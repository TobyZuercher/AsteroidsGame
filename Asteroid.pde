class Asteroid extends Floater {
  private double turnSpeed;
  Asteroid() {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 5;
    yCorners[0] = -10;
    xCorners[1] = 10;
    yCorners[1] = 0;
    xCorners[2] = 5;
    yCorners[2] = 10;
    xCorners[3] = -5;
    yCorners[3] = 10;
    xCorners[4] = -10;
    yCorners[4] = 0;
    xCorners[5] = -5;
    yCorners[5] = -10;
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
    myXspeed = Math.cos(myPointDirection);
    myYspeed = Math.sin(myPointDirection);
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
}
