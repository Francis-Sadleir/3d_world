class Bullet extends GameObject {

  PVector dir;
  float speed;


  Bullet() {
    super(eyex, eyey, eyez, 10);
    speed = 50;

    float vx = cos(leftRightAngle);
    float vy = tan(upDownAngle);
    float vz = sin(leftRightAngle);
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
  }


  void act() {

    if (loc.y >= height) {
      lives = 0;

      for ( int i = 0; i < 7; i++) {
        objects.add(new Particle(loc));
      }
    }

    if (loc.y <= height-gridSize*3-5) {
      lives = 0;

      for ( int i = 0; i < 7; i++) {
        objects.add(new Particle(loc));
      }
    }

    int hitx = int(loc.x+2000+5) / gridSize;
    int hity = int(loc.z+2000+5) / gridSize;

    //if (loc.x > target.x || loc.y > target.y ) {
    if (dist(loc.x, loc.y, loc.z, target.x, target.y, 0)<target.s/2) {
      target.isHit();
    }

    if (map.get(hitx, hity) == white) {
      loc.add(dir);
    } else {
      lives = 0;
      //print("DEAD ");
      for ( int i = 0; i < 7; i++) {
        objects.add(new Particle(loc));
      }
    }
  }
}
