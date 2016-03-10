int x = 250;
int y = 250;
int angle = 0;

void setup() {
    size(600, 600);
}

void draw() {
    background(255, 255, 255);
    stroke(0, 0, 0);
    fill(255, 140, 20);
    translate(width/2, height/2);
    rotate(radians(angle));
    rect(-50, -50, 100, 100);
    angle++;
}