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
  int x = 300, y = 50, cooldown = 500, img = 0, oldTime = 0, sinceLock = 0, dir = 0;
  boolean hit = false;
  ArrayList<bullet> hitList = new ArrayList<bullet>(); //gonna need one every scan, no point in a big list, we run it internal to this bastard
  void boss(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void motion() {
    if (x >= 100) {
      
      img = 1;
    }
  }
  void shoot(player target) {
    if (millis()-cooldown >= oldTime) {
      detectScan();
      oldTime = millis();
    }
    
  }
  void display() {
    img = dir;
    image(bigBoiPics[img], x, y);
  }
  void detectScan() {
    while(hit = false) {
      
    }
  }
}
