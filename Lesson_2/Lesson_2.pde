color backgroundColour;
color cursorColour;
color squareColour;
color circleColour;
color squareStroke;
color circleStroke;

int circleX;
int circleY;
int rectX;
int rectY;
int lineLength;
int sideLength;
int radius1;
int radius2;

void setup() {
  size(600, 600);
  rectX = 30;
  rectY = 30;
  sideLength = 189;
  squareColour = color(230, 40, 187);
  squareStroke = color(0, 40, 3);
  lineLength = 20;
  cursorColour = color(255, 0, 0);
  backgroundColour = color(255, 255, 255);
  circleX = 400;
  circleY = 387;
  radius1 = 140;
  radius2 = 140;
  circleColour = color(3, 249, 213);
  circleStroke = color(0, 0, 0);
}

void draw() {
  background(backgroundColour);
  
  noCursor();
  
  stroke(squareStroke);  
  fill(squareColour);
  rect(rectX, rectY, sideLength, sideLength);
  
  stroke(circleStroke);
  fill(circleColour);
  ellipse(circleX, circleY, radius1, radius2);
  
  stroke(cursorColour);
  line(mouseX, mouseY - lineLength/2, mouseX, mouseY + lineLength/2);
  line(mouseX - lineLength/2, mouseY, mouseX + lineLength/2, mouseY);

}

void keyPressed() {
  if(key == CODED) {
    switch(keyCode) {
      case UP:
        rectY--;
        break;
      case DOWN: 
        rectY++;
        break;
      case LEFT:
        rectX--;
        break;
      case RIGHT:
        rectX++;
        break;
    }
  }
  if(key == 'b') {
    backgroundColour = color(0, 0, 0);
  }
  if(key == 'r') {
     backgroundColour = color(255, 0, 0); 
  }
  if(key == 'i') {
    sideLength++; 
  }
  if(key == 'd') {
     sideLength--; 
  }
  if(key == '1') {
    radius1++;
  }
  if(key == '2') {
    radius1--;
  }
  if(key == '3') {
    radius2++;
  }
  if(key == '4') {
    radius2--;
  }
}

void mouseClicked() {  
  circleX = mouseX;
  circleY = mouseY;
}