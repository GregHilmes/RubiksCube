class CubePieceFace {
  
    private PVector orientation;
  
    public CubePieceFace(PVector orientationIn) {
        orientation = orientationIn;
    }
    public void show() {
      pushMatrix();
      
      if (orientation == PX) {
        fill(BLUE);
      }
      else if (orientation == PY) {
        fill(WHITE);
      }
      else if (orientation == PZ) {
         fill(RED);
      }
      else if (orientation == NX) {
        fill(GREEN);
      }
      else if (orientation == NY) {
        fill(YELLOW);
      }
      else if (orientation == NZ) {
        fill(ORANGE); 
      }
      stroke(0);
      
      translate(orientation.x*R, orientation.y*R, orientation.z*R);
      if (orientation == PY || orientation == NY) {
        rotateX(HALF_PI);
      }
      else if (orientation == PX || orientation == NX){
        rotateY(HALF_PI);
      }
      rectMode(CENTER);
      rect(0, 0, R*2, R*2);
      
      popMatrix();
    }
}