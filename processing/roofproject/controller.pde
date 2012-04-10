void addToRadioButton(RadioButton theRadioButton, String theName, int theValue ) {
  Toggle t = theRadioButton.addItem(theName,theValue);
  t.captionLabel().setColorBackground(color(80));
  t.captionLabel().style().movePadding(2,0,-1,2);
  t.captionLabel().style().moveMargin(-2,0,0,-3);
  t.captionLabel().style().backgroundWidth = 46;
}

void controller() {
  controlP5 = new ControlP5(this);
  controlWindow = controlP5.addControlWindow("controlP5window",100,100,400,200);
  controlP5.addButton("autocam", 0,100,120,80,19).setWindow(controlWindow);
  controlP5.addButton("Export", 0,100,140,80,19).setWindow(controlWindow);
  controlP5.addSlider("eyeX",-2500,2500,eyeX,10,10,80,19).setWindow(controlWindow);
  controlP5.addSlider("eyeY",-2500,2500,eyeY,10,30,80,19).setWindow(controlWindow);
  controlP5.addSlider("eyeZ",-2500,2500,eyeZ,10,50,80,19).setWindow(controlWindow);
  controlP5.addSlider("centerX",-2500,2500,centerX,140,10,80,19).setWindow(controlWindow);
  controlP5.addSlider("centerY",-2500,2500,centerY,140,30,80,19).setWindow(controlWindow);
  controlP5.addSlider("centerZ",-2500,2500,centerZ,140,50,80,19).setWindow(controlWindow);
  controlP5.addSlider("divideBy",2,15,divideBy,10,80,80,19).setWindow(controlWindow);
  /* weird, setWindow doesn't work
  RadioButton r = controlP5.addRadioButton("radioButton",20,160).setWindow(controlWindow);
  r.setColorForeground(color(120)); r.setColorActive(color(255)); r.setColorLabel(color(255)); r.setItemsPerRow(5); r.setSpacingColumn(50);
  for(int i =0; i < mesh.getNumFaces(); i++){
   addToRadioButton(r,"triangle"+i,i);
  } 
  */  


}


//void autoCam() {
// autocam=!autocam ;
// }


void keyPressed() {
  if (key=='+') {
    println("pluspressed");
    viewX++;
  }
  if (key=='-') {
    println("minuspressed");
    int[] faces = mesh.getFacesAsArray();
    mesh.translate(new Vec3D(-20,-20,-20));  //
   // mesh.setName("blaah");
    //println(mesh.getMeshAsVertexArray());
    println(a.interpolateTo(b, 2.5));
    //mesh = new Vec3D(20,20,20);
  }
}
