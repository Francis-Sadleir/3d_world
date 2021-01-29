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

    pushMatrix();

    fill(grey);
    strokeWeight(5);
    stroke(grey);

    translate(x, y, z);

    //outer white layer
    ellipse(0, 0, s*7, s*7);
    stroke(0);

    //red layer
    fill(red);
    ellipse(0, 0, s*7/6, s*7/6);
    ellipse(0, 0, s*7/5, s*7/5);

    //blue layer
    fill(blue);
    ellipse(0, 0, s*7/4, s*7/4);
    ellipse(0, 0, s*7/3, s*7/3);

    //yellow layer
    fill(yellow);
    ellipse(0, 0, s*7/2, s*7/2);

    //bullseye
    fill(black);
    ellipse(0, 0, s*7/0.1, s*7/0.1);

    popMatrix();
  }
}
