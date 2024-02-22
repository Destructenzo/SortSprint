import processing.sound.*;
SoundFile mainTrack;
color col1 = color(0, 0, 25); //Global Variables and objects
color col2 = color(18, 108, 175);
color col3 = color(170, 149, 24);
color col4 = color(49, 18, 29);
color col5 = color(80, 90, 98);
color col6 = color(234, 12, 94);
color col7 = color(6, 209, 75);
float intelligence = random(0, 2);
float luck = random(0, 2);
float money = 0;
int controls = 0;
int gameNumber = 0;
Menu myMenu;
End loser, winner;
Button skipButton, startButton, quitButton, exitButton, goButton1, goButton2, goButton3, goButton4, c11, c12, c21, c22, c31, c32, c41, c42, c51, c52, s11, s12, s13, restart;
Choice c1, c2, c3, c4, c5;
InstructionScreen myInstruct;
Game game1, game2;
Setting s1;
boolean Lose = false;
boolean rightArrow = false;
boolean leftArrow = false;
boolean upArrow = false;
boolean tempS = false;
boolean tempI = false;
boolean tempB = false;
player player1 = new player(10, 600);
Boss boss1 = new Boss();
PImage[] prototype = new PImage[5];
PImage[] bigBoiPics = new PImage[4];
void setup() {//loads sprites for player and boss objects, initializes al button objects, one menu object and one End object
  mainTrack = new SoundFile(this, "Every_End-Dimrain47.wav");
  mainTrack.loop();
  prototype[0] = loadImage("spiderSimR.png");//also sets canvas size to be 1200 by 900 pixels with a frame rate of 60
  prototype[1] = loadImage("spiderSimR.png");
  prototype[2] = loadImage("spiderSimR1.png");
  prototype[3] = loadImage("spiderSimL.png");
  prototype[4] = loadImage("spiderSimL1.png");
  bigBoiPics[0] = loadImage("IRS.png");
  bigBoiPics[1] = loadImage("IRSL.png");
  bigBoiPics[2] = loadImage("IRSR.png");
  bigBoiPics[3] = loadImage("IRSA.png");
  size(1200, 900);
  frameRate(60);
  startButton = new Button(300, 350, 600, 200, col2, "Start", 100, col3);
  exitButton = new Button(300, 650, 600, 200, col2, "Exit", 100, col3);
  quitButton = new Button(1000, 0, 200, 100, col2, "Quit", 50, col3);
  goButton1 = new Button(100, 600, 400, 120, col2, "Continue", 90, col3);
  goButton2 = new Button(-100, -100, 0, 0, col2, "Continue", 90, col3);
  goButton3 = new Button(-100, -100, 0, 0, col2, "Continue", 90, col3);
  goButton4 = new Button(-100, -100, 0, 0, col2, "Finish", 90, col3);
  restart = new Button(-100, -100, 0, 0, col2, "Restart", 100, col3);
  c11 = new Button(150, 550, 400, 300, col2, "Business Course", 50, col3);
  c21 = new Button(150, 550, 400, 300, col2, "Make a" + "\n" + "new product", 50, col3);
  c31 = new Button(150, 550, 400, 300, col2, "Hire a " + "\n" + "New Employee", 50, col3);
  c41 = new Button(150, 550, 400, 300, col2, "Work on Self" + "\n" + "Confidence", 50, col3);
  c51 = new Button(150, 550, 400, 300, col2, "Volunteer at" + "\n" + "School Fair", 50, col3);
  c12 = new Button(650, 550, 400, 300, col2, "Off Period", 50, col3);
  c22 = new Button(650, 550, 400, 300, col2, "Market" + "\n" + "Current" + "\n" + "Products", 50, col3);
  c32 = new Button(650, 550, 400, 300, col2, "Work Longer" + "\n" + "Hours", 50, col3);
  c42 = new Button(650, 550, 400, 300, col2, "Focus More" + "\n" + "on School", 50, col3);
  c52 = new Button(650, 550, 400, 300, col2, "Improve Customer" + "\n" + "Service", 50, col3);
  s11 = new Button(200, 100, 350, 300, col2, "Shuffle Sort" + "\n" + "for $5000", 50, col3);
  s12 = new Button(200, 500, 350, 300, col2, "Insertion Sort" + "\n" + "for $10000", 50, col3);
  s13 = new Button(650, 100, 350, 300, col2, "Bubble Sort" + "\n" + "for $20000", 50, col3);
  myMenu = new Menu(1200, 900, col1, startButton, exitButton);
  loser = new End(1200, 900, col6, restart, "You Lose!");
}
void draw() {//depending on the buttons that are active, it runs the different display methods of different classes
  if (Lose) {//draw loops 60 times per second and uses double buffer animation
    restart.setSize(300, 350, 600, 200);
    loser.display();
  } else if (!myMenu.getStartButton().getPressed()) {
    myMenu.display();
  } else if (myMenu.getStartButton().getPressed() && !goButton1.getPressed()) {
    myInstruct.display();
  } else if (goButton1.getPressed() && !game1.getOver()) {
    game1.display();
  } else if (game1.getOver() && goButton2.getPressed() && !(c11.getPressed() || c12.getPressed())) {
    c1.display();
  } else if (c11.getPressed() && !(c21.getPressed() || c22.getPressed())) {
    c2.display();
  } else if (c21.getPressed() && !(c31.getPressed() || c32.getPressed())) {
    c3.display();
  } else if (c31.getPressed() && !(c41.getPressed() || c42.getPressed())) {
    c4.display();
  } else if (c41.getPressed() && !(c51.getPressed() || c52.getPressed())) {
    c5.display();
  } else if (c51.getPressed() && !goButton3.getPressed()) {
    s1.display();
  } else if (goButton3.getPressed() && !game2.getOver()) {
    game2.display();
  } else if (goButton4.getPressed()) {
    restart.setSize(300, 350, 600, 200);
    winner.display();
  }
}
void mousePressed() {//whenever you click, looks what what Button instance was clicked and uses that to progress through the game
  if (myMenu.getQuitButton().isHovered()) {
    exit();
  }
  if (myMenu.getStartButton().isHovered()) {
    myMenu.getStartButton().togglePressed();
    myMenu.getQuitButton().togglePressed();
    myInstruct = new InstructionScreen(1200, 900, col1, goButton1);
    game1 = new Game(1200, 900, col1, 36000, quitButton, player1, goButton2);
    gameNumber = 1;
    if (quitButton.getPressed()) {
      quitButton.togglePressed();
    }
  } else if (quitButton.isHovered()) {
    money = 0;
    quitButton.togglePressed();
    startButton.togglePressed();
    exitButton.togglePressed();
    if (goButton2.getPressed()) {
      goButton2.togglePressed();
    }
    if (c11.getPressed()) {
      c11.togglePressed();
    }
    if (c21.getPressed()) {
      c21.togglePressed();
    }
    if (c31.getPressed()) {
      c31.togglePressed();
    }
    if (c41.getPressed()) {
      c41.togglePressed();
    }
    if (c51.getPressed()) {
      c51.togglePressed();
    }
    if (c12.getPressed()) {
      c12.togglePressed();
    }
    if (c22.getPressed()) {
      c22.togglePressed();
    }
    if (c32.getPressed()) {
      c32.togglePressed();
    }
    if (c42.getPressed()) {
      c42.togglePressed();
    }
    if (c52.getPressed()) {
      c52.togglePressed();
    }
    if (s11.getPressed()) {
      s11.togglePressed();
    }
    if (s12.getPressed()) {
      s12.togglePressed();
    }
    if (s13.getPressed()) {
      s13.togglePressed();
    }
    if (goButton2.getPressed()) {
      goButton2.togglePressed();
    }
    if (goButton3.getPressed()) {
      goButton3.togglePressed();
    }
    if (goButton4.getPressed()) {
      goButton4.togglePressed();
    }
  } else if (goButton1.isHovered()) {
    goButton1.togglePressed();
  } else if (goButton2.isHovered()) {
    goButton2.togglePressed();
    game1.toggleGame();
    money = game1.getScore() * luck * intelligence;
    c1 = new Choice(1200, 900, col1, c11, c12, quitButton, "Take a Business Course" + "\n" + "or" + "\n" + "Use off to focus on Business");
  } else if (c11.isHovered() || c12.isHovered()) {
    if (c11.isHovered()) {
      intelligence +=.2;
    } else if (c12.isHovered()) {
      money += 50;
    }
    c11.togglePressed();
    c12.togglePressed();
    c2 = new Choice(1200, 900, col1, c21, c22, quitButton, "Create a new Product" + "\n" + "or" + "\n" + "Market Existing Products Better");
  } else if (c21.isHovered() || c22.isHovered()) {
    if (c21.isHovered()) {
      money += (intelligence * luck * random(-100, 100));
    } else if (c22.isHovered()) {
      money += (intelligence * luck * random(-100, 100));
    }
    c21.togglePressed();
    c22.togglePressed();
    c3 = new Choice(1200, 900, col1, c31, c32, quitButton, "Hire a new Employee" + "\n" + "or" + "\n" + "Work longer Hours");
  } else if (c31.isHovered() || c32.isHovered()) {
    if (c31.isHovered()) {
      money += (intelligence * luck * random(-100, 10));
      intelligence +=.1;
    } else if (c32.isHovered()) {
      money += (intelligence * luck * random(-10, 50));
      intelligence -= .2;
    }
    c31.togglePressed();
    c32.togglePressed();
    c4 = new Choice(1200, 900, col1, c41, c42, quitButton, "Work on Self Confidence" + "\n" + "or" + "\n" + "Focus more on School");
  } else if (c41.isHovered() || c42.isHovered()) {
    if (c41.isHovered()) {
      luck +=.2;
    } else if (c42.isHovered()) {
      intelligence += .2;
    }
    c41.togglePressed();
    c42.togglePressed();
    c5 = new Choice(1200, 900, col1, c51, c52, quitButton, "Volunteer at School Fair" + "\n" + "or" + "\n" + "Improve Customer Service");
  } else if (c51.isHovered() || c52.isHovered()) {
    if (c51.isHovered()) {
      luck +=.2;
      money += (luck * intelligence * random(-10, 50));
    } else if (c52.isHovered()) {
      luck += .2;
      money += (luck * intelligence * random(-10, 50));
    }
    c51.togglePressed();
    c52.togglePressed();
    goButton3.setSize(650, 500, 350, 300);
    s1 = new Setting(1200, 900, col1, s11, s12, s13, quitButton, goButton3);
  } else if (s11.isHovered() || s12.isHovered() || s13.isHovered()) {
    if (s11.isHovered() && money >= 5000) {
      s11.togglePressed();
      tempS = true;
      money -=5000;
    }
    if (s12.isHovered() && money >= 10000) {
      s12.togglePressed();
      tempI = true;
      money -= 10000;
    }
    if (s13.isHovered() && money >= 20000) {
      s13.togglePressed();
      tempB = true;
      money -= 20000;
    }
  } else if (goButton3.isHovered()) {
    goButton3.togglePressed();
    game2 = new Game(1200, 900, col1, 12000, quitButton, player1, goButton4);
    gameNumber = 2;
    game2.setShuffle(tempS);
    game2.setInsertion(tempI);
    game2.setBubble(tempB);
    game2.setBossFight(true);
  } else if (goButton4.isHovered()) {
    goButton4.togglePressed();
    money += (game2.getScore() *100 * intelligence * luck);
    game2.toggleGame();
    winner = new End(1200, 900, col7, restart, "You Win!");
  } else if ( restart.isHovered()) {
    restart.togglePressed();
    money = 0;
    quitButton.togglePressed();
    startButton.togglePressed();
    exitButton.togglePressed();
    if (goButton2.getPressed()) {
      goButton2.togglePressed();
    }
    if (c11.getPressed()) {
      c11.togglePressed();
    }
    if (c21.getPressed()) {
      c21.togglePressed();
    }
    if (c31.getPressed()) {
      c31.togglePressed();
    }
    if (c41.getPressed()) {
      c41.togglePressed();
    }
    if (c51.getPressed()) {
      c51.togglePressed();
    }
    if (c12.getPressed()) {
      c12.togglePressed();
    }
    if (c22.getPressed()) {
      c22.togglePressed();
    }
    if (c32.getPressed()) {
      c32.togglePressed();
    }
    if (c42.getPressed()) {
      c42.togglePressed();
    }
    if (c52.getPressed()) {
      c52.togglePressed();
    }
    if (s11.getPressed()) {
      s11.togglePressed();
    }
    if (s12.getPressed()) {
      s12.togglePressed();
    }
    if (s13.getPressed()) {
      s13.togglePressed();
    }
    if (goButton2.getPressed()) {
      goButton2.togglePressed();
    }
    if (goButton3.getPressed()) {
      goButton3.togglePressed();
    }
    if (goButton4.getPressed()) {
      goButton4.togglePressed();
    }
  }
}
void keyPressed() {//this and key realeased give us control over the player.
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
    if ((keyCode == 49) && (game1.getRemoval()) && (game1.getCooldown() ==0) ) {
      game1.removal();
    } else if ((keyCode == 50) && (game1.getShuffle()) && (game1.getCooldown() ==0) ) {
      game1.shuffle();
    } else if ((keyCode == 51) && (game1.getInsertion()) && (game1.getCooldown() ==0) ) {
      game1.insertion();
    } else if ((keyCode == 52) && (game1.getBubble()) && (game1.getCooldown() ==0) ) {
      game1.bubble();
    }
  } else if (gameNumber ==2) {
    if (keyCode == 37) { //moveLeft
      leftArrow = true;
      rightArrow = false;
    } else if (keyCode == 38) { //moveUp
      upArrow = true;
    } else if (keyCode == 39) { //moveRight
      rightArrow = true;
      leftArrow = false;
    }
    if ((keyCode == 49) && (game2.getRemoval()) && (game2.getCooldown() ==0) ) {
      game2.removal();
    } else if ((keyCode == 50) && (game2.getShuffle()) && (game2.getCooldown() ==0) ) {
      game2.shuffle();
    } else if ((keyCode == 51) && (game2.getInsertion()) && (game2.getCooldown() ==0) ) {
      game2.insertion();
    } else if ((keyCode == 52) && (game2.getBubble()) && (game2.getCooldown() ==0) ) {
      game2.bubble();
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
