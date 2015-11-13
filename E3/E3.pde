PImage img  ;

int r = 10 ; 

void setup () {
  size(300, 300) ;
  img = loadImage("p1.jpg") ; 
  
  rectMode(CENTER) ; 
  //noStroke();
  //noCursor();
}



void draw() {

  int mx = mouseX ; 
  int my = mouseY ;
  image(img, 0, 0 ) ; 
  img.loadPixels() ;

  int rSum = 0, gSum = 0, bSum = 0, total = 0 ; 

  for (int x = mx - r; x < mx + r; x++ ) {
    for (int y = my - r; y < my + r; y++ ) {
      if (x >= 0 && x < img.width && y>= 0 && y<img.height) {
        if (dist(x, y, mx, my) < r) {
          int loc = x + y*img.width;
          color c = img.pixels[loc] ;

          rSum  += red  (c);
          gSum  += green(c);
          bSum  += blue (c);
          total += 1 ;
        }
      }
    }
  }
  
  if (total > 0 ) {
      
    if ( mousePressed ) {
      for (int x = mx - r; x < mx + r; x++ ) {
        for (int y = my - r; y < my + r; y++ ) {
          if (x >= 0 && x < img.width && y>= 0 && y<img.height) {
            if (dist(x, y, mx, my) < r) {
              int loc = x + y*img.width;
              color c = img.pixels[loc] ;
              img.pixels[loc] =  color (rSum / total ,gSum / total ,bSum / total );            
            }     
          }
        }
      }
      img.updatePixels();
    }
  
    println ("" + rSum / total + gSum / total + bSum / total  );
    fill(rSum / total, gSum / total, bSum / total  ) ; 

    //image(img , 0 , 0 ) ;
    //ellipse(mx, my, 2 * r, 2* r);
  }
  
}