  //sortSprint prototype for the FBLA contests
ArrayList<slot> towers = new ArrayList<slot>();
float temp1;
boolean rightArrow = false; boolean leftArrow = false; boolean upArrow = false; 
player player1 = new player(10, 600);
int controls = 0;
void setup() {
  frameRate(60);
  size(1200,900);
  for (int i = 0; i < 50; i++) { //i controls amount of columns, use a integer divisor of 1000 for best results
    temp1 = (random(25, 700));
    towers.add(new slot(25, 0, 25, round(temp1)));
  }
}
//everyFramePlays
void draw() {
  background(0); //black background
  pallete(#FFFFFF);
  rect(0, 750, 100, 50);
  rect(1100, 400, 100, 400);
  input();
  for (int i = 0; i < towers.size(); i += 1) {
    slot tower = towers.get(i);
    pallete(#FFAD77);
    strokeWeight(0);
    tower.update(ceil((100+(i*(ceil(1000/towers.size()))))), (ceil((1000)/towers.size())));
    tower.display();
    pallete(color(#9FFF9F));
    player1.collision(tower);
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
    rightArrow = false;
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
    slot tower0 = towers.get(i);
    slot tower1 = towers.get(i+1);
    if (tower0.y <= tower1.y) {
      tempList.add(tower1);
    }
  }
  towers = tempList;
  while (tempList.size() <= 0) {
    shorten(tempList);
  }
  RESIZE();
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
