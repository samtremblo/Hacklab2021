//ETIENNE MONTENEGRO. 2018
//FLOWFIELD OBJECT BASED ON THE NATURE OF CODE FLOWFIELD EXAMPLE

class Flowfield {



  //DATA

  PVector [][] field;
  int rows, cols, res ;

  float  zoff, incX , incY , incZ;


  //CONSTRUCTOR

  Flowfield( int res, float incX , float incY) {

    this.res = res;
    cols = floor(width / res);
    rows = floor(height / res);
    field = new PVector[cols][rows];
    this.incX = incX;
    this.incY = incY;

  }





  //METHODS
  
  void update(float incZ){
   this.incZ = incZ;
     zoff+=incZ; 
  
  }
  
  void make() {
    
    
     float  xoff = 0;

    for ( int x = 0; x < cols; x ++ ) {

      float yoff = 0;
      for ( int y = 0; y < rows; y++ ) {

        float angle = map(noise(xoff, yoff, zoff), 0, 1, 0, TWO_PI) ;


        field[x][y] = new PVector(cos(angle), sin(angle));

       
        yoff += incY;
      }
      xoff += incX;

    }
  }

  void display() {
    background(255);

    for ( int x = 0; x < cols; x ++ ) {

      for ( int y = 0; y < rows; y++ ) {    


        //DRAW VECTOR
        pushMatrix();
        stroke(0, 50);
        translate(x*res, y*res);
        rotate(field[x][y].heading());
        line(0, 0, res, 0);
        popMatrix();
        ///////////////////////////////////////////
      }
    }
  }
  
  
  PVector lookup ( PVector lookup){ //CALL THIS IN VEHICULE CLASS METHOD FOLLOW
    int col = floor( constrain( lookup.x/res,0,cols-1));
    int row = floor( constrain( lookup.y/res,0,rows-1));
    return field[col][row].copy();
  
  
  }
}
