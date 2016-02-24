Series serie_rouge;
Series serie_bleue;
Graph g;


void setup () {
  size (640, 480);
  
  int graph_width = width - 100;
  int graph_height = height - 100;
    
  g = new Graph( new Rectangle (50, 50, graph_width, graph_height));
  
  serie_rouge = new Series(color(255,0,0));
  serie_bleue = new Series(color(0, 0, 127));

  serie_rouge.setDisplayLimits(g.getLimits());  
  serie_bleue.setDisplayLimits(g.getLimits());
  
  for (int i = 0; i < graph_width; i += 10) {
    serie_rouge.pushPoint(new ChartPoint(i, random (0, graph_height), color(0) ));
    serie_bleue.pushPoint(new ChartPoint(i, random (0, graph_height), color(0) ));
  }
  
  g.pushSeries(serie_rouge);
  g.pushSeries(serie_bleue);
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