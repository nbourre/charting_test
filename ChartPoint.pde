class ChartPoint {
  float x, y;
  color c;
  String label;
  float size;
  
  
  public ChartPoint(float x, float y) {
    this.x = x;
    this.y = y;
    
    size = 3;
    c = color (127, 0, 0);
  }
  
  void display() {
    pushMatrix();
    translate (x, y);
    noStroke();
    fill (c);
    ellipse (0, 0, size, size);
    popMatrix();
  }
}