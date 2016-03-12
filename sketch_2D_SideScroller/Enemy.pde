class Enemy extends Sprite{
  
  //
  //
  public Enemy(){
      setX(DEFAULT_X);
      setY(DEFAULT_Y);
      setDx(0);
      setDy(0);
  }
  
  //
  //
  public Enemy(int startingX, int startingY){
      setX(startingX);
      setY(startingY);
      setDx(0);
      setDy(0);
      setColour(128);
  }
  
  
}