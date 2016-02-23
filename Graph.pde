class Graph{
  int w, h, borderWeight;
  
  PVector position;
    
  ArrayList<Series> series;
  
  public Graph() {
    this.position = new PVector();
  }
  
 Graph(int x, int y, int sizeX, int sizeY, int borderWeight){
   
   this.w = sizeX;
   this.h = sizeY;
   this.borderWeight = borderWeight;
   series = new ArrayList<Series>();
   
   this.position = new PVector(x, y);
 }
 
 void pushSeries(Series s){
   series.add(s);
 }
 
 void display(){
   pushMatrix();
   rectMode(CORNER);
   translate(position.x, position.y);
   
   fill(255);
   stroke(0);
   strokeWeight(borderWeight);
   
   rect(0, 0, w, h);
   
   for (int i = 0; i < series.size(); i++){
     series.get(i).display();
   }
   
   popMatrix();
 }
  
  
}