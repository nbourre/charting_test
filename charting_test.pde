Series s;
ChartPoint p;

void setup () {
  s = new Series();
  size (640, 480);
  
  for (int i = 0; i < width; i += 5) {
    s.pushPoint(new ChartPoint(i, random (0, height)));
  }
}

void draw () {
  update();
  display();
}

void update() {
}

void display () {
  s.display();
}