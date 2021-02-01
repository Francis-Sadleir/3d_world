void move() {

  if (akey && canMoveRight()) {
    eyex += cos(leftRightAngle - radians(90))* 10;
    eyez += sin(leftRightAngle - radians(90))* 10;
  }
  if (dkey && canMoveLeft()) {
    eyex += cos(leftRightAngle + radians(90))* 10;
    eyez += sin(leftRightAngle + radians(90))* 10;
  }

  if (wkey && canMoveForward()) {
    eyex += cos(leftRightAngle)* 10;
    eyez += sin(leftRightAngle)* 10;
  }
  if (skey && canMoveBack()) {
    eyex -= cos(leftRightAngle)* 10;
    eyez -= sin(leftRightAngle)* 10;
  }
  if (spacekey) objects.add(new Bullet());

  focusx = eyex + cos(leftRightAngle)*300;
  focusy = eyey + tan(upDownAngle)*300;
  focusz = eyez + sin(leftRightAngle)*300;

  leftRightAngle = leftRightAngle + (mouseX - pmouseX)*0.0085;
  upDownAngle = upDownAngle + (mouseY - pmouseY)*0.0085;

  if (upDownAngle > PI/2.5) upDownAngle = PI/2.5;
  if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;

  if (mouseX > width-2) rbt.mouseMove(3, mouseY);
  if (mouseX < 2) rbt.mouseMove(width-3, mouseY);
  //upDownAngle = upDownAngle-0.01;
}


boolean canMoveForward() {

  float fwdx, fwdy, fwdz;
  int mapx, mapy;


  fwdx = eyex + cos(leftRightAngle)*150;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle)*150;

  mapx = int(fwdx+2000) / gridSize;
  mapy = int(fwdz+2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveBack() {

  float bkwx, bkwy, bkwz;
  int mapx, mapy;


  bkwx = eyex - cos(leftRightAngle)*150;
  bkwy = eyey;
  bkwz = eyez - sin(leftRightAngle)*150;

  mapx = int(bkwx+2000) / gridSize;
  mapy = int(bkwz+2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveRight() {
  float fwdx, fwdy, fwdz;
  int mapx, mapy;


  fwdx = eyex + cos(leftRightAngle - radians(90))* 150;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle - radians(90))* 150;

  mapx = int(fwdx+2000) / gridSize;
  mapy = int(fwdz+2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {

    return false;
  }
}

boolean canMoveLeft() {
  float fwdx, fwdy, fwdz;
  int mapx, mapy;


  fwdx = eyex + cos(leftRightAngle + radians(90))* 150;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle + radians(90))* 150;

  mapx = int(fwdx+2000) / gridSize;
  mapy = int(fwdz+2000) / gridSize;

  if (map.get(mapx, mapy) == white) {
    return true;
  } else {

    return false;
  }
}
