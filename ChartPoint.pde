class ChartPoint {
  float x, y;
  color c;
  String label;
  float size;
  
  
  public ChartPoint(float x, float y, color c) {
    this.x = x;
    this.y = y;
    
    size = 1;
    this.c = c;
  }
  
  void display() {
    pushMatrix();
    translate (x, y);
    fill (c);
    stroke(0);
    ellipse (0, 0, size, size);
    popMatrix();
  }
}