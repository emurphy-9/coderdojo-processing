
class Player {
  
  int x;
  int y;
  PImage image;
  int speed;
  
  Player(int x, int y, PImage image, int speed) {
    this.x = x;
    this.y = y;
    this.image = image;
    this.speed = speed;
  }
  
  
  void draw() {
   image(this.image, x, y); 
  }
}