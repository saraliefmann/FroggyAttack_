class Abeja {
  float movX;
  float movY;
  float dir=1;
  boolean estaVivo;

  //variable de movimiento

  public Abeja(float posXInicial, float posYInicial, boolean vive) {
    movX=posXInicial;
    movY = posYInicial;
    estaVivo = vive;
  }
  //propiedades demovimiento
  void moverse() {

    if (movX >= width || movY >= height) {
      dir=-1;
    }  
    if (movX <= 0 || movY <= 0) {
      dir = 1;
    }

    movX =  movX + random(1, 5)*dir;
    movY =  movY + random(1, 5)*dir;
  }
  //para dibujar las abejitas
  void dibujar() {
    if (estaVivo) {

      fill(240, 255, 77);
      noStroke();
      ellipse(movX+50, movY, 50, 30);
      fill(137, 211, 247, 150);
      ellipse(movX+40, movY-15, 26, 20);
      ellipse(movX+60, movY-15, 26, 20);
      fill(0);
      ellipse(movX+69, movY, 5, 5);
      stroke(0);
      strokeWeight(4);
      line(movX+55, movY+10, movX+55, movY-6);
      line(movX+45, movY+10, movX+45, movY-5);
      line(movX+35, movY+10, movX+35, movY);
    }
  }  

  void morirse() {
    estaVivo = false;
  }
}
