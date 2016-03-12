class Bullet extends Sprite{
  
  private final int DEFAULT_X = 0;
  private final int DEFAULT_Y = 0;
  private final int DEFAULT_SIZE = 10;
  
  //
  //
  public Bullet(){
      setX(DEFAULT_X);
      setY(DEFAULT_Y);
      setDx(0);
      setDy(0);
  }
  
  //
  //
  public Bullet(int startingX, int startingY){
      setX(startingX);
      setY(startingY);
      setDx(0);
      setDy(0);
  }
  
  
}