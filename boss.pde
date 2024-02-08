public class boss {
  private class bullet {
    int x, y, w, h;
    bullet (int x, int y, int w, int h) { // BIRB NEST
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
    }
  }
  int x = 300, y = 50, cooldown = 100, img = 0, oldTime = 0, sinceLock = 0, dir = 0;
  float angle = 0;
  boolean hit = false, shooting = false;
  ArrayList<bullet> hitList = new ArrayList<bullet>(); //gonna need one every scan, no point in a big list, we run it internal to this bastard
  bullet SCANROUND = new bullet(-100, -100, 5,5);//the one that tries to scan for the player
  boss(int tx, int ty) {
    x = tx;
    y = ty;
  }
  void motion() {
    if (x >= 300 && x <= 900) {
      x += 3*dir;
    } if (x<= 425) {
      dir = 1;
    } if (x >= 775) {
      dir = -1;
    } if (shooting == true) {
      dir = 0;
    }
  }
  void shoot(player target) {
    if (millis()-cooldown >= oldTime && shooting == false) {
      detectScan(target, false);
      oldTime = millis();
    } if (shooting == true && oldTime+500 <= millis()) {
      detectScan(target, true);
    }
  }
  void display() {
    if (dir == -1) {
      img = 1;
    } if (dir == 1) {
      img = 2;
    } if (dir == 0) {
      img = 0;
      if (shooting == true) {
        img = 3;
      }
    }
    image(bigBoiPics[img], x, y);
    print(hit);
  }
  
  void detectScan(player target, boolean k) {
    int i = 0;
    boolean killShot = k;
    if (killShot == false) {
      angle = 0;
    }
    while (angle <= 360 && hit == false) {
      while(hit == false && i <1000) {
        SCANROUND.x = x+25+round(sin(radians(angle))*1*i);
        SCANROUND.y = y+50+round(cos(radians(angle))*1*i);
        strokeWeight(0);
          rect(SCANROUND.x, SCANROUND.y, SCANROUND.w, SCANROUND.h);
        if (killShot == true) {
          strokeWeight(0);
          rect(SCANROUND.x, SCANROUND.y, SCANROUND.w*2, SCANROUND.h*2);
        }
        i++;
      }
      if (SCANROUND.x >= target.x && SCANROUND.x <= target.x+target.w && SCANROUND.y >= target.y && SCANROUND.y <=target.y+target.h) {
        hit = true;
      } if (SCANROUND.x+SCANROUND.w >= target.x && SCANROUND.x+SCANROUND.w <= target.x+target.w && SCANROUND.y+SCANROUND.h >= target.y && SCANROUND.y=SCANROUND.h <=target.y+target.h) {
        hit = true;
      }
      if (hit == true) {
        shooting = true;
        hit = true;
        dir = 0;
      } if (hit != true && i >199) {
        i = 0;
        angle += 10;
      } if (killShot == true && hit == true) {
        game1.score -= 100;
      }
    }
  }
}
