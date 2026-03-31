//Pallette of colours
color veryLightPink = #FCFBE3;
color lightPink = #FFB3C6;
color mediumPink = #FF6F91;
color darkPink = #C9184A;
color veryDarkPink = #8B0A50;

void setup() {
  size(800,600);
  strokeWeight(5);
  stroke(veryDarkPink);
}

void draw() {
  background(veryLightPink);
  
  //buttons
  fill(lightPink);
  circle(700,100,100);
  
  fill(mediumPink);
  circle(700,300,100);
  
  fill(darkPink);
  circle(700,500,100);
  
  //indicator
  square(100,100,400);
}

void mouseReleased() {
  
}
