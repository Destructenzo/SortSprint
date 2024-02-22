  public class Boss {//final boss of the game

  private float x = 300;//instances variables
  private float y = 50;
  private float tempX, tempY;
  private int cooldown = 180;
  private  int shotTimer = 120;
  private  boolean follow = true;
  private boolean hasShot = false;
  Boss() {//basic constructor
  }

  public void setFollow(boolean f) {
    this.follow = f;
  }
  public void display() {//he follows you and will shoot lasers at you. if one hits, it is game over.
    if (cooldown >0) {
      cooldown--;
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
    if (follow) {
      x = player1.getX();
      y = 50;
      image(bigBoiPics[0], x, y);
    }
    if (cooldown == 0) {
      image(bigBoiPics[3], x, y);
      follow = false;
      if (shotTimer > 0) {
        shotTimer --;
      }
      if (!hasShot) {
        tempX = player1.getX()+12;
        tempY = player1.getY()+12;
        hasShot =!hasShot;
      }
      strokeWeight(10);
      stroke(255, 0, 0);
      fill(255, 0, 0);
      col1 = color (255, 0, 0);
      tempX = player1.getX();
      tempY = player1.getY();
      line(x, y, tempX, tempY);
      if (shotTimer == 0) {
        follow = true;
        hasShot = !hasShot;
        cooldown = 180;
        hasShot = true;
        shotTimer = 120;
        if (player1.getX() <= tempX && tempX <= (player1.getX()+player1.getW()) && player1.getY() <= tempY && tempY <= (player1.getY()+player1.getH())) {
          game2.setScore(0);
        }
      }
    }
  }
}
