//Pallette of colours
color veryLightPink = #FCFBE3;
color lightPink = #FFB3C6;
color mediumPink = #FF6F91;
color darkPink = #C9184A;
color veryDarkPink = #8B0A50;
color white = #FFFFFF;

//variables for color selection
color selectedColor;

void setup() {
  size(800,600);
  strokeWeight(5);
  stroke(veryDarkPink);
  selectedColor = darkPink;
}

void draw() {
  background(veryLightPink);
  
  //buttons
  tactile(700,100,50);
  fill(lightPink);
  circle(700,100,100);
  
  tactile(700,300,50);
  fill(mediumPink);
  circle(700,300,100);
  
  tactile(700,500,50);
  fill(darkPink);
  circle(700,500,100);
  
  //indicator
  stroke(veryDarkPink);
  fill(selectedColor);
  square(100,100,400);
}

void tactile (int x,int y,int r) {
  if (dist(x,y,mouseX,mouseY) < r) {
  stroke(white);
  } else {
    stroke(veryDarkPink);
  }
}

void mouseReleased() {
   if (dist(700,100,mouseX,mouseY) < 50) {
     selectedColor = lightPink;
   }
   if(dist(700,300,mouseX,mouseY) < 50) {
     selectedColor = mediumPink;
   }
   if(dist(700,500,mouseX,mouseY) < 50) {
     selectedColor = darkPink;
   }
}
