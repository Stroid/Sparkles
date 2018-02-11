class Emiter {
  PVector pos;

  Emiter(float x, float y) {
    this.pos = new PVector(x, y);
  }
  void update() {
    
    PVector step = PVector.random2D();
    if (random(1) > .85)
      step.mult(20.0);
    else
      step.mult(2.0);

    pos.add(step);
    pos.set(wrap(pos));

    for (int i = 0; i < 5; i++) {
      Sparkles.add(new Sparkle(pos.x, pos.y));
    }
  }
}