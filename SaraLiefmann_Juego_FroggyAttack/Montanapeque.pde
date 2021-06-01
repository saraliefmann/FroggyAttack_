class Montanapeque{
float posicionX1;
float posicionY1;
color miColor1;

//le permite existir a la montaña
Montanapeque(float posicionXInicial, float posicionYInicial){
 posicionX1 = posicionXInicial;
 posicionY1 = posicionYInicial;
}


//para pintarse
void pintese2 () {
  fill(#2C9D4F);
  noStroke();
  beginShape();
curveVertex(522, 663);
curveVertex(522, 388);
curveVertex(591,326);
curveVertex(639, 346);
curveVertex(676, 359);
curveVertex(744, 416);
curveVertex(787,400);
curveVertex(849, 417);
curveVertex(903, 386);
curveVertex(1000, 326);
curveVertex(1049, 438);
curveVertex(1093, 431);
curveVertex(1155, 436);
curveVertex(1205, 433);
curveVertex(1400, 497);
curveVertex(1400,700);
curveVertex(521,700);
curveVertex(521, 36);
endShape();
}
}
