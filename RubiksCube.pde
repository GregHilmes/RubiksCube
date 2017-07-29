import peasy.*;
//import peasy.org.apache.commons.math.*;
//import peasy.org.apache.commons.math.geometry.*;


PeasyCam CAM;

float R = 50;

// The center of our sketch.
PVector C = new PVector(0, 0, 0);

// Define the axes.
PVector PX = new PVector(1, 0, 0);
PVector PY = new PVector(0, 1, 0);
PVector PZ = new PVector(0, 0, 1);
PVector NX = new PVector(-1, -0, -0);
PVector NY = new PVector(0, -1, 0);
PVector NZ = new PVector(0, 0, -1);
PVector[] AXES = {PX, PY, PZ, NX, NY, NZ};

// Define the colors.
int RED = 0xffff3333;
int BLUE = 0xff3333ff;
int WHITE = 0xffffffff;
int GREEN = 0xff33ff33;
int YELLOW = 0xffffff33;
int ORANGE = 0xffff7f33;
int BLACK = 0xff000000;

Cube cube;

void setup() {
    // Processing setup.
    size(600, 600, P3D);
    strokeWeight(5);
    stroke(0);

    // Camera setup.
    CAM = new PeasyCam(this, 600);
    CAM.setResetOnDoubleClick(false);
    CAM.setMinimumDistance((3 * R) * sqrt(3) + 200);

    cube = new Cube();
}

void draw() {
    background(51);

    cube.update();  
    cube.show();
}

void keyPressed() {
    switch (key) {
    case '`': 
        cube = new Cube();
        break;
    case 'R': 
        cube.turn(PX, -1);
        break;
    case 'L': 
        cube.turn(NX, -1);
        break;
    case 'U': 
        cube.turn(NY, -1);
        break;
    case 'D': 
        cube.turn(PY, -1);
        break;
    case 'F': 
        cube.turn(PZ, -1);
        break;
    case 'B': 
        cube.turn(NZ, -1);
        break;
    case 'r': 
        cube.turn(PX, 1);
        break;
    case 'l': 
        cube.turn(NX, 1);
        break;
    case 'u': 
        cube.turn(NY, 1);
        break;
    case 'd': 
        cube.turn(PY, 1);
        break;
    case 'f': 
        cube.turn(PZ, 1);
        break;
    case 'b': 
        cube.turn(NZ, 1);
        break;
    default: 
        break;
    }
}