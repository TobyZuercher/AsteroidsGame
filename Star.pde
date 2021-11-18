class Star //note that this class does NOT extend Floater
{
  float xPos, yPos;
  int col;
  Star()
  {
    xPos = (float)(Math.random() * width);
    yPos = (float)(Math.random() * height);
    col = color((int)(Math.random() * 100 + 50), (int)(Math.random() * 100 + 50), (int)(Math.random() * 100 + 50));
  }
  
  void show()
  {
    fill(col);
    noStroke();
    ellipse(xPos, yPos, 5, 5);
  }
}
