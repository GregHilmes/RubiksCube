class CubePieceFace {
  
    private PVector orientation;
    public PVector center;
    public PVector[] corners = new PVector[4];
  
    public CubePieceFace(PVector orientationIn, PVector centerIn) {
        orientation = orientationIn;
        center = centerIn;
    
        if (orientation == PZ) {
            corners[0] = center.copy().add(-R, -R, R);
            corners[1] = center.copy().add(R, -R, R);
            corners[2] = center.copy().add(R, R, R);
            corners[3] = center.copy().add(-R, R, R);
        }
        else if (orientation == NZ) {
            corners[0] = center.copy().add(-R, -R, -R);
            corners[1] = center.copy().add(R, -R, -R);
            corners[2] = center.copy().add(R, R, -R);
            corners[3] = center.copy().add(-R, R, -R);
        }
        else if (orientation == PX) {
            corners[0] = center.copy().add(R, -R, R);
            corners[1] = center.copy().add(R, -R, -R);
            corners[2] = center.copy().add(R, R, -R);
            corners[3] = center.copy().add(R, R, R);
        }
        else if (orientation == NX) {
            corners[0] = center.copy().add(-R, -R, R);
            corners[1] = center.copy().add(-R, -R, -R);
            corners[2] = center.copy().add(-R, R, -R);
            corners[3] = center.copy().add(-R, R, R);
        }
        else if (orientation == PY) {
            corners[0] = center.copy().add(-R, R, -R);
            corners[1] = center.copy().add(R, R, -R);
            corners[2] = center.copy().add(R, R, R);
            corners[3] = center.copy().add(-R, R, R);
        }
        else if (orientation == NY) {
            corners[0] = center.copy().add(-R, -R, -R);
            corners[1] = center.copy().add(R, -R, -R);
            corners[2] = center.copy().add(R, -R, R);
            corners[3] = center.copy().add(-R, -R, R);
        }
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
      
      translate(center.x, center.y, center.z);

      beginShape();
      PVector v;
      for (int i = 0; i < corners.length; i++) {
          v = corners[i];
          vertex(v.x, v.y, v.z);
      }
      endShape(CLOSE);
      
      popMatrix();
    }
}