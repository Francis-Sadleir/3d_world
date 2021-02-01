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
    y = 775;
    z = 0;
    s = random(10,50);
  }



  void show() {//float x, float y, float z, float s) {

     world.pushMatrix();

     world.fill(grey);
     world.strokeWeight(5);
     world.stroke(grey);

     world.translate(x, y, z);

    //outer white layer
     world.ellipse(0, 0, s*7, s*7);
     world.stroke(0);

    //red layer
     world.fill(red);
     world.ellipse(0, 0, s*7/6, s*7/6);
     world.ellipse(0, 0, s*7/5, s*7/5);

    //blue layer
     world.fill(blue);
     world.ellipse(0, 0, s*7/4, s*7/4);
     world.ellipse(0, 0, s*7/3, s*7/3);

    //yellow layer
     world.fill(yellow);
     world.ellipse(0, 0, s*7/2, s*7/2);

    //bullseye
     world.fill(black);
     world.ellipse(0, 0, s*7/0.1, s*7/0.1);

     world.popMatrix();
  }
}
