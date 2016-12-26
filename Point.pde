class Point implements Comparable<Point>{
  
  private float x, y;
  private String label;
  public int col;
  
  
  public Point(float x, float y){
    this.x = x;
    this.y = y;
    label = generateLabel();
  }
  public Point(double x, double y){
    this((float)x,(float)y);
  }
  
  public float getX(){
    return x;
  }
  
  public float getY(){
    return y;
  }
  
  public String getLabel(){
    return label;
  }
  
  public void setXY(float newX, float newY){
    x = newX;
    y = newY;
  }
  
  public void setX(float newX){
    x = newX;
  }
  
  public void setY(float newY){
    y = newY;
  }
  
  public void render(){
    ellipse(getX(), getY(), 10, 10);
    text(label, getX()-20, getY()+5);
  }
  
  public float distSq(Point p){
    float distX = x - p.x;
    float distY = y - p.y;
    return distX*distX + distY*distY;
  }
  
  public float dist(Point p){
    return sqrt(distSq(p));
  }
  
  public boolean equals(Point p){
    if(p == null) return false;
    return x == p.x && y == p.y;
  }
  
  @Override
    public int compareTo(Point p) {
        if(x == p.x){
          return new Float(y).compareTo(p.x);
        }
        
        return new Float(x).compareTo(p.x);
    }
}