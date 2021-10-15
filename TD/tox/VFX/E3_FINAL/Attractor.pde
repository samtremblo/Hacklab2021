
class Attractor{


  //DATA
  PVector pos , vel, acc;
  
  //CONSTRUCTOR
  Attractor(float x,float y){
  
  acc = new PVector(0,0);
  vel = new PVector(0,0);
  pos = new PVector( x , y);
    
  }
  
  
  //METHODS
  
  void follow(Flowfield flow ){
     
     PVector force = flow.lookup(pos);
     force.setMag(2);
     applyForce(force);
   }
  
  void applyForce( PVector force){
    
    PVector f = force.copy();
    acc.add(f);
    
  }
  
  void update(){
    acc.limit(1);
    vel.add(acc);
    vel.limit(10);
    pos.add(vel);
    acc.mult(0);
  
  }
  
  
  void display(){
   noStroke();
   fill(20);
   ellipse( pos.x , pos.y , 50 , 50 );
  
  }
  
   void warparound(){
  if(pos.x  < 0){
     this.pos.x = width;
  }
  if(this.pos.x > width){
    pos.x = 0;

}

  if(pos.y < 0){
     pos.y = height;

  }

  if(pos.y > height){
    this.pos.y = 0;

  }
}
  
 void attraction(){
   PVector mouse = new PVector( mouseX , mouseY);
    PVector force  = PVector.sub( mouse , pos);
    
    applyForce(force);
  
  }
void friction(){
 
  float c = 0.02;
  PVector friction = vel.copy();
  friction.mult(-1);
  friction.normalize();
  friction.mult(c);
  
  applyForce(friction);
  

}
  
}
