//Declaración de variables
int entero, posicionX, posicionY;
PImage fondo, personaje;
boolean boton = false;

void setup() {
  size(1800, 1000);
  print("Hola");
  fondo = loadImage("fondo_nubes.png");
  personaje = loadImage("personaje.png");
  posicionX = int(width*0.45);
  posicionY = int(height*0.4);
}

void draw() {
  image(fondo, 0, 0);

  //Posición fija para personaje
  //image(personaje,int(width*0.45),int(height*0.4), int(width*0.1),int(height*0.15));

  //Posición cambiante para el personaje
  image(personaje, posicionX, posicionY, int(width*0.1), int(height*0.15) );
  movimientoTeclado();
  //movimientoConMouse();
  boton();
}

/*void movimientoConMouse() {
  if (mousePressed) {
    posicionX = int(mouseX);
    posicionY = int(mouseY);

    //Solo aparece cuando el mouse está presionado
  }
}
*/

void movimientoTeclado() {

  if (keyPressed && (key == 'd' || keyCode == RIGHT)) {
    if (posicionX + width*0.1 < width) {
      posicionX += 20;
    }
  }
  if (keyPressed && (key == 'a' || keyCode == LEFT)) {
    if (posicionX > 0) {
      posicionX -= 20;
    }
  }
  if (keyPressed && (key == 'w' || keyCode == UP)) {
    if (posicionY > 0) {
      posicionY -= 20;
    }
  }
  if (keyPressed && (key == 's' || keyCode == DOWN)) {
    if (posicionY + (height*0.15) < height) {
      posicionY += 20;
    }
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

/*
void mouseClicked() {
 image(personaje,mouseX, mouseY,int(width*0.1), int(height*0.15));
 }
*/
