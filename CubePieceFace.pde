class CubePieceFace {

    private PVector orientation;
    public PVector center;
    public PVector[] corners = new PVector[4];

    public CubePieceFace(PVector orientationIn, PVector centerIn) {
        orientation = orientationIn;
        center = centerIn;

        if (orientation == PZ) {
            corners[0] = new PVector(-R, -R, R);
            corners[1] = new PVector(R, -R, R);
            corners[2] = new PVector(R, R, R);
            corners[3] = new PVector(-R, R, R);
        } else if (orientation == NZ) {
            corners[0] = new PVector(-R, -R, -R);
            corners[1] = new PVector(R, -R, -R);
            corners[2] = new PVector(R, R, -R);
            corners[3] = new PVector(-R, R, -R);
        } else if (orientation == PX) {
            corners[0] = new PVector(R, -R, R);
            corners[1] = new PVector(R, -R, -R);
            corners[2] = new PVector(R, R, -R);
            corners[3] = new PVector(R, R, R);
        } else if (orientation == NX) {
            corners[0] = new PVector(-R, -R, R);
            corners[1] = new PVector(-R, -R, -R);
            corners[2] = new PVector(-R, R, -R);
            corners[3] = new PVector(-R, R, R);
        } else if (orientation == PY) {
            corners[0] = new PVector(-R, R, -R);
            corners[1] = new PVector(R, R, -R);
            corners[2] = new PVector(R, R, R);
            corners[3] = new PVector(-R, R, R);
        } else if (orientation == NY) {
            corners[0] = new PVector(-R, -R, -R);
            corners[1] = new PVector(R, -R, -R);
            corners[2] = new PVector(R, -R, R);
            corners[3] = new PVector(-R, -R, R);
        }
    }
    public void show() {
        pushMatrix();

        if (orientation == PX) {
            fill(BLUE);
        } else if (orientation == PY) {
            fill(WHITE);
        } else if (orientation == PZ) {
            fill(RED);
        } else if (orientation == NX) {
            fill(GREEN);
        } else if (orientation == NY) {
            fill(YELLOW);
        } else if (orientation == NZ) {
            fill(ORANGE);
        }
        stroke(0);
        strokeWeight(5);

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