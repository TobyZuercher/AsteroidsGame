Spaceship[] ships = new Spaceship[12];
Star[] stars = new Star[150];
ArrayList<Asteroid> asts = new ArrayList<Asteroid>();
ArrayList<Lazer> bullets = new ArrayList<Lazer>();
double[] xPos = {0, -35, -35, -60, -60, -20, -20, 20, 20, 60, 60, 100}, yPos = {0, -18, 18, -48, 48, -36, 36, -24, 24, -12, 12, 0};
int destAsteroids = 0, canShoot = 0;
boolean gameOver = false;

public void setup() 
{
  loop();
  destAsteroids = 0;
  gameOver = false;
  canShoot = 0;
  size(700, 700);
  background(0);
  for(int i = 0; i < stars.length; i++)
    stars[i] = new Star();
  for(int i = 0; i < ships.length; i++) {
    ships[i] = new Spaceship();
    double x = width/2, y = height/2;
    ships[i].setY(y + yPos[i]);
    ships[i].setX(x + xPos[i]);
    ships[i].addRot(degrees((float)ships[i].getAngle(ships[0].getX() - ships[i].getX(), ships[0].getY() - ships[i].getY())));
  }
  ships[0].setLives(1);
  ships[0].setCol(color(200, 50, 50));
  for(int i = 0; i < 15; i++) {
    asts.add(new Asteroid(1 + (double)destAsteroids/50));
  }
}

