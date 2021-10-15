TestObj obj; 
ArrayList<TestObj> objs = new ArrayList<TestObj>();
DistCalc dc;
void setup(){
size(300,300);
for ( int i = 0 ; i < 2 ; i++){
  obj  =  new TestObj( random(width) , random(height));
  objs.add(obj);

}

dc = new DistCalc(  );
  
}


void draw(){
background(255);

dc.update(objs.get(0).pos , objs.get(1).pos);
dc.display();
for( TestObj obj : objs){
obj.update();
obj.display();

}



}
