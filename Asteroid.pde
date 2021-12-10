class Asteroid extends Floater {
  private double turnSpeed;
  Asteroid(double s) {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = (int)(Math.random() * 3) + 4;
    yCorners[0] = -(int)(Math.random() * 3) - 9;
    xCorners[1] = (int)(Math.random() * 4) + 11;
    yCorners[1] = (int)(Math.random() * 3) -1;
    xCorners[2] = (int)(Math.random() * 3) + 4;
    yCorners[2] = (int)(Math.random() * 3) + 9;
    xCorners[3] = -(int)(Math.random() * 3) - 4;
    yCorners[3] = (int)(Math.random() * 3) + 9;
    xCorners[4] = -(int)(Math.random() * 4) - 11;
    yCorners[4] = (int)(Math.random() * 3) -1;
    xCorners[5] = -(int)(Math.random() * 3) - 4;
    yCorners[5] = -(int)(Math.random() * 3) - 9;
    myCenterX = (Math.random() * (width + 100) - 50);
    if(myCenterX > -10 && myCenterX < width + 10) {
      if(Math.random() < 0.5)
        myCenterY = (Math.random() * 40 - 50);
      else
        myCenterY = (Math.random() * 40 + width + 10);
    }
    else myCenterY = (Math.random() * (height + 100) - 50);
    myColor = color(100);
    translate(width/2, height/2);
    myPointDirection = Math.atan2(myCenterX - width/2, myCenterY - height/2) + (Math.random() * 20 - 10);
    translate(-width/2, -height/2);
    myXspeed = Math.cos(myPointDirection) * s;
    myYspeed = Math.sin(myPointDirection) * s;
    turnSpeed = (Math.random() * 7 + 3);
  }
  void move() {
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if(myCenterX > width + 50)
    {     
      myCenterX -= width + 100;    
    }    
    else if (myCenterX < -50)
    {     
      myCenterX += width + 100;    
    }    
    if(myCenterY > height + 50 )
    {    
      myCenterY -= height + 100;    
    } 
    
    else if (myCenterY < -50)
    {     
      myCenterY += height + 100;    
    }
    turn(turnSpeed);
  }
  double getRadius() {
    double d = 0;
    for(int i = 0; i < corners; i++)
      d+= (double)dist((float)myCenterX, (float)myCenterY, (float)(xCorners[i] + myCenterX), (float)(yCorners[i] + myCenterY));
    return d/corners;
  }
  double getCenterX() { return myCenterX; }
  double getCenterY() { return myCenterY; }
}
