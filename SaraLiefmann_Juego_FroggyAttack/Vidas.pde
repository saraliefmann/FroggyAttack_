class Vidas{
float posicionX;
float posicionY;

//Vidas
 public Vidas(float posicionXInicial, float posicionYInicial){
 posicionX = posicionXInicial;
 posicionY = posicionYInicial;
}



//para pintarse
void pintese(){
fill(255,0,0);
smooth();
noStroke();
fill(255,0,0);
beginShape();
vertex(posicionX+50, posicionY+15);
bezierVertex(posicionX+50, posicionY+(-5), posicionX+90,posicionY+5,posicionX+ 50, posicionY+40);
vertex(posicionX+50, posicionY+15);
bezierVertex(posicionX+50, posicionY+(-5), posicionX+10, posicionY+5, posicionX+50, posicionY+40);
endShape();
 }
}
