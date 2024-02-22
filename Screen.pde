public class Screen {//superclass for all screens. makes background one color, returns canvas size too.
  private int x, y;//instance variables and constructor below
  private color c;
  float[][] randos = new float[48][36];

  Screen(int x, int y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
    for (int i = 0; i<48; i++) {
      for (int j = 0; j<36; j++) {
        randos[i][j] = random(0, 2);
      }
    }
  }
  public void display() {
    background(c);
    strokeWeight(3);
    stroke(41, 201, 214, 100);
    for (int i = 0; i<48; i++) {
      for (int j = 0; j<36; j++) {
        if (randos[i][j] <1) {
          line(25 * i, 25 * j, 25 + 25*i, 25 + 25 * j);
        } else {
          line(25 * i, 25 + 25 *j, 25 + 25 * i, 25 * j);
        }
      }
    }
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
