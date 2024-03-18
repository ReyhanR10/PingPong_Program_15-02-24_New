/*known ERRORS:
 night mode - ball color is full blue*/
class Ball {
  //Ball Global Vars
  float x, y, dia;
  color ballCol;
  float xSpeed, ySpeed;
  float xSpeedChange = 1.0, ySpeedChange = 1.0;
  float gravity = 0.0;
  boolean disappear = false;
  boolean dumbAF ;
  boolean pongBall;
  float tableX, tableY, tableWidth, tableHeight, paddleX, paddleY, paddleWidth, paddleHeight ;
  //static int count = 25


  //ball constructor
  Ball () {
    //local vars
    int startx = displayWidth*1/2;
    int starty = displayHeight*1/2;
    int referentMeasure = (displayWidth < displayHeight) ? displayWidth: displayHeight; //review ternary operator

    //object vars
    this.x = startx;
    this.y = starty;
    this.dia = referentMeasure*1/20;
    this.ballCol = 0 ; //random(255) also applicable. Casting from float to int.
    this.xSpeed = 3*xSpeedChange();
    this.ySpeed = 3*ySpeedChange();
    this.xSpeedChange = 1.0; //break bounce physics - change speed
    this.ySpeedChange = 1.0;
    pongBall = true;
  } //end ball constructor

  //firework constructor - multiple constructors by identifying different parameters.
  Ball(float xParameter, float yParameter, float gravityParameter) {
    //Ball(); //placeholder
    this.x = xParameter; //ERROR: trigger when the Ball enters goal area
    this.y = yParameter; //ERROR: trigger when the Ball enters goal area
    this.ballCol = color (int(random(255)), int(random(255)), int(random(255))) ; //random(), random()-shortcut, casting from float to intin color var
    this.dia = random(width*1/70); //returns unseen diamters
    this.xSpeed = random(-5, 5); //Can return 0
    this.ySpeed = random(-5, 5); //Can return 0
    gravity = gravityParameter;
    pongBall = false;
  }//end firework constructor

  //movedBall constructor -- must look like old ball instance ( same color, same size ) and make old ball instance disappear.
  Ball(float xParameter, float yParameter, float diaParameter, color colParameter, float xSpeedParameter, float ySpeedParameter, float xSpeedChangeParameter, float ySpeedChangeParameter) {
    this.x = xParameter;
    this.y = yParameter;
    this.dia = diaParameter;
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
    ellipse(x, y, dia, dia); //easter egg at bounce - dia will change to create the effect of a "squish".
    fill(0);

    step(); //manipulating the variables.
  }//endBallDraw

  void step() {
    bounce();
    ySpeed += gravity; //Ball() is not affected - thus, the pong ball has no gravity.
    x += xSpeed * xSpeedChange;
    y += ySpeed * ySpeedChange;

    if (this.x <= (tableWidth*1/2)) {
      dumbAF = true;
    } else {
      dumbAF = false;
    }
  }//endBallStep

  void bounce() {
    if (pongBall == true) {
      if (dumbAF == true) {
        if (this.x < (paddleX + paddleWidth + (dia/2)) && this.y > paddleY && this.y < (paddleY + paddleHeight)) {
          if (this.x > paddleX - dia) {
            this.x = (paddleX + paddleWidth + (dia/2));
            xSpeed *= -1;
          } else {
            xSpeed *= -1;
          }
        }
      } else {
        if (this.x > (paddleX - (dia/2)) && this.y > paddleY && this.y < (paddleY + paddleHeight )) {
          if (this.x < paddleX + dia) {
            this.x = (paddleX - (dia/2));
            xSpeed *= -1;
          } else {
            xSpeed *= -1;
          }
        }
      }
      if (y < tableY + (dia/2) || y > (tableY + tableHeight - (dia/2))) {
        ySpeed *= -1;
      }
      if (x < 0 + (dia/2) || x > tableWidth - (dia/2)) {
        xSpeed *=  -1;
      }
    } else {
      if (y < tableX + (dia/2) || y > (tableY + tableHeight - (dia/2))) {
        ySpeed *= -1;
      }
      if (x < 0 + (dia/2) || x > tableWidth - (dia/2)) {
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
    tableWidth = tableWParameter;
    tableHeight = tableHParameter;
  }

  void paddleUpdate(float rPaddleXParameter, float lPaddleXParameter, float rPaddleYParameter, float lPaddleYParameter, float rPaddleWParameter, float lPaddleWParameter, float rPaddleHParameter, float lPaddleHParameter) {
    paddleX = (x <= (tableWidth * 1/2)) ? rPaddleXParameter: lPaddleXParameter;
    paddleY = (x <= (tableWidth * 1/2)) ? rPaddleYParameter: lPaddleYParameter;
    paddleWidth = (x <= (tableWidth * 1/2)) ? rPaddleWParameter: lPaddleWParameter;
    paddleHeight = (x <= (tableWidth * 1/2)) ? rPaddleHParameter: lPaddleHParameter;
  }
  float left () {
  return x-dia/2 ;
}
float right () {
  return x+dia/2;
}
float up () {
  return y-dia/2 ;
}
float down () {
  return y+dia/2 ;
}

}//end Ball
