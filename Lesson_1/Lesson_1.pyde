int x = 250;
int y = 250;


void setup() {
    size(600, 600);
}

void draw() {
    background(0, 0, 0);
    noStroke();
    fill(255, 140, 20);
    rotate(radisns(10));
    rect(x, y, 100, 100);
}