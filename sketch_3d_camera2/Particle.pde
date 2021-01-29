class Particle extends GameObject {


  PVector velocity;
  float speed;
  int alpha;

  Particle (PVector location) {
    loc = location.copy();
    velocity = new PVector(random(-10, 10), random(-10, 10), random(-10, 10));
    alpha = 255;
    speed = 3;
    velocity.setMag(speed);
    size = random(2, 5);
  }


  void show() {
    pushMatrix();
    noStroke();
    fill(255);
    translate(loc.x, loc.y, loc.z);
    box(size);
    popMatrix();
  }

  void act() {

    loc.add(velocity);
    alpha -= 12.5;
    if (alpha <= 0) lives = 0;
  }
}
