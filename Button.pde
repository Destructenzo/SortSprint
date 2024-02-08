public class Button {
  private int x, y, l, w, tSize, x1, y1, l1, w1;//instnance vairables and constructor
  private color cB, cT;
  String t;
  private boolean hasBeenPressed = false;
  Button(int x, int y, int l, int w, color cB, String t, int tSize, color cT) {
    this.x = x;
    this.x1 = x;
    this.y = y;
    this.y1 = y;
    this.l = l;
    this.l1 =l;
    this.w = w;
    this.w1 = w;
    this.cB = cB;
    this.tSize = tSize;
    this.t = t;
    this.cT = cT;
  }
  public void display() {

    if (this.isHovered()) {//highlights the button if cursor is on top
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
    textAlign(CENTER, CENTER);
    fill(cT);
    text(t, x+l/2, y+w/2);
  }
  public boolean isHovered() {//detects if cursor is on top of the button
    if ((x <= mouseX) && (mouseX <= (x+l)) && (y <= mouseY) && (mouseY <= (y+w))) {
      return true;
    } else {
      return false;
    }
  }
  public boolean getPressed() {//getter method for if the button has been pressed.
    return hasBeenPressed;
  }
  public void togglePressed() {
    hasBeenPressed = !hasBeenPressed;
    if(hasBeenPressed){
    this.setSize(-1, -1, 0, 0);
    }else if (!hasBeenPressed){
      this.setSize(x1, y1, l1, w1);
    }
  }
  public void setX(int x) {//setter methods
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
  public void setColor( color c){
    this.cB = c;
  }
  public void setSize(int x, int y, int l, int w) {
    this.setX(x);
    this.setY(y);
    this.setL(l);
    this.setW(w);
  }
}
