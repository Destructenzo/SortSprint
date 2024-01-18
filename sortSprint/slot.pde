class slot {
  float x, y, h, w;
  slot(int xTemp, int yTemp, int wTemp, int hTemp) {
    x = xTemp;
    y = yTemp;
    h = hTemp;
    w = wTemp;
  }
  void update(int newX, int newX2) {
    x = newX;
    w = newX2;
  }
  void display() {
    y = 800-h;
   rect(x, y, (w), (h)); 
  }
}
