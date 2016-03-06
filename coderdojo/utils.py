class ball:
    
    def __init__(self, x, y, radius, c):
        self.x = x
        self.y = y
        self.radius = radius
        self.c = c

    def draw(self):
        noStroke()
        fill(self.c)
        ellipse(self.x, self.y, self.radius, self.radius)
     
        if(self.x - self.radius < 0):
            ellipse(self.x+width, self.y, self.radius, self.radius)
        elif(self.x + self.radius > width):
            ellipse(self.x - width, self.y, self.radius, self.radius)
        if(self.y - self.radius < 0):
            ellipse(self.x, self.y + height, self.radius, self.radius)
        elif(self.y + self.radius > height):
             ellipse(self.x, self.y - height, self.radius, self.radius)
    def move(self, dx, dy):
         self.x += dx
         self.y += dy
         if(self.x > width):
             self.x = 0
         elif(self.x < 0):
             self.x = width
         if(self.y > height):
             self.y = 0
         elif(self.y < 0):
             self.y = height
    def followMouse(self, speed):
        if(mouseX > self.x):
            self.x += speed
        elif(mouseX < self.x):
            self.x -= speed
        if(mouseY > self.y):
            self.y += speed
        elif(mouseY < self.y):
             self.y -= speed
             
    def collision(self, other):
        distance = d(self.x, self.y, other.x, other.y)
        return (distance < (self.radius + other.radius))
            
    
    def grow(self, growth):
        self.radius += growth
        

def d(x1, y1, x2, y2):
    xDiff = x2 - x1
    yDiff = y2 - y1
    total = xDiff ** 2
    total = total + yDiff**2
    return sqrt(total)