class ChartPoint {
  float x, y;
  color c;
  String label;
  float size;
  
  float scaleX = 1;
  float scaleY = 1;
  
  public ChartPoint(float x, float y, color c) {
    this.x = x;
    this.y = y;
    
    size = 1;
    this.c = c;
  }
  
  public void setScales (float scaleX, float scaleY) {
    this.scaleX = scaleX;
    this.scaleY = scaleY;
  }
  
  void display() {
    pushMatrix();
    translate (x * scaleX, y * scaleY);
    fill (c);
    stroke(0);
    ellipse (0, 0, size, size);
    popMatrix();
  }
}