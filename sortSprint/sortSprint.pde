//sortSprint prototype for the FBLA contests
ArrayList<slot> towers = new ArrayList<slot>();
float temp1;
boolean rightArrow = false; boolean leftArrow = false; boolean upArrow = false; 
player player1 = new player(10, 600);
PImage[] prototype = new PImage[4];
int controls = 0;
void setup() {
  prototype[1] = loadImage("prototype.png");
  frameRate(60);
  size(1200,900);
  for (int i = 0; i < 40; i++) { //i controls amount of columns, use a integer lkkkkdivisor of 1000 for best results. Recommending max: 40 to prevent tower climbing with clipping.
    temp1 = (random(25, 700));
    towers.add(new slot(25, 0, 25, round(temp1)));
  }
}    
//everyFramePlays
void draw() {
  background(0); //black background
  //player1.inair = true;
  pallete(#FFFFFF);
  rect(0, 750, 100, 50);
  rect(1100, 400, 100, 400);
  input();
  
  for (int j = 0; j < 4; j +=1) {
    for (int i = 0; i < towers.size(); i += 1) {
      slot tower = towers.get(i);
      pallete(#FFAD77);
      strokeWeight(0);
      tower.update(ceil((100+(i*(ceil(1000/towers.size()))))), (ceil((1000)/towers.size())));
      tower.display();
      pallete(color(#9FFF9F));
      player1.collision(tower);
    }
  }
  player1.move();
  player1.display();
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
  print(keyCode);
  if (keyCode == 49) {
    STALIN();
  }
  print(keyCode);
  if (keyCode == 50) {
    BOGO();
  }
  if (keyCode == 51) {
    INSERTION();
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
}
void mouseClicked() {
  println(mouseX + "," + mouseY);
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

void INSERTION() {
  ArrayList<slot> tempList0 = new ArrayList<slot>();
  ArrayList<slot> tempList1 = new ArrayList<slot>();
  boolean sorted = false;
  slot tower0;
  slot tower1;
  slot tower2;
  int whichOne = 0;
  //findStart: starts off from the last spot it was. 
  for (int i = 0; i < towers.size(); i += 1) {
    tower0 = towers.get(i+1);
    tower1 = towers.get(i);
    if ((tower0.h < tower1.h)) {
      whichOne = i+1;
      i = towers.size();
    }
  }
  tower0 = towers.get(whichOne);
  towers.remove(whichOne);
  tower1 = towers.get(whichOne-1);
  for (int i = whichOne; i >= 0; i--) {
    if (i > 0) {
      tower1 = towers.get(i-1);
      print("till goin");
    }
    if (sorted == false &&  tower0.y >= tower1.y && i > 0); {
      towers.add(i, tower0);
      sorted = true;
    }
  }
  println("l0=",tower0.y,"l1 = ",tower1.y," j= ",whichOne, "t=",towers.size());
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
