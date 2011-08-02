
void setup()
{
  size(269, 269);
  background(200);
  smooth();
}

void draw(){
 if KeyPressed() {
   if (key == "b"){
  balls(); 
   }
}


void balls()
{
  
 for(int i=0; i<10; i+=1) {
   int x = int(random(269));
   int y = int(random(269));
   int r = int(random(269)/5);
   int s = int(random(269)/5);
   ellipse(x,y,r,r);
 }
}
