class Circle{
  Circle precedent;
  int nbrDots;
  float radius;
  float incrementAngle;
  float zPos;
  float time;
  boolean moving;
  
  Circle(float r){
    this.radius = r;
    this.nbrDots = int(2*PI*this.radius/distDots - 1);
    this.incrementAngle = 2*PI/this.nbrDots;
    this.zPos = 0;
    time = 0;
    this.moving = false;
  }
  
  void setPrecedent(Circle c){
    this.precedent = c;
  }
  
  void setFirst(){
    this.moving = true;
  }
  
  void update(){
    if(this.precedent.time*frequency > PI/3){
      this.moving = true;
    }
    if(this.moving){
      this.zPos = amplitude * sin(this.time * frequency);
      this.time += 0.05;
      if(this.time*frequency > 2*PI){
        this.time = 0;
        this.moving = false;
      }
    }
  }
  
  void display(){
    translate(0, 0, this.zPos);
    fill(map(this.zPos, -amplitude, amplitude, 0, 126), 255, 255);
    if(this.radius == 0){
      sphere(2*radiusDots);
    } else {
      for(int i=0; i<this.nbrDots; i++){
        translate(this.radius*cos(i*this.incrementAngle), this.radius*sin(i*this.incrementAngle));
        sphere(2*radiusDots);
        translate(-this.radius*cos(i*this.incrementAngle), -this.radius*sin(i*this.incrementAngle));
      }
    }
    translate(0, 0, -this.zPos);
  }
}
