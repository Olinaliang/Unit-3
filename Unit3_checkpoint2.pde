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
  tactile(600,700,50,150);
  fill(lightPink);
  rect(600,50,100,100);
  
  tactile(600,700,250,350);
  fill(mediumPink);
  rect(600,250,100,100);
  
  tactile(600,700,450,550);
  fill(darkPink);
  rect(600,450,100,100);
  
  //indicator
  stroke(veryDarkPink);
  fill(selectedColor);
  rect(100,100,400,400);
}

void tactile (int x,int y,int r, int a) {
  if (mouseX>x && mouseX<y && mouseY>r && mouseY<a) {
    stroke(white);
  } else {
    stroke(veryDarkPink);
  } 
}

void mouseReleased() {
  if(mouseX>600 && mouseX<700 && mouseY>50 && mouseY<150){
    selectedColor=lightPink;
  }
  if(mouseX>600 && mouseX<700 && mouseY>250 && mouseY<350){
    selectedColor=mediumPink;
  }
  if(mouseX>600 && mouseX<700 && mouseY>450 && mouseY<550){
    selectedColor=darkPink;
  }
}
