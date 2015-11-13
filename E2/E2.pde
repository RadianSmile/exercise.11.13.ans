boolean[][] grid;

// Number of columns and rows in the grid
int cols = 100;
int rows = 100;
int cellWidth = 0 ; 
int cellHeight = 0 ;

int triggerX = -1 ;
int triggerY = -1 ;
void setup() {
  size(500,500);
  cellWidth = width / cols  ;
  cellHeight = height / rows ; 
  
  grid = new boolean[cols][rows] ;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = false ; 
    }
  }
  frameRate(60);
}

int nowDist = 0 ; 
void draw() {
  
  nowDist++ ;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float dist = dist(i,j,triggerX,triggerY) ;
      if (triggerX < 0  || triggerY < 0) {
        fill(100);
      }else if ( dist >= nowDist && dist < nowDist + 1 ){
        fill(255);
      }else{
        fill(100);
      }
      rect(cellWidth*i,cellHeight*j,cellWidth,cellHeight) ;
    }
  }
}

void mouseReleased (){
   nowDist = 0 ;
   triggerX = mouseX / cellWidth ; 
   triggerY = mouseY / cellHeight ; 
      
}