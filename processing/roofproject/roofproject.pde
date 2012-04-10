

public List<Vec3D> divideVector(Vec3D x, Vec3D y, String method, int segments){
  List<Vec3D> xy = new ArrayList<Vec3D>();
  if (method == "equal") {
    Line3D xyline = new Line3D(x,y);
    float seglength = (xyline.getLength())/segments;
    println("the lengte is:");
    println(segments);
    xyline.splitIntoSegments(x,y,seglength, xy, true);
  }
  return xy;
}



void Line3Dintersect(Vec3D x, Vec3D y, Vec3D z, int beams) {
  //Line3D xyline = new Line3D(x,y);
  float xylen = new Line3D(x,y).getLength();
  float yzlen = new Line3D(y,z).getLength();
  float xzlen = new Line3D(x,z).getLength();
  int beamsa = floor(xylen/(xylen + yzlen)*beams);
  int beamsb = beams - beamsa;
  List<Vec3D> xy = new ArrayList<Vec3D>(divideVector(x, y, "equal", beamsa));
  List<Vec3D> xz = new ArrayList<Vec3D>(divideVector(x, z, "equal", beamsb)); 
  println(beamsb);
  println("f");
  println(xz.size());
}



void drawLines(List<Vec3D> xy, List<Vec3D> yz, color c) {  
  for (int t = 0; t < xy.size(); t++) {
   stroke(c);
   gfx.line(new Line3D(xy.get(t), yz.get(t)));
  }
}

//void drawLines(Vec3D x,Vec3D y,Vec3D z, String interpolationmethod, Vec3D dir) {
 // dir = 
 // Line3D fd = new Line3D(f,d); 
 // Line3D ec = new Line3D(e,c); 
 // gfx.line(new Line3D(e,c));
  
//}




void frameWork() {
 mesh.addFace(a,b,e );
 mesh.addFace(a,b,d );
 mesh.addFace(a,c,d );
 mesh.addFace(f,b,e );
 mesh.setName("abcd");
}


void divideAll() {
  for(int i=0; i < mesh.getNumFaces(); i++) {
    int[] faces = mesh.getFacesAsArray();
    divideEqual(mesh.faces.get(i).a,mesh.faces.get(i).b,mesh.faces.get(i).c);
  }
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
  //divideEqual(e,b,a);
  divideAll();
  beam(a, b);
  fill(255,50,10);
  Line3Dintersect(a,b,e,10);
    
}


void beam(Vec3D x, Vec3D y) {
      Vec3D beam_size = new Vec3D(x.distanceTo(y)/2,5,17);
      TriangleMesh beam=(TriangleMesh)new AABB(new Vec3D(), beam_size).toMesh();
       // align the Z axis of the box with the direction vector
      beam.pointTowards(y);
      // move the box to the correct position
      beam.transform(new Matrix4x4().translateSelf(x.x,x.y,x.z));
      //beam.translate(x);
      //println(beam.getNumFaces());
      //beams.addMesh(beam);
      gfx.mesh(beam);
      
}

void beam2(int x, int y,Vec3D k, Vec3D l) {
  //construct beam at k xyl

}


