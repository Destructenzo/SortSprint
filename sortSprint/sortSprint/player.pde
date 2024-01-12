class player {
  float x = 0, y= 0, w = 25, h = 25, jFrames = 0;
  float grav = 2; float fall = 0;
  boolean canRight = true, canLeft = true, jump = false, stop = false, inair = true;
  int VX = 3;
  player (int baseX, int baseY) {
    x = baseX;
    y = baseY;
  }
  
  void jump() {
    if (jump == false) {
      fall = millis();
    }
    if (jump == true && (fall+500 >= millis())) {
      y -= 7;
    } else {
      jump = false;
      inair = true;
    }
  }
  void moveRight() {
      rightArrow = true;
    }
  void moveLeft() {
      leftArrow = true;
    }
  void collision(slot tower) {
    if (y+25 >= 750 && x+25 < 100 &&  x > -5 && inair == true && grav != 0) { //first platform
      jump = true;
      if (stop == false) {
        y -= 1;
      }
      inair = false;
    }  if (y+25 >= 750 && x < 100 &&  x > -5 && inair == true && grav != 0) { //first platform
      jump = true;
      if (stop == false) {
        y -= 1;
      }
      inair = false;
    }
    if (y+25 >= tower.y && x <= tower.x && x+25 >=tower.x+tower.w) { //tower floor
      if (inair == false) {
        y -= grav;
      }
      inair = false;
      jump = true;
    }
    if (y+25 >= tower.y && x <= tower.x && x+25 >= (tower.x+tower.w)) { //tower floor
        inair = false;
        y -=1 ;
        jump = true;
    } if (y+25 >= tower.y && x <= tower.x && x+25 >=tower.x+tower.w) { //tower floor
      inair = false;
      jump = true;
      if (inair == false) {
        y -= 1;
      }
    } if (y+25 >= tower.y && x <= tower.x && x >=tower.x+tower.w && y <= tower.y) { //tower floor
      inair = false;jump = true;
      print("center");
      if (inair == false) {
          y -= 1;
      }
      inair = false;
      if (inair == true) {
        y += grav;
      }
    }
    if (x+25 >= tower.x && y+25 > tower.y && x < tower.x) { // tower side
        x -= VX;
    }
    if (x >= tower.x && y-25 <=tower.y && x <= tower.x) {
      //grav = 0;
    }
    if (x <= 0) {
      x++;
        print("hit");
      }
    if (x >= 1200) {
        x -= 1;
        print("rightWall");
    }
  }
  void move() {
  if (inair == true) {
    y += grav;
  }
  if (rightArrow == true) {
    x += VX;
  }
  if (leftArrow == true) {
    x-= VX;
  }
  
  }
  void display() {
    println(x + "," + y + "," + "," + inair);
    rect(x, y, w, h);
  }
}
