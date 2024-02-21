/* Known ERRORs
 - Night Mode: Ball Colour is Full BLUE
 */
class Ball
{
  //Global Variables
  float x, y, diameter;
  color colour;
  float xSpeed, ySpeed, xSpeedChange=1.0, ySpeedChange=1.0;
  float gravity=0.0;
  //static int count = 25; //Static Number for Amount of Ball Instances in a Firework
  //
  //Overloading Constructors or Mulitple Constructors
  //Ball Constructor
  Ball () {
    //Constructor Is ... hard coded, single variable object
    //Local Variables, deleted at end of Constructor
    int startX = width*1/2;
    int startY = height*1/2;
    int referentMeasure = ( width < height ) ? width : height ; //Review Ternary Operator
    //
    //Object Variables
    this.x = startX; //spawn myBall in the middle of the display
    this.y = startY;
    this.diameter = referentMeasure * 1/20;
    this.colour = color ( random(0, 255), random(255), random(255) ) ; //random(), random()-shortcut, casting from float to intin color var
    this.xSpeed = xDirection(); //float, could be any number
    this.ySpeed = yDirection(); //float, could be any number
    //ERROR: random() will choose ZERO, not only -1 & 1
    this.xSpeedChange = 1.0; //Break bounce physics
    this.ySpeedChange = 1.0; //Change speeds
  } //End Ball Constructor
   //
  // Mulitple Constructors by identifying different parameters
  Ball (float xParameter, float yParameter, float gravityParameter) {
    //Ball(); //Place Holder
    this.x = xParameter; //ERROR: trigger when the Ball enters goal area
    this.y = yParameter; //ERROR: trigger when the Ball enters goal area
    this.colour = color ( random(0, 255), random(255), random(255) ) ; //random(), random()-shortcut, casting from float to intin color var
    this.diameter = random(width*1/25); //returns unseen diamters
    this.xSpeed = random(-5, 5); //Can return 0
    this.ySpeed = random(-5, 5); //Can return 0
    gravity = gravityParameter;
  } //End Firework Ball
  //
  float xDirection() {
    float xDirection = int (random (-2, 2) ); //float, truncated, must be 2 minimum
    while ( xDirection == 0 ) {
      xDirection = int (random (-2, 2) ); //variable must be populated first
    }
    return xDirection;
     } //End xDirection
  float yDirection() {
    float yDirection = int (random (-2, 2) ); //float, truncated, must be 2 minimum
    while ( yDirection == 0 ) {
      yDirection = int (random (-2, 2) ); //variable must be populated first
    }
    return yDirection;
  } //End yDirection
  void draw() { //ball
    fill(colour);
    ellipse(x, y, diameter, diameter); //Easter Egg: at bounce diameters changes
    fill(0);
    //
      step(); //Manipulating the Variables
  }//End draw
  void step() {
    bounce();
    ySpeed += gravity; //Ball() is not affected, thus Pong Ball has no gravity
    x += xSpeed * xSpeedChange;
    y += ySpeed * ySpeedChange;
  } //End step
  void bounce() {
    if ( x < 0+(diameter*1/2) || x > width-(diameter*1/2) ) xSpeed *= -1;
    if ( y < 0+(diameter*1/2) || y > height-(diameter*1/2) ) ySpeed *= -1;
  } //End bounce
  //
  
  void display () {
    fill ( colour ) ;
    ellipse ( x, y, diameter, diameter ) ;
  } //END DISPLAY
  
  //Function help 
  float left () {
    return x-diameter/2 ;
  }
  float right () {
    return x+diameter/2 ;
  }
  float up () {
    return y-diameter/2 ;
  }
  float down () {
    return y+diameter/2 ;
  }
  
  class Paddle {
    float x, y, xWidth, yHeight  ;
    float xspeed, yspeed ;
    color colour ;
    //
    Paddle (  float tempX, float tempY, float tempWidth, float tempHeight ) {
      x = tempX ;
      y = tempY ;
      xWidth = tempWidth ;
      yHeight  = tempHeight ;
      xspeed = 0 ; 
      yspeed = 0 ;
      colour = ( 225 ) ;   
    //
  } //End paddle 
  float left () {
    return x-ballWidth/2 ;
  }
  float right () {
    return  x+ballWidth/2 ;
  }
  float up () {
    return y-ballHeight/2 ;
  }
  float down () {
    return y+ballHeight/2 ;
  }
} //End Ball
//
