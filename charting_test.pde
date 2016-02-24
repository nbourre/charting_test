Series serie_rouge;
Series serie_bleue;
Series serie_jaune;

Graph g;
Graph gBD; // Bas-Droit

PVector currentSize;
PVector previousSize;


void setup () {
  size (640, 480);
  
  currentSize = new PVector (width, height);
  previousSize = currentSize.copy();
  
  surface.setResizable(true);
    
  int graph_width = width - 100;
  int graph_height = height - 100;
    
  g = new Graph( new Rectangle (0, 0, width / 2, height / 2));
  gBD = new Graph (new Rectangle (width / 2, height / 2, width / 2, height / 2));
  
  gBD.setBGColor(color(75));
  
  serie_rouge = new Series(color(255,0,0));
  serie_bleue = new Series(color(0, 0, 127));
  
  serie_jaune = new Series(color(255, 255, 0));

  serie_rouge.setDisplayLimits(g.getLimits());  
  serie_bleue.setDisplayLimits(g.getLimits());
  serie_jaune.setDisplayLimits(gBD.getLimits());
  
  for (int i = 0; i < graph_width; i += 10) {
    serie_rouge.pushPoint(new ChartPoint(i, random (0, graph_height), color(0) ));
    serie_bleue.pushPoint(new ChartPoint(i, random (0, graph_height), color(0) ));
    
    serie_jaune.pushPoint(new ChartPoint(i, random (0, graph_height), color(0) ));
  }
  
  g.pushSeries(serie_rouge);
  g.pushSeries(serie_bleue);
  
  gBD.pushSeries(serie_jaune);
}

void draw () {
  update();
  display();
}

void update() {
  currentSize.set(width, height);
  
  if (currentSize.x != previousSize.x || currentSize.y != previousSize.y) {
    //g.updateLimits(,,,);
  }
  previousSize.set(currentSize.x, currentSize.y);
}

void display () {
  g.display();
  gBD.display();
}