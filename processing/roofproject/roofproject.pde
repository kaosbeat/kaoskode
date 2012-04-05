import toxi.math.conversion.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh2d.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.math.noise.*;
import toxi.processing.*;
import controlP5.*;
import processing.opengl.*;
ToxiclibsSupport gfx;
TriangleMesh[] shapes=new TriangleMesh[600];
TriangleMesh mesh = new TriangleMesh();
Vec3D[] vectors;
ControlP5 controlP5;
ControlWindow controlWindow;
// vertices of construction

Vec3D a = new Vec3D(0,-1180,-346);
Vec3D b = new Vec3D(700,-1140,-415);
Vec3D c = new Vec3D(0,-678,0);
Vec3D d = new Vec3D(700,-898,-203);
Vec3D e = new Vec3D(0,-688,-893); 
Vec3D f = new Vec3D(700,-688,-893);
 //interpolated vectors
ZoomLensInterpolation zoomLens = new ZoomLensInterpolation();
float smoothStep=0.15;
 
 

int viewX = 0; 
float eyeX = 0;
float eyeY = 0;
float eyeZ = 0;
float centerX = 0;
float centerY = 0;
float centerZ = 0;

void interpolatePlane() {
  //Vec3D[] ab = new Vec3D(a.interpolateTo(b, -0.5));
  float ablen = a.distanceTo(b);
  zoomLens.setLensPos(ablen*random(0,1),smoothStep);
  zoomLens.setLensStrength((10 * 0.5f) / (50 * 0.5f),smoothStep);
  for (float x = 0; x < ablen; x++) {
    float t = x / ablen;
    float y = zoomLens.interpolate(0, ablen, t);
     if (0 == x % 10) {
      mesh.addFace(a,new Vec3D(a.interpolateTo(b,t)),c);
    }
    
  }

}


void setup() {
  size(1000,1000,OPENGL);
  smooth();
  textSize(9);
  gfx=new ToxiclibsSupport(this);
  frameWork();
  controller();

  interpolatePlane();
}

void frameWork() {

 mesh.addFace(a,b,d );
 fill(25,60,80);
 mesh.addFace(a,c,d );
 mesh.addFace(a,b,e );
 mesh.addFace(f,b,e );
 fill(255,5,90);
 mesh.setName("abcd");
}


void controller() {
  controlP5 = new ControlP5(this);
  controlWindow = controlP5.addControlWindow("controlP5window",100,100,400,200);
  controlP5.addButton("Mode", 0,100,120,80,19).setWindow(controlWindow);
  controlP5.addButton("Export", 0,100,140,80,19).setWindow(controlWindow);
  controlP5.addSlider("eyeX",-500,500,10,10,10,80,19).setWindow(controlWindow);
  controlP5.addSlider("eyeY",-500,500,30,10,30,80,19).setWindow(controlWindow);
  controlP5.addSlider("eyeZ",-500,500,50,10,50,80,19).setWindow(controlWindow);
  controlP5.addSlider("centerX",-500,500,10,140,10,80,19).setWindow(controlWindow);
  controlP5.addSlider("centerY",-500,500,30,140,30,80,19).setWindow(controlWindow);
  controlP5.addSlider("centerZ",-500,500,50,140,50,80,19).setWindow(controlWindow);
}


void draw() {
  background(255);
  lights();
  camera(eyeX, eyeY, eyeZ , centerX, centerY, centerZ,0.0,1.0,0.0);
  //camera(350+mouseX,500+mouseY,200,500,-500,-500,0.0,1.0,0.0);
  translate(width / 10, height / 10, 0);
  //rotateX(viewX * 0.01f);
  //rotateY(mouseX * 0.01f);
  fill(255);

  gfx.mesh(mesh);

}


void beam(Vec3D a) {
  
}

void keyPressed() {
  if (key=='+') {
    println("pluspressed");
    viewX++;
  }
  if (key=='-') {
    println("minuspressed");
    int[] faces = mesh.getFacesAsArray();
    mesh.translate(new Vec3D(-20,-20,-20));
   // mesh.setName("blaah");
    println(mesh.getMeshAsVertexArray());
    println(a.interpolateTo(b, 2.5));
    //mesh = new Vec3D(20,20,20);
  }
}
