void intro() {
  background(black);
  textSize(40);
  fill(255, 0, 0);
  text("Winter In Minecraft", width/2, height/2);

  fill(#00ffff);
  textSize(60);
  text("Click To Begin", width/2, height/2+80);
}



void introClicks() {
  mode = GAME;
}
