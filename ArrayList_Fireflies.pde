import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;


Ellipsoid earth, fondo;

boolean attached = true;


//ArrayList en Processing, normalemente esto se conoce como un vector
ArrayList<Firefly> fireflies;

void settings() {
  size (640, 480, P3D);
  }
  
void setup() {
  
  fireflies = new ArrayList<Firefly>(); // inicializa el vector
  // Create the earth
  earth = new Ellipsoid(this, 10, 10);
  earth.setTexture("luci1.jpg");
  earth.setRadius(20);
  earth.moveTo(new PVector(0, 0, 0));
  earth.strokeWeight(1.0f);
  earth.stroke(color(255, 255, 0));
  earth.moveTo(20, 40, -80);
  earth.drawMode(Shape3D.TEXTURE);

 
  // Create the star background
  fondo = new Ellipsoid(this, 10, 10);
  fondo.setTexture("luciernaga2.jpeg", 5, 5);
  fondo.drawMode(Shape3D.TEXTURE);
  fondo.setRadius(500);
}

void draw() {
    pushStyle();
  // Change the rotations before drawing
  earth.rotateBy(0, radians(0.6f), 0);
  fondo.rotateBy(0, 0, radians(0.02f));

  background(0);
  pushMatrix();
  camera(0, -190, 350, 0, 0, 0, 0, 1, 0);

  earth.draw();
  fondo.draw();
 
  popMatrix();
  popStyle();
   
 fireflies.add(new Firefly());
  
  for (Firefly p : fireflies) {
    p.update();
    p.display();
    }

  // Looping through backwards to delete
  for (int i = fireflies.size()-1; i >= 0; i--) {
    Firefly p = fireflies.get(i);
    p.run();
    if (p.fades()) {
     fireflies.remove(i);
    }
  }
  
}