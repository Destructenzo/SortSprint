public class boss {
  int x = 300, y = 50, cooldown = 500, img = 0, oldTime = 0, sinceLock = 0;
  void boss() {
  }
  void motion() {
    
  }
  void shoot() {
    if (millis()-cooldown >= oldTime) {
      
      oldTime = millis();
    }
  }
  void display() {
    image(bigBoiPics[img], x, y);
  }
}
