//Sara Liefmann
//Froggy atack es un juego para atrapar mariquitas e ir sumando puntos, mientras tanto hay que tener cuidado
//con las abejas, ya que hay tres vidas y cada abeja que toques te va quitando una hasta perder
//para aumentar la dificultad las mariquitas cambian de velocidad, y con click aparecen más abejas
//tiene musica de acuerdo al ecosistema que cree

//Abejas
Abeja abejita;
Abeja abejita2;
Abeja abejita3;
Abeja abejita4;

//montanas
Montana montanita;
Montanapeque montanitapeque;
Nube nubecita;

//nubecitas
Nube nubecita2;
Nube nubecita3;
Nube nubecita4;

//sapo
Sapo sapito;

//muchas abejas
ArrayList<Abeja> abejitas;
int numAbejas = 10;

//arreglo mariquitas
Mariquita[] grupoMariquitas;
int numMariquitas = 19;

//para crear las vidas del juego
Vidas viditas;
Vidas viditas1;
Vidas viditas2;

//estados
int INICIO = 1;
int JUEGO = 2;
int PERDEDOR = 3;
int Eactual = 1;
int TRANSICION = 5;
//estado de las abejas
int tipodia = 4;


//imagenes usadas en el juego
//PImage inicio;
//PImage gameover;
PImage sapoinicio;
PImage sapofinal;
PImage mariquitabeja;
PImage transicionGameOver;
PImage instrucciones;

//variable para las vidas del juego
int vidasN = 3;

//variable del puntaje
int score;

//variable de tabla de puntaje
Table puntajes;

//variables de la tipografia utilizada
PFont VeronaBolda; //(60)
PFont VeronaBoldb; //(80)
PFont VeronaBoldc; //(30)
PFont VeronaBoldd; //(25)

//variables para la hora de los puntajes
int   mes;
int   dia;
int   hora;
int  minuto;
  
String fecha_juego;


//para la cancion del juego
import processing.sound.*;
//variables para los sonidos
SoundFile miCancion;
SoundFile sapomariquita;
 


void setup() {
  size(800, 800);

  //cielo
  background(203, 243, 250);

  ////abejitas
  //abejita= new Abeja (3,0.8);
  //abejita2= new Abeja (2,5);
  //abejita3= new Abeja (0.05,140);
  //abejita4= new Abeja (0.05,600);

  //abejas
  abejitas = new ArrayList<Abeja>();

  for (int i =0; i<numAbejas; i++) {
    abejitas.add(new Abeja (random(0, width), random(0,300), true));
  }

  //nube
  nubecita= new Nube (2, 100);
  nubecita2= new Nube (2, 3);
  nubecita3= new Nube (7, 500);
  nubecita4= new Nube (0.2, 600);

  //Montanitas
  montanita = new Montana(0, 0, color(84, 113, 40));

  //montañapeque
  montanitapeque = new Montanapeque(0, 0);



  //Grupo de mariquitas
  grupoMariquitas = new Mariquita[numMariquitas];

  for (int i = 0; i < numMariquitas; i++) {
    grupoMariquitas[i] = new Mariquita(int(random(0, width)), int(random(0, height)), true);
  }
  //sapitos
  sapito = new Sapo (50, 700);

  //vidas del juego
  viditas = new Vidas(0, 0);
  viditas1 = new Vidas(40, 0);
  viditas2 = new Vidas(80, 0);


  ////foto de inicio
  //inicio = loadImage("inicio.jpg");

  ////foto de game over
  //gameover = loadImage ("gameover.jpg");

  //sapo de inicio
  sapoinicio = loadImage ("Untitled_Artwork 8.png");

  //sapo del final
  sapofinal = loadImage("Untitled_Artwork 7.png");

  //Mariquita y abeja del final
  mariquitabeja = loadImage("mariquitabeja.png");

  //Transicion game over
  transicionGameOver = loadImage("SapoMuerto.png");
  
  //instrucciones para el inicio
  instrucciones = loadImage("instrucciónes.png");
  
  //para  cargar el font
  VeronaBolda = createFont("Verona-Bold.ttf", 60);
  VeronaBoldb = createFont("Verona-Bold.ttf", 80);
  VeronaBoldc = createFont("Verona-Bold.ttf", 30);
  VeronaBoldd = createFont("Verona-Bold.ttf", 25);
  
  ////inicializar la tabla de puntajes
  //puntajes = new Table();
  //puntajes.addColumn("fecha");
  //puntajes.addColumn("puntaje");
  puntajes = loadTable ("data/puntajes.csv", "header");
   //para hacer la tabla de datos con la hora
   mes = month();
   dia = day();
   hora = hour();
   minuto = minute();
  
   fecha_juego = mes+"-"+dia+" "+hora+":"+minuto;
   
   //canción de sapitos
   miCancion = new SoundFile(this, "abeja.mp3");
   miCancion.play();
   miCancion.loop();
   
   //sonido de sapo para cuando agarra una mariquita
   sapomariquita = new SoundFile(this, "sapitocroag.mp3");
} 

