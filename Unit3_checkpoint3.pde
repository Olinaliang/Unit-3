color pink = #F21D41;

float sliderY;
float shade;

void setup() {
  size(800,600);
  strokeWeight(5);
  stroke(pink);
  fill(pink);
  sliderY = 300;
}

void draw() {
  background(0);

  shade = map(sliderY, 100, 500, 50, 300);

  line(700,100,700,500);
  circle(700,sliderY,50);

  circle(300,300,shade);
}

void mouseDragged() {
  controlSlider();
}

void mouseReleased() {
  controlSlider();
}

void controlSlider() {
  if (mouseX > 675 && mouseX < 725 && mouseY > 100 && mouseY < 500) {
    sliderY = mouseY;
  }
}
