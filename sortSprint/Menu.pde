public class Menu extends Screen {
  Button b;
  Menu(int x, int y, color c, Button b) {
    super(x, y, c);
    this.b = b;
  }
  public Button getButton() {
    return b;
  }
  public void display() {
    super.display();
    b.display();
  }
}
