class CubePiece {
    private PVector center;
    private ArrayList<CubePieceFace> sides = new ArrayList();


    public CubePiece(PVector centerIn) {
        center = centerIn;

        for (PVector a : AXES) {
            CubePieceFace face = new CubePieceFace(a, new PVector(a.x, a.y, a.z));
            sides.add(face);
        }
    }
    public void show() {
        pushMatrix();
        translate(center.x, center.y, center.z);

        for (CubePieceFace face : sides) {
            face.show();
        }
        popMatrix();
    }
    public void turnFaces(PVector axis, float angle) {
        PVector corner;
        PVector cornerCopy;

        for (CubePieceFace side : sides) {
            for (int i = 0; i < side.corners.length; i++) {
                corner = side.corners[i];

                cornerCopy = corner.copy();

                if (axis == PX) {
                    corner.y = cornerCopy.y*cos(angle) - cornerCopy.z*sin(angle);
                    corner.z = cornerCopy.y*sin(angle) + cornerCopy.z*cos(angle);
                } else if (axis == NX) {
                    corner.y = cornerCopy.y*cos(angle) + cornerCopy.z*sin(angle);
                    corner.z = -cornerCopy.y*sin(angle) + cornerCopy.z*cos(angle);
                } else if (axis == PY) {
                    corner.z = cornerCopy.z*cos(angle) - cornerCopy.x*sin(angle);
                    corner.x = cornerCopy.z*sin(angle) + cornerCopy.x*cos(angle);
                } else if (axis == NY) {
                    corner.z = cornerCopy.z*cos(angle) + cornerCopy.x*sin(angle);
                    corner.x = -cornerCopy.z*sin(angle) + cornerCopy.x*cos(angle);
                } else if (axis == PZ) {
                    corner.x = cornerCopy.x*cos(angle) - cornerCopy.y*sin(angle);
                    corner.y = cornerCopy.x*sin(angle) + cornerCopy.y*cos(angle);
                } else if (axis == NZ) {
                    corner.x = cornerCopy.x*cos(angle) + cornerCopy.y*sin(angle);
                    corner.y = -cornerCopy.x*sin(angle) + cornerCopy.y*cos(angle);
                }
            }
        }
    }
}