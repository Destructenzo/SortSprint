public class Slot {//class for all of the towers in the main game
  private int x, y, h, w;//instance variables and constructor below
  Slot(int x, int y, int w, int h ) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
  }
  public void update(int x, int w) {
    this.x = x;
    this.w = w;
  }
  public void setX(int x) {//setter methods
    this.x = x;
  }
  public void setY(int y) {
    this.y = y;
  }
  public void setW(int w) {
    this.w = w;
  }
  public void setH(int h) {
    this.h = h;
  }
  public void setSize(int x, int y, int w, int h) {
    this.setX(x);
    this.setY(y);
    this.setW(w);
    this.setH(h);
  }
  public int getX(){//getter methods
    return x;
  }
  public int getY() {
    return y;
  }
  public int getW(){
    return w;
  }
  public int getH(){
    return h;
  }
  public void display() {
    y = 900-h;
    rect(x, y, w, h);
  }
}
