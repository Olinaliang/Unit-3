//Color Variables
color red = #FF595E;
color orange = #FF924C;
color yellow = #FFCA3A;
color green = #8AC926;
color blue = #1982C4;
color purple = #6A4C93;
color white = #FFFFFF;
color black = #000000;

//Stamp
PImage winnie;
PImage pikachu;

float sliderX;
float shade;

//Variables For Color Selection
color selectedColor;   

void setup() {
  size(800,600);
  strokeWeight(2);
  selectedColor = red;
  sliderX = 155;
  shade = 10;   

  //Drawing Board
  background(255);
  
  //stamp
  winnie = loadImage("winnie.png");
  pikachu = loadImage("pikachu.png");
}

void draw() {
  strokeWeight(2);
  
  //Toolbar
  noStroke();
  fill(220);
  rect(0,0,800,150);
  
  //winnie stamp 
  tactile(460,37,85,85);
  stroke(black);
  fill(255);
  rect(460, 37, 85, 85);
  image(winnie, 462, 40, 81, 81);
  
  //pikachu stamp
  stroke(black);
  fill(255);
  rect(560, 37, 85, 85);
  image(pikachu, 561.5, 40, 80, 80);
 
  //Slider
  stroke(black);
  line(55,120,300,120);
  fill(255);
  circle(sliderX, 120, 40);
  
  //Buttons
  circleButton(red, 55, 55, 30);
  circleButton(orange, 125, 55, 30);
  circleButton(yellow, 195, 55, 30);
  circleButton(green, 265, 55, 30);
  circleButton(blue, 335, 55, 30);
  circleButton(purple, 405, 55, 30);
  
  //Indicator
  stroke(selectedColor);
  strokeWeight(shade);
  line(340, 120, 390, 120);
}

void circleButton(color c, int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(black);
  }
  fill(c);
  circle(x, y, 60);
}

void rectButton(color c, int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    stroke(white);
  } else {
    stroke(black);
  }
  fill(c);
  rect(x, y, w, h);
}

void mouseDragged() {
  if (mouseX > 55 && mouseX < 300 && mouseY > 100 && mouseY < 140) {
    controlSlider();
  } else if (mouseY > 150) {  
    stroke(selectedColor);
    strokeWeight(shade);  
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

void controlSlider() {
  if (mouseX > 55 && mouseX < 300 && mouseY > 100 && mouseY < 140) {
    sliderX = mouseX;
  }
  shade = map(sliderX,55,300,5,20);   
}

void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(255,255,0);
  } else {
    fill(255);
  }
}
