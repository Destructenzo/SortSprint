public class Setting extends Screen {//this is the screen before the boss fight
  Button b1, b2, b3, b4, b5;//instance variables
  Setting(int x, int y, color c, Button b1, Button b2, Button b3, Button b4, Button b5) {//constructor
    super(x, y, c);
    this.b1 = b1;
    this.b2 = b2;
    this.b3 = b3;
    this.b4 = b4;
    this.b5 = b5;
  }
  public void display(){
    super.display();
    b1.display();
    b2.display();
    b3.display();
    b4.display();
    b5.display();
    fill(col2);
    stroke(0);
    strokeWeight(1);
    rectMode(CORNER);
    rect(0, 0, 200, 100);
    textAlign(CENTER, CENTER);
    textSize(50);
    fill(col3);
    text(round(money), 100, 50);
  }
}
