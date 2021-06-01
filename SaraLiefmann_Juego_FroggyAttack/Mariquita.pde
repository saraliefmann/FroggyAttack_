class Mariquita {
  // caracteristica
  float miX;
  float miY;
  float dirX=1.5;
  float dirY=1;
  int rapidez = 1;
  int LLOVER = 1;
  int NORMALITO = 2;
  int SEQUIA = 3;
  int estadom = 4;
  boolean estaVivo;

  // le permite existir a la MariquitA
  public Mariquita (int posX, int posY, boolean vive) {
    miX = posX;
    miY = posY;
    estadom = NORMALITO;
    estaVivo = vive;
  }
   

  // habilidades
  
  void dibujarse() {
    if (estaVivo) {
    noStroke();
    ellipse(miX-50, miY, 20, 20);
    fill(250, 3, 7);
    ellipse(miX-50, miY+20, 40, 40);
    fill(0);
    stroke(0);
    strokeWeight(4);
    line(miX-50, miY+38, miX-50, miY+00);
    ellipse(miX-60, miY+20, 5, 5);
    ellipse(miX-60, miY+30, 2, 2);
    ellipse(miX-60, miY+8, 2, 2);
    ellipse(miX-40, miY+20, 5, 5);
    ellipse(miX-40, miY+30, 2, 2);
    ellipse(miX-40, miY+8, 2, 2);
    }
  }
  
  
  void morir(){
   estaVivo = false;
  }
  
  //moverse randomly
  void moverse(int cambioEstado) {
     estadom = cambioEstado;
     //println(estadom);
    
    
  if (estadom == NORMALITO){
    rapidez = 3;
    miX=miX+(dirX*rapidez);
    miY=miY+(dirY*rapidez);
  }
  else if (estadom == LLOVER){
    rapidez = 5;
    miX=miX+(dirX*rapidez);
    miY=miY+(dirY*rapidez);
  }
  else if (estadom == SEQUIA){
    rapidez = 3;
    miX=miX+(dirX*rapidez);
    miY=miY+(dirY*rapidez);
  }
  }
  //Le permite rebotar en la pantalla
  void rebotar() {
    if (miX<0 || miX>800) {
      dirX=dirX*-1;
    }
    if (miY<0 || miY>800){
     dirY=dirY*-1; 
    }
  }
}
