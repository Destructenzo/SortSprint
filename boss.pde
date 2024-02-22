  public class Boss {//final boss of the game

  private float x = 300;//instances variables
  private float y = 50;
  private float tempX, tempY;
  private int cooldown = 180;
  private  int shotTimer = 120;
  private  boolean follow = true;
  private boolean hasShot = false;
  Boss() {//basic constructor
  }

  public void setFollow(boolean f) {
    this.follow = f;
  }
  public void display() {//he follows you and will shoot lasers at you. if one hits, it is game over.
    if (cooldown >0) {
      cooldown--;
    }
    if (follow) {
      x = player1.getX();
      y = 50;
      image(bigBoiPics[0], x, y);
    }
    if (cooldown == 0) {
      image(bigBoiPics[3], x, y);
      follow = false;
      if (shotTimer > 0) {
        shotTimer --;
      }
      if (!hasShot) {
        tempX = player1.getX()+12;
        tempY = player1.getY()+12;
        hasShot =!hasShot;
      }
      strokeWeight(10);
      stroke(255, 0, 0);
      fill(255, 0, 0);
      col1 = color (255, 0, 0);
      tempX = player1.getX();
      tempY = player1.getY();
      line(x, y, tempX, tempY);
      if (shotTimer == 0) {
        follow = true;
        hasShot = !hasShot;
        cooldown = 180;
        hasShot = true;
        shotTimer = 120;
        if (player1.getX() <= tempX && tempX <= (player1.getX()+player1.getW()) && player1.getY() <= tempY && tempY <= (player1.getY()+player1.getH())) {
          game2.setScore(0);
        }
      }
    }
  }
}
