

class TestObj{

//DATA
 PVector pos, vel ,acc;
 int d;
 

//CONSTRUCTOR
 TestObj(float x , float y){
 pos = new PVector( x , y ) ; 
 vel = PVector.random2D();
 acc = new PVector( 0 , 0 );
 d = 50;
 }
 
 //METHODS
 
 void update(){
 
  vel.add(acc);
  pos.add(vel);
   
 }
 
 void display(){
 
 fill(255,0,0);
 ellipse( pos.x , pos. y , d, d);
 
 }
 
}
