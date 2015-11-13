PImage map ;

int x = 0 ; 
int y = 0 ; 
int sideLength = 10 ; 
int speed = 3;  // 1
boolean isMovingUp ;
boolean isMovingDown ;
boolean isMovingLeft ;
boolean isMovingRight ;

void setup(){
  map = loadImage("m1.jpg") ;
  //map = loadImage("m2.jpg") ;
  size(600,600);
  x = sideLength ; 
  y = sideLength*9 ; 
  //frameRate(10);
}

void draw(){
  loadPixels();
  
  image(map,0,0);
  noStroke();
  fill (255,0,0);
  
  rect(x,y,sideLength,sideLength) ;
  
  // check moveable
  
  
  
  
  
  //int max = 0 ; 
  //for (int i = 0 ; i < max ; i++ ){
  //  float radian = map ( i , 0,100, 0 , TWO_PI) ;
  //  cos(radian) * radius , (radian) * radius
     
    
  //}

  // original 
  if (isMovingUp    && y - speed> 0 && checkCanMove ( x, y-1, sideLength ,speed , 1 , -1 )) 
    y-= speed ; 
  if (isMovingDown  && y + sideLength + speed < height && checkCanMove ( x , y + sideLength +1 , sideLength ,speed , 1 , 1 ))
    y += speed ; 
  
  if (isMovingRight && x + sideLength + speed < width  && checkCanMove ( x + sideLength +1 , y , speed ,sideLength , 1 , 1 ))                
    x += speed ;
  if (isMovingLeft  && x - speed > 0 && checkCanMove ( x-1, y , speed ,sideLength , -1 , 1 ) )
    x -= speed ;
    
  //updatePixels();
}

boolean checkCanMove(int xStart , int yStart , int spanX , int spanY , int xDir , int yDir  ){
  for (int ySpan = 0 ; ySpan < spanY  ; ySpan++){
    for (int xSpan = 0 ; xSpan < spanX ; xSpan++ ){
      color c = pixels[ (yStart + yDir * ySpan)*width + (xStart + xDir * xSpan)] ;
      pixels[ (yStart + yDir * ySpan)*width + (xStart + xDir * xSpan)] = color (0,255,0);
      //print ((red(c) + green(c) + blue(c)) + ", ");
      if (red(c) + green(c) + blue(c) < 128 * 2) {
        return false ;        
      }
      
    } 
    println ("");
  } // RIGHT DOWN 
  return true ;
}

void keyPressed(){
  switch(keyCode){
    case UP : isMovingUp = true ;break ;
    case DOWN : isMovingDown = true ; break ;
    case LEFT : isMovingLeft = true ; break ;
    case RIGHT : isMovingRight = true ; break ;
    default :break ;
  }
}
void keyReleased(){
  switch(keyCode){
    case UP : isMovingUp = false ;break ;
    case DOWN : isMovingDown = false ; break ;
    case LEFT : isMovingLeft = false ; break ;
    case RIGHT : isMovingRight = false ; break ;
    default :break ;
  }
}