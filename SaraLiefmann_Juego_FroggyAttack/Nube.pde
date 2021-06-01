class Nube{
 float movnX;
 float movnY;
 float veln;
 float posicionxn;
 float posicionyn;
 float dirn=1;

 //le permite existir a ls nubess
 Nube(float velInicial, float posXInicial){
 movnX=posXInicial;
 veln=velInicial;
 }
//mover las nuvez en horizontal y que se devuelvan
 void moverHorizontaln(){
  movnX=movnX+0.2;
  movnX=movnX+1*dirn;
 if(movnX>800){
  dirn=dirn-0.5;
  }
  else if (movnX<0){
  dirn=1;
  }
 }
 //dibujar la nube
 void dibujar () {
 movnY=0;
 fill(255,255,255);
 noStroke();
 ellipse(movnX+30,movnY+30,50,50);
 ellipse(movnX+80,movnY+30,30,30);
 ellipse(movnX+110,movnY+30,20,20);
 ellipse(movnX+30,movnY+80,50,50);
 ellipse(movnX+80,movnY+80,50,50);
 ellipse(movnX+110,movnY+80,50,50);
 }
 
 
}
