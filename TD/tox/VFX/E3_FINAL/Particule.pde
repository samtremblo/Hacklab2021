

class Particule{

  //DATA
  int maxVel;
  PVector pos,vel,acc;
  float m, delay ;

  
  
  
  //CONSTRUCTOR
  Particule(float x , float y){
    
  maxVel = floor(random(20,30));
  acc = new PVector( 0,0);
  vel = new PVector(0,0);
  pos = new PVector( x ,y );
  
  }
  
  
  //METHODS
  
  void applyForce( PVector force){
    
    PVector f = force.copy();
    
    acc.add(f);
    
    
  
  }
  
   void follow(Flowfield flow ){
     
     PVector force = flow.lookup(pos);
     force.setMag(40);
     applyForce(force);
   }
   
  void update(){
    acc.limit(1);
    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
    acc.mult(0);
  
  }
  
  void display(){
    stroke(220,50);
    strokeWeight(4);
    point(pos.x,pos.y);  
  
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
   
    PVector force  = PVector.sub( att.pos , pos);
    
    applyForce(force);
  
  }
  
  
}
