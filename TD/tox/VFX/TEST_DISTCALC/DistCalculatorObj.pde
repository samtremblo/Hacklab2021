

class DistCalc {

 //DATA
 PVector pos1 , pos2;
 float dist;
 //CONSTRUCTOR
 DistCalc(){
 
  // this.pos1 = pos1.copy();
   //this.pos2 = pos2.copy();


 }


//METHODS
 
 void update(PVector pos1 , PVector pos2){
   this.pos1 = pos1.copy();
   this.pos2 = pos2.copy();
   dist = pos1.dist( pos2);    
 }
 
 
void display(){
   
  for ( int i = 0 ; i < dist ; i++){
    float t = map( i , 0 , dist , 0,1);
    float x = lerp( pos1.x , pos2.x, t);
    float y = lerp( pos1.y , pos2.y, t);
    pushStyle();
    if( t  > 0.45 && t < 0.55){
      stroke(0,0);
    }else{
      stroke(0);
    } 
    point(x ,y ) ;
  
  }
 String distString = Float.toString(floor(dist*10)/100);
 pushMatrix();
 translate(-10,3);
 textSize(8);
 text( distString, lerp( pos1.x , pos2.x, 0.5), lerp( pos1.y , pos2.y, 0.5)); 
 popMatrix();
}



}