void draw() {
  //println(Eactual);

  if (Eactual == INICIO) {
    background(203, 243, 250);
    //image( inicio, 0, 0, width, height);

    //montanitapeque
    montanitapeque.pintese2();

    //pintar montana
    montanita.pintese();

    //sapito
    image (sapoinicio, 0, 0);

    //boton de play
    strokeWeight(2);
    stroke(0);
    fill(#FABA79);
    rect(300, 560, 200, 80);
    fill(0);
    textFont(VeronaBolda);
    text("Play", 330, 610); 
    

    //texto juego
    fill(0);
    textFont(VeronaBoldb);
    text("Froggy", 250, 150); 
    text("Attack", 250, 240); 

    //mariquitas
    for (int i = 0; i < numMariquitas; i++) {
      grupoMariquitas[i].dibujarse();
    }

    ////abejitas
    // abejita.dibujar(); 
    // abejita3.dibujar(); 
    // abejita4.dibujar(); 


    //nubes
    nubecita.dibujar();
    nubecita2.dibujar();
    nubecita3.dibujar();
    nubecita4.dibujar();

    //zona sensible
    if ((mouseX>300)&&
      (mouseX<300+200)&&
      (mouseY>560)&&
      (mouseY<560+80)&&
      (mousePressed==true)) {
      Eactual = JUEGO;
    }
    
      //imagen para las isntrucciones del juego
    image (instrucciones, 0, 0);
  
    
  } else if (Eactual == JUEGO) {

    //color cielo para que no se vea el movimiento
    background(203, 243, 250);

    //pintese montana y cambio de color
    montanita.pintese();
    montanita.cambiodecolor();

    //pintese nube y muevase horizontal
    nubecita.dibujar();
    nubecita.moverHorizontaln();

    nubecita2.dibujar();
    nubecita2.moverHorizontaln();

    nubecita3.dibujar();
    nubecita3.moverHorizontaln();

    nubecita4.dibujar();
    nubecita4.moverHorizontaln();

    //abejas paren con el mouse
    //abejita.parar(mouseX, mouseY);
    //abejita2.parar(mouseX, mouseY);
    //abejita3.parar(mouseX, mouseY);

    //pintese abejitas   y muevanse en la horizonatl
    //abejita.moverHorizontal();
    //abejita.dibujar(); 

    //abejita2.moverHorizontal();
    //abejita2.dibujar();  

    //abejita3.moverHorizontal();
    //abejita3.dibujar();

    //vidas del juego
    if (vidasN>=1) {
      viditas.pintese();
    } 
    if (vidasN >=2) {
      viditas1.pintese();
    } 
    if (vidasN >=3) {
      viditas2.pintese();
    }

    //abejitas nuevas
    for (int i = abejitas.size()-1; i>=0; i--) {
      Abeja abeja = abejitas.get(i);
      abeja.dibujar();
      abeja.moverse();
    }

    //arraylist de las abejas
    for (int i = 0; i<abejitas.size (); i++) {
      //abejitas.get(i).pocionx = 2;
      if (abejitas.get(i).estaVivo) {
        
        //dist entre la abeja y la cabeza del sapo para perder vidas
        float distAbejaSapo = dist(abejitas.get(i).movX, abejitas.get(i).movY, sapito.movXs, sapito.posiciony+10);
        if (distAbejaSapo<30) {
          if (vidasN>1) {
            vidasN = vidasN-1;
            abejitas.get(i).morirse();

          //para ir al game over despues de quedarse sin vidas
          } else if (vidasN == 1) {
            vidasN = vidasN-1;
            abejitas.get(i).morirse();
            sapito.morir();
            Eactual = TRANSICION;
          }
          println(vidasN);
        }
      }
    }
    //println(sapito.posiciony);


    //pintese sapito y muevase por todos lados con las teclas up,down,left,right
    sapito.dibujar();
    sapito.mover();

    

    //pintese mariquitas y reboten por doquier
    for (int i = 0; i < numMariquitas; i++) {
      grupoMariquitas[i].dibujarse();
      grupoMariquitas[i].moverse(int(random(1, 4)));
      grupoMariquitas[i].rebotar();
      
     //caundo el sapito coge la mariquita suma puntos 
     float distSapoMariquita = dist(sapito.movXs+50, sapito.posiciony+30, grupoMariquitas[i].miX-50, grupoMariquitas[i].miY+20);
       if (distSapoMariquita < 9) {  
        score = score+1;
        grupoMariquitas[i].morir();
        //grupoMariquitas[i].moverse(0);
        println("puntaje"+score);
        println(distSapoMariquita);
        
        //Sonido cuando el sapo toca la mariquita
        sapomariquita.play();
    
        
         }
    }
    
  //puntos
  textFont(VeronaBoldc);
  text("score"+score,650,20); 
  
 

 
  
  } else if (Eactual == TRANSICION) {

    //imagen del sapito muerto
    image (transicionGameOver, 0, 0);
    
    //click para pasar al game over y volver a jugar
    if (mousePressed==true) {
      Eactual = PERDEDOR;
      puntaje();
    }
    
  } else if (Eactual == PERDEDOR) {
    background(#D1FFFB);
    //image( gameover, 0, 0, width, height);

    //pintar montana
    montanitapeque.pintese2();

    //pintar montana
    montanita.pintese();

    //boton volver a jugar
    strokeWeight(2);
    stroke(0);
    fill(#FABA79);
    rect(300, 340, 200, 80);
    fill(0);
    textFont(VeronaBoldd);
    text("Volver a jugar", 310, 390); 

    ////boton salir del juego
    //strokeWeight(2);
    //stroke(0);
    //fill(#FABA79);
    //rect(300, 510, 200, 80);
    //fill(0);
    //textSize(28);
    //text("Salir de juego", 310, 560); 

    //sapito
    image (sapofinal, 0, 0);

    //nubes
    nubecita.dibujar();
    nubecita2.dibujar();
    nubecita3.dibujar();
    nubecita4.dibujar();

    //mariquita y abeja
    image (mariquitabeja, 0, 0);

    //texto game over
    fill(0);
    textFont(VeronaBoldb);
    text("Game  ver", 180, 230); 
    textFont(VeronaBoldd);
    text("su puntaje fue:" + score, 310, 540);

    //zona sensible
    if ((mouseX>300)&&
      (mouseX<500)&&
      (mouseY>340)&&      
      (mouseY<420)&&
      (mousePressed==true)) {
      Eactual = INICIO;
      //sapitos
      sapito = new Sapo (50, 700);
      //variable para las vidas del juego
      vidasN = 3;
      score = 0;
      
      //mariquitas
       for (int i = 0; i < numMariquitas; i++) {
      grupoMariquitas[i].dibujarse();
      grupoMariquitas[i].moverse(int(random(1, 4)));
      grupoMariquitas[i].rebotar();
       }
    }
    
  
 
  
  }
  
}

void puntaje() {
  
 
    //para la tabla de puntajes  
   TableRow nuevaFila = puntajes.addRow();
   nuevaFila.setInt("puntaje", score);
   nuevaFila.setString("fecha", fecha_juego);
   saveTable(puntajes, "data/puntajes.csv"); 
  
  
  
}
void keyReleased() {
  //if (key=='1'){
  //  Eactual = INICIO;
  //}
  //else if (key=='2'){
  //  Eactual = JUEGO;
  //}
  //oprimir el numero 3 para perder 
  if (key=='2') {
    Eactual = TRANSICION;
  } else if (key=='3') {
    Eactual = PERDEDOR;
  }
}


//Al dar cick sale una abajea nueva para umentar la dficultad
void mousePressed() {
  abejitas.add (new Abeja(random(1, 5), mouseX, true));
}
