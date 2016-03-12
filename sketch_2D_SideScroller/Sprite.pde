class Sprite{
  
  private int size;
  private int x, y;
  private int dx, dy;
  private int colour;
  
  //
  //
  int getX(){ 
    return x;
  }
  
  //
  //
  int getY(){
    return y;
  }
  
  //
  //
  int getDx(){
    return dx;
  }
  
  //
  //
  int getDy(){
    return dy;
  }
  
  //
  //
  int getColour(){
    return colour;
  }
  
  
  //
  //
  void setColour(int valueToSetColourAs){
    colour = valueToSetColourAs;
  }
 
 
  //
  //
  void setX(int valueToSetXAs){
    x = valueToSetXAs;
  }
  
  //
  //
  void setY(int valueToSetYAs){
    y = valueToSetYAs;
  }
  
  //
  //
  void setDx(int valueToSetDxAs){
    dx = valueToSetDxAs;
  }
  
  //
  //
  void setDy(int valueToSetDyAs){
    dy = valueToSetDyAs;
  }
  
   //
  //
  void setSize(int valueToSetSizeAs){
    size = valueToSetSizeAs;
  }
 
  //
  //
  void moveRight(){
    x = x + dx;
  }
  
  //
  //
  void moveLeft(){
     x = x - dx;
  }
  
  //
  //
  void moveDown(){
     y = y + dy;
  }
  
  //
  //
  void moveUp(){
     y = y - dy;
  }
  
  //
  //
  void drawMe(){
    fill(colour);
    rect(x,y,size,size);
  }
}