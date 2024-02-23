//Global Variables and Objects
Ball myBall;

Paddle paddleLeft ;
Paddle paddleRight ;

int scoreBoardLeft, scoreBoardRight ;

Ball[] fireworks = new Ball[25];
Ball movedBall;
//
color pongTableColour = 255; //ERROR: move to Table CLASS, 255 is full BLUE
//
void setup() {
  size(600, 400); //fullScreen(); displayWidth, displayHeight
  /*ScreenSizeChecker() for Lnadscape, Protrait, Square views
   Updated Automatically for screen rotation on Android
   */
  //Population
  
  myBall  = new Ball ( width/2, height/2, 50 ) ; //Myball = instance of Ball
  myBall = new Ball ( width/3, height /3, 50 ) ;
  
  paddleLeft = new Paddle ( 15, height/2, 30,205 ) ;
  paddleRight = new Paddle  ( width-15, height/2, 30, 205 ) ;
  
  myBall = new Ball(); // Both 1/2's of Constructor
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(width*-1, height*-1, 0.5);
  }
  movedBall = new Ball(width*-1, height*-1, myBall.diameter, myBall.colour, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
  //
} //End setup
//
void draw() {
  background(pongTableColour); //ERROR: Night Mode is know in CLASS, not DRIVER
  
  paddleLeft.move () ;
  paddleLeft.display () ;
  paddleRight.move () ;
  paddleRight.display () ;
  
   if ( myBall.right () > width ) {
    scoreBoardLeft = scoreBoardLeft +1 ;
    myBall.x= width/2 ;
    myBall.y= height/2 ;
  }
  
  
  
  
  if ( myBall.disappear == true ) {
    //EMPTY IF
    //myBall.step(); //Keeps active the variables but not .draw
  } else {
    myBall.draw();
  }
  // Trigger: Left Goal, Right Goal
  // ERROR: Ball Instance still bounces
  if ( myBall.x<(2*myBall.diameter) || myBall.x>( width - (2*myBall.diameter) ) || movedBall.x<(2*movedBall.diameter) || movedBall.x>( width - (2*movedBall.diameter) ) ) {
    // See ball.bounce() for IF Conditional
    // myBall.diameter sets all Pong Ball Diameters
    // if ( mouseX < 0+(myBall.diameter*1/2) || mouseX > width-(myBall.diameter*1/2) ) {}
    if ( myBall.x<(2*myBall.diameter) || myBall.x>( width - (2*myBall.diameter) ) ) netExplosion(  myBall.x, myBall.y );
    if ( movedBall.x<(2*movedBall.diameter) || movedBall.x>( width - (2*movedBall.diameter) ) ) netExplosion(  movedBall.x, movedBall.y );
  } //GOAL! Firework Constructor Execution, based on X-value
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i].draw();
  }
  movedBall.draw();
} //End draw
//
void keyPressed() {
  if ( keyCode == UP ) {
    paddleRight.ySpeed = -8 ;
  }
  if ( keyCode == DOWN ) {
    paddleRight.ySpeed= 8 ;
  }
  if ( key  == 'w' ) {
    paddleLeft.ySpeed= -8 ;
  }
  if ( key  == 's' ) {
    paddleLeft.ySpeed = 8 ;
  }
  
  
  
  
  
} //End keyPressed
//
void mousePressed() {
  //

  movedBall = new Ball(mouseX, mouseY, myBall.diameter, myBall.colour, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
  //CAUTION: only brings forth myBall, not last known movedBall
  //Note: .draw is not being executed so
  //myBall.disappear = true;
} //End mousePressed
//

 /*void keyReleased() {
  if ( keyCode == UP ) {
    paddleRight.ySpeed=0;
  }
  if ( keyCode == DOWN ) {
    paddleRight.ySpeeed =0 ;
  }
  if ( key == 'w' ) {
    paddleLeft.ySpeed =0 ;
  }
  if ( key == 's' ) {
    paddleLeft.ySpeed=0 ;
  }
  
}

//End keyReleased 

  
  
}




//End DRIVER
