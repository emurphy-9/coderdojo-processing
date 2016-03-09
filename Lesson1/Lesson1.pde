color backColor = color(255, 255, 255);
int x = 250;
int y = 250;
int sideLength = 100;
float rotation = 45;

void setup() {
  size(600, 600);
  
}

void draw() {
  pushMatrix();
  noStroke();
  fill(255, 0, 0);
  background(backColor);
  translate(x, y);
  rotate(radians(rotation));
  rect(-sideLength/2, -sideLength/2, sideLength, sideLength);
  popMatrix();
  
  rotation++;
  noFill();
  noCursor();
  stroke(0, 0, 0);
  ellipse(mouseX, mouseY, 10, 10); 
}