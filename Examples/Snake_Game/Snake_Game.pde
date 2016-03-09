final int PADDING = 15;
final int NUMBER_OF_FOOD = 50;
final int NUMBER_OF_SEGMENTS = 20;
final int NUMBER_OF_ENEMIES = 10;
int screenX = 640;
int screenY = 360;

int playerScore = 0;
int lifes = 0;
float segLength = 18;

float[] x = new float[NUMBER_OF_SEGMENTS];
float[] y = new float[NUMBER_OF_SEGMENTS];
ArrayList<Float> foodX = new ArrayList<Float>();
ArrayList<Float> foodY = new ArrayList<Float>();

ArrayList<Float> enemiesX = new ArrayList<Float>();
ArrayList<Float> enemiesY = new ArrayList<Float>();

boolean gameOver = false;
/*
  
*/
void setup() {
  size(640, 360);
  strokeWeight(9);
  stroke(255, 100);
  generateFood();
  generateEnemies();
}

/*
  
*/
void draw() {
  if(!gameOver){
    background(0);
    dragSegment(0, mouseX, mouseY);
    for(int i=0; i<x.length-1; i++) {
      dragSegment(i+1, x[i], y[i]);
    }
    if(!foodX.isEmpty()) checkFood();
    if(!foodX.isEmpty()) drawFood();
    drawScore();
    drawPlayerHead();
    checkEnemies();
    drawEnemies();
    
    if(foodX.isEmpty()){
      text("You win!", screenX / 2 , screenY / 2);
    }
  }
  else{
    text("Game Over!", screenX / 2 , screenY / 2);
  }
  
}

/*
  
*/
void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

/*
  
*/
void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}


void drawScore(){
  text("Score: " + playerScore, 10, 25);
}

void drawPlayerHead(){
  noCursor();
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, PADDING, PADDING);
  fill(255, 255, 255);
}

/*
  
*/
void generateFood(){
  for(int i = 0; i < NUMBER_OF_FOOD; i = i + 1){
    float xValue = random(0, 640);
    float yValue = random(0, 360);
    
    foodX.add(xValue);
    foodY.add(yValue);
    println( "(" + xValue +","+yValue + ") was added!");
  }
}

/*
  
*/
void drawFood(){
  for(int i = 0; i < foodX.size(); i = i + 1){
    ellipse(foodX.get(i), foodY.get(i), PADDING, PADDING);
  }
}

/*
  
*/
void checkFood(){
  for(int i = 0; i < foodX.size(); i = i + 1){
    float xVal = mouseX;
    float yVal = mouseY;
    
    float xValFood = (float) foodX.get(i);
    float yValFood = (float) foodY.get(i);
    
    boolean right = yVal > yValFood && xValFood < xVal + PADDING;
    boolean left = xVal < xValFood && xValFood > xVal - PADDING;
    
    boolean bottom = yVal > yValFood && yValFood < yVal - PADDING;
    boolean top = yVal < yValFood && yValFood > yVal + PADDING;
    
    boolean topLeft = top && left;
    boolean topRight = top && right;
    boolean bottomLeft = bottom && left;
    boolean bottomRight = bottom && right;
    
    boolean betweenLeftAndRight = (xVal < xValFood + 10) && (xVal > xValFood - 10);
    boolean betweenTopAndBottom = (yVal < yValFood + 10) && (yVal > yValFood - 10);
    
    boolean center = betweenLeftAndRight && betweenTopAndBottom;
   
    
    if (center) {
      foodX.remove(i);
      foodY.remove(i);
      playerScore = playerScore + 10;
      println( "center" );
    }
    else if( betweenLeftAndRight ) println( "betweenLeftAndRight" );
    else if( betweenTopAndBottom ) println( "betweenTopAndBottom" );
    else if( topLeft ) println( "we are to the top-left" );
    else if( topRight ) println( "we are to the top-right" );
    else if( bottomLeft ) println( "we are to the bottom-left" );
    else if( bottomRight ) println( "we are to the bottom-right" );
    else if( right ) println( "we are to the right" );
    else if( left ) println( "we are to the left" );
    else if( bottom ) println( "we are to the bottom" );
    else if( top ) println( "we are to the top" );
    else println("We're on top!"); 
  }
}


/*
  
*/
void checkEnemies(){
  for(int i = 0; i < enemiesX.size(); i = i + 1){
    float xVal = mouseX;
    float yVal = mouseY;
    
    float xValFood = (float) enemiesX.get(i);
    float yValFood = (float) enemiesY.get(i);
    
    boolean right = yVal > yValFood && xValFood < xVal + PADDING;
    boolean left = xVal < xValFood && xValFood > xVal - PADDING;
    
    boolean bottom = yVal > yValFood && yValFood < yVal - PADDING;
    boolean top = yVal < yValFood && yValFood > yVal + PADDING;
    
    boolean topLeft = top && left;
    boolean topRight = top && right;
    boolean bottomLeft = bottom && left;
    boolean bottomRight = bottom && right;
    
    boolean betweenLeftAndRight = (xVal < xValFood + 10) && (xVal > xValFood - 10);
    boolean betweenTopAndBottom = (yVal < yValFood + 10) && (yVal > yValFood - 10);
    
    boolean center = betweenLeftAndRight && betweenTopAndBottom;
   
    
    if (center) {
      lifes++;
      gameOver = true;
      println( "center enemy " + lifes );
    }
    else if( betweenLeftAndRight ) println( "betweenLeftAndRight enemy" );
    else if( betweenTopAndBottom ) println( "betweenTopAndBottom enemy" );
    else if( topLeft ) println( "we are to the top-left enemy" );
    else if( topRight ) println( "we are to the top-right enemy" );
    else if( bottomLeft ) println( "we are to the bottom-left enemy" );
    else if( bottomRight ) println( "we are to the bottom-right enemy" );
    else if( right ) println( "we are to the right enemy" );
    else if( left ) println( "we are to the left enemy" );
    else if( bottom ) println( "we are to the bottom enemy" );
    else if( top ) println( "we are to the top" );
    else println("We're on top!"); 
  }
}

void generateEnemies(){
  for(int i = 0; i < NUMBER_OF_ENEMIES; i = i + 1){
    float xValue = random(0, 640);
    float yValue = random(0, 360);
    
    enemiesX.add(xValue);
    enemiesY.add(yValue);
    println( "(" + xValue +","+yValue + ") was added!");
  }
}

void drawEnemies(){
  for(int i = 0; i < enemiesX.size(); i = i + 1){
    fill(0, 0, 255);
    ellipse(enemiesX.get(i), enemiesY.get(i), PADDING, PADDING);
    fill(255, 255, 255);
  }
}