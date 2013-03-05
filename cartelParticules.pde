float value;
import java.util.Iterator;
String texte="Solution";
boolean consigne;
PImage img,img2;


ArrayList<Particle> particles;
color fin;
float amt = 0.0;
color partColor;





void setup() {
  
  img = loadImage("cartel2.png");
  img2 = loadImage("cartel2bis.png");
  consigne = true;
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(36);
  particles = new ArrayList<Particle>();

  background(0);
}

void draw() {
  background(0);
  
  image(img2, 0, 0,width,height);
  tint(255,255,255, 255-value);  // Apply transparency without changing color
  image(img,0 , 0,width,height);
  noTint();

  if (consigne) {
     fill(0);
      if (value < 20) {
     text("Frottez l’écran avec le doigt!", width/2, height-50);
      }
     if (value > 0) {
       if (value > 251) {
        value-=0.03;
       }else{
         value-=3;
       }
        //println(value);
     }
  }


  
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }

}

void mouseDragged() {

  particles.add(new Particle(new PVector(mouseX,mouseY)));
  consigne=false;
  value = value + 1.5;
  if (value > 254) {
    value = 254;
  }
//println (value);  
  
}

void mouseReleased() {
  consigne=true;
  
}




