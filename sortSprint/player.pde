class player {
  float x = 0, y= 0, w = 25, h = 25, jFrames = 0;
  float grav = 2; float fall = 0;
  boolean canRight = true, canLeft = true, jump = false, stop = false, inair = true;
  int VX = 3; int disp = 0; int dispStep = 0;
  player (int baseX, int baseY) {
    x = baseX;
    y = baseY;
  }
  
  void jump() {//this is jump, works .5 seconds or 500 millis. Change the 500 to raise the time
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
  //are you GOING to move right. 
  void moveRight() {
      rightArrow = true;
  }
  //are you GOING to move left?
  void moveLeft() {
      leftArrow = true;
    }
  void collision(slot tower) {
    canRight = true;
    canLeft = true;
    if (y+25 >= 750 && x+25 < 100 &&  x > -5 && inair == true && grav != 0) { //first platform
      jump = true;
      y -= 1;
      inair = false;
    }  if (y+25 >= 750 && x < 100 &&  x > -5 && inair == true && grav != 0) { //first platform
    print("plat");
      jump = true;
      y -= 1;
      inair = false;
    } //second, final platform. 
    if (y+25 >= 400 && x+25 < 1205 &&  x > 1100 && inair == true && grav != 0) { //last platform
      jump = true;
      y -= 1;
      inair = false;
    }  if (y+25 >= 400 && x < 1100 &&  x+25 > 1100 && inair == true && grav != 0) { //first platform
    print("plat");
      jump = true;
      y -= 1;
      inair = false;
    } if (x+25 >= 1100 && y+25 > 400 && x < 1100) { // tower side
        x -= VX;
    }//                    
    //the tower fed into this. for now it checks against everything in existence.
    if (x+25 >= tower.x && y+25 > tower.y && x < tower.x) { // tower side
        x -= VX; canRight = false;
    } if (x <= tower.x+tower.w && y+w > tower.y && x+w > tower.x+tower.w) { // tower side
        x += VX; canLeft = false;
    }//                                                                                                          ____[]___
    if (y+h > tower.y && x+w < tower.x+tower.w &&  x > tower.x && inair == true) { //tower floor TILE IN CENTER [_________]   WORKS
      y -= grav;
      inair = false;
      jump = true;
    }                                                                                                     //  []_____
    if (y+h > tower.y && x < tower.x &&  x+w > tower.x && inair == true) { //tower floor TILE ON LEFT          |_____]
        inair = false;
        y -= grav ;
        jump = true;
    } if (y+25 > tower.y && x <= tower.x+tower.w && x+25 >=tower.x) { //tower floor RIGT
      inair = false;
      jump = true;
      y -= grav;
    } 
    if (x >= tower.x && y-25 <=tower.y && x <= tower.x) {
      //grav = 0;
    }
    if (x <= 0) {x++; print("hit");}
    if (x+25 >= 1200) {x -= 3;print("rightWall");}
  }
  //this is player input, should run BEFORE collsion
  void move() {
    if (inair == true) {
      y += grav;
    }  
    if (rightArrow == true && canRight == true) {
      x += VX;
      disp = 1;
      if (inair = true) {
        
      }
      
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
