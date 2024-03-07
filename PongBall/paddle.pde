class Paddle {
  float x, y, xWidth, yHeight ;
  float xNet, yNet, widthNet, heightNet ;
  float xSpeed, ySpeed ;
  color colour ;
  
  //
  Paddle ( float tempX, float tempY, float tempWidth, float tempHeight ) {
    /*netWidth = 
    netHeight =
    tableHeight =
    */
    
  x = tempX ;
  y = tempY ;
  xWidth = tempWidth ;
  yHeight = tempHeight  ;
  xSpeed = 0 ;
  ySpeed = 0 ;
  colour = ( 0 ) ;
  //
  } //End 
   void move () {
   x += xSpeed ;
   y += ySpeed  ;
  } //End 
 
  void display () {
    fill ( colour ) ;
    rect ( x-xWidth/2, y-yHeight/2, xWidth, yHeight ) ;
  } //End 
  
  //Help me Plssssss
  float left () {
    return x-xWidth/2 ;
  }
   float right () {
    return  x+xWidth/2 ;
  }
  float up () {
    return y-yHeight/2 ;
  }
  float down () {
    return y+yHeight/2 ;
  }
  
  
  
  
}
