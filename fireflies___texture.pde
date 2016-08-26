
// Simple Particle System

// Clase Firefly
class Firefly {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;


  Firefly() { // esta parte es como el setup() del codigo principal
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = new PVector(random(width), random(height));
    lifespan = 255.0;

  }

  void run() {
    update();
    display();
  }

  // Actualizar la posicion de la particula
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  // dibujar la particula en esa posicion y segun su tiempo de vida (transparencia)
  void display() {
    stroke(#FFE205, lifespan);
    strokeWeight(0.5);
    fill(#EEFF05, lifespan);
    ellipse(position.x, position.y, 12, 12);
  }

  // Hora de morir
  boolean fades() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}