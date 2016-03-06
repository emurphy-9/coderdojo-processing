float[] x = new float[20];
float[] y = new float[20];
float segLength = 18;

int PADDING = 15;
int NUMBER_OF_FOOD = 20;
ArrayList<Float> foodX = new ArrayList<Float>();
ArrayList<Float> foodY = new ArrayList<Float>();

/*
  
*/
void setup() {
  size(640, 360);
  strokeWeight(9);
  stroke(255, 100);
  generateFood();
}

/*
  
*/
void draw() {
  background(0);
  dragSegment(0, mouseX, mouseY);
  for(int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);
  }
  if(!foodX.isEmpty()) checkFood();
  if(!foodX.isEmpty()) drawFood();
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
  text("Mouse: " + mouseX + ", "+ mouseY, 10, 10); 
  text("Food: " + foodX.get(0) + ", "+ foodY.get(0), 10, 55); 
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
    println( "************* "+ mouseX + " " + mouseY + ", " + (xValFood) +" " + yValFood);
  }
}