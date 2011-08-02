
void setup()
{
  size(269, 269);
  background(200);
  smooth();
}

void draw(){
 if(keyPressed) {
    if (key == 'b'){
      balls();
    } else if ( key == 'B') {
      toggleColor();
      balls();
    } else if (key == 'l' || key == 'L') {
      drawlines();
    } else if (key == 'c' || key == 'C') {
      toggleColor();
    } else if (key == 'R') {
      drawconlines();
    }
 }
}

void toggleColor() {
   int r = int(random(255));
   int g = int(random(255));
   int b = int(random(255));
   int a = int(random(255));
   fill(r,g,b,a);
   stroke(r,g,b); 
  
}


void drawlines()
{
    
   strokeWeight(random(5));  
   toggleColor();   
   int x = int(random(269));
   int y = int(random(269));
   int l = int(random(269));
   int k = int(random(269));
   line(x,y,l,k); 
}

void drawconlines()
{
   int x = int(random(269));
   int y = int(random(269));
   int l = int(random(269));
   int k = int(random(269));
   line(x,y,l,k);
   for (int i = 1; i < 100; i++) {
      line(x+2*i,y-2*i,l+3*i,k+4*i);
      strokeWeight(i/2);
   }
   strokeWeight(1);  
   toggleColor();   
}



void balls()
{
  
 for(int i=0; i<10; i+=1) {
   int x = int(random(269));
   int y = int(random(269));
   int r = int(random(269)/5);
   int s = int(random(269)/5);
   ellipse(x,y,r,s);
 }
}
