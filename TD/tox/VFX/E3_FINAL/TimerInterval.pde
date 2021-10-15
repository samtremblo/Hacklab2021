public class TimerInterval {

  //DATA
  float t;
int interval,timerStart;
boolean state;
//CONSTRUCTOR
TimerInterval(int _interval){
 state = false;
timerStart = 0;
interval = _interval;
}

//METHODS
 public void loop( ){
        state = false;

  
float timeElapsed = millis()-timerStart;
t = timeElapsed;
if (timeElapsed  >= interval ){
      timerStart = millis();
      state = true;
}
}
}
