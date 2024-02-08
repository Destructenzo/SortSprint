color col1 = color(234, 12, 94);
color col2 = color(18, 108, 175);
color col3 = color(170, 149, 24);
color col4 = color(49, 18, 29);
float intelligence = random(0, 2);
float luck = random(0, 2);
int controls = 0;
int gameNumber = 0;
Menu myMenu;
Button startButton;
Button quitButton;
Button exitButton;
Game game1;
Button skipButton;
boolean rightArrow = false;
boolean leftArrow = false;
boolean upArrow = false;
player player1 = new player(10, 600);
PImage[] prototype = new PImage[5];
void setup() {
  prototype[0] = loadImage("spiderSimR.png");
  prototype[1] = loadImage("spiderSimR.png");
  prototype[2] = loadImage("spiderSimR1.png");
  prototype[3] = loadImage("spiderSimL.png");
  prototype[4] = loadImage("spiderSimL1.png");
  size(1200, 900);
  frameRate(60);
  startButton = new Button(300, 300, 600, 200, col2, "Start", 100, col3);
  exitButton = new Button(300, 600, 600, 200, col2, "Exit", 100, col3);
  quitButton = new Button(1100, 0, 100, 100, col2, "Quit", 50, col3);
  myMenu = new Menu(720, 360, col1, startButton, exitButton);
}
void draw() {
  if (!myMenu.getStartButton().getPressed()) {
    myMenu.display();
  } else if (myMenu.getStartButton().getPressed() && !game1.getOver()) {
    game1.display();
  }
}
void mousePressed() {
  if (myMenu.getQuitButton().isHovered()) {
    exit();
  }
  if (myMenu.getStartButton().isHovered()) {
    myMenu.getStartButton().togglePressed();
    game1 = new Game(720, 360, col4, 36000, quitButton);
    gameNumber = 1;
    if (quitButton.getPressed()) {
      quitButton.togglePressed();
    }
  }
  if (quitButton.isHovered()) {
    quitButton.togglePressed();
    startButton.togglePressed();
  }
}
void keyPressed() {
  if (gameNumber == 1) {
    if (keyCode == 37) { //moveLeft
      leftArrow = true;
      rightArrow = false;
    } else if (keyCode == 38) { //moveUp
      upArrow = true;
    } else if (keyCode == 39) { //moveRight
      rightArrow = true;
      leftArrow = false;
    }
    if ((keyCode == 49) && (game1.getStalin()) && (game1.getCooldown() ==0) ) {
      game1.stalin();
    } else if ((keyCode == 50) && (game1.getBOGO()) && (game1.getCooldown() ==0) ) {
      game1.bogo();
    } else if ((keyCode == 51) && (game1.getInsertion()) && (game1.getCooldown() ==0) ) {
      game1.insertion();
    } else if ((keyCode == 52) && (game1.getBubble()) && (game1.getCooldown() ==0) ) {
      game1.bubble();
    }
  }
}

void keyReleased() {
  if (keyCode == 37) { //moveLeft
    leftArrow = false;
  }
  if (keyCode == 38) { //moveUp
    upArrow = false;
    player1.jump = false;
  }
  if (keyCode == 39) { //moveRight
    rightArrow = false;
  }
}



/*
  PImage[] prototype = new PImage[5];
 int controls = 0;
 prototype[0] = loadImage("prototype.png");
 prototype[1] = loadImage("spiderSimR.png");
 prototype[2] = loadImage("spiderSimR1.png");
 prototype[3] = loadImage("spiderSimL.png");
 prototype[4] = loadImage("spiderSimL1.png");
 public void display() {
 pallete(#0F0F8F);
 
 input();
 if (ENERGY <0) {
 ENERGY = 0;
 }
 for (int j = 0; j < 4; j +=1) {
 for (int i = 0; i < towers.size(); i += 1) {
 slot tower = towers.get(i);
 pallete(#9a0a9a);
 stroke(#0F090F);
 strokeWeight(1);
 tower.update(ceil((100+(i*(ceil(1000/towers.size()))))), (ceil((1000)/towers.size())));
 tower.display();
 pallete(color(#9FFF9F));
 player1.collision(tower);
 }
 }
 pallete(#00FF00);
 rect(1125, 700-ENERGY, 50, ENERGY);
 player1.move();
 player1.display();
 if ((menu == 1)) {
 pallete(#000000);
 rect(0, 0, 1200, 800);
 pallete(#FFFFFF);
 rect(100, 100, 100, 20);
 }
 }
 
 if (leftArrow == true) {
 if (controls == 0) {
 player1.moveLeft();
 player1.inair = true;
 }
 }
 if (rightArrow == true) {
 if (controls == 0) {
 player1.moveRight();
 player1.inair = true;
 }
 }
 }
 
 
 
 void keyPressed() {
 //print(keyCode);
 if (keyCode == 49) {
 if (ENERGY >= 0) {
 STALIN();
 }
 }
 print(keyCode);
 if (keyCode == 50) {
 if (ENERGY >= 0) {
 BOGO();
 }
 }
 if (keyCode == 51) {
 if (ENERGY >=5) {
 INSERTION();
 ENERGY -= 4;
 }
 }
 if (keyCode == 52) {
 if (ENERGY >= 8) {
 BUBBLE();
 ENERGY -= 8;
 }
 }
 if (keyCode == 37) { //moveLeft
 leftArrow = true;
 rightArrow = false;
 }
 if (keyCode == 38) { //moveUp
 upArrow = true;
 }
 if (keyCode == 39) { //moveRight
 rightArrow = true;
 leftArrow = false;
 }
 if (keyCode == 8) {
 menu +=1;
 if (menu == 2) {
 menu = 0;
 }
 }
 }
 void mouseClicked() {
 println(mouseX + "," + mouseY);
 if (mouseX >100 && mouseX <300 && 120 > mouseY && mouseY >100 ) {
 print("firstButton");
 }
 }
 
 void pallete(color c1) {
 fill(c1);
 stroke(c1);
 }
 */
