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


void assenkruis(){
 Vec3D zero = new Vec3D(0,0,0);  
 Vec3D x = new Vec3D(1000,0,0);
 Vec3D y = new Vec3D(0,1000,0);
 Vec3D z = new Vec3D(0,0,1000);
 stroke(255,0,0);
 gfx.line(new Line3D(zero,x)); 
  stroke(0,255,0);
 gfx.line(new Line3D(zero,y)); 
  stroke(0,0,255);
 gfx.line(new Line3D(zero,z)); 

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

