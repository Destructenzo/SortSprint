public class player {
  private float x = 0;//instance variables
  private float y= 0;
  private float w = 25;
  private float h = 25;
  private float grav = 2;
  private float fall = 0;
  private boolean canRight = true;
  private boolean canLeft = true;
  private boolean jump = false;
  private boolean inair = true;
  private int VX = 3;
  private int disp = 0;
  private int dispStep = 0;
  private int BUFF = 0;
  player (float x, float y) {
    this.x = x;
    this.y = y;
  }
  public float getX(){
    return x;
  }
  public float getY(){
    return y;
  }
  public float getW(){
    return w;
  }
  public float getH(){
    return h;
  }
  public void setJump(boolean j) {
    this.jump = j;
  }
  public void setX(float x){
    this.x = x;
  }
  public void setY(float y){
    this.y = y;
  }
  void jump() {//this is jump, works .5 seconds or 500 millis. Change the 500 to raise the time
    if (jump == false) {
      fall = millis();
    }
    if (jump == true && (fall+400+(BUFF*(250/20)) >= millis())) {
      y -= 7;
    } else {
      jump = false;
      inair = true;
    }
  }
  //are you GOING to move right.
  void moveRight() {
    rightArrow = true;
  }
  //are you GOING to move left?
  void moveLeft() {
    leftArrow = true;
  }
  void collision(Slot tower) {
    canRight = true;
    canLeft = true;
    if (y+25 >= 750 && x+25 < 100 &&  x > -5 && inair == true && grav != 0) { //first platform
      jump = true;
      y -= 1;
      inair = false;
    }
    if (y+25 >= 750 && x < 100 &&  x > -5 && inair == true && grav != 0) { //first platform
      print("plat");
      jump = true;
      y -= 1;
      inair = false;
    } //second, final platform.
    if (y+25 >= 400 && x+25 < 1205 &&  x > 1100 && inair == true && grav != 0) { //last platform
      jump = true;
      y -= 1;
      inair = false;
    }
    if (y+25 >= 400 && x < 1100 &&  x+25 > 1100 && inair == true && grav != 0) { //first platform
      print("plat");
      jump = true;
      y -= 1;
      inair = false;
    }
    if (x+25 >= 1100 && y+25 > 400 && x < 1100) { // tower side
      x -= VX;
    }//
    //the tower fed into this. for now it checks against everything in existence.
    if (x+25 >= tower.getX() && y+25 > tower.getY() && x < tower.getX()) { // tower side
      x -= VX;
      canRight = false;
    }
    if (x <= tower.getX()+tower.getW() && y+w > tower.getY() && x+w > tower.getX()+tower.getW()) { // tower side
      x += VX;
      canLeft = false;
    }//                                                                                                          ____[]___
    if (y+h > tower.getY() && x+w < tower.getX()+tower.getW() &&  x > tower.getX() && inair == true) { //tower floor TILE IN CENTER [_________]   WORKS
      y -= grav;
      inair = false;
      jump = true;
    }                                                                                                     //  []_____
    if (y+h > tower.getY() && x < tower.getX() &&  x+w > tower.getX() && inair == true) { //tower floor TILE ON LEFT          |_____]
      inair = false;
      y -= grav ;
      jump = true;
    }
    if (y+25 > tower.getY() && x <= tower.getX()+tower.getW() && x+25 >=tower.getX()) { //tower floor RIGT
      inair = false;
      jump = true;
      y -= grav;
    }
    if (x >= tower.getX() && y-25 <=tower.getY() && x <= tower.getX()) {
      //grav = 0;
    }
    if (x <= 0) {
      x++;
      print("hit");
    }
    if (x+25 >= 1200) {
      x -= 3;
      x = 10;
      y = 400;
      print("rightWall");
      if (bossTime == true) {
        bossTime = false;
        justOne.remove(0);
      }
      if (bossTime == false) {
        justOne.add(new boss(400, 25));
        bossTime = true;
      } 
      //bossTime = true;
    }
  }
  //this is player input, should run BEFORE collsion
  void move() {
    if (inair == true) {
      y += grav;
    }
    if (rightArrow == true && canRight == true) {
      x += VX;
      disp = 1;
      //     if (inair = true) {
      //   }
    }
    if (leftArrow == true && canLeft == true) {
      x-= VX;
      disp = 3;
    }
  }
  //This displays the character, for now just a 25x25 rect, maybe later it can be a 25x25 sprite that checks state and we get a spritesheet
  void display() {
    //println(x + "," + y + "," + "," + inair);
    //rect(x, y, w, h);
    if (dispStep == 1) {
      dispStep = 0;
    }
    if ((millis()%5) == 0) {
      dispStep = 1;
    }
    image(prototype[disp+dispStep], (x), (y));
  }
}
