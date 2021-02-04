void pause() {



  noStroke();
  fill(100, 5);
  rect(0, 0, width, height);

  fill(0);
  textSize(100);
  text("PAUSED", width/2, height/2-50);

  fill(0);
  textSize(20);
  text("Click To Un-Pause", 400, 100);


}


void pauseClicks() {
  mode = GAME;
}
