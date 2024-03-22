/*known ERRORS:
 night mode - ball color is full blue*/
class Ball {
  //Ball Global Vars
  float ballX, ballY, Dia;
  color ballCol;
  float xSpeed, ySpeed;
  float xSpeedChange = 1.0, ySpeedChange = 1.0;
  float gravity = 0.0;
  boolean disappear = false;
  boolean mySide, pongBall;
  float tableX, tableY, tableW, tableH, paddleX, paddleY, paddleW, paddleH;
  //static int count = 25


  //ball constructor
  Ball () {
    //local vars
    int startx = displayWidth*1/2;
    int starty = displayHeight*1/2;
    int referentMeasure = (displayWidth < displayHeight) ? displayWidth: displayHeight; //review ternary operator

    //object vars
    this.ballX = startx;
    this.ballY = starty;
    this.Dia = referentMeasure*1/20;
    this.ballCol = 0; //random(255) also applicable. Casting from float to int.
    this.xSpeed = 3*xSpeedChange();
    this.ySpeed = 3*ySpeedChange();
    this.xSpeedChange = 1.0; //break bounce physics - change speed
    this.ySpeedChange = 1.0;
    pongBall = true;
  } //end ball constructor

  //firework constructor - multiple constructors by identifying different parameters.
  Ball(float xParameter, float yParameter, float gravityParameter) {
    //Ball(); //placeholder
    this.ballX = xParameter; //ERROR: trigger when the Ball enters goal area
    this.ballY = yParameter; //ERROR: trigger when the Ball enters goal area
    this.ballCol = color (int(random(255)), int(random(255)), int(random(255))) ; //random(), random()-shortcut, casting from float to intin color var
    this.Dia = random(width*1/70); //returns unseen diamters
    this.xSpeed = random(-5, 5); //Can return 0
    this.ySpeed = random(-5, 5); //Can return 0
    gravity = gravityParameter;
    pongBall = false;
  }//end firework constructor

  //movedBall constructor -- must look like old ball instance ( same color, same size ) and make old ball instance disappear.
  Ball(float xParameter, float yParameter, float diaParameter, color colParameter, float xSpeedParameter, float ySpeedParameter, float xSpeedChangeParameter, float ySpeedChangeParameter) {
    this.ballX = xParameter;
    this.ballY = yParameter;
    this.Dia = diaParameter;
    this.ballCol = colParameter;
    this.xSpeed = xSpeedParameter;
    this.ySpeed = ySpeedParameter;
    this.xSpeedChange = xSpeedChangeParameter;
    this.ySpeedChange = ySpeedChangeParameter;
    pongBall = true;
  }//end movedBall constructor

  float xSpeedChange() {
    float xSpeedChange = int (random(-2, 2));
    while (xSpeedChange == 0) {
      xSpeedChange = int (random(-2, 2)); //variable must be populated FIRST!
    }
    return xSpeedChange;
  }//end xSpeedChange

  float ySpeedChange() {
    float ySpeedChange = int (random(-2, 2)); //THIS IS THE CODE FOR CHANGING THE SPEED!!!!!!!!!!!11111!!!!!!1!11!!
    while (ySpeedChange == 0) {
      ySpeedChange = int (random(-2, 2));
    }
    return ySpeedChange;
  }// end ySpeedChange

  void draw() {
    fill(ballCol);
    ellipse(ballX, ballY, Dia, Dia); //easter egg at bounce - dia will change to create the effect of a "squish".
    fill(0);

    step(); //manipulating the variables.
  }//endBallDraw

  void step() {
    bounce();
    ySpeed += gravity; //Ball() is not affected - thus, the pong ball has no gravity.
    ballX += xSpeed * xSpeedChange;
    ballY += ySpeed * ySpeedChange;

    if (this.ballX <= (tableW*1/2)) {
      mySide = true;
    } else {
      mySide = false;
    }
  }//endBallStep

  void bounce() {
    if (pongBall == true) {
      if (mySide == true) {
        if (this.ballX < (paddleX + paddleW + (Dia/2)) && this.ballY > paddleY && this.ballY < (paddleY + paddleH)) {
          if (this.ballX > paddleX - Dia) {
            this.ballX = (paddleX + paddleW + (Dia/2));
            xSpeed *= -1;
          } else {
            xSpeed *= -1;
          }
        }
      } else {
        if (this.ballX > (paddleX - (Dia/2)) && this.ballY > paddleY && this.ballY < (paddleY + paddleH)) {
          if (this.ballX < paddleX + Dia) {
            this.ballX = (paddleX - (Dia/2));
            xSpeed *= -1;
          } else {
            xSpeed *= -1;
          }
        }
      }
      if (ballY < tableY + (Dia/2) || ballY > (tableY + tableH - (Dia/2))) {
        ySpeed *= -1;
      }
      if (ballX < 0 + (Dia/2) || ballX > tableW - (Dia/2)) {
        xSpeed *=  -1;
      }
    } else {
      if (ballY < tableX + (Dia/2) || ballY > (tableY + tableH - (Dia/2))) {
        ySpeed *= -1;
      }
      if (ballX < 0 + (Dia/2) || ballX > tableW - (Dia/2)) {
        xSpeed *=  -1;
      }
    }
  }//end ballBounce

  void netExplosion(float xParameter, float yParameter, float gravityParameter) {
    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i] = new Ball(xParameter, yParameter, gravityParameter);
    }
  }//end netExplosion

  void tableUpdate(float tableXParameter, float tableYParameter, float tableWParameter, float tableHParameter) { //GETTERS AND SETTERS
    tableX = tableXParameter;
    tableY = tableYParameter;
    tableW = tableWParameter;
    tableH = tableHParameter;
  }

  void paddleUpdate(float rPaddleXParameter, float lPaddleXParameter, float rPaddleYParameter, float lPaddleYParameter, float rPaddleWParameter, float lPaddleWParameter, float rPaddleHParameter, float lPaddleHParameter) {
    paddleX = (ballX <= (tableW * 1/2)) ? rPaddleXParameter: lPaddleXParameter;
    paddleY = (ballX <= (tableW * 1/2)) ? rPaddleYParameter: lPaddleYParameter;
    paddleW = (ballX <= (tableW * 1/2)) ? rPaddleWParameter: lPaddleWParameter;
    paddleH = (ballX <= (tableW * 1/2)) ? rPaddleHParameter: lPaddleHParameter;
  }
  //Functions to help
  
float left () {
  return ballX-Dia/2 ;
}
float right () {
  return ballX+Dia/2;
}
float up () {
  return ballY-Dia/2 ;
}
float down () {
  return ballY+Dia/2 ;
}
}//end Ball
