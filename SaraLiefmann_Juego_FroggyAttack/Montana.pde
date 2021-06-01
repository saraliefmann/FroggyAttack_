class Montana{
float posicionX;
float posicionY;
int xm= 0;
int ym=0;
color miColor;

//le permite existir a la montaña
Montana(float posicionXInicial, float posicionYInicial, color colorInicial){
 miColor = colorInicial;
 posicionX = posicionXInicial;
 posicionY = posicionYInicial;
}

//para pintarse
void pintese(){
  fill(miColor);
//Montaña grande 
noStroke();
beginShape();
curveVertex(xm+0,ym+388);
curveVertex(xm+68, ym+318);
curveVertex(xm+91,ym+275);
curveVertex(xm+156,ym+204);
curveVertex(xm+199,ym+141);
curveVertex(xm+256,ym+163);
curveVertex(xm+328, ym+259);
curveVertex(xm+390, ym+294);
curveVertex(xm+501, ym+383);
curveVertex(xm+584, ym+425);
curveVertex(xm+921, ym+568);
curveVertex(xm+1123, ym+500);
curveVertex(xm+1348, ym+381);
curveVertex(xm+1400, ym+307);
curveVertex(xm+1400, ym+800);
curveVertex(xm+842, ym+800);
curveVertex(xm+0,ym+800);
curveVertex(xm+0, ym+556);
curveVertex(xm+0,ym+388);
curveVertex(xm+0,ym+388);
endShape(CLOSE);
}
//cambio de color de la montana con la tecla a
//para ver un color café
void cambiodecolor(){
  miColor= color(84, 113, 40); 
 if (keyPressed) {
   if (key== 'a'){
   miColor = color(162,127,30);
 } else{
   miColor = color (84, 113, 40);
 }
  
   
 
 } 
 }
    
    

}
