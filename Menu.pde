public class Menu extends Screen {
  Button start, quit;
  Menu(int x, int y, color c, Button b1, Button b2) {
    super(x, y, c);
    this.start = b1;
    this.quit = b2;
  }
  public Button getStartButton() {
    return start;
  }
  public Button getQuitButton() {
    return quit;
  }
  public void display() {
    super.display();
    start.display();
    quit.display();
  }
}
