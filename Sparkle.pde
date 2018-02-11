class Sparkle {
  PVector pos, vel, acc;
  float size, lerp;
  color c1, c2;

  boolean dead;
  Sparkle(float x, float y) {
    this.pos = new PVector(x, y);
    this.vel = new PVector(0, 0);
    this.acc = new PVector(0, 0);


    lerp = 0;
    if (random(1) > .75) {
      this.size = random(2, 5);
    } else {
      this.size = random(1, 2);
    }
    this.c1 = #FFE600;//FFF700;
    this.c2 = #FF5500;

    this.dead = false;

    PVector force = PVector.fromAngle(random(0, TWO_PI));
    if  (random(1) > 0.75) {
      force.setMag(random(0.1, 0.5));
    } else {
      force.setMag(.1);
    }
    addForce(force);
  }

  void update() {
    this.vel.add(acc);
    this.pos.add(vel);
    this.acc.mult(0);
    wrap();


    addForce(gravity);
    lerp+= 0.0075;

    size -= 0.02;
    if (size < 0) {
      size = 0;
      this.dead = true;
    }

    if (this.pos.y > height) {
      this.dead = true;
    }
  }

  void display() {
    stroke(lerpColor(this.c1, this.c2, lerp));
    strokeWeight(this.size);
    point(this.pos.x, this.pos.y);
  }

  void wrap() {
    if (pos.x > width) {
      pos.x -= width;
    } else if (pos.x < 0) {
      pos.x += width;
    }
  }

  void addForce(PVector force) {
    this.acc.add(force);
  }
}