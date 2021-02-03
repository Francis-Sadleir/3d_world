class Snow extends GameObject {
  float speed;
  PVector velocity;
  
  Snow () {
    size = random(0.1, 3);
    speed = size;
    lives = 1;
    loc = new PVector(random(-2000, 2000), random(-2000, 2000), 100);
    velocity.setMag(speed);
  }



  void show() {
    popMatrix();
    world.fill(white);
    world.noStroke();
    world.translate(loc.x, loc.y, loc.z);
    world.box(size);
    pushMatrix();
  }

  void act() {
    loc.add(velocity);
  }
}
