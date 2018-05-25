// UP/DOWN ARROW = grid wider/denser
// LEFT/RIGHT ARROW = dots smaller/bigger;
// SHIFT = bigger increments in value changes
// SPACE = new grid
// r = reset
// s = save frame
// t = toggle between squares and ellipses
// q = toggle between random sizes and equal sizes


float r, offset, myVar;
boolean shiftDown, drawRect, randSize;


void setup() {
  size(1920, 1080);
  background(255);
  fill(0);
  noStroke();
  rectMode(CENTER);
  frameRate(12);

  offset = 15;
  r = 5;
  shiftDown = false;
  drawRect = false;
  randSize = true;

  grid();
}


void draw() {
  // background(255);
  // grid();
}


void grid() {
  for (int x = int(offset / 2); x < width; x += offset) {
    for (int y = int(offset / 2); y < width; y+= offset) {
      float rad = r;
      if (randSize) {
        rad = random(r);
      }
      if (drawRect) {
        rect(x, y, rad, rad);
      } else {
        ellipse(x, y, rad, rad);
      }
    }
  }
}


void keyPressed() {
  //println(keyCode);
  if (keyCode == SHIFT) {
    shiftDown = true;
  }
  // t
  if (keyCode == 84) {
    drawRect = !drawRect;
    background(255);
    grid();
  }
  // q
  if (keyCode == 81) {
    randSize = !randSize;
    background(255);
    grid();
  }
  if (keyCode == 32) {
    background(255);
    grid();
  }
  // arrow up
  if (keyCode == 38) {
    if (shiftDown) {
      offset += 10;
    } else {
      offset += 1;
    }
    background(255);
    grid();
  }
  // arrow down
  if (keyCode == 40) {
    if (shiftDown) {
      offset -= 10;
    } else {
      offset -= 1;
    }
    background(255);
    grid();
  }
  // arrow left
  if (keyCode == 39) {
    if (shiftDown) {
      r += 10;
    } else {
      r += 1;
    }
    background(255);
    grid();
  }
  // arrow right
  if (keyCode == 37) {
    if (shiftDown) {
      r -= 10;
    } else {
      r -= 1;
    }
    background(255);
    grid();
  }
  // s
  if (keyCode == 83) {
    saveFrame("renders/grid.png");
  }
  // r
  if (keyCode == 82) {
    offset = 15;
    r = 5;
    background(255);
    grid();
  }
}


void keyReleased() {
  if (keyCode == SHIFT) {
    shiftDown = false;
  }
}
