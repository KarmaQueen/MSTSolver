import java.util.Collections;

private static final double FLOATING_POINT_EPSILON = 1E-12;

ArrayList<Point> points;
ArrayList<Edge> edges;
ArrayList<Edge> alledges;

int num = 20;
float padding = 100;



void setup(){
  size(1600, 1600);
  smooth();
  
  points = new ArrayList<Point>();  
  
  stroke(255);
  textAlign(CENTER);
  
  setupDots();
}

void draw(){
  background(0);
  
  for(Edge e : edges)
    e.render();
  for(Point p : points){
    p.render();
  }
}

void setupDots(){
  points.clear();
  for(int i = 0; i < num; i++){
    points.add(new Point(
      Math.random()*(width-2*padding)+padding,
      Math.random()*(height-2*padding)+padding));
  }
  
  alledges = new ArrayList<Edge>();
  edges = new ArrayList<Edge>();
  
  for(int i = 0; i < num; i++){
    for(int j = i+1; j < num; j++){
      alledges.add(new Edge(points.get(i), points.get(j)));
    }
  }
  currentLabel = 'A';
}

boolean isConnected(Point a, Point b){
  ArrayList<Point> pts = new ArrayList<Point>();
  pts.add(a);
  for(int i = 0; i < pts.size(); i++){
    Point c = pts.get(i);
    for(Edge e : edges){
      if(e.has(c)){
        if(!pts.contains(e.getPointA())) pts.add(e.getPointA());
        if(!pts.contains(e.getPointB())) pts.add(e.getPointB());
      }
    }
  }
  return pts.contains(b);
}

void kruskalMST(){
  Collections.sort(alledges);
  for(Edge e : alledges){
    System.out.print(e);       
    if(!isConnected(e.getPointA(), e.getPointB())){
      edges.add(e);
      System.out.print(" added\n");
    } else System.out.print("\n");
  }
}

int count = 1;
void activate(){
  switch(count){
  case 0: 
    setupDots();
    count++;
    return;
  case 1:
    kruskalMST();
    count = 0;
    return;
  }
    
}

  char currentLabel = 'A';
  String generateLabel(){
    return ""+currentLabel++;
  }

void keyPressed(){ activate(); }
void mousePressed(){ activate(); }