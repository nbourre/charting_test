class Graph{
  int w, h, borderWeight;
  Rectangle limits;
  
  ArrayList<Series> series;
  
  color bgColor = color(255);
  
  public Graph() {
   limits = new Rectangle (0, 0, width, height);
   this.borderWeight = 1;
   series = new ArrayList<Series>();
  }
  
  public Graph (Rectangle limits) {
    this.limits = limits;
    this.borderWeight = 1;
    series = new ArrayList<Series>();
  }
  
  
 Graph(int x, int y, int sizeX, int sizeY, int borderWeight){
   
   this.borderWeight = borderWeight;
      
   limits = new Rectangle (x, y, sizeX, sizeY);
   
   series = new ArrayList<Series>();
   
 }
  
 Rectangle getLimits() {
   return limits;
 }
 
 void setBGColor(color c) {
   bgColor = c;
 }
 
 void pushSeries(Series s){
   
   if (s.limits == null) {
     s.limits = limits;
   }
   series.add(s);
 }
 
 public void updateLimits (float x, float y, float w, float h) {
   limits.x = x;
   limits.y = y;
   limits.w = w;
   limits.h = h;
   for(int i = 0; i < series.size(); i++){
     series.get(i).setDisplayLimits(limits);
   }
 }
 
 void display(){
   pushMatrix();
   rectMode(CORNER);
   translate(limits.x, limits.y);
   
   fill(bgColor);
   stroke(0);
   strokeWeight(borderWeight);
   
   rect(0, 0, limits.w, limits.h);
   
   for (int i = 0; i < series.size(); i++){
     series.get(i).display();
   }
   
   popMatrix();
 }
  
  
}