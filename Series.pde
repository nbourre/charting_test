class Series {
  ArrayList <ChartPoint> points;
  color c;
  
  float minX, maxX;
  float minY, maxY;
  
  float scaleX, scaleY;
  Rectangle limits;
  
  Series (color c) {
    this.c = c;
    points = new ArrayList<ChartPoint>();
    initMinMax();
  }
  
  void initMinMax() {
    minX = maxX = minY = maxY = 0;
    scaleX = scaleY = 1.0;
  }
  
  void pushPoint (ChartPoint p) {
    points.add(p);
    
    // Sert à aller chercher les extrêmes de la série
    // pour pouvoir l'afficher
    if (points.size() == 1) {
      minX = maxX = points.get(0).x;
      minY = maxY = points.get(0).y;
    } else {
      Boolean isDirty = false;
      if (p.x < minX) {
        minX = p.x;
        isDirty = true;
      }
      
      if (p.x > maxX) {
        maxX = p.x;
        isDirty = true;
      }
      
      if (p.y < minY) {
        minY = p.y;
        isDirty = true;
      }
      
      if (p.y > maxY) {
        maxY = p.y;
        isDirty = true;
      }
      
      if (isDirty) {
        updateScales();
      }
    } 
  }
  
  // Permet de régler le rectangle d'affichage
  void setDisplayLimits(Rectangle limits){
    this.limits = limits;
    
    updateScales();
  }
  
  // Permet de mettre à jour l'échelle d'affichage
  void updateScales() {
    float dX = maxX - minX;
    float dY = maxY - minY;
    
    scaleX = dX != 0 ? limits.w / dX : scaleX;
    scaleY = dY != 0 ? limits.h / dY : scaleY;
  }  
  
  void display() {
    ChartPoint p1, p2;
    
    if (limits != null) {
      for (int i = 1; i < points.size(); i++){
        p1 = points.get(i - 1);
        p2 = points.get(i);
        
        if (scaleX != 1 || scaleY != 1) {
          p1.setScales(scaleX, scaleY);
        }
        
        pushMatrix();
        
        translate (p1.x * scaleX, p1.y * scaleY);
        strokeWeight(1);
        stroke(c);
        line (0, 0, (p2.x - p1.x) * scaleX, (p2.y - p1.y) * scaleY);
        
        popMatrix();
        
        p1.display();
      }
      
      if (scaleX != 1 || scaleY != 1) {
        points.get(points.size() - 1).setScales(scaleX, scaleY);
      }    
      points.get(points.size() - 1).display();
    }
    
  }
  
  
}