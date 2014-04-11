float value;
import java.util.Iterator;
String texte="Solution";
boolean consigne;
PImage img, img2, imgEn, img2En;


ArrayList<Particle> particles;
color fin;
float amt = 0.0;
color partColor;

boolean flip=false;
boolean french=true;
String basename = "cartel1";



void setup() {

  img = loadImage(basename+"FRA.jpg");
  img2 = loadImage(basename+"bisFRA.jpg");
  imgEn = loadImage(basename+"ANG.jpg");
  img2En = loadImage(basename+"bisANG.jpg");

  consigne = true;

  //size(600,1024);


  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(36);
  particles = new ArrayList<Particle>();

  background(0);
}

void draw() {
  background(0);

  if (flip) {
    translate(width, height);
    rotate(PI);
  }


  if (french) {
    image(img2, 0, 0, width, height);
    tint(255, 255, 255, 255-value);  // Apply transparency without changing color
    image(img, 0, 0, width, height);
  }
  else {
    image(img2En, 0, 0, width, height);
    tint(255, 255, 255, 255-value);  // Apply transparency without changing color
    image(imgEn, 0, 0, width, height);
  }

  noTint();

  if (consigne) {
    fill(0);
    if (value < 20) {
      //text("Frottez l’écran avec le doigt!", width/2, height-50);
    }
    if (value > 0) {
      if (value > 251) {
        value-=0.03;
      }
      else {
        value-=3;
      }
      //println(value);
    }
  }



  Iterator<Particle> it = particles.iterator();
  while (it.hasNext ()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }
}

void mouseDragged() {

  particles.add(new Particle(new PVector(mouseX, mouseY)));
  consigne=false;
  value = value + 1.5;
  if (value > 254) {
    value = 254;
  }
  //println (value + "--" + mouseX + " - "+emouseY);
   println ("dragged");
   
}

void mouseReleased() {
  
  if(!flip){
  if (mouseX>466  && mouseX<579 && mouseY>20 && mouseY<87) {
    french=!french;
  }
  }else{
    if (mouseX>36  && mouseX<133 && mouseY>947 && mouseY<996) {
    french=!french;
    }
  }
  
  println ("released");
  consigne=true;
}



