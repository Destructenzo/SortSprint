public class Screen {//superclass for all screens. makes background one color, returns canvas size too.
  private int x , y;//instance variables and constructor below
  private color c;
  Screen(int x, int y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  public void display() {
    background(c);
  }
  public int getX() {
    return this.x;//getter methods
  }
  public int getY() {
    return this.y;
  }
  public void pallete(color c1) {
    fill(c1);
    stroke(c1);
  }
}
