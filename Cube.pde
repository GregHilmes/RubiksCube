class Cube {

    CubePiece[][][] pieces = new CubePiece[3][3][3];
    private boolean rotating;
    private final float step = PI/64;
    private float currentRotation;
    private PVector currentFace;
    private float currentStep;

    public Cube() {
        for (int i = -1; i < 2; i++) {
            for (int j = -1; j < 2; j++) {
                for (int k = -1; k < 2; k++) {
                    CubePiece piece = new CubePiece(new PVector(i*2*R, j*2*R, k*2*R));
                    pieces[i+1][j+1][k+1] = piece;
                }
            }
        }
    }
    public void show() {
        for (int i = 0; i < pieces.length; i++) {
            for (int j = 0; j < pieces[i].length; j++) {
                for (int k = 0; k < pieces[i][j].length; k++) {
                    pieces[i][j][k].show();
                }
            }
        }
    }
    public void update() {
        if (rotating) {
            turnCubes(currentFace, currentStep);

            if (currentRotation >= HALF_PI || currentRotation <= -HALF_PI) {
                rotating = false;
                currentFace = null;
                currentRotation = 0;
            }
        }
    }
    public void turn(PVector axis, int direction) {
        if (!rotating) {
            currentRotation = 0;
            currentFace = axis;
            currentStep = step * direction;
            rotating = true;
        }
    }

    private void turnCubes(PVector axis, float angle) {
        CubePiece cube;
        PVector centerCopy;

        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                for (int k = 0; k < 3; k++) {
                    cube = pieces[i][j][k];
                    centerCopy = cube.center.copy();

                    if (axis == PX && round(cube.center.x) == axis.x * R * 2) {
                        cube.center.y = centerCopy.y*cos(angle) - centerCopy.z*sin(angle);
                        cube.center.z = centerCopy.y*sin(angle) + centerCopy.z*cos(angle);

                        cube.turnFaces(axis, angle);
                    } else if (axis == PY && round(cube.center.y) == PY.y * R * 2) {

                        cube.center.z = centerCopy.z*cos(angle) - centerCopy.x*sin(angle);
                        cube.center.x = centerCopy.z*sin(angle) + centerCopy.x*cos(angle);

                        cube.turnFaces(axis, angle);
                    } else if (axis == PZ && round(cube.center.z) == PZ.z * R * 2) {

                        cube.center.x = centerCopy.x*cos(angle) - centerCopy.y*sin(angle);
                        cube.center.y = centerCopy.x*sin(angle) + centerCopy.y*cos(angle);

                        cube.turnFaces(axis, angle);
                    } else if (axis == NX && round(cube.center.x) == NX.x * 2 * R) {

                        cube.center.y = centerCopy.y*cos(angle) + centerCopy.z*sin(angle);
                        cube.center.z = -centerCopy.y*sin(angle) + centerCopy.z*cos(angle);

                        cube.turnFaces(axis, angle);
                    } else if (axis == NY && round(cube.center.y) == NY.y * R * 2) {                      

                        cube.center.z = centerCopy.z*cos(angle) + centerCopy.x*sin(angle);
                        cube.center.x = -centerCopy.z*sin(angle) + centerCopy.x*cos(angle);

                        cube.turnFaces(axis, angle);
                    } else if (axis == NZ && round(cube.center.z) == NZ.z * R * 2) {

                        cube.center.x = centerCopy.x*cos(angle) + centerCopy.y*sin(angle);
                        cube.center.y = -centerCopy.x*sin(angle) + centerCopy.y*cos(angle);

                        cube.turnFaces(axis, angle);
                    }
                }
            }
        }
        currentRotation += angle;
    }
}