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
float eyeX = 500;
float eyeY = 500;
float eyeZ = 312;
float centerX = 25;
float centerY = -460;
float centerZ = -275;

void interpolatePlane(int divisions) {
  //Vec3D[] ab = new Vec3D(a.interpolateTo(b, -0.5));
  float ablen = a.distanceTo(b);
  println(ablen);
  zoomLens.setLensPos(200,smoothStep);
  zoomLens.setLensStrength((10 * 0.5f) / (50 * 0.5f),smoothStep);
  for (float x = 0; x < ablen; x++) {
    float t = x / ablen;
    float y = zoomLens.interpolate(0, ablen, t);
    Vec3D iii = new Vec3D(a.interpolateTo(b,t));
     if (0 == x % 100) {
      //mesh.addFace(a,iii,e);
      stroke(2,0,120);
     
      Vec3D beam_size = new Vec3D(5,17,a.distanceTo(iii));
      TriangleMesh beam=(TriangleMesh)new AABB(new Vec3D(), beam_size).toMesh();
      // align the Z axis of the box with the direction vector
      beam.pointTowards(e);
      // move the box to the correct position
      beam.transform(new Matrix4x4().translateSelf(e.x,e.y,e.z));
      //mesh.removeFace(a,b,e);
      println(mesh.getNumFaces());
      //Line3D[x] abiii = lliii;  
     }
    
  }
  //mesh.faces.remove(0);
}

void drawLines(Vec3D x,Vec3D y,Vec3D z, String interpolationmethod, Vec3D dir) {
 // dir = 
  stroke(255,0,255);
 // Line3D fd = new Line3D(f,d); 
 // Line3D ec = new Line3D(e,c); 
 // gfx.line(new Line3D(e,c));
  
}

void divideEqual(Vec3D x, Vec3D y, Vec3D z, int i) {
  Line3D xyline = new Line3D(x,y);
  float xylen = xyline.getLength(); 
  float seglength = xylen/i;
  List<Vec3D> xy = new ArrayList<Vec3D>();
  xyline.splitIntoSegments(x,y,seglength, xy, true);
  Line3D xzline = new Line3D(x,z); 
  
  for (int t = 0; t < i; t++) {
    stroke(255,255,0);
   gfx.line(new Line3D(xy.get(t), xzline.closestPointTo(xy.get(t))));
    println(xy.get(t));
   println(xzline.closestPointTo(xy.get(t)));
  }
}




void setup() {
  size(1000,1000,OPENGL);
  smooth();
  textSize(9);
  gfx=new ToxiclibsSupport(this);
  frameWork();
  controller();

  interpolatePlane(7);
  
}

void frameWork() {
 mesh.addFace(a,b,e );
 mesh.addFace(a,b,d );
 mesh.addFace(a,c,d );
 mesh.addFace(f,b,e );
 mesh.setName("abcd");
}


void controller() {
  controlP5 = new ControlP5(this);
  controlWindow = controlP5.addControlWindow("controlP5window",100,100,400,200);
  controlP5.addButton("Mode", 0,100,120,80,19).setWindow(controlWindow);
  controlP5.addButton("Export", 0,100,140,80,19).setWindow(controlWindow);
  controlP5.addSlider("eyeX",-1500,1500,-500,10,10,80,19).setWindow(controlWindow);
  controlP5.addSlider("eyeY",-1500,1500,-750,10,30,80,19).setWindow(controlWindow);
  controlP5.addSlider("eyeZ",-1500,1500,-225,10,50,80,19).setWindow(controlWindow);
  controlP5.addSlider("centerX",-1500,1500,500,140,10,80,19).setWindow(controlWindow);
  controlP5.addSlider("centerY",-1500,1500,-1012,140,30,80,19).setWindow(controlWindow);
  controlP5.addSlider("centerZ",-1500,1500,-500,140,50,80,19).setWindow(controlWindow);
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
  //drawLines(a,b,e,"blah", e);
  divideEqual(a,b,e,5);
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
