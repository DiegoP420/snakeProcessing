ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();

int ancho=30;
int alto=30;
int tamano=20;
int direccion=2;
int puntaje=0;

int[]dx={0,0,1,-1};
int[]dy={1,-1,0,0};

int manzX= 20;
int manzY= 20;

PImage tierra;
PImage manzana;

boolean gameover=false;

void setup() {
  size(600, 600); 
  x.add(5); 
  y.add(5);
  tierra = loadImage("ground.jpg");
  manzana = loadImage("apple.png");
}
  
void draw() {  
  background(tierra);

  for (int i = 0 ; i < x.size(); i++){
    stroke(#2BFF03);
    fill(#1DAA3F);
    strokeWeight(5);
    rect(x.get(i)*tamano, y.get(i)*tamano, tamano, tamano);
    }
  

  if (!gameover){
    noFill();
    noStroke();
    image (manzana, manzX*tamano, manzY*tamano, tamano, tamano); 
 
    if (frameCount%5==0) {
        x.add(0, x.get(0) + dx[direccion]); 
        y.add(0, y.get(0) + dy[direccion]);
        
        

        if(x.get(0) < 0 || y.get(0)< 0 || x.get(0) >= alto || y.get(0) >= ancho) {
          gameover=true;
          puntaje=0;
        }
        
        
        for(int i =1 ;i < x.size(); i++){
          if(x.get(0) == x.get(i) && y.get(0) == y.get(i)){
           gameover=true;
           puntaje=0;
          }
        }
        
        if (x.get(0)==manzX && y.get(0)==manzY) { 
          manzX = (int)random(0, ancho); 
          manzY = (int)random(0, alto);
          puntaje++;
        } else { 
          x.remove(x.size()-1); 
          y.remove(y.size()-1); 
        }
      }  
      
    } else {
      fill(#ffffff);
      textSize(20);
      textAlign(CENTER);
      text("GAME OVER, Pulsar Espacio", width/2, height/2);
      if(keyPressed&&key==' '){
        x.clear();
        y.clear();
        x.add(5);
        y.add(5);
        gameover = false;
      }
    }
    textSize(20);
    textAlign(CENTER);
    fill(#ffffff);
    text("PUNTAJE: " + puntaje , 500, 40 );
  }
  
void keyPressed() { 
  int nd=key=='s'? 0: (key=='w'?1: (key=='d'?2: (key=='a'?3:-1)));
  if (nd!=-1){
    direccion=nd;
  }
}
