class Player extends Sprite{
  
  //
  //
  public Player(){
      setX(DEFAULT_X);
      setY(DEFAULT_Y);
      setDx(DEFAULT_DX);
      setDy(DEFAULT_DY);
      setSize(DEFAULT_SIZE);
  }
  
  //
  //
  public Player(int startingX, int startingY, int speedX, int speedY){
      setX(startingX);
      setY(startingY);
      setDx(speedX);
      setDy(speedY);
      setColour(255);
      setSize(DEFAULT_SIZE);
  }
  
  
  void checkMovement(){
    
    if(keyPressed){
      if(key == 'w' || key == 'W'){
        println("You pressed w!");
        moveUp();
      }
      else if(key == 'a'|| key == 'A'){
        println("You pressed a!");
        moveLeft();
      }
      else if(key == 's' || key == 'S'){
        println("You pressed s!");
         moveDown();
      }
      else if(key == 'd' || key == 'D'){
        println("You pressed d!");
        moveRight();
       
      }
    }
  }
  
}