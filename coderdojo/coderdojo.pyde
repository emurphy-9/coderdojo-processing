from utils import Ball
from random import randint

def setup():
    global b, extras
    size(800,600)
    b = Ball(width/2, height/2, 50, color(255, 0, 0))
    extras = []
    for i in range(200):
        extras.append(Ball(randint(0, width), randint(0, height), 10, 
            color(randint(0, 255), randint(0,255), randint(0, 255)) ) )

def draw():
    global b, extras
    background(255)
    b.draw()
    if(not extras):
        text("YOU WIN!", 200, 200)
    else:
        b.followMouse(1)
        for e in extras:
            e.draw()
            if(b.collision(e)):
                extras.remove(e)
                b.grow(e.radius/4)