class Series {
  ArrayList <ChartPoint> points;
  
  Series () {
    points = new ArrayList<ChartPoint>();
  }
  
  void pushPoint (ChartPoint p) {
    points.add(p);
  }
  
  void display() {
    ChartPoint p1, p2;
    
    for (int i = 1; i < points.size(); i++){
      p1 = points.get(i - 1);
      p2 = points.get(i);
      
      pushMatrix();
      translate (p1.x, p1.y);
      stroke (color(0));
      line (0, 0, p2.x - p1.x, p2.y - p1.y);
      popMatrix();
      
      p1.display();
    }
    
    points.get(points.size() - 1).display();
    
  }
}