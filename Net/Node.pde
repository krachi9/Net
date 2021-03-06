class Node
{
  PVector position;
  PVector velocity;
  float xOff;
  float yOff;
  color clr;

  Node(boolean randomColor)
  {
    int x = int(random(width));
    int y = int(random(height));
    position = new PVector(x, y);
    velocity = new PVector();
    yOff = random(100.1);
    xOff= random(100.5);
    if (randomColor)
    {
      clr = color(random(0, 255), random(0, 255), random(0, 255));
    } else
    {
      float a = random(6);

      if (a < 1)
      {
        clr = color(0, 255, 0);
      } else if (a < 2)
      {
        clr = color(0, 0, 255);
      } else if (a < 3)
      {
        clr = color(255, 0, 0);
      } else if (a < 4)
      {
        clr = color(198, 18, 44);
      } else if (a < 5)
      {
        clr = color(123, 240, 21);
      } else if (a < 6)
      {
        clr = color(230, 130, 200);
      }
    }
  }

  void update()
  {
    move();
    position.add(velocity);
    edge();
  }

  void draw()
  {
    fill(clr);
    noStroke();
    ellipse(position.x, position.y, circleSize, circleSize);
  }

  void move()
  {
    velocity = new PVector((noise(t*xOff, t)-0.5)*maxSpeed, (noise(t, t*yOff)-0.5)*maxSpeed);
  }

  void edge()
  {
    if (this.position.x > width) 
    { 
      this.position.x = 0;
    } else if (this.position.x < 0)
    { 
      this.position.x = width;
    } 
    if (this.position.y > height) 
    { 
      this.position.y = 0;
    } else if (this.position.y < 0) 
    { 
      this.position.y = height;
    }
  }
}
