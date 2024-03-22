//Global Vars and objects


Ball myBall, movedBall;
Ball[] fireworks = new Ball[20];
Paddle table, exitBut, lPaddle, rPaddle;

color black=#000000, white=#FFFFFF, red=#951111, Lgreen=#27C149, gray=#CBCBCB;

color tableColor = white;//ERROR - move to table CLASSSSS!!!!!!! NOWWWW!!!!!! >:(
int SBL = 0 ;
int SBR = 0 ;
void setup() {
  println("LET HIM COOK");
  noStroke();
  fullScreen();  
  /*screenSizeChecker(); for landscape, portrait, square views.
   Updated automatically for screen rotation on android.
   */
  //String[] fontList = PFont.list();
  //printArray(fontList);

  //population
  myBall = new Ball(); //both halves of the constructor.
  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(displayWidth * -1, displayHeight * -1, 0.5);
  }
  movedBall = new Ball(displayWidth * -1, displayHeight * -1, myBall.Dia, myBall.ballCol, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
  //exit = new Button(red, displayWidth*19/20, displayHeight*0, displayWidth*1/20, displayHeight*1/25);

  rPaddle = new Paddle(0, myBall.Dia, white);
  lPaddle = new Paddle(displayWidth, myBall.Dia, white);
  table = new Paddle();
  exitBut = new Paddle ("x", 40, black, red, displayWidth*17/20, displayHeight/30, displayWidth/10, displayHeight/24);

  myBall.tableUpdate(rPaddle.tableX, rPaddle.tableY, rPaddle.tableW, rPaddle.tableH);

  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i] = new Ball(displayWidth * -1, displayHeight * -1, 0.5);
  }
}//endSetup

void draw() {
  background(0);
  table.draw();
  
    if ( myBall.right () > width ) {
   SBL = SBL +1 ;
    myBall.ballX = width/2 ;
    myBall.ballY = height/2 ;
  }
  if ( myBall.left () < 0 ) {
    SBR = SBR + 1 ;
    myBall.ballX = width/2 ;
    myBall.ballY = height/2 ;
  }
  

  for (int i = 0; i < fireworks.length; i++) {
    fireworks[i].draw();
  }

  lPaddle.draw();
  rPaddle.draw();

  if (myBall.disappear == true) {
    //empty IF
  } else {
    myBall.draw();
  }

  if (myBall.disappear == false  && myBall.ballX < myBall.Dia || myBall.ballX > (displayWidth - myBall.Dia)) { //goal - firework execution is based on x value. triggers are left goal and right goal.
    myBall.netExplosion(myBall.ballX, myBall.ballY, 0.5);
    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i].tableUpdate(rPaddle.tableX, rPaddle.tableY, rPaddle.tableW, rPaddle.tableH);
    }
  } else if (myBall.disappear == true && movedBall.ballX < movedBall.Dia || movedBall.ballX > (displayWidth - movedBall.Dia)) {
    movedBall.netExplosion(movedBall.ballX, movedBall.ballY, 0.5);
    for (int i = 0; i < fireworks.length; i++) {
      fireworks[i].tableUpdate(rPaddle.tableX, rPaddle.tableY, rPaddle.tableW, rPaddle.tableH);
    }
  }
  movedBall.draw();
  //println(movedBall.x);

  if (myBall.disappear == true) {
    movedBall.paddleUpdate(rPaddle.paddleX, lPaddle.paddleX, rPaddle.paddleY, lPaddle.paddleY, rPaddle.paddleW, lPaddle.paddleW, rPaddle.paddleH, lPaddle.paddleH);
  } else {
    myBall.paddleUpdate(rPaddle.paddleX, lPaddle.paddleX, rPaddle.paddleY, lPaddle.paddleY, rPaddle.paddleW, lPaddle.paddleW, rPaddle.paddleH, lPaddle.paddleH);
  }
  
  exitBut.draw();
  
   textSize ( 60 ) ;
   textAlign ( CENTER, TOP ) ;
  // Score Board WIN / WIN ;
   text ( SBR, width/2+30, 30 ) ; // Right and left ScoreBoard
   text ( SBL, width/2-30, 30 ) ; //
}

void keyPressed() {


  rPaddle.keyPressedWASD();
  lPaddle.keyPressedARROW();
}

void keyReleased() {
  rPaddle.keyReleasedWASD();
  lPaddle.keyReleasedARROW();
}

void mousePressed() {
  println("ball moved or bug lOL !");
  if (myBall.disappear == false) {
    movedBall = new Ball(mouseX, mouseY, myBall.Dia, myBall.ballCol, myBall.xSpeed, myBall.ySpeed, myBall.xSpeedChange, myBall.ySpeedChange);
    movedBall.tableUpdate(rPaddle.tableX, rPaddle.tableY, rPaddle.tableW, rPaddle.tableH);
    myBall.disappear = true;
  } else {
    movedBall = new Ball(mouseX, mouseY, myBall.Dia, myBall.ballCol, movedBall.xSpeed, movedBall.ySpeed, movedBall.xSpeedChange, movedBall.ySpeedChange);
    movedBall.tableUpdate(rPaddle.tableX, rPaddle.tableY, rPaddle.tableW, rPaddle.tableH);
    myBall.disappear = true;
  }

  if (mouseX >= exitBut.butX && mouseX <= (exitBut.butX + exitBut.butW) && mouseY >= exitBut.butY && mouseY <= (exitBut.butY + exitBut.butH)) {
   println("BEGONE ");
   exit();
   }
}

//endDRIVER
