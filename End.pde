public class End extends Screen {//last two screens of the game.
  private Button b;//instance variables and constructor
  private String s;
  End(int x, int y, color c, Button b, String s) {
    super(x, y, c);
    this.b = b;
    this.s = s;
  }
  public void display() {
    super.display();
    b.display();
    fill(col2);
    stroke(0);
    strokeWeight(1);
    rectMode(CORNER);
    rect(250, 50, 700, 200);
    textAlign(CENTER, CENTER);
    textSize(70);
    fill(col3);
    text(s + "\n" + "Final Money: " + money, 600, 150);
  }
}
