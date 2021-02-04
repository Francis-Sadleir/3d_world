class Target extends GameObject {

  color red, blue, yellow, grey;
  float x, y, z, s;

  Target() {
    red = #fb4f4f;
    blue = #6cc0e5;
    yellow = #fbc93d;
    grey = #CBCBCB;
    black = #000000;

    x = random(-2000+200, 2000-200);
    y = 780;
    z = 0;
    s = random(100, 200);
  }



  void show() {//float x, float y, float z, float s) {

    world.pushMatrix();

    world.fill(grey);
    world.strokeWeight(5);
    world.stroke(grey);

    world.translate(x, y, z+2000-101);
    //outer white layer
    world.ellipse(0, 0, s, s);
    world.stroke(0);
    world.popMatrix();


    world.pushMatrix();
    world.translate(x, y, z+2000-102);
    //red layer
    world.fill(red);
    world.ellipse(0, 0, s*0.833, s*0.833);
    world.ellipse(0, 0, s*0.666, s*0.666);
    world.popMatrix();


    world.pushMatrix();
    world.translate(x, y, z+2000-103);
    //blue layer
    world.fill(blue);
    world.ellipse(0, 0, s*0.5, s*0.5);
    world.ellipse(0, 0, s*0.333, s*0.333);
    world.popMatrix();


    world.pushMatrix();
    world.translate(x, y, z+2000-104);
    //yellow layer
    world.fill(yellow);
    world.ellipse(0, 0, s*0.166, s*0.166);
    world.popMatrix();


    world.pushMatrix();
    world.translate(x, y, z+2000-105);
    //bullseye
    world.fill(black);
    world.ellipse(0, 0, s*0.01, s*0.01);
    world.popMatrix();
  }

  void isHit() {
    //score++
    x = random(-2000+200, 2000-200);
    y = 780;
    z = 0;
    s = random(100, 200);
  }

  void act() {
  }
}
