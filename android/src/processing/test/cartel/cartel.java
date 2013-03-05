package processing.test.cartel;

import processing.core.*; 
import processing.data.*; 
import processing.opengl.*; 

import java.util.Iterator; 

import android.view.MotionEvent; 
import android.view.KeyEvent; 
import android.graphics.Bitmap; 
import java.io.*; 
import java.util.*; 

public class cartel extends PApplet {

float value;

String texte="Solution";
boolean consigne;
PImage img,img2;
ArrayList<Particle> particles;

public void setup() {
  img = loadImage("cartel2.png");
  img2 = loadImage("cartel2bis.png");
  consigne = true;
  //orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(36);
    particles = new ArrayList<Particle>();

  background(0);
}

public void draw() {
  background(0);
  image(img2, 0, 0);
  
  tint(255, 255-value);  // Apply transparency without changing color
  image(img, 0, 0);
  

  if (consigne) {
//    fill(179,181,167, 255-value);
//    rect(0, 0, width, height);
    fill(0);
   // text("Frotter pour d\u00e9couvrir la solution", width/2, height-20);
     text("Frottez l\u2019\u00e9cran avec le doigt!", width/2, height-20);
  }
//  
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }  
  
}

public void mouseDragged() {
  //particles.add(new Particle(new PVector(mouseX,mouseY)));
  consigne=false;
  value = value + 0.2f;
  if (value > 254) {
    value = 254;
  }
println (value);  
  

  
  
}

public void mouseReleased() {
  consigne=true;
  value = 0;
}


class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    //acceleration de la particule
    acceleration = new PVector(0, 0.02f);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    location = l.get();
    lifespan = 255.0f;
  }

  public void run() {
    update();
    display();
  }

  // mise a jour de la position
  public void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0f;
  }

  // Affichage de la particule
  public void display() {
    noStroke();
  //  partColor = lerpColor(deb,fin,amt);
  //a tester ici les couleurs des particules
 //arc en ciel : 
 // fill(random(10),random(220),random(255));
 //vert bleu
   fill(random(10),random(220),random(255));
    ellipse(location.x, location.y, 2, 2);
  // rect(location.x, location.y, 8, 8);
  }

  // particule encore utile
  public boolean isDead() {
    if (lifespan < 0.0f) {
      return true;
    } 
    else {
      return false;
    }
  }
}


}