public void draw() 
{
  if(ships[0] == null) {
     gameOver = true;
  }
  if(gameOver) {
    noLoop();
    setEndScreen();
    return;
  }
  if(canShoot % 20 != 0)
    canShoot++;
  if(canShoot > 59)
    canShoot -= 60;
  fill(0, 0, 0, 130);
  noStroke();
  rect(0, 0, width, height);
  if(w && Math.abs(ships[0].getSpeedPlusAccel(0.1)) <= 10)
    for(int i = 0;i < ships.length; i++) {
      if(ships[i] != null)
        ships[i].accelerate(0.1);
    }
    
  if(a) {
    double x = ships[0].getX(), y = ships[0].getY();
    for(int i = 0; i < ships.length; i++) 
      if(ships[i] != null) {
        double p = (double)dist((float)x, (float)y, (float)(xPos[i] + x), (float)(yPos[i] + y));
        if(xPos[i] < 0)
          p = -(double)dist((float)x, (float)y, (float)(xPos[i] + x), (float)(yPos[i] + y));
        double ta = -(double)ships[i].getTurnPower();
        ships[i].turn(ta);
        ships[i].addRot(ta);
        while(ships[i].getRot() < 0)
          ships[i].addRot(360);
        ships[i].setY(y + p * Math.sin(radians((float)ships[i].getRot())));
        ships[i].setX(x + p * Math.cos(radians((float)ships[i].getRot())));
      }
  }
  
  if(d) {
    double x = ships[0].getX(), y = ships[0].getY();
    for(int i = 0; i < ships.length; i++) 
      if(ships[i] != null) {
        double q = (double)dist((float)x, (float)y, (float)(xPos[i] + x), (float)(yPos[i] + y));
        if(xPos[i] < 0)
          q = -(double)dist((float)x, (float)y, (float)(xPos[i] + x), (float)(yPos[i] + y));
        double td = (double)ships[i].getTurnPower();
        ships[i].turn(td);
        ships[i].addRot(td);
        while(ships[i].getRot() < 0)
          ships[i].addRot(360);
        ships[i].setY(y + q * Math.sin(radians((float)ships[i].getRot())));
        ships[i].setX(x + q * Math.cos(radians((float)ships[i].getRot())));
      }
  }
  
  if(space) {
    double x = (Math.random() * width), y = (Math.random() * height), pDir = (Math.random() * 360);
    for(int i = 0; i < ships.length; i++) 
      if(ships[i] != null) {
        double l = (double)dist((float)x, (float)y, (float)(xPos[i] + x), (float)(yPos[i] + y));
        if(xPos[i] < 0)
          l = -(double)dist((float)x, (float)y, (float)(xPos[i] + x), (float)(yPos[i] + y));
        ships[i].setYspeed(0);
        ships[i].setXspeed(0);
        ships[i].turn(pDir);
        ships[i].addRot(pDir);
        ships[i].setY(y + l * Math.sin(radians((float)ships[i].getRot())));
        ships[i].setX(x + l * Math.cos(radians((float)ships[i].getRot())));
      }
    for(int i = 0; i < stars.length; i++)
      stars[i].change();
    space = false;
  }
  
  if(r && canShoot % 20 == 0) {
    if(ships[0] != null) {
      canShoot++;
      float randSpread = random(2.5, 4);
      bullets.add(new Lazer(ships[0].getX(), ships[0].getY(), radians((float)ships[0].getDirection()), ships[0].getXspeed(), ships[0].getYspeed()));
      bullets.add(new Lazer(ships[0].getX(), ships[0].getY(), radians((float)ships[0].getDirection() + randSpread), ships[0].getXspeed(), ships[0].getYspeed()));
      bullets.add(new Lazer(ships[0].getX(), ships[0].getY(), radians((float)ships[0].getDirection() - randSpread), ships[0].getXspeed(), ships[0].getYspeed()));
    }
  }
  
  if(!w) {   
    if(ships[0].getXspeed() > 0)
      for(int i = 0; i < ships.length; i++)
        if(ships[i] != null)
          ships[i].setXspeed(ships[i].getXspeed() - Math.abs(Math.cos(ships[i].getAngleofDirection()))/(1/ships[i].getBrakes()));
    if(ships[0].getXspeed() < 0)
      for(int i = 0; i < ships.length; i++)
        if(ships[i] != null)
          ships[i].setXspeed(ships[i].getXspeed() + Math.abs(Math.cos(ships[i].getAngleofDirection()))/(1/ships[i].getBrakes()));
        
    if(ships[0].getYspeed() > 0)
      for(int i = 0; i < ships.length; i++)
        if(ships[i] != null)
          ships[i].setYspeed(ships[i].getYspeed() - Math.abs(Math.sin(ships[i].getAngleofDirection()))/(1/ships[i].getBrakes()));
    if(ships[0].getYspeed() < 0)
      for(int i = 0; i < ships.length; i++)
        if(ships[i] != null)
          ships[i].setYspeed(ships[i].getYspeed() + Math.abs(Math.sin(ships[i].getAngleofDirection()))/(1/ships[i].getBrakes()));
        
    if(Math.abs(ships[0].getXspeed()) < 0.5)
      for(int i = 0; i < ships.length; i++)
        if(ships[i] != null)
          ships[i].setXspeed(0);
    if(Math.abs(ships[0].getYspeed()) < 0.5)
      for(int i = 0; i < ships.length; i++)
        if(ships[i] != null)
          ships[i].setYspeed(0);
  }
  
  for(int i = 0; i < stars.length; i++)
    stars[i].show();
  
  for(int i = bullets.size() - 1; i >= 0; i--) {
    if(bullets.get(i).getX() >= width || bullets.get(i).getX() <= 0 || bullets.get(i).getY() >= height || bullets.get(i).getY() <= 0)
      bullets.remove(i);
    else {
    bullets.get(i).move();
    bullets.get(i).show();
    }
  }
  
  rectMode(CORNER);
  
  for(int i = 0; i < asts.size(); i++){
    asts.get(i).move();
    asts.get(i).show();
  }
  
  for(int i = 0; i < ships.length; i++) 
    if(ships[i] != null) {
      ships[i].move();
      ships[i].show();
    }
    
  SHIPS_LOOP:
  for(int i = 0; i < ships.length; i++) {
    for(int j = 0; ships[i] != null && j < ships[i].getCorners(); j++)
      for(int k = 0; k < asts.size(); k++)
        if(ships[i] != null)
          if((double)dist((float)ships[i].getCornerPosX(j), (float)ships[i].getCornerPosY(j), (float)asts.get(k).getCenterX(), (float)asts.get(k).getCenterY()) < asts.get(k).getRadius()) {
            destAsteroids++;
            asts.set(k, new Asteroid(1 + (double)destAsteroids/50));
            ships[i].setLives(ships[i].getLives() - 1);
            ships[i].setCol(ships[i].getLives() == 2 ? color(200, 100, 100) : color(200, 50, 50));
            if(ships[i].getLives() == 0) {
              ships[i].kill();
              ships[i] = null;
            }
            continue SHIPS_LOOP;
          }
  }

  BULLET_LOOP:
  for(int i = bullets.size() - 1; i >= 0; i--) {
    for(int j = 0; j < 3; j+= 2) {
      for(int k = 0; k < asts.size(); k++) {
        double[] hb = bullets.get(i).getHB();
        if((double)dist((float)hb[j], (float)hb[j+1], (float)asts.get(k).getCenterX(), (float)asts.get(k).getCenterY()) < asts.get(k).getRadius()) {
          destAsteroids++;
          asts.set(k, new Asteroid(1 + (double)destAsteroids/50));
          bullets.remove(i);
          continue BULLET_LOOP;
        }
      }
    }
  }
  
  noStroke();
  fill(0, 0, 255);
  rect(0, 0, width, 5);
  rect(0, height-5, width, 5);
  fill(255, 150, 0);
  rect(0, 0, 5, height);
  rect(width-5, 0, 5, height);
  fill(255);
  textAlign(CORNER);
  textSize(20);
  text(destAsteroids + " asteroids destroyed", 20, 30);
  
}
boolean w = false, a = false, s = false, d = false, space = false, r = false;

