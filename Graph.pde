class Graph{
  int posX, posY, sizeX, sizeY, borderWeight;
  ArrayList<Series> series;
  
 Graph(int posX, int posY, int sizeX, int sizeY, int borderWeight){
   this.posX = posX;
   this.posY = posY;
   this.sizeX = sizeX;
   this.sizeY = sizeY;
   this.borderWeight = borderWeight;
   series = new ArrayList<Series>();
 }
 
 void pushSeries(Series s){
   series.add(s);
 }
 
 void display(){
   rectMode(CORNER);
   fill(255);
   stroke(0);
   strokeWeight(borderWeight);
   rect(posX, posY, sizeX, sizeY);
   for (int i = 0; i < series.size(); i++){
     series.get(i).display();
   }
 }
  
  
}