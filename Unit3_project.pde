color red = #FF595E;
color orange = #FF924C;
color yellow = #FFCA3A;
color green = #8AC926;
color blue = #1982C4;
color purple = #6A4C93;
color white = #FFFFFF;
color black = #000000;

//variables for color selection
color selectedColor;   

void setup() {
  size(800,600);
  strokeWeight(2);
  selectedColor = red;

//Drawing board
background(255);
}

void draw() {
  
   strokeWeight(2);
   
  //toolbar
  noStroke();
  fill(220);
  rect(0,0,800,150);
  
  //buttons
  tactile(55,55,30);
  fill(red);
  circle(55,55,60);
  
  tactile(125,55,30);
  fill(orange);
  circle(125,55,60);
  
  tactile(195,55,30);
  fill(yellow);
  circle(195,55,60);
  
  tactile(265,55,30);
  fill(green);
  circle(265,55,60);
  
  tactile(335,55,30);
  fill(blue);
  circle(335,55,60);
  
  tactile(405,55,30);
  fill(purple);
  circle(405,55,60);
}

void tactile (int x, int y, int r) {
  if (dist(x,y,mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(black);
  }
}

void mouseDragged() {
  if (mouseY > 150) {  
    stroke(selectedColor);
    strokeWeight(10);  
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void mouseReleased() {
  if (dist(55, 55, mouseX, mouseY) < 30) {
    selectedColor = red;
  }
  if (dist(125, 55, mouseX, mouseY) < 30) {
    selectedColor = orange;
  }
  if (dist(195, 55, mouseX, mouseY) < 30) {
    selectedColor = yellow;
  }
  if (dist(265, 55, mouseX, mouseY) < 30) {
    selectedColor = green;
  }
  if (dist(335, 55, mouseX, mouseY) < 30) {
    selectedColor = blue;
  }
  if (dist(405, 55, mouseX, mouseY) < 30) {
    selectedColor = purple;
  }
}
