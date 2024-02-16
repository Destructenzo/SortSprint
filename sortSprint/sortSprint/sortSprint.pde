//Updated upstream
class sortSprint{
public static void sortSprint(Sting[] args){
//sortSprint prototype for the FBLA contests  SPIDER: Student Production Imitation & Duplication Economy Robot
ArrayList<slot> towers = new ArrayList<slot>();
float temp1;
boolean rightArrow = false; boolean leftArrow = false; boolean upArrow = false; 
player player1 = new player(10, 600);
PImage[] prototype = new PImage[5];
int controls = 0;
void setup() {
  prototype[0] = loadImage("prototype.png");
  prototype[1] = loadImage("spiderSimR.png");
  prototype[2] = loadImage("spiderSimR1.png");
  prototype[3] = loadImage("spiderSimL.png");
  prototype[4] = loadImage("spiderSimL1.png");
  
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
  pallete(#0F0F8F);
  rect(0, 750, 100, 50);
  rect(1100, 400, 100, 400);
  input();
  
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
>>>>>>> Stashed changes

}
