class Spaceship extends Floater  
{   
  protected double brakingPower, offSetRot;
  protected int alpha, turnPower;
    Spaceship()
    {
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 0;
      yCorners[1] = -2;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = 16;
      yCorners[3] = -1;
      alpha = 255;
      myColor = color(200, 200, 200, alpha);
      myCenterX = width/2;
      myCenterY = height/2;
      myXspeed = myYspeed = 0;
      myPointDirection = 0.001;
      brakingPower = 0.25;
      offSetRot = 0;
      turnPower = 3;
    }
    
    public double getX() { return myCenterX; }
    public void setX(double d) { myCenterX = d; }
    public double getY() { return myCenterY; }
    public void setY(double d) { myCenterY = d; }
    public double getBrakes() { return brakingPower; }
    public double getSpeed() { 
      if(myXspeed >= 0 && myYspeed > 0) 
        return Math.sqrt( Math.pow(myXspeed, 2) + Math.pow(myYspeed, 2) );
      if(myXspeed <= 0 && myYspeed < 0) 
        return -Math.sqrt( Math.pow(myXspeed, 2) + Math.pow(myYspeed, 2) );
      if(myXspeed <= 0 && myYspeed > 0) 
        return -Math.sqrt( Math.pow(myXspeed, 2) + Math.pow(myYspeed, 2) );
      if(myXspeed >= 0 && myYspeed < 0) 
        return Math.sqrt( Math.pow(myXspeed, 2) + Math.pow(myYspeed, 2) );
      return 0;
    }
  
    public double getSpeedPlusAccel(double accelAmount)
    {
      double dRadians = myPointDirection*(Math.PI/180);
      double plusX = accelAmount * Math.cos(dRadians);
      double plusY = accelAmount * Math.sin(dRadians);

      if(myXspeed >= 0 && myYspeed > 0) 
        return Math.sqrt( Math.pow(myXspeed + plusX, 2) + Math.pow(myYspeed + plusY, 2) );
      if(myXspeed <= 0 && myYspeed < 0) 
        return -Math.sqrt( Math.pow(myXspeed + plusX, 2) + Math.pow(myYspeed + plusY, 2) );
      if(myXspeed <= 0 && myYspeed > 0) 
        return -Math.sqrt( Math.pow(myXspeed + plusX, 2) + Math.pow(myYspeed + plusY, 2) );
      if(myXspeed >= 0 && myYspeed < 0) 
        return Math.sqrt( Math.pow(myXspeed + plusX, 2) + Math.pow(myYspeed + plusY, 2) );
      return 0;
    }
    public double getXspeed() { return myXspeed; }
    public void setXspeed(double d) { myXspeed = d; }
    public double getYspeed() { return myYspeed; }
    public void setYspeed(double d) { myYspeed = d; }
    public double getDirection() { return myPointDirection; }
    public void setDirection(double d) { myPointDirection = d; }
    public double getAngleofDirection() { 
      if(myXspeed != 0)
        return Math.atan(myYspeed/myXspeed);
      else if(myYspeed > 0)
      {
        return 3*PI/2;
      }
      else if(myYspeed < 0)
      {
        return PI/2;
      }
      else return 0;
  }
  public double getAngle(double x, double y) {
      if(x != 0)
        return Math.atan(y/x);
      else if(y > 0)
      {
        return 3*PI/2;
      }
      else if(y < 0)
      {
        return PI/2;
      }
      else return 0;
  }
  public void move ()
  {          
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if(myCenterX > width)
    {     
      myCenterX -= width;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX += width;    
    }    
    if(myCenterY > height)
    {    
      myCenterY -= height;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY += height;    
    }   
  }
  public int getCorners() { return corners; }
  public double getCornerPosX(int i) { return xCorners[i] + myCenterX; }
  public double getCornerPosY(int i) { return yCorners[i] + myCenterY; }
  public void kill() { alpha = 0; myColor = color(200, 200, 200, alpha); }
  public void setCol(int col) { myColor = color(col); }
  public void rot(double d) { offSetRot += d; }
  public double rot() { return offSetRot; }
  public int getTurnPower() { return turnPower; }
}
