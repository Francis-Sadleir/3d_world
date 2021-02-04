class Snow extends GameObject {
  float x, y, z, speed;

  Snow () {
    size = random(1, 15);
    x = random(-2000, width+500);
    y = random(-2000, height);
    z = random(-2000, width-500);
    speed = size;
    lives = 1;
  }



  void show() {
    world.pushMatrix();
    world.fill(white);
    world.noStroke();
    world.translate(x, y, z);
    world.box(size);
    world.popMatrix();
  }

  void act() {
    y = y + speed;
    if (y > height) {
      y = 0;
    }
  }
}
