Personaje eleccion1;
Personaje eleccion2;
Pantalla pantallas;

int personajeseleccionado;
int pantalla;
int turno; 
int ganador;

PImage  buho, rey, samurai, insecto, insectouno;
PImage pinicio, pseleccion, pcombate,presultado;
int S,J1,J2;

void setup(){
  size(900,600);
  
  
  personajeseleccionado=0;
  pantalla=0;
  turno=1;
  eleccion1 = new Personaje();
  eleccion2 = new Personaje();
  pantallas = new Pantalla(0);
  
  pinicio=loadImage("p1.jpg"); 
  pseleccion=loadImage("p3.1.jpg"); 
  pcombate=loadImage("p4.jpg"); 
  presultado=loadImage("p2.2.jpg"); 
  
  buho = loadImage("per1.png"); 
  rey = loadImage("per2.png"); 
  samurai = loadImage("per3.png");  
  insecto = loadImage("per4.png"); 
  insectouno = loadImage("per5.png"); 

}
void draw(){
pantallas.dibujarPantalla();
}

void keyPressed(){
switch (pantallas.secuencia){
  case 0: 
      if (key == 'A' | key == 'a'){
        pantallas.cambiarPantalla(1);
      }
    break;
  case 1:
      if (key == 'A' || key == 'a'){ 
        personajeseleccionado++;
        if (personajeseleccionado > 4){
          personajeseleccionado = 0;
        }
      }
      
     if (key == 'D' || key == 'd'){
        if(turno==1){
         eleccion1.inicializarPersonaje(personajeseleccionado,turno);
          turno = 2;
          personajeseleccionado = 0;
        } else {
         eleccion2.inicializarPersonaje(personajeseleccionado,turno);
          turno = 1;
          pantallas.cambiarPantalla(2);
        }
        
      }
      break;
    case 2:
      if(turno == 1){
        if(key == 'A' || key == 'a'){
         eleccion2.restarVida(eleccion1.ataque);
          turno=2;
        }
      }
      if(turno == 2){
        if(key == 'D' || key == 'd'){
         eleccion1.restarVida(eleccion2.ataque);
          turno=1;
        }
      }
      
      if(eleccion1.vida <= 0){
        ganador = 2;
        pantallas.cambiarPantalla(3);
      }
      if(eleccion2.vida <= 0){
        ganador = 1;
        pantallas.cambiarPantalla(3);
      }
      break;
    case 3:
    
      if(key == 'W' || key == 'w'){
        personajeseleccionado=0;
        pantalla=0;
        turno=1;
        pantallas.cambiarPantalla(0);
      }
      break;
  
  }
}

class Pantalla{
  int secuencia; 
  Pantalla(int ordendepantalla){
    secuencia=ordendepantalla;
  }
  void dibujarPantalla(){
  switch(secuencia){
      case 0: 
        pantalladeinicio();
      break;
      case 1:
        seleccionador();
      break;
      case 2:
        pantalladepelea();
      break;
      case 3:
        pantallaganador();
      break;
      
    }
  }
  void cambiarPantalla(int nuevapantalla){
    secuencia= nuevapantalla; 
  }
  
