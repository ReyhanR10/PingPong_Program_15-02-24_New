//global vars
//// keyPressed --> draw(); encapsulate later on.

class Paddle {
  PFont font = createFont("AppleMyungjo", 55);
  //class vars
  float netX, netY, netW, netH;
  float paddleX, paddleY, paddleW, paddleH, paddleHeightRef;
  float butX, butY, butW, butH;
  float paddleSpeed;
  color paddleCol, textCol, butCol;
  int textSize ;
  String buttonText;
  boolean up = false, down = false;
  boolean paddle, button;

  float tableX = 0 ;
  float tableW = displayWidth ;
  float tableH = displayHeight * 8/10;
  float tableY = displayHeight * 1/10;

  Paddle (float paddleStartParameter, float ballDiaParameter, color paddleColParameter) {
    paddle = true;
    button = false;
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
    this.paddleCol = paddleColParameter;
    this.paddleSpeed = 9;
    this.up = false;
    this.down = false;
  }

  Paddle () { //table
    paddle = false;
  }

  Paddle (String textParameter, int textSizeParameter, color textColParameter, color butColParameter, float butXParameter, float butYParameter, float butWParameter, float butHParameter) { // button
    paddle = false;
    button = true;
    this.butX = butXParameter;
    this.butY = butYParameter;
    this.butW = butWParameter;
    this.butH = butHParameter;
    this.butCol = butColParameter;
    this.paddleCol = butColParameter;
    this.buttonText = textParameter;
    this.textSize = textSizeParameter;
    this.textCol = textColParameter;
  }

  void draw() {
    table();
    paddles();
    button();
    fill(#24A6E0);
  }//end draw

  void table() {
    if (paddle == false && button == false) {
      fill( 255 );
      rect(tableX, tableY, tableW, tableH);
      fill(#24A6E0);
    }
  }

  void button() {
    if (button == true) {
      if (mouseX >= this.butX && mouseX <= (this.butX + this.butW) && mouseY >= this.butY && mouseY <= (this.butY + this.butH)) {
        this.butCol = paddleCol;
      } else {
        this.butCol = tableColor;
      }
      fill(butCol);
      rect(butX, butY, butW, butH);
      fill(textCol);
      createText(this.butX, this.butY, this.butW, this.butH);
      fill(0);
    }
  }

  void paddles() {
    if (paddle == true) {
      fill (#D51EFA);
      rect(paddleX, paddleY, paddleW, paddleH);
      if (up == true) {
        movePaddleUp();
      }
      if (down == true) {
        movePaddleDown();
      }
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

  void createText (float textX, float textY, float textW, float textH) {
    fill( textCol );
    textAlign (CENTER, CENTER);
    textFont(font, textSize);
    text(buttonText, textX, textY, textW, textH);
    fill( 255 );
  }
}// end class
