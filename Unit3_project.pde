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
boolean winnieOn;
PImage pikachu;
boolean pikachuOn;

float sliderX;
float shade;

//Variables For Color Selection
color selectedColor;   

void setup() {
  size(800,600);
  strokeWeight(2);
  textSize(12);
  selectedColor = red;
  sliderX = 155;
  shade = 10;   

  //Drawing Board
  background(255);
  
  //Stamp
  winnie = loadImage("winnie.png");
  winnieOn = false;
  pikachu = loadImage("pikachu.png");
  pikachuOn = false;
}

void draw() {
  strokeWeight(2);
  
  //Toolbar
  noStroke();
  fill(220);
  rect(0,0,800,150);
  
  //Winnie Stamp 
  tactile(460,37,85,85);
  winnieOnOff();
  rect(460, 37, 85, 85);
  image(winnie, 462, 40, 81, 81);
  
  //Pikachu Stamp
  tactile(560,37,85,85);
  pikachuOnOff();
  rect(560, 37, 85, 85);
  image(pikachu, 561.5, 40, 80, 80);
 
  //Slider
  stroke(black);
  strokeWeight(2);
  line(55,120,300,120);
  fill(255);
  circle(sliderX, 120, 40);
  
  //Buttons
  strokeWeight(2);
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
  
  //New Button
  strokeWeight(1);
  rectButton(white, 680, 30, 60, 25);
  fill(0);
  text("New", 697, 47);

  //Load Button
  strokeWeight(1);
  rectButton(white, 680, 65, 60, 25);
  fill(0);
  text("Load", 694, 82);

  //Save Button
  strokeWeight(1);
  rectButton(white, 680, 100, 60, 25);
  fill(0);
  text("Save", 694, 117);
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
    if (winnieOn == true) {
      image(winnie, mouseX, mouseY, 85, 85);
    } else if (pikachuOn == true) {
      image(pikachu, mouseX, mouseY, 85, 85);
    } else {
      stroke(selectedColor);
      strokeWeight(shade);  
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}

void mouseReleased() {
  if (dist(55, 55, mouseX, mouseY) < 30) {
    selectedColor = red;
    winnieOn = false;
    pikachuOn = false;
  }
  if (dist(125, 55, mouseX, mouseY) < 30) {
    selectedColor = orange;
    winnieOn = false;
    pikachuOn = false;
  }
  if (dist(195, 55, mouseX, mouseY) < 30) {
    selectedColor = yellow;
    winnieOn = false;
    pikachuOn = false;
  }
  if (dist(265, 55, mouseX, mouseY) < 30) {
    selectedColor = green;
    winnieOn = false;
    pikachuOn = false;
  }
  if (dist(335, 55, mouseX, mouseY) < 30) {
    selectedColor = blue;
    winnieOn = false;
    pikachuOn = false;
  }
  if (dist(405, 55, mouseX, mouseY) < 30) {
    selectedColor = purple;
    winnieOn = false;
    pikachuOn = false;
  }
  
  //Winnie Button
  if (mouseX > 460 && mouseX < 545 && mouseY > 37 && mouseY < 122) {
    winnieOn = !winnieOn;
    pikachuOn = false;
  }
  
  //Pikachu Button
  if (mouseX > 560 && mouseX < 645 && mouseY > 37 && mouseY < 122) {
    pikachuOn = !pikachuOn;
    winnieOn = false;
  }
  
  //New Button
  if (mouseX > 680 && mouseX < 740 && mouseY > 30 && mouseY < 55) {
    background(white);
  }
  
  //Load Button
  if (mouseX > 680 && mouseX < 740 && mouseY > 65 && mouseY < 90) {
    selectInput("Pick an image to load", "openImage");
  }
  
  //Save Button
  if (mouseX > 680 && mouseX < 740 && mouseY > 100 && mouseY < 125) {
    selectOutput("Choose a name for your image file", "saveImage");
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

//Stamp On and Off
void winnieOnOff() {
  if (winnieOn == true) {
    stroke(255,0,0);
    strokeWeight(5);
  } else {
    stroke(0);
    strokeWeight(1);
  }
}

void pikachuOnOff() {
  if (pikachuOn == true) {
    stroke(255,0,0);
    strokeWeight(3);
  } else {
    stroke(0);
    strokeWeight(1);
  }
}

//Loading Image
void openImage(File f) {
  if (f !=null) {
    int n = 0;
    while (n<10) {
      PImage pic = loadImage(f.getPath());
      image(pic, 0, 0);
      n = n + 1;
    }
  }
}

//Saving Image
  void saveImage(File f) {
  if (f != null) {
    PImage canvas = get(0, 150, 800, 450);
    canvas.save(f.getAbsolutePath());
  }
}
