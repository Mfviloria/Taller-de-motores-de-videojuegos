//Declaración de variables
int entero, posicionX, posicionY, i, velocidad; //Nuevo: velocidad, i
float yObstaculo, xObstaculo, xPersonaje, yPersonaje, obstaculoX, obstaculoY; //Nuevo: tamaños
PImage fondo, obstaculo;
PImage[] personaje = new PImage[14];
boolean boton = false, arriba = true, abajo = true, derecha = true, izquierda = true; //Nuevo: direccones

void setup() {
  //Nuevo: Tamaño de pantalla
  fullScreen();
  print("Hola");
  fondo = loadImage("cesped.jpg");
  obstaculo = loadImage("paparazzi.png");
  //Nuevo: Cambiar el personaje por un vector personaje
  for (i=0; i<=13; i++) {
    personaje[i] = loadImage("personaje_"+i+".png");
    posicionX = int(width*0.45);
    posicionY = int(height*0.4);
  }
  //Nuevo: Inicializar velocidad, i
  i=7;
  velocidad = 30;
  xPersonaje = width*0.12; //Ancho Personaje
  yPersonaje = height*0.18; //Alto personaje
  xObstaculo = width*0.12; //Ancho obstáculo
  yObstaculo = height*0.12; //Alto obstáculo
  obstaculoX = width * 0.3; // Posicion X obstáculo
  obstaculoY = height * 0.65; //Posicion Y obstáculo
}

void draw() {
  image(fondo, 0, 0, width, height);

  image(personaje[i], posicionX, posicionY, xPersonaje, yPersonaje);
  movimientoTeclado();
  //Nuevo: Dibujar obstáculo
  image(obstaculo, width*0.3, height*0.65, xObstaculo, yObstaculo);
  boton();
  obstaculo_colision();
}

void movimientoTeclado() {
  //Nuevo: Cambio en la velocidad
  if (keyPressed && (key == 'd' || keyCode == RIGHT) && derecha) {
    if (posicionX + width*0.2 < width) {
      posicionX += velocidad;
    }
    switch(i) {
    case 3:
      i=4;
      break;
    case 4:
      i=5;
      break;
    case 5:
      i=6;
      break;
    case 6:
      i=3;
      break;
    }
    if(i<2 || i > 6){
      i=3;
    }
  }
  if (keyPressed && (key == 'a' || keyCode == LEFT) && izquierda) {
    if (posicionX > 0) {
      posicionX -= velocidad;
    }
    switch(i) {
    case 10:
      i=11;
      break;
    case 11:
      i=12;
      break;
    case 12:
      i=13;
      break;
    case 13:
      i=10;
      break;
    }
    if(i<10){
      i=10;
    }
  }
  if (keyPressed && (key == 'w' || keyCode == UP) && arriba) {
    if (posicionY > 0) {
      posicionY -= velocidad;
    }
    switch(i) {
    case 0:
      i=1;
      break;
    case 1:
      i=2;
      break;
    case 2:
      i=0;
      break;
    }
    if(i>2){
      i=0;
    }
  }
  if (keyPressed && (key == 's' || keyCode == DOWN) && abajo) {
    if (posicionY + (height*0.25) < height) {
      posicionY += velocidad;
    }
    switch(i) {
    case 7:
      i=8;
      break;
    case 8:
      i=9;
      break;
    case 9:
      i=7;
      break;
    }
    if(i<7 || i > 9){
      i=7;
    }
  }
}

void obstaculo_colision(){
  if(posicionY + yPersonaje > obstaculoY && posicionY < obstaculoY && posicionX + xPersonaje > obstaculoX && posicionX < obstaculoX + xObstaculo){
    abajo = false;
  }else{
    abajo=true;
  }
  if(posicionY < obstaculoY + yObstaculo && posicionY > obstaculoY && posicionX + xPersonaje > obstaculoX && posicionX < obstaculoX + xObstaculo){
    arriba = false;
  }else{
    arriba=true;
  }
  if(posicionX + xPersonaje > obstaculoX && posicionX < obstaculoX && posicionY + yPersonaje > obstaculoY && posicionY < obstaculoY + yObstaculo){
    derecha = false;
  }else{
    derecha=true;
  }
  if(posicionX < obstaculoX + xObstaculo && posicionX > obstaculoX && posicionY + yPersonaje > obstaculoY && posicionY < obstaculoY + yObstaculo){
    izquierda = false;
  }else{
    izquierda=true;
  }
}

void boton() {
  rect(width*0.9, height*0.9, width*0.05, height*0.05);
}

void mouseClicked() {
  if (mouseX > width*0.9 && mouseX < width*0.9+width*0.05 && mouseY > height*0.9 && mouseY < height*0.9+height*0.05) {
    if (boton) {
      fill(#4F54CE);
      boton = !boton;
    } else {
      fill(#FFA5EC);
      boton = !boton;
    }
  }
}
