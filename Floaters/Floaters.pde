void setup(){
  background(255,255,255);
  //size(1920,1080);
  fullScreen();
  for(int i = 0; i < floaters.length; i++){
     
    floaters[i] = new Floater();
    
  }
  
  
}

int numberOfFloaters = 500;
public Floater[] floaters = new Floater[numberOfFloaters];


void draw(){
  clear();
  updateFloaters(floaters);
  
  
}


public void updateFloaters(Floater[] floaterArray){
  checkCollisions();
  for(int i = 0; i < floaters.length; i++){
     
    floaters[i].move();
    floaters[i].show();
    
  }
}

private void checkCollisions(){
  for(int i = 0; i < floaters.length; i++){
    
    for(int j = 0; j < floaters.length; j++){
      
      if(i == j){
        break;
      }
      else{
        floaters[i].collides(floaters[j]);
      }
    }
  }
}


      
    