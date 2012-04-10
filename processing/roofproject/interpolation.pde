



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
        ///add lines/beams!
     }
    
  }
  //mesh.faces.remove(0);
}



void divideEqual(Vec3D x, Vec3D y, Vec3D z) {
  Line3D xyline = new Line3D(x,y);
  float xylen = xyline.getLength();
  float seglength = xylen/divideBy;
  List<Vec3D> xy = new ArrayList<Vec3D>();
  xyline.splitIntoSegments(x,y,seglength, xy, true);
  Line3D xzline = new Line3D(x,z);
  float xzlen = xzline.getLength();
  float seglength2 = xzlen/divideBy;
  List<Vec3D> xz = new ArrayList<Vec3D>();
  xzline.splitIntoSegments(x,z,seglength2, xz, true);
  for (int t = 0; t < divideBy; t++) {
   stroke(255,255,0);
   gfx.line(new Line3D(xy.get(t), xz.get(t)));
  }
}

