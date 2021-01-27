class Particle extends GameObject {

  PVector dir;
  float speed;
  int alpha;

  Particle (PVector location) {
    loc = location.copy();
    alpha = 255;
    speed = 50;
    //size = random(2, 4);
  }


  void show() {
    fill(255, alpha);
    
    alpha -= 25;
    if (alpha <= 0) lives = 0;
    translate(loc.x,loc.y,loc.z);
    box(size);
  }
}
