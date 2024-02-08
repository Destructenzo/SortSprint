public class Game extends Screen {
  private ArrayList<Slot> towers = new ArrayList<Slot>();
  private float temp1;
  //  private int menu = 1;
  private int cooldown = 120;
  private boolean isOver = false;
  private boolean canStalin = true;
  private boolean canBOGO = true;
  private boolean canInsertion = true;
  private boolean canBubble = true;
  private int score;
  private Button exit;
  //boolean rightArrow = false;
  //boolean leftArrow = false;
  //boolean upArrow = false;
  //player player1 = new player(10, 600);
  public Game(int x, int y, color c, int s, Button b) {
    super(x, y, c);
    for (int i = 0; i < 40; i++) {
      temp1 = (random(25, 700));
      towers.add(new Slot(25, 0, 25, round(temp1)));
      this.score = s;
      this.exit = b;
    }
  }
  public void input() {
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
  public void display() {
    super.display();
    exit.display();
    if (cooldown > 0) {
      cooldown --;
    }
    score--;
    stroke(0);
    strokeWeight(1);
    rect(0, 750, 100, 50);
    rect(1100, 400, 100, 400);
    input(); //sorry it is at the bottom of the SortSprint tab.
    for (int j = 0; j < 4; j +=1) {
      for (int i = 0; i < towers.size(); i += 1) {
        Slot tower = towers.get(i);
        pallete(#9a0a9a);
        stroke(#0F090F);
        strokeWeight(1);
        tower.update(ceil((100+(i*(ceil(1000/towers.size()))))), (ceil((1000)/towers.size())));
        tower.display();
        towers.set(i, tower);
        pallete(color(#9FFF9F));
        player1.collision(tower);
      }
    }
    
    player1.move();
    player1.display();
    fill(col2);
    rect(0, 0, 400, 100);
    textSize(50);
    fill(col3);
    textAlign(LEFT, CENTER);
    stroke(0);
    strokeWeight(1);
    text("Score: " + ceil(((float)score)/60), 10, 25);
    text("CoolDown: " + ceil(((float)cooldown)/60), 10, 75);
    if (bossTime == true) {
      THEGOV.display();
    }
  }
  public void toggleGame() {
    isOver = !isOver;
  }
  public boolean getOver() {
    return isOver;
  }
  public int getCooldown() {
    return cooldown;
  }
  public boolean getStalin() {
    return canStalin;
  }
  public boolean getBOGO() {
    return canBOGO;
  }
  public boolean getInsertion() {
    return canInsertion;
  }
  public boolean getBubble() {
    return canBubble;
  }
  public void reSize() { //might be useless. This code runs every frame for some reason?
    for (int i = 0; i < towers.size(); i += 1) {
      Slot tower = towers.get(i);
      pallete(#FFAD77);
      strokeWeight(0);
      tower.update(ceil((100+(i*(ceil(1000/towers.size()))))), (ceil((1000)/towers.size())));
      pallete(color(#9FFF9F));
    }
  }
  public void stalin() {
    cooldown +=120;
    ArrayList<Slot> tempList = new ArrayList<Slot>();
    tempList.add(towers.get(0));
    for (int i = 0; i < towers.size()-1; i ++) {
      Slot tower0 = tempList.get(tempList.size()-1);
      Slot tower1 = towers.get(i+1);
      if (tower0.getY() >= tower1.getY()) {
        tempList.add(tower1);
      }
    }
    towers = new ArrayList<Slot>(tempList);
    while (tempList.size() <= 0) {
      shorten(tempList);
    }
    this.reSize();
  }
  public void bogo() {
    cooldown += 120;
    ArrayList<Slot> tempList0 = new ArrayList<Slot>();
    ArrayList<Slot> tempList1 = new ArrayList<Slot>(towers);
    int j;
    for (int i = 0; i < towers.size(); i++) {
      j = round(random(0, int(tempList1.size()-1)));
      tempList0.add(tempList1.get(j));
      tempList1.remove(j);
      //println("l0=",tempList0.size(),"l1 = ",tempList1.size()," j= ",j, "t=",towers.size());
    }
    towers = new ArrayList<Slot>(tempList0);
  }
  public void insertion() { //FINISHED NEEL! I DID IT!
    cooldown += 30;
    int correct = 0;
    Slot tower0 = towers.get(0);
    Slot tower1;
    int whichOne = 0;
    for (int i = 0; i < towers.size(); i ++) {
      if (!(i == towers.size()-1)) {
        tower0 = towers.get(i+1);
        tower1 = towers.get(i);
        if ((tower0.getH() < tower1.getH())) {
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
      println(correct + " 0.y " + tower0.getY() + " 1.y " +tower1.getY());
      while (correct > 0 && tower0.getY() > tower1.getY()) {
        correct--;
        tower1 = towers.get(correct);
        println(correct + "KillGOD");
      }
      if (correct >0) {
        towers.add(correct+1, tower0);
      } else {
        tower1 = towers.get(0);
        if (tower0.getY() < tower1.getY()) {
          towers.add(1, tower0);
        }
        if (tower0.getY() > tower1.getY()) {
          towers.add(0, tower0);
        }
      }
    }
    //println("l0=",tower0.y,"l1 = "," j= ",whichOne, "t=",towers.size());
  }

  public void bubble() {
    cooldown +=60;
    Slot tower0 = towers.get(0);
    Slot tower1 = towers.get(1);
    for (int i = 0; i < towers.size()-1; i ++) {
      tower0 = towers.get(i);
      tower1 = towers.get(i+1);
      if (tower0.getY() < tower1.getY()) {
        towers.remove(i);
        towers.add(i+1, tower0);
      }
      if (tower0.getY() > tower1.getY()) {
      }
    }
  }

  //  //everyFramePlays

  //  //sortingAlgorithms
  //  public void STALIN() {
  //    ArrayList<Slot> tempList = new ArrayList<Slot>();
  //    tempList.add(towers.get(0));
  //    for (int i = 0; i < towers.size()-1; i += 1) {
  //      Slot tower0 = tempList.get(tempList.size()-1);
  //      Slot tower1 = towers.get(i+1);
  //      if (tower0.y >= tower1.y) {
  //        tempList.add(tower1);
  //      }
  //    }
  //    towers = new ArrayList<Slot>(tempList);
  //    while (tempList.size() <= 0) {
  //      shorten(tempList);
  //    }
  //    RESIZE();
  //  }

  //  public void BOGO() {
  //    ArrayList<Slot> tempList0 = new ArrayList<Slot>();
  //    ArrayList<Slot> tempList1 = new ArrayList<Slot>(towers);
  //    int j;
  //    for (int i = 0; i < towers.size(); ++i) {
  //      j = round(random(0, int(tempList1.size()-1)));
  //      tempList0.add(tempList1.get(j));
  //      tempList1.remove(j);
  //      //println("l0=",tempList0.size(),"l1 = ",tempList1.size()," j= ",j, "t=",towers.size());
  //    }
  //    towers = new ArrayList<Slot>(tempList0);
  //  }

  //  public void INSERTION() { //FINISHED NEEL! I DID IT!
  //    int correct = 0;
  //    Slot tower0 = towers.get(0);
  //    Slot tower1;
  //    int whichOne = 0;
  //    for (int i = 0; i < towers.size(); i += 1) {
  //      if (!(i == towers.size()-1)) {
  //        tower0 = towers.get(i+1);
  //        tower1 = towers.get(i);
  //        if ((tower0.h < tower1.h)) {
  //          whichOne = i+1;
  //          i = towers.size();
  //        }
  //      }
  //    }
  //    if (!(whichOne == 0)) {
  //      tower0 = towers.get(whichOne);
  //      tower1 = towers.get(whichOne-1);
  //      towers.remove(whichOne);
  //      correct = whichOne;
  //      println(correct + " 0.y " + tower0.y + " 1.y " +tower1.y);
  //      while (correct > 0 && tower0.y > tower1.y) {
  //        correct--;
  //        tower1 = towers.get(correct);
  //        println(correct + "KillGOD");
  //      }
  //      if (correct >0) {
  //        towers.add(correct+1, tower0);
  //      } else {
  //        tower1 = towers.get(0);
  //        if (tower0.y < tower1.y) {
  //          towers.add(1, tower0);
  //        }
  //        if (tower0.y > tower1.y) {
  //          towers.add(0, tower0);
  //        }
  //      }
  //    }
  //    //println("l0=",tower0.y,"l1 = "," j= ",whichOne, "t=",towers.size());
  //  }

  //  public void BUBBLE() {
  //    Slot tower0 = towers.get(0);
  //    Slot tower1 = towers.get(1);
  //    for (int i = 0; i < towers.size()-1; i += 1) {
  //      tower0 = towers.get(i);
  //      tower1 = towers.get(i+1);
  //      if (tower0.y < tower1.y) {
  //        towers.remove(i);
  //        towers.add(i+1, tower0);
  //      }
  //      if (tower0.y > tower1.y) {
  //      }
  //    }
  //  }

  //  public void QUICK() {
  //    Slot tower0 = towers.get(0);
  //    Slot tower1 = towers.get(1);
  //  }
  //  public void RESIZE() { //might be useless. This code runs every frame for some reason?
  //    for (int i = 0; i < towers.size(); i += 1) {
  //      Slot tower = towers.get(i);
  //      pallete(#FFAD77);
  //      strokeWeight(0);
  //      tower.update(ceil((100+(i*(ceil(1000/towers.size()))))), (ceil((1000)/towers.size())));
  //      pallete(color(#9FFF9F));
  //    }
  //  }
}
