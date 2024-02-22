public class Menu extends Screen {//main title screen
  Button start, quit; // instance variables and constructor
  Menu(int x, int y, color c, Button b1, Button b2) {
    super(x, y, c);
    this.start = b1;
    this.quit = b2;
  }
  public Button getStartButton() {//getter methods
    return start;
  }
  public Button getQuitButton() {
    return quit;
  }
  public void display() {
    super.display();
    start.display();
    quit.display();
    fill(col2);
    stroke(0);
    strokeWeight(1);
    rectMode(CORNER);
    rect(250, 50, 700, 200);
    textAlign(CENTER, CENTER);
    textSize(125);
    fill(col3);
    text("SortSprint", 600, 150);
  }
}
