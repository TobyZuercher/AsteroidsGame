class Star //note that this class does NOT extend Floater
{
  float xPos, yPos, size;
  int col;
  Star()
  {
    xPos = (float)(Math.random() * width);
    yPos = (float)(Math.random() * height);
    col = (int)(Math.random() * 100 + 50);
    size = random(4, 8);
  }
  
  void show() {
    fill(col, col, col);
    noStroke();
    ellipse(xPos, yPos, size, size);
  }
  
  void change() {
    size = random(4, 8);
    col = (int)(Math.random() * 100 + 50);
  }
}
