class Series {
  ArrayList <ChartPoint> points;
  color c;
  
  float minX, maxX;
  float minY, maxY;
  
  Series (color c) {
    this.c = c;
    points = new ArrayList<ChartPoint>();
    initMinMax();
  }
  
  void initMinMax() {
    minX = maxX = minY = maxY = 0;
  }
  
  void pushPoint (ChartPoint p) {
    points.add(p);
    
    // Sert à aller chercher les extrêmes de la série
    // pour pouvoir l'afficher
    if (points.size() == 1) {
      minX = maxX = points.get(0).x;
      minY = maxY = points.get(0).y;
    } else {
      if (p.x < minX) minX = p.x;
      if (p.x > maxX) maxX = p.x;
      if (p.y < minY) minY = p.y;
      if (p.y > maxY) maxY = p.y;
    }   
    
  }
  
  void display() {
    ChartPoint p1, p2;
    
    for (int i = 1; i < points.size(); i++){
      p1 = points.get(i - 1);
      p2 = points.get(i);
      
      pushMatrix();
      
      translate (p1.x, p1.y);
      strokeWeight(1);
      stroke(c);
      line (0, 0, p2.x - p1.x, p2.y - p1.y);
      
      popMatrix();
      
      p1.display();
    }
    
    points.get(points.size() - 1).display();
    
  }
  
  
}