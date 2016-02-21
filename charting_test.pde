Series s;
Graph g;
void setup () {
  size (640, 480);
  
  s = new Series(color(255,0,0));
  for (int i = 0; i < width; i += 10) {
    s.pushPoint(new ChartPoint(i, random (0, height), color(0) ));
  }
  g = new Graph(50, 50, width-100, height-100, 10);
  g.pushSeries(s);
}

void draw () {
  update();
  display();
}

void update() {
}

void display () {
  g.display();
}