void keyPressed()
{
  move(key, true);
}

void keyReleased()
{
  move(key, false);
}

boolean move(char c, boolean b)
{
  switch(c)
  {
    case 'W': return w = b;
    case 'w': return w = b;
    
    case 'A': return a = b;
    case 'a': return a = b;
    
    case 'S': return s = b;
    case 's': return s = b;
    
    case 'D': return d = b;
    case 'd': return d = b;
    
    case 'R': return r = b;
    case 'r': return r = b;
        
    case ' ': return space = b;
        
    default: return b;
  }
}

void reset() {
  destAsteroids = 0;
  gameOver = false;
  canShoot = 0;
  loop();
  background(0);
  for(int i = 0; i < stars.length; i++)  
    stars[i] = new Star();
  for(int i = 0; i < ships.length; i++) {
    ships[i] = new Spaceship();
    double x = width/2, y = height/2;
    ships[i].setY(y + yPos[i]);
    ships[i].setX(x + xPos[i]);
    ships[i].addRot(degrees((float)ships[i].getAngle(ships[0].getX() - ships[i].getX(), ships[0].getY() - ships[i].getY())));
  }
  ships[0].setLives(1);
  ships[0].setCol(color(200, 50, 50));
  for(int i = 0; i < 20; i++) {
    asts.add(new Asteroid(1 + (double)destAsteroids/50));
  }
}

void setEndScreen() {
  while(asts.size() > 0)
    asts.remove(0);
  for(int i = 0; i < ships.length; i++)
    if(ships[i] != null) {
      ships[i].kill();
      ships[i].show();
      ships[i] = null;
    }
  while(bullets.size() > 0)
    bullets.remove(0);
    
  background(0);
  
  fill(0);
  stroke(200);
  rect(width/4, height/4, width/2, height/2, 10);
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("Your score was " + destAsteroids, width/2, height/3);
  fill(30);
  rect(0.9 * width/3, height/2, width - (2 * 0.9 * width/3), height/6, 10);
  fill(255);
  text("Play again?", width/2, 7*height/12);
}

void mousePressed() {
  if(gameOver) {
    if(mouseX > (0.9 * width/3) && mouseX < (0.9 * width/3) + (width - (2 * 0.9 * width/3)) && mouseY > height/2 && mouseY < 4 * height/6) {
      setup();
    }
  }
  else move('r', true);
}

void mouseReleased() {
  if(!gameOver) 
    move('r', false);
}
