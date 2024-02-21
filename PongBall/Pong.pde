//Global Variables and Objects
Ball myBall ;

Paddle paddleLeft ;
Paddle paddleRight ;

int scoreBoardLeft = 0 ;
int scoreBoardRight = 0 ;


Ball[] fireworks = new Ball[25];
//
color pongTableColour = 255; //ERROR: move to Table CLASS, 255 is full BLUE
//
void setup() {
  fullScreen () ; //fullScreen(); displayWidth, displayHeight
  /*ScreenSizeChecker() for Lnadscape, Protrait, Square views
   Updated Automatically for screen rotation on Android
   */
  //Population
  myBall = new Ball(); // Both 1/2's of Constructor
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(width*-1, height*-1, 0.5);
  }
} //End setup
//
void draw() {
  background(pongTableColour); //ERROR: Night Mode is know in CLASS, not DRIVER
  myBall.draw();
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i].draw();
  }
  println(fireworks[0].y);
} //End draw
//
void keyPressed() {
} //End keyPressed


void keyReleased () {
  
  
  
} End KeyReleased 
//
void mousePressed() {
  for (int i=0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(mouseX, mouseY, 0.5);
  }
} //End mousePressed
//
//End DRIVER
