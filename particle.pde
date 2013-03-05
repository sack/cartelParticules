


class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    //acceleration de la particule
    acceleration = new PVector(random(-1, 1), random(-1, 1));
    velocity = new PVector(random(-1, 1), random(-1, 1));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // mise a jour de la position
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Affichage de la particule
  void display() {
    noStroke();
  //  partColor = lerpColor(deb,fin,amt);
  //a tester ici les couleurs des particules
 //arc en ciel : 
  fill(value);
 //vert bleu
   //fill(random(10),random(220),random(255));
    ellipse(location.x, location.y, 2, 2);
   //rect(location.x, location.y, 8, 8);
  }

  // particule encore utile
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}


