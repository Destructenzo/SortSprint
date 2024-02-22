public class Game extends Screen {//this is the class that runs the main game. it has all of the sorting algorythms here
  private ArrayList<Slot> towers = new ArrayList<Slot>();//instance variables
  private float temp1;
  private boolean bossFight = false;
  private int cooldown = 120;
  private boolean isOver = false;
  private boolean canRemoval = true;
  private boolean canShuffle = true;
  private boolean canInsertion = true;
  private boolean canBubble = true;
  private int score;
  private Button exit, goOn;
  player p;
  public Game(int x, int y, color c, int s, Button b, player p, Button b1) {//constructor
    super(x, y, c);
    for (int i = 0; i < 40; i++) {
      temp1 = (random(125, 800));
      towers.add(new Slot(25, 0, 25, round(temp1)));
      this.score = s;
      this.exit = b;
      this.p = p;
      this.p.setX(10);
      this.p.setY(600);
      this.goOn = b1;
    }
  }
  public void input() {//input method reads the input the user puts in and translats that into methods
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
    if (bossFight) {
      boss1.display();
    }
    if (cooldown > 0) {
      cooldown --;
    }
    score--;
    stroke(75, 75, 200);
    strokeWeight(1);
    fill(25, 25, 55);
    rect(0, 750, 100, 150);
    rect(1100, 400, 100, 500);
    input(); //sorry it is at the bottom of the SortSprint tab.
    for (int j = 0; j < 4; j +=1) {
      for (int i = 0; i < towers.size(); i += 1) {
        Slot tower = towers.get(i);
        fill(25, 25, 50);
        stroke(50, 255, 110, 200);
        strokeWeight(1);
        tower.update(ceil((100+(i*(ceil(1000/towers.size()))))), (ceil((1000)/towers.size())));
        tower.display();
        towers.set(i, tower);
        pallete(color(#9FFF9F));
        player1.collision(tower);
      }
    }
    fill(col2);
    rect(0, 0, 400, 100);
    textSize(50);
    fill(col3);
    textAlign(LEFT, CENTER);
    stroke(0);
    strokeWeight(1);
    text("Score: " + ceil(((float)score)/60), 10, 25);
    text("CoolDown: " + ceil(((float)cooldown)/60), 10, 75);
    player1.move();
    player1.display();
    if (player1.getX() >= 1100 && player1.getY() >= 300) {
      goOn.setSize(100, 600, 400, 120);
      goOn.display();
    }
    if (score <= 0) {
      Lose = true;
      this.toggleGame();
    }
  }
  public void toggleGame() {//mix between getter and setter methods
    isOver = !isOver;
  }
  public void setBossFight(boolean f) {
    this.bossFight = f;
  }
  public boolean getBossFight() {
    return bossFight;
  }
  public int getScore() {
    return score;
  }
  public void setScore(int s) {
    this.score = s;
  }
  public boolean getOver() {
    return isOver;
  }
  public int getCooldown() {
    return cooldown;
  }
  public boolean getRemoval() {
    return canRemoval;
  }
  public boolean getShuffle() {
    return canShuffle;
  }
  public boolean getInsertion() {
    return canInsertion;
  }
  public boolean getBubble() {
    return canBubble;
  }
  public void setRemoval(boolean r) {
    this.canRemoval = r;
  }
  public void setShuffle(boolean s) {
    this.canShuffle = s;
  }
  public void setInsertion(boolean i) {
    this.canInsertion = i;
  }
  public void setBubble(boolean b) {
    this.canBubble = b;
  }

  public void reSize() { //addition needed for the removal
    for (int i = 0; i < towers.size(); i += 1) {
      Slot tower = towers.get(i);
      pallete(#FFAD77);
      strokeWeight(0);
      tower.update(ceil((100+(i*(ceil(1000/towers.size()))))), (ceil((1000)/towers.size())));
      pallete(color(#9FFF9F));
    }
  }
  public void removal() {//first sorting algorythm. this one removes any item not in order
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
  public void shuffle() {// randomly mixes all elements in a list 
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
  public void insertion() { //takes the first element out of order and puts it in order
    cooldown += 120;
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
  }

  public void bubble() {//looks through the list and swaps any elements that are adjacent but in the wrong order
    cooldown += 0;
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
}
