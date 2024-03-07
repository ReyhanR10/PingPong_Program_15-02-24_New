//Global Variables and Objects
Ball myBall;
Ball[] fireworks = new Ball[25];
Ball movedBall;



Boolean startK = false ;
Boolean startM = false ;

Paddle PLeft ;
Paddle PRight ;

int scoreBoardLeft ;
int scoreBoardRight ;

//
color pongTableColour = 255; //ERROR: move to Table CLASS, 255 is full BLUE
float gravity=0.5;
//
void setup() {
  fullScreen () ; //fullScreen(); displayWidth, displayHeight
  ellipseMode ( CENTER ) ;
  /*ScreenSizeChecker() for Landscape, Protrait, Square views
   Updated Automatically for screen rotation on Android
   */
  //Population
  myBall = new Ball(); // Both 1/2's of Constructor
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(width*-1, height*-1, 0.5);
  }
  movedBall = new Ball(width*-1, height*-1, myBall.diameter, myBall.colour, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
  //
  PLeft = new Paddle ( 15, height/2, 30,205 ) ;
  PRight = new Paddle  ( width-15, height/2, 30, 205 ) ;
} //End setup
//
void draw() {
  background(pongTableColour); //ERROR: Night Mode is know in CLASS, not DRIVER
  //Paddle Movement
  PLeft.move () ;
  PLeft.display () ;
  PRight.move () ;
  PRight.display () ;
  
  //
  
  //BALL
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
  }
  //Score
    if ( myBall.right () > width ) {
    scoreBoardLeft = scoreBoardLeft +1 ;
    myBall.x = width/2 ;
    myBall.y = height/2 ;
  }
  if ( myBall.left () < 0 ) {
    scoreBoardRight = scoreBoardRight + 1 ;
    myBall.x = width/2 ;
    myBall.y = height/2 ;
  }
  if ( myBall.down () > height ) {
    myBall.ySpeed = -myBall.ySpeed ;
  }
  if ( myBall.up () < 0 ) {
    myBall.ySpeed = -myBall.ySpeed ;
  }
    if ( PLeft.down () > height ) {
    PLeft.y = height-PLeft.yHeight/2 ;
  }
  if ( PLeft.up () < 0 ) {
    PLeft.y = PLeft.yHeight/2 ;
  }
  if ( PRight.down () > height ) {
    PRight.y = height-PRight.yHeight/2 ;
  }
  if ( PRight.up () < 0 ) {
    PRight.y = PRight.yHeight/2 ;
  }
  
  
  
  
  
  
  
  
  //Paddle Bounch
  if ( PLeft.down () > height ) {
    PLeft.y = height-PLeft.yHeight/2 ;
  }
  if ( PLeft.up () < 0 ) {
    PLeft.y = PLeft.yHeight/2 ;
  }
  if ( PRight.down () > height ) {
    PRight.y = height-PRight.yHeight/2 ;
  }
  if ( PRight.up () < 0 ) {
    PRight.y = PRight.yHeight/2 ;
  }
  //Bounce the ball from Pddle > other diretions
  if ( myBall.left () < PLeft.right () && myBall.y > PLeft.up () && myBall.y < PLeft.down ()) {
    myBall.xSpeed = -myBall.xSpeed ;
    myBall.ySpeed = map ( myBall.y - PLeft.y, -PLeft.yHeight/2, PLeft.yHeight/2, -10, 10 ) ;
  }
    if ( myBall.right() > PRight.left() && myBall.y > PRight.up() && myBall.y < PRight.down()) {
    myBall.xSpeed = -myBall.xSpeed ;
    myBall.ySpeed = map( myBall.y - PRight.y, -PRight.yHeight/2, PRight.yHeight/2, -10, 10);
  }  
  //Rect for ScoreBoard 
  
  textSize ( 60 ) ;
  textAlign ( CENTER, TOP ) ;
  //ScoreBoard WIN / WIN 
  text ( scoreBoardRight, width/2+30, 30 ) ; // Right and left ScoreBoard
  text ( scoreBoardLeft, width/2-30, 30 ) ; // Same like the  on the top anyway.
} //End draw
//
void keyPressed() {
   if ( keyCode == UP ) {
    PRight.ySpeed= -8;
  }
  if ( keyCode == DOWN ) {
    PRight.ySpeed= 8 ;
  }
  if ( key  == 'w' ) {
    PLeft.ySpeed= -8 ;
  }
  if ( key  == 's' ) {
    PLeft.ySpeed= 8 ;
  }
  /*SSSSSht this is a Really Power Up Easter EGG
  if ( key == '1' ) {
    myBall.xSpeed = 10  ;
     }
  if ( key == '2' ) {
    PLeft.ySpeed = -12 ;
  }
  if ( key == '3' ) {
    PLeft.ySpeed = 12 ;
  }
  if ( scoreBoardLeft > 8 ) {
    myBall.xSpeed = 16 ;
  }
  */
  
  
  
} //End keyPressed
//
void mousePressed() {
  //

  movedBall = new Ball(mouseX, mouseY, myBall.diameter, myBall.colour, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
  //CAUTION: only brings forth myBall, not last known movedBall
  //Note: .draw is not being executed so
  //myBall.disappear = true;
} //End mousePressed


void mouseClicked () {
  
  
  
}
//
//End DRIVER
