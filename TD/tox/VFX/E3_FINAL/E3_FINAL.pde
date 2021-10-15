


//GLOBAL VARIABLE

ArrayList<Particule> particules = new ArrayList<Particule>();
Attractor att;
Flowfield ff;

void setup(){
 
 size(1920 , 1080,P2D);

  
   //PARTICULES SPAWNER
    for( int i = 0 ; i < 20000   ; i++  ){
      Particule p = new Particule(random(width),random(height));
      particules.add(p);
    }
 
  att = new Attractor(width/2,height/2);
  ff = new Flowfield(60 , 10,0.5);

}

void draw(){
    background(70);

  ff.make();
  ff.update(0.003);
  // att.follow(ff);

 // att.warparound();
 // att.friction();
  //att.update();
//att.display();
  
for( Particule p : particules){
      p.follow(ff);

   // p.attraction();

  p.warparound();
  p.update();
  p.display();

}





}


void mouseReleased(){

  att.attraction();


}
  
  
  
  
  
  
