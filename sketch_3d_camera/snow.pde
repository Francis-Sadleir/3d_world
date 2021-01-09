class Snowflake { //<>//

  //1. Instance variables: the data that each snowflake
  //                       needs to keep track of.
  float x, y, z, size, speed;

  //2. Constructor(s): initializes the instance variables.
  //   Rules: no return type (void), name matches class
  Snowflake() {
    x = random(-4000, 4000);
    y = 0;
    z = random(-4000, 4000);
    size = random(3, 10);
    speed = size;
  }

  //3. Behaviour Functions: functions that describe how
  //                        Snowflakes act and look.
  void act() {
    y = y + speed;
    if (y > height) {
      y = 0;
      x = random(-4000, 4000);
      z = random(-4000, 4000);
    }
  }

  void show() {
    rect(x, y, z, size, size);
  }
}
