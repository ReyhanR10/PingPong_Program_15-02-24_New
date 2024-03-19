//Global Variables Dude WHYY?

//// keyPressed --> draw(); encapsulate later on OR LOL IDK WHEN.

class Paddle {
 //class vars
 float netX, netY, netW, netH;
 float paddleX, paddleY, paddleW, paddleH, paddleHeightRef;
 float paddleSpeed;
 color paddleCol;
 Boolean up = false, down = false;
 
 float tableX = 0;
 float tableW = displayWidth;
 float tableH = displayHeight * 8/10;
 float tableY = displayHeight * 1/10;

 //Line () ; alternative  design 
 
 Paddle (float paddleStartParameter, float ballDiaParameter) {
   netW = ballDiaParameter*2;
   paddleW = ballDiaParameter*1/2;
   paddleHeightRef = 0.25;
   if (paddleStartParameter ==  0) {
     netX = paddleStartParameter;
   }
   if (paddleStartParameter == displayWidth) {
     netX = paddleStartParameter - (netW*2 + paddleW);
   }
   this.paddleX = netX + netW; //caution: netX has two possible values -- ERROR.
   if (paddleStartParameter == displayWidth) {
     netX = paddleStartParameter - (netW*2 + paddleW);
   }
   this.paddleH = tableH * paddleHeightRef;
   this.paddleY = tableY + (tableH*1/2) - (paddleH*1/2);
   this.paddleCol = #EE14F2 ;
   this.paddleSpeed = 9;
   this.up = false;
   this.down = false;
 }
 
 void draw() {
  fill (paddleCol);
  paddles();
  fill(0);
 }//end draw
 
 void paddles() {
  rect(paddleX, paddleY, paddleW, paddleH);
  if (up == true) {
   movePaddleUp(); 
  }
  if (down == true) {
   movePaddleDown(); 
  }
 }
 
 void movePaddleUp() {
  paddleY -= paddleSpeed; 
  if (paddleY < tableY) { //error catch
    paddleY = tableY;
  }
 }
 
  void movePaddleDown() {
  paddleY += paddleSpeed; //DOWN
  if ((paddleY + paddleH) > (tableY + tableH)) {
    paddleY = ((tableY + tableH) - paddleH);
  }
 }
 
 void keyPressedWASD() {
  if (key == 'w' || key == 'W') {
    down = false;
    up = true;
  }
  if ( key == 's' || key == 'S') {
    up = false;
    down = true;
  }
 }
 
 void keyPressedARROW() {
  if (key == CODED && keyCode == UP) {
    down = false;
    up = true;
  }
  if (key == CODED && keyCode == DOWN) {
    up = false;
    down = true;
  } 
 }
 
 void keyReleasedWASD() {
   if (key == 'w' || key == 'W') {
    up = false;
  }
  if (key == 's' || key == 'S') {
    down = false;
  }
 }
 
 void keyReleasedARROW() {
   if (key == CODED && keyCode == UP) {
    up = false;
  }
  if (key == CODED && keyCode == DOWN) {
    down = false;
  }
 }
 void table () {
   
   //rect ( tableX, tableY, tableW, tableH ) ;
   //Line () ;    
 } //End buddy
 
} // end class
