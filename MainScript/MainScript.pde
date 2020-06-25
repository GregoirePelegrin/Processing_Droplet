// Works but is resource consuming

ArrayList<Circle> water;
int distDots;
int radiusDots;
int nbrCircles;
float amplitude;
float frequency;

void setup(){
  size(600, 600, P3D);
  frameRate(30);
  colorMode(HSB);
  
  water = new ArrayList<Circle>();
  distDots = 20;
  radiusDots = distDots/8;
  amplitude = 50;
  frequency = 1;
  nbrCircles = 10;
  
  Circle c = new Circle(0);
  c.setFirst();
  water.add(c);
  for(int i=0; i<nbrCircles-1; i++){
    c = new Circle((i+1)*distDots);
    c.setPrecedent(water.get(i));
    water.add(c);
  }
  water.get(0).setPrecedent(water.get(nbrCircles-1));
}

void draw(){
  background(0);
  noStroke();
  lights();
  translate(width/2, height/2);
  rotateX(PI/3);
  
  for(Circle c : water){
    c.update();
    c.display();
  }
}
