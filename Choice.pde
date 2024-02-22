public class Choice extends Screen {
  Button b1, b2, b3;
  String s;//instance variables and constructor
  Choice(int x, int y, color c, Button b1, Button b2, Button b3, String s) {
    super(x, y, c);
    this.b1 = b1;
    this.b2 = b2;
    this.b3 = b3;
    this.s = s;
  }
  public void display() {
    super.display();
    fill(col2);
    stroke(0);
    strokeWeight(1);
    rectMode(CORNER);
    rect(150, 150, 900, 300);
    textAlign(CENTER, CENTER);
    textSize(65);
    fill(col3);
    text(s, 600, 300);
    b1.display();
    b2.display();
    b3.display();
  }
}
