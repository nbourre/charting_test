class Graph{
  int w, h, borderWeight;
  Rectangle limits;
  

    
  ArrayList<Series> series;
  
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
 
 void pushSeries(Series s){
   
   if (s.limits == null) {
     s.limits = limits;
   }
   series.add(s);
 }
 
 void display(){
   pushMatrix();
   rectMode(CORNER);
   translate(limits.x, limits.y);
   
   fill(255);
   stroke(0);
   strokeWeight(borderWeight);
   
   rect(0, 0, limits.w, limits.h);
   
   for (int i = 0; i < series.size(); i++){
     series.get(i).display();
   }
   
   popMatrix();
 }
  
  
}