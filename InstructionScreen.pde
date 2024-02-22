public class InstructionScreen extends Screen {//gives instructions
  Button b;// instance variables and contructor
  PImage instructionBackground = loadImage("InstructionBackground.png");
  InstructionScreen(int x, int y, color c, Button b) {
    super(x, y, c);
    this.b =b;
  }
  public void display() {
    super.display();
    image(instructionBackground, 0, 0, 1200, 900);
    fill(col2);
    stroke(0);
    strokeWeight(1);
    rectMode(CORNER);
    rect(650, 50, 500, 120); 
    rect(90, 190, 100, 100); 
    rect(225, 190, 100, 100);
    rect(360, 190, 100, 100);
    rect(490, 190, 100, 100);
    rect(875, 440, 100, 100);
    rect(750, 560, 100, 100);
    rect(1000, 560, 100, 100);
    textAlign(CENTER, CENTER);
    textSize(90);
    fill(col3);
    text("How To Play", 900, 110);
    textSize(23);
    text("Press 1:" + "\n" + "Removal" + "\n" + "Sort", 140, 240);
    text("Press 2:" + "\n" + "Shuffle" + "\n" + "Sort", 275, 240);
    text("Press 3:" + "\n" + "Insertion" + "\n" + "Sort", 410, 240);
    text("Press 4:" + "\n" + "Bubble" + "\n" + "Sort", 540, 240);
    text("Press ↑:" + "\n" + "Jump" + "\n" + "Up", 925, 490);
    text("Press ←:" + "\n" + "Go" + "\n" + "Left", 800, 610);
    text("Press →:" + "\n" + "Go" + "\n" + "Right", 1050, 610);
    textSize(15);
    fill(100);
    text("Use these to Manipulate the Towers", 500, 50);
    textAlign(LEFT);
    text("Welcome" + "\n" + "S tudent" + "\n" + "P roductivity" + "\n" + "I ntelligence" + "\n" + "D evelopment" + "\n" + "E xcercise"  + "\n" + "R obot", 100, 400);
    b.display();
  }
}
