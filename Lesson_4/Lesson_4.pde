Bullet bullet;

int x = 200;
int y = 200;
void setup()
{
  size(600, 600);
  bullet = new Bullet(x, y);
}

void draw()
{
  background(90);
  
  fill(200, 0, 0);
  rect(x, y, 20, 20);
  
  if (bullet.finished == false)
  {
    bullet.bulletDraw();
  }
  
}

void keyPressed()
{
  if (key == ' ')
  {
    bullet = new Bullet((x + 5), (y + 5));
    bullet.finished = false;
  }
  
  else if (key == 'a')
  {
    x = x - 5;
  }
  
  
  else if (key == 'd')
  {
    x = x + 5;
  }
  
  else if (key == 'w')
  {
    y = y - 5;
  }
  
  else if (key == 's')
  {
    y = y + 5;
  }
}