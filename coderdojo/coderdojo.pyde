import utils


def setup():
    global b
    size(800,600)
    b = utils.ball(width/2, height/2, 50, color(255, 0, 0))

def draw():
    global b
    background(255)
    b.draw()
    b.move(1,.75)