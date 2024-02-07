public class Game extends Screen {
  ArrayList<slot> towers = new ArrayList<slot>();
  float temp1;
  int menu = 1;
  int ENERGY = 100;
  boolean rightArrow = false;
  boolean leftArrow = false;
  boolean upArrow = false;
  Button b;
  //player player1 = new player(10, 600);
  public Game(int x, int y, color c, Button b) {
    super(x, y, c);
    this.b = b;
  }
  public void display() {
    super.display();
    b.display();
  }
  public Button getButton() {
    return b;
  }

  //PImage[] prototype = new PImage[5];
  //int controls = 0;
  //  prototype[0] = loadImage("prototype.png");
  //  prototype[1] = loadImage("spiderSimR.png");
  //  prototype[2] = loadImage("spiderSimR1.png");
  //  prototype[3] = loadImage("spiderSimL.png");
  //  prototype[4] = loadImage("spiderSimL1.png");
  for (int i = 0; i < 40; i++) { //i controls amount of columns, use a integer lkkkkdivisor of 1000 for best results. Recommending max: 40 to prevent tower climbing with clipping.
    temp1 = (random(25, 700));
    towers.add(new slot(25, 0, 25, round(temp1)));
  }
//everyFramePlays
public void display() {
  pallete(#0F0F8F);
  rect(0, 750, 100, 50);
  rect(1100, 400, 100, 400);
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
void input() {
  if (upArrow == true) {
    if (controls == 0) {
      player1.jump();
      player1.inair = true;
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
//sortingAlgorithms
void STALIN() {
  ArrayList<slot> tempList = new ArrayList<slot>();
  tempList.add(towers.get(0));
  for (int i = 0; i < towers.size()-1; i += 1) {
    slot tower0 = tempList.get(tempList.size()-1);
    slot tower1 = towers.get(i+1);
    if (tower0.y >= tower1.y) {
      tempList.add(tower1);
    }
  }
  towers = new ArrayList<slot>(tempList);
  while (tempList.size() <= 0) {
    shorten(tempList);
  }
  RESIZE();
}

void BOGO() {
  ArrayList<slot> tempList0 = new ArrayList<slot>();
  ArrayList<slot> tempList1 = new ArrayList<slot>(towers);
  int j;
  for (int i = 0; i < towers.size(); ++i) {
    j = round(random(0, int(tempList1.size()-1)));
    tempList0.add(tempList1.get(j));
    tempList1.remove(j);
    //println("l0=",tempList0.size(),"l1 = ",tempList1.size()," j= ",j, "t=",towers.size());
  }
  towers = new ArrayList<slot>(tempList0);
}

void INSERTION() { //FINISHED NEEL! I DID IT!
  int correct = 0;
  slot tower0 = towers.get(0);
  slot tower1;
  int whichOne = 0;
  for (int i = 0; i < towers.size(); i += 1) {
    if (!(i == towers.size()-1)) {
      tower0 = towers.get(i+1);
      tower1 = towers.get(i);
      if ((tower0.h < tower1.h)) {
        whichOne = i+1;
        i = towers.size();
      }
    }
  }
  if (!(whichOne == 0)) {
    tower0 = towers.get(whichOne);
    tower1 = towers.get(whichOne-1);
    towers.remove(whichOne);
    correct = whichOne;
    println(correct + " 0.y " + tower0.y + " 1.y " +tower1.y);
    while (correct > 0 && tower0.y > tower1.y) {
      correct--;
      tower1 = towers.get(correct);
      println(correct + "KillGOD");
    }
    if (correct >0) {
      towers.add(correct+1, tower0);
    } else {
      tower1 = towers.get(0);
      if (tower0.y < tower1.y) {
        towers.add(1, tower0);
      }
      if (tower0.y > tower1.y) {
        towers.add(0, tower0);
      }
    }
  }
  //println("l0=",tower0.y,"l1 = "," j= ",whichOne, "t=",towers.size());
}

void BUBBLE() {
  slot tower0 = towers.get(0);
  slot tower1 = towers.get(1);
  for (int i = 0; i < towers.size()-1; i += 1) {
    tower0 = towers.get(i);
    tower1 = towers.get(i+1);
    if (tower0.y < tower1.y) {
      towers.remove(i);
      towers.add(i+1, tower0);
    }
    if (tower0.y > tower1.y) {
    }
  }
}

void QUICK() {
  slot tower0 = towers.get(0);
  slot tower1 = towers.get(1);
}
void RESIZE() { //might be useless. This code runs every frame for some reason?
  for (int i = 0; i < towers.size(); i += 1) {
    slot tower = towers.get(i);
    pallete(#FFAD77);
    strokeWeight(0);
    tower.update(ceil((100+(i*(ceil(1000/towers.size()))))), (ceil((1000)/towers.size())));
    pallete(color(#9FFF9F));
  }
}
}
