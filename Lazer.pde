class Lazer {
  protected double xPos, yPos, xSpeed, ySpeed, angle;
  Lazer(double x, double y, double r, double xS, double yS) {
    xPos = x;
    yPos = y;
    angle = r;
    xSpeed = 20 * Math.cos(r) + xS;
    ySpeed = 20 * Math.sin(r) + yS;
  }
  public void move() {
    xPos += xSpeed;
    yPos += ySpeed;
  }
  public void show() {
    pushMatrix();
    translate((float)xPos, (float)yPos);
    rotate((float)angle);
    rectMode(CENTER);
    fill(255, 0, 0);
    stroke(255, 0, 0);
    rect(0, 0, 10, 3, 4);
    popMatrix();
  }
  
  public double[] getHB() {
    double[] d = new double[4];
    d[0] = xPos + Math.cos(angle) * 5;
    d[1] = yPos + Math.sin(angle) * 5;
    d[2] = xPos - Math.cos(angle) * 5;
    d[3] = yPos - Math.sin(angle) * 5;
    return d;
  }
  
  
  public double getX() { return xPos; }
  public double getY() { return yPos; }
  public void setX(double x) { xPos = x; }
  public void setY(double y) { yPos = y; }
}
