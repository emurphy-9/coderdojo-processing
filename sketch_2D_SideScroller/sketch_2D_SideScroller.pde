int screenWidth = 400;
int screenHeight = 400;

Player player;
Enemy enemy;
Bullet bullet;

//
//
void setup(){
  //background(0);
  //fullScreen();
  size(400,400);
  player = new Player(screenWidth/2,screenHeight/2, 1, 1);
  enemy = new Enemy();
}

//
//
void draw(){
  player.drawMe();
  player.checkMovement();
  enemy.drawMe();
}