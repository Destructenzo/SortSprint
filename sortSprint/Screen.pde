public class Screen {
  private int x;
  private int y;
  private color c;
  Screen(int x, int y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  public void display() {
    background(c);
  }
  public int getX(){
    return this.x;
  }
  public int getY(){
    return this.y;
  }
    
}
