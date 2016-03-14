import processing.sound.*;

Player player;
ArrayList<Player> enemies;
int playerX = 400;
int playerY = 300;
int playerSpeed = 1;

int numberOfEnemies = 20;
int enemyX = 5;
int enemyY = 100;
int enemySpeed = 1;


color backgroundColour;

void setup() {
  size(800, 600); 
  enemies = new ArrayList<Player>();
  PImage playerImage = loadImage("Player.png");
  PImage enemyImage = loadImage("Enemy.gif");
  backgroundColour = color(0, 0, 0);
  player = new Player(playerX, playerY, playerImage, playerSpeed);
  createEnemies(numberOfEnemies, enemyX, enemyY, 50, enemyImage, enemySpeed);
}

void draw() {
  background(backgroundColour);
  
  drawEnemies();
  player.draw();
}

void createEnemies(int number, int x, int y, int space, PImage image, int speed) {

 for(int i = 0; i < number; i++) {
  enemies.add(new Player(x + i*space, y, image, speed)); 
 }
}

void drawEnemies() {
  for(int i = 0; i < enemies.size(); i++) {
    enemies.get(i).draw();
  }
}