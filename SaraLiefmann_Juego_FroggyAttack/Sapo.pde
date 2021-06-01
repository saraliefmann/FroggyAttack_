class Sapo {
  float movXs;
  float posiciony;
  float vels;
  Boolean estaVivo;


  //le permite crearse al sapito come mariquitas
  public Sapo(float posX, float posY) {
    movXs=posX ;
    posiciony = posY;
    estaVivo = true;
  }

  void dibujar() {

    if (estaVivo) {
      noStroke();
      fill(156, 245, 106);
      noStroke();
      ellipse(movXs, posiciony-10, 50, 30);
      ellipse(movXs, posiciony+10, 50, 30);
      fill(255);
      noStroke();
      ellipse(movXs-10, posiciony-20, 20, 20);
      ellipse(movXs+10, posiciony-20, 20, 20);
      fill(0);
      stroke(0);
      line(movXs-5, posiciony-5, movXs+8, posiciony-5);
      ellipse(movXs-10, posiciony-20, 5, 5);
      ellipse(movXs+10, posiciony-20, 5, 5);
      fill(250, 156, 213);
      noStroke();
      ellipse(movXs-12, posiciony-5, 10, 10);
      ellipse(movXs+12, posiciony-5, 10, 10);
    }
  }    

  //para mover el sapito por toda la pantalla
  void mover() {
    //para que se pueda mover con las flechas del teclado
    if (keyPressed==true) {     
      if (keyCode==LEFT) {
        movXs=movXs-5;
      }
      if (keyCode==RIGHT) {
        movXs=movXs+5;
      }
      if (keyCode==UP) {
        posiciony=posiciony-5;
      }
      if (keyCode==DOWN) {
        posiciony=posiciony+5;
      }
    }
  }
  void morir () {
    estaVivo = false;
  }

  void revivir() {
    estaVivo = true;
  }
}
