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
ControlP5 controlP5;
ControlWindow controlWindow;

TriangleMesh mesh = new TriangleMesh();
TriangleMesh beams = new TriangleMesh();
//Vec3D[] vectors;



void setup() {
  size(1000,1000,OPENGL);
  smooth();
  textSize(9);
  gfx=new ToxiclibsSupport(this);
  frameWork();
  controller();
  interpolatePlane(7);
}