  void pantalladeinicio(){ 

background(pinicio);
noStroke();
fill(255,255,255,100 );
rect(0,200, 900,100);
pushMatrix();
translate(0,0);
  noStroke();
fill(102);
arc(220, 600, 285, 240, radians(180), radians(360));
fill(45);
arc(50, 600, 175, 180, radians(180), radians(360));
fill(80);
arc(410, 600, 185, 180, radians(180), radians(360));
fill(49);
arc(510, 600, 175, 140, radians(180), radians(360));
fill(60);
arc(740, 600, 320, 210, radians(180), radians(360));
for(int y = 0; y<=height; y+=100){
for  (int x=0; x<=width; x+=20){
fill( random(255), random(255), random(255)); 
ellipse(x,y,5,5);}

}

stroke(2);
textSize(100);

fill(218,165,52);

text("KAZAGURUMA",130,290);
textSize(18);
fill(255);
text("Presiona A para iniciar",15,530, 130,100);
popMatrix();
 } 
  
void seleccionador(){

 background(pseleccion);
 noStroke();
 fill(255,255,255,43 );
 rect(0,0,900,600);
 fill(0,0,0,0);
 stroke(0,0,255);
    
 switch(personajeseleccionado){
      case 0:
      ellipse(185,165,190,190);
      break; 
    case 1:
      ellipse(630,170,190,190);
      break; 
    case 2:
      ellipse(415,380,190,190);
      break; 
    case 3:
      ellipse(190,450,190,190);
      break; 
    case 4:
      ellipse(630,450,190,190);
      break; 
    }
    
    buho(80,36);
   
    rey(530,50);
  
    samurai(320,200);

    insecto (100,340);
    
    insectouno(540,340);
    
    textSize(40);
    fill(128, 0, 128);
    text("ELIGE TUS PERSONAJES", 220, 50);
    textSize(15);
    text("DESPLAZA LA SELECCIÓN CON LA TECLA A", 283,555);
    text("SELECCIONA CON D",283,575);
  } 
  void pantalladepelea(){
     background(pcombate);
     noStroke();
     fill(255,255,255,110);
     rect(0,0,900,600);
     vida(eleccion1.vida,eleccion2.vida);
     eleccion1.dibujarPersonaje();
     eleccion2.dibujarPersonaje();
     textSize(30);
     fill(75, 27, 126   );
     text("Personaje uno ataca con A ",25,145);
     text(eleccion1.nombre,25,175);
     text(eleccion2.nombre,455,175);
     text(" Personaje dos ataca con D",455,145);
    
  }
  void pantallaganador (){
    background(presultado);
    stroke(2);
    noStroke();
    for(int y = 0; y<= height; y+=100){
    for  (int x=0; x<= width; x+=90){
    fill( random(255), random(255), random(255),(100)); 
    ellipse(x,y,30,30);}
    fill( 180,160, 65,230);
    ellipse(450,300,400,400);
    if(ganador == 1){
    eleccion1.dibujarPersonaje(ganador);
    }
    if(ganador == 2){
    eleccion2.dibujarPersonaje(ganador);
    }
    fill(180,160, 65,230);
    textSize(20);
    text("Presiona W para vovler a jugar",350,550);
  }
}

void vida(int x, int y){
   noFill();
   noStroke();
   rect(70,520,x,20);
   rect(530,520,x,20);
   fill(50,255,255);
   rect(70,520,x,20);
   rect(530,520,x,20);
}
}


interface Personajes {
  void inicializarPersonaje();
  void restarVida();
  void dibujarPersonaje();
}

class Personaje {
  String nombre;
  int personaje;               
  int vida;             
  int ataque;           
  int turno;
  Personaje (){
    vida = 200;
  }
  void inicializarPersonaje(int personaje_,int turno_){
   personaje = personaje_;
   ataque=(int)random(18,25);
   turno=turno_;
   vida = 200;
    
    switch (personaje_){
    case 0: nombre = "Buho";
    break;
    case 1: nombre = "Rey";
    break;
    case 2: nombre = "Samurai";
    break;
    case 3: nombre = "Insecto";
    break;
    case 4: nombre = "Bicho";
    break;
    }
    
  }
  void restarVida(int ataque){
    vida=vida-ataque;
  }
  void dibujarPersonaje(){
    int x;
    int y;
    if(turno == 1){
      x= 180;
      y= 210;
    } else{
      x= 460;
      y=210;
    }
    switch (personaje){
      case 0: buho(x,y);
      break;
      case 1: rey(x,y);
      break;
      case 2: samurai(x,y);
      break;
      case 3: insecto(x,y);
      break;
      case 4: insectouno(x,y);
      break;
    
    }
  }
    void dibujarPersonaje(int ganador_){
     if(ganador_ == 1){
      textSize(40);
      text("GANÓ JUGADOR UNO",200,50);
      textSize(30);
      text(eleccion1.nombre,350,90);
    } else{
      textSize(40);
      text("GANO JUGADOR DOS ",200,50);
      textSize(30);
      text(eleccion2.nombre,350,90);
    }
    
    switch (personaje){
      case 0: 
      pushMatrix();
      scale(1.5);
      translate(190,60);
      buho(0,0);
      popMatrix();
      
      break;
      case 1: 
      pushMatrix();
      scale(1.5);
      rey(200,70);
      popMatrix();
      
      break;
      case 2: 
      pushMatrix();
      scale(1.4);
      samurai(222,70);
      popMatrix();
      break;
      case 3: 
      pushMatrix();
      scale(1.5);
      insecto(212,72);
      popMatrix();
      break;
      case 4: 
      pushMatrix();
      scale(1.45);
      translate( 210,80);
      insectouno(0,0);
      popMatrix();
      break;
    }
  }  
}
void buho(int x, int y){ 
  pushMatrix();
  translate(x,y);
  scale(.13);
 image(buho, 0,0);
 popMatrix();
}
void rey(int x, int y){
 pushMatrix();
 translate(x,y);
 scale(.13);
 image(rey, 0, 0);
 popMatrix();
}
void samurai(int x, int y){
 pushMatrix();
 translate(x,y); 
 scale(.13);
 image(samurai, 0,0);
 popMatrix();
}
void insecto(int x, int y){
   pushMatrix();
   translate(x,y);
   scale(.13);
   image(insecto, 0,0);
    popMatrix(); 
}
void insectouno(int x, int y){
  pushMatrix();
   translate(x,y);
   scale(.13);
   image(insectouno,0, 0);
 popMatrix(); 
}
