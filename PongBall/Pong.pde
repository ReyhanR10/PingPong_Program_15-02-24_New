//Global Variables and Objects
Ball myBall, movedBall;
Ball[] fireworks = new Ball[25];
Paddle myPaddle, yourPaddle;
//
color pongTableColour = 255; //ERROR: move to Table CLASS, 255 is full BLUE
float gravity=0.5;
int scoreBoardL = 0 ;
int scoreBoardR = 0 ;

//
void setup() {
  size(600, 400); //fullScreen(); displayWidth, displayHeight
  /*ScreenSizeChecker() for Landscape, Protrait, Square views
   Updated Automatically for screen rotation on Android
   */
  //Population
  myBall = new Ball(); // Both 1/2's of Constructor
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(width*-1, height*-1, 0.5);
  }
  movedBall = new Ball(width*-1, height*-1, myBall.diameter, myBall.colour, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
  myPaddle = new Paddle( 0, myBall.diameter );
  yourPaddle = new Paddle( width, myBall.diameter );
  //
} //End setup
//
void draw() {
  background(pongTableColour); //ERROR: Night Mode is know in CLASS, not DRIVER
  //
  //Paddles drawn before the ball
  myPaddle.draw();
  yourPaddle.draw();
  //ScoreBoard where ball + = score ;
  if ( myBall.right () > width ) {
  scoreBoardL = scoreBoardL = +1 ;
  myBall.x = width/2 ;
  myBall.y = width/2 ;
  }
  if ( myBall.left () < 0 ) {
    scoreBoardR = scoreBoardR +1 ;
    myBall.x = width/2 ;
    myBall.y = height/2 ;
  }

  
  //
  //Update the Paddle Position for the Ball, before drawing the Ball
  //This update does not need to run in draw(), only at end of setup()
  //Note: pick a paddle that will always be instantiated here
  //Note: easier to iterate through an array here than somewhere else
  // float paddleWidthParameter, float myPaddleHeightParameter, float yourPaddleHeightParameter
  myBall.tableYUpdate(myPaddle.tableX, myPaddle.tableY, myPaddle.tableWidth, myPaddle.tableHeight, myPaddle.paddleX, yourPaddle.paddleX, myPaddle.paddleY, yourPaddle.paddleY, myPaddle.paddleWidth, myPaddle.paddleHeight, yourPaddle.paddleHeight);
  //movedBall.tableYUpdate(myPaddle.tableY, myPaddle.tableHeight, myPaddle.tableWidth, myPaddle.tableX, myPaddle.paddleX, yourPaddle.paddleX, myPaddle.paddleY, yourPaddle.paddleY, myPaddle.paddleWidth, myPaddle.paddleHeight, yourPaddle.paddleHeight);
  //
  //Bounce 
  /*if ( myBall.left() < myPaddle.right() && myBall.y > myPaddle.up() && myBall.y < myPaddle.down()){
    myBall.xSpeed = -myBall.xSpeed;
    myBall.ySpeed = map(myBall.y - myPaddle.paddleX, -myPaddle.paddleHeight*1/2, myPaddle.paddleHeight*1/2, -8, 8);
  }
  
  if ( myBall.right() > yourPaddle.left() && myBall.y > yourPaddle.up() && myBall.y < yourPaddle.down()) {
    myBall.xSpeed = -myBall.xSpeed;
    myBall.ySpeed = map(myBall.y - yourPaddle.paddleY, -yourPaddle.paddleHeight*1/2, yourPaddle.paddleHeight*1/2, -8, 8);
  } */ 
  
  
  if ( myBall.disappear == true ) {
    //EMPTY IF
    //myBall.step(); //Keeps active the variables but not .draw
  } else {
    myBall.draw();
  }
  if ( movedBall.disappear == true ) {
    //EMPTY IF
    //myBall.step(); //Keeps active the variables but not .draw
  } else {
    movedBall.draw();
  }
  // Trigger: Left Goal, Right Goal
  // ERROR: Ball Instance still bounces
  if ( myBall.x<(2*myBall.diameter) || myBall.x>( width - (2*myBall.diameter) ) ) myBall.goalExplosion(myBall.x, myBall.y, gravity);
  //
  //Turned off for first ball to wrok
  //if ( movedBall.x<(2*movedBall.diameter) || movedBall.x>( width - (2*movedBall.diameter) ) ) movedBall.goalExplosion(movedBall.x, movedBall.y, gravity);
  //
  //Does "infront of ball" make a difference
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i].draw(); //
    //
    //MyBall is bounce LOL HOPEFULLY
   textSize ( 60 ) ;
   textAlign ( CENTER, TOP ) ;
   //SCOREBOARD
   text ( scoreBoardL, width/2+30, 30 ) ;
   text ( scoreBoardR, width/2-30,30 ) ;
  }
} //End draw
//
void keyPressed() {
  myPaddle.keyPressedWASD();
  yourPaddle.keyPressedARROW();
} //End keyPressed
//
void keyReleased() {
  myPaddle.keyReleasedWASD();
  yourPaddle.keyReleasedARROW();
}
void mousePressed() {
  //

  movedBall = new Ball(mouseX, mouseY, myBall.diameter, myBall.colour, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
  //CAUTION: only brings forth myBall, not last known movedBall
  //Note: .draw is not being executed so
  //myBall.disappear = true;
} //End mousePressed
//
//End DRIVER 
