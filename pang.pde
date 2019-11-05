x = 150
y = 150
paddle = 165
ballX = 6
ballY = 7
score = 0
gameState = False
def setup():
    size(1000, 550)
    noStroke()
    
def draw():
    global gameState
    drawStart()
    if (gameState == False):
        instructions()
        restart()
    else: 
        ballMoving()
        onContact()
        restart()
        
#the start of the game
def drawStart():
    global x, y, greyBar, blackBar, paddle, score
    background(160,173,240)
    #wall
    fill (0)
    rect (0, 0, 20, 550)
    #paddle
    fill (0)
    rect (980, mouseY-paddle/2, 10, paddle)
    #ball
    fill(233,240,160)
    ellipse(x, y, 30, 30)
    #show number of hits
    fill (0)
    textSize (25)
    text ("Hits: " + str(score), 460, 30)

#"left click to start" only in the beginning; disappears after game starts
def instructions():
    if (gameState == False):
        text ("LEFT CLICK TO START", 375, 270)
    else:
        fill (160,173,240)
        rect (500, 270, 60, 20)

#after dying, goes back to starting position
def restart():
    global x, y, ballX, ballY, paddle, gameState, score
    if (x > 1000):
        gameState = False
        x = 150
        paddle = 165
        ballX = 5
        ballY = 7
        score = 0
        
    
#movement and speed
def ballMoving():
    global x, y, ballX, ballY
    x = x + ballX
    y = y + ballY
 
#change ball direction when touching the paddle to go back
#also increase speed so game gets "harder"     
def onContact():
    global x, y, ballX, ballY, paddle, score
    if ( x > 970 and x < 980 and y > mouseY-paddle/2 and y < mouseY+paddle/2 ):
        ballX = ballX * -1
        x = x + ballX
        score = score + 1
        paddle = paddle - 11
    elif (x < 25):
        ballX = ballX * -1.15
        x = x + ballX
    if ( y > 550 or y < 0 ):
        ballY = ballY * -1.05
        y = y + ballY
    
#to start game
def mousePressed():
    global gameState
    if(mouseButton == LEFT):
        gameState = True
