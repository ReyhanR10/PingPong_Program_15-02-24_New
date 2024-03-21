//Global Vars and objects

Ball myBall, movedBall;
Ball[] fireworks = new Ball[20];
Paddle pongTable, leftPaddle, rightPaddle;

// BRO IT'S COLOR !

color black=#000000, white=#FFFFFF, red=#951111, Lgreen=#27C149, gray=#CBCBCB;

//Button exit;
int SBL = 0 ;
int SBR = 0 ;
int X1Width, X1Height ; 

color tableColor = #29FFF2 ; //ERROR DumbAss
float AXWidth, AXHeight ;
void setup() {
  noStroke();
  fullScreen(); //FULLSCREENNNNNNNN BASSSSSSSSSS
  AXWidth = +displayWidth ;
  AXHeight = +displayHeight ;
  
  X1Width = displayWidth ;
  X1Height = displayWidth ;
  //font = createFont("Roboto", 55);
  /*screenSizeChecker(); for landscape, portrait, square views.
   Updated automatically for screen rotation on android.
   */

  //population
  myBall = new Ball(); //both halves of the constructor.
  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(displayWidth * -1, displayHeight * -1, 0.5);
  }
  movedBall = new Ball(displayWidth * -1, displayHeight * -1, myBall.dia, myBall.ballCol, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
  //exit = new Button(red, displayWidth*19/20, displayHeight*0, displayWidth*1/20, displayHeight*1/25);
  rightPaddle= new Paddle(0, myBall.dia);
  leftPaddle = new Paddle(displayWidth, myBall.dia);
  pongTable = new Paddle() ; //rect here bro 

  myBall.tableUpdate(rightPaddle.tableX, rightPaddle.tableY, rightPaddle.tableW, rightPaddle.tableH);

  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(displayWidth * -1, displayHeight * -1, 0.5);
  }
}//endSetup

void draw() {
  background(tableColor);
  pongTable.draw () ;

  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i].draw();
  }
  if ( myBall.right () > width ) {
    SBL = SBL +1 ;
    myBall.x = width/2 ;
    myBall.y = height/2 ;
  }
  if ( myBall.left () < 0 ) {
   SBR = SBR + 1 ;
    myBall.x = width /2 ;
    myBall.y = height/2 ;
  }

  leftPaddle.draw();
  rightPaddle.draw();

  if (myBall.disappear == true) {
    //empty IF
  } else {
    myBall.draw();
  }

  if (myBall.disappear == false  && myBall.x < myBall.dia || myBall.x > (displayWidth - myBall.dia)) { //goal - firework execution is based on x value. triggers are left goal and right goal.
    myBall.netExplosion(myBall.x, myBall.y, 0.5);
    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i].tableUpdate(rightPaddle.tableX, rightPaddle.tableY, rightPaddle.tableW, rightPaddle.tableH);
    }
  } else if (myBall.disappear == true && movedBall.x < movedBall.dia || movedBall.x > (displayWidth - movedBall.dia)) {
    movedBall.netExplosion(movedBall.x, movedBall.y, 0.5);
    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i].tableUpdate(rightPaddle.tableX, rightPaddle.tableY, rightPaddle.tableW, rightPaddle.tableH);
    }
  }
  movedBall.draw();
  //println(movedBall.x);

  if (myBall.disappear == true) {
    movedBall.paddleUpdate(rightPaddle.paddleX, leftPaddle.paddleX, rightPaddle.paddleY, leftPaddle.paddleY, rightPaddle.paddleW, leftPaddle.paddleW, rightPaddle.paddleH, leftPaddle.paddleH);
  } else {
    myBall.paddleUpdate(rightPaddle.paddleX, leftPaddle.paddleX, rightPaddle.paddleY, leftPaddle.paddleY, rightPaddle.paddleW, leftPaddle.paddleW, rightPaddle.paddleH, leftPaddle.paddleH);
  }
  textSize ( 65 ) ;
  textAlign ( CENTER, TOP ) ;
  // Score Board WIN / WIN ;
  text ( SBR, width/2+30, 30 ) ; // Right and left ScoreBoard
  text ( SBL, width/2-30, 30 ) ; //
  
}

void keyPressed() {
  /*if (key == 'p' || key == 'P') {
    if (partyMode == false) {
      partyMode = true;
      println("partyMode on!");
    } else {
      partyMode = false;
      println("partyMode off!");
      tableColor = 150;
    }
    */
  

  rightPaddle.keyPressedWASD();
  leftPaddle.keyPressedARROW();
}

void keyReleased() {
  rightPaddle.keyReleasedWASD();
  leftPaddle.keyReleasedARROW();
}

void mousePressed() {
  println("ball moved!");
  if (myBall.disappear == false) {
    movedBall = new Ball(mouseX, mouseY, myBall.dia, myBall.ballCol, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
    movedBall.tableUpdate(rightPaddle.tableX, rightPaddle.tableY, rightPaddle.tableW, rightPaddle.tableH);
    myBall.disappear = true;
  } else {
    movedBall = new Ball(mouseX, mouseY, myBall.dia, myBall.ballCol, movedBall.xSpeed, movedBall.ySpeed, movedBall.xSpeedChange, movedBall.ySpeedChange);
    movedBall.tableUpdate(rightPaddle.tableX, rightPaddle.tableY, rightPaddle.tableW, rightPaddle.tableH);
    myBall.disappear = true;
  }

  /* if (mouseX>=exit.x && mouseX<=exit.x+exit.w && mouseY>=exit.y && mouseY<=exit.y+exit.h) {
   exit();
   }*/
}

//endDRIVER
