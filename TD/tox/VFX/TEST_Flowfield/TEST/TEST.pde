
Flowfield ff;

void setup(){
 size(1920, 1080);

  ff = new Flowfield( 60, 0.1,0.2);
  
}



void draw(){
  
  ff.update(0.003);
  ff.make();
  ff.display();
 println(frameRate);

}
