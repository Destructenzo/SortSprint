color col1 = color(234, 12, 94);
color col2 = color(18, 108, 175);
color col3 = color(170, 149, 24);
color col4 = color(49, 18, 29);
float intelligence = random(0, 2);
Menu myMenu;
Button startButton;
Game game1;
Button skipButton;

void setup() {
  size(720, 360);
  startButton = new Button(110, 60, 500, 220, col2, "Play", 100, col3);
  myMenu = new Menu(720, 360, col1, startButton);
}
void mousePressed() {
  if (myMenu.getButton().isHovered()) {
    myMenu.getButton().togglePressed();
    skipButton = new Button(110, 60, 500, 220, col2, "Skip for Now", 90, col3);
    game1 = new Game(720, 360, col4, skipButton);
  } else if (game1.getButton().isHovered()) {
    game1.getButton().togglePressed();
  }
}
void draw() {
  if (!myMenu.getButton().getPressed()) {
    myMenu.display();
  } else if (myMenu.getButton().getPressed() && !game1.getButton().getPressed()) {
    game1.display();
  }
}
