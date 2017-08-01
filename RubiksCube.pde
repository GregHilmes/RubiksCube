import peasy.*;
//import peasy.org.apache.commons.math.*;
//import peasy.org.apache.commons.math.geometry.*;


PeasyCam CAM;

PeasyCam BUFFERCAM;
PGraphics buffer;

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

    surface.setTitle("Rubik's Cube Simulator");

    // Camera setup.
    CAM = new PeasyCam(this, 600);
    CAM.setResetOnDoubleClick(false);
    CAM.setMinimumDistance((3 * R) * sqrt(3) + 200);

    buffer = createGraphics(width, height, P3D);
    BUFFERCAM = new PeasyCam(this, buffer, 600);
    BUFFERCAM.setResetOnDoubleClick(false);
    BUFFERCAM.setMinimumDistance((3 * R) * sqrt(3) + 200);

    cube = new Cube();
}

void draw() {
    background(51);

    cube.update();  
    cube.show();

    updateBuffer();
}

void mousePressed() {

    buffer.loadPixels();
    int c = buffer.pixels[mouseY*width+mouseX];

    PVector axis = null;
    int direction;

    if (c == BLUE) 
        axis = PX;
    else if (c == WHITE)
        axis = PY;
    else if (c == RED)
        axis = PZ;
    else if (c == GREEN)
        axis = NX;
    else if (c == YELLOW)
        axis = NY;
    else if (c == ORANGE)
        axis = NZ;

    if (axis != null) {

        if (mouseButton == RIGHT) {
            direction = -1;
        } else {
            direction = 1;
        }

        cube.turn(axis, direction);
    }
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
void updateBuffer() {
    buffer.beginDraw();
    buffer.noStroke();
    buffer.background(51);
    for (PVector orientation : AXES) {
        buffer.beginShape();
        if (orientation == PX) {
            buffer.fill(BLUE);
            buffer.vertex(3*R, -3*R, 3*R);
            buffer.vertex(3*R, -3*R, -3*R);
            buffer.vertex(3*R, 3*R, -3*R);
            buffer.vertex(3*R, 3*R, 3*R);
        } else if (orientation == PY) {
            buffer.fill(WHITE);
            buffer.vertex(-3*R, 3*R, -3*R);
            buffer.vertex(3*R, 3*R, -3*R);
            buffer.vertex(3*R, 3*R, 3*R);
            buffer.vertex(-3*R, 3*R, 3*R);
        } else if (orientation == PZ) {
            buffer.fill(RED);
            buffer.vertex(-3*R, -3*R, 3*R);
            buffer.vertex(3*R, -3*R, 3*R);
            buffer.vertex(3*R, 3*R, 3*R);
            buffer.vertex(-3*R, 3*R, 3*R);
        } else if (orientation == NX) {
            buffer.fill(GREEN);
            buffer.vertex(-3*R, -3*R, 3*R);
            buffer.vertex(-3*R, -3*R, -3*R);
            buffer.vertex(-3*R, 3*R, -3*R);
            buffer.vertex(-3*R, 3*R, 3*R);
        } else if (orientation == NY) {
            buffer.fill(YELLOW);
            buffer.vertex(-3*R, -3*R, -3*R);
            buffer.vertex(3*R, -3*R, -3*R);
            buffer.vertex(3*R, -3*R, 3*R);
            buffer.vertex(-3*R, -3*R, 3*R);
        } else if (orientation == NZ) {
            buffer.fill(ORANGE);
            buffer.vertex(-3*R, -3*R, -3*R);
            buffer.vertex(3*R, -3*R, -3*R);
            buffer.vertex(3*R, 3*R, -3*R);
            buffer.vertex(-3*R, 3*R, -3*R);
        }
        buffer.endShape();
    }

    buffer.endDraw();
}