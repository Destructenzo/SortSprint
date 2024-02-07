public class Button {
  private int x, y, l, w, tSize;
  private color cB, cT;
  String t;
  private boolean hasBeenPressed = false;
  Button(int x, int y, int l, int w, color cB, String t, int tSize, color cT) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.w = w;
    this.cB = cB;
    this.tSize = tSize;
    this.t = t;
    this.cT = cT;
  }
  public void display() {

    if (this.isHovered()) {
      strokeWeight(10);
      stroke(255, 255, 0);
    } else {
      strokeWeight(1);
      stroke(0);
    }
    fill(cB);
    rectMode(CORNER);
    rect(x, y, l, w);
    textSize(tSize);
    textAlign(CENTER);
    fill(cT);
    text(t, x+l/2, y+w/2+25);
  }
  public boolean isHovered() {
    if ((x <= mouseX) && (mouseX <= (x+l)) && (y <= mouseY) && (mouseY <= (y+w))) {
      return true;
    } else {
      return false;
    }
  }
  public boolean getPressed() {
    return hasBeenPressed;
  }
  public void togglePressed() {
    hasBeenPressed = !hasBeenPressed;
    this.setSize(-1, -1, 0, 0);
  }
  public void setX(int x) {
    this.x = x;
  }
  public void setY(int y) {
    this.y = y;
  }
  public void setL(int l) {
    this.l = l;
  }
  public void setW(int w) {
    this.w = w;
  }
  public void setSize(int x, int y, int l, int w) {
    this.setX(x);
    this.setY(y);
    this.setL(l);
    this.setW(w);
  }
}
