void game() {
  world.beginDraw();

  world.textureMode(NORMAL);


  world.background(0);
  //world.background(random(0,255),random(0,255),random(0,255),random(0,255));
  world.pointLight(255, 255, 255, eyex, eyey, eyez); 

  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);

  move();
  //drawAxis();
  drawFloor(-2000, 2000, height, 100);
  //drawFloor(-2000, 2000, height-gridSize*4, 100);
  drawMap();
  //drawInterface();

  if (pkey) {
    mode = PAUSE;
  }
  

  
  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }


  world.endDraw();
  image(world, 0, 0);

  HUD.beginDraw();
  HUD.clear();

  drawCrosshair();
  drawMinimap();
  drawEffects();

  HUD.endDraw();


  image(HUD, 0, 0);
}

void gameClicks() {
}
