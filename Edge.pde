class Edge implements Comparable<Edge>{
  
  private Point a, b;
  
  private float len;
  
  public Edge(Point a, Point b){
    this.a = a;
    this.b = b;
    update();
  }
  
  public void setPointA(Point aa){
    a = aa;
    update();
  }
  
  public void setPointB(Point bb){
    b = bb;
    update();
  }
  
  public Point getPointA(){
    return a;
  }
  
  public Point getPointB(){
    return b;
  }
  
  public float length(){
    return len;
  }
  
  public void update(){
    len = sqrt((a.getX() - b.getX())*(a.getX() - b.getX()) + (a.getY() - b.getY())*(a.getY() - b.getY()));
  }
  
   @Override
    public int compareTo(Edge e) {
      return new Float(len).compareTo(e.len);
    }
    
  public void render(){
    line(a.getX(), a.getY(), b.getX(), b.getY());
    ellipse(a.getX(), a.getY(), 5, 5);
    ellipse(b.getX(), b.getY(), 5, 5);
  }
  
  public boolean has(Point p){
    return a.equals(p) || b.equals(p);
  }
  
  public String toString(){
    return a.getLabel() + " " + b.getLabel() + ": " + len;
  }
}