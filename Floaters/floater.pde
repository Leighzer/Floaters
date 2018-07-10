public class Floater{

  float maxSpeed = 3;
  float speedBoost = 0.2, speedSlow = 0.6;
  int maxSize = 15, minSize = 10;
  
  PVector pos;
  PVector speed;
  int radius;
    
  color c;

public Floater(){
  radius = (ceil(random(maxSize - minSize)) + minSize)/2;
  pos = new PVector(random(width - radius*2) + radius, random(height - radius*2) + radius); 
  float randomSpeed = random(maxSpeed);
  float randomAngle = random(2*PI);
  speed = new PVector( randomSpeed*cos(randomAngle), randomSpeed*sin(randomAngle));
  
  if(random(1) < 0.3333){
    c = color(255,0,0);
  }
  else if(random(1) < 0.5){
    c = color(0,255,0);
  }
  else{
  c = color(0, 0, 255);
  }
}

public void move(){
    pos.x += speed.x;
    pos.y += speed.y;
  
  if(pos.x < radius){
    this.pos.x = width - this.pos.x;
  }
  else if(pos.x >width - radius){
    this.pos.x = this.pos.x % width;
  }
  
  if(pos.y < radius){
    this.pos.y = height - this.pos.y;
  }
  else if(pos.y > height - radius){
   this.pos.y = this.pos.y % height;
  }
}

public void show(){
  stroke(c);
  strokeWeight(radius*2);
  point(pos.x, pos.y);  
}

public void collides(Floater floater){
 
  int collisionDistance = this.radius + floater.radius;
  float temp;
  
  if( dist(this.pos.x, this.pos.y, floater.pos.x, floater.pos.y) < collisionDistance){
    
    if(this.c == floater.c){
      this.pos.x = floater.pos.x + random(this.radius)*randomSign();
      this.pos.y = floater.pos.y + random(this.radius)*randomSign();
      this.speed.setMag(mag(this.speed.x, this.speed.y) + speedBoost);
      floater.speed.setMag(mag(floater.speed.x, floater.speed.y) + speedBoost);
      
    }
    else{
      this.pos.x = floater.pos.x + random(this.radius)*randomSign();
      this.pos.y = floater.pos.y + random(this.radius)*randomSign();
      this.speed.setMag(mag(this.speed.x, this.speed.y) - speedSlow);
      floater.speed.setMag(mag(floater.speed.x, floater.speed.y) - speedSlow);
    }
    
    
    temp = this.speed.x;
    this.speed.x = floater.speed.x;
    floater.speed.x = temp;
  
  
  
    temp = this.speed.y;
    this.speed.y = floater.speed.y;
    floater.speed.y = temp;
    
    if(random(100000) < 1){
      this.speed.setMag(mag(this.speed.x*25, this.speed.y*25));
      stroke(255,0,255);
      strokeWeight(200);
      point(this.pos.x, this.pos.y);
    }
  }
  
}

private int randomSign(){
  if(random(1) < 0.5){
    return 1;
  }
  else{
    return -1;
  }
}

}