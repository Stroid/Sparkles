ArrayList<Sparkle> Sparkles;

PVector gravity;

ArrayList<Emiter> Emiters;


void setup() {
  size(800, 800);
  noCursor();
  colorMode(HSB);
  smooth();
  Sparkles = new ArrayList();

  gravity = new PVector(0, 0.03);
  
  Emiters = new ArrayList();
  
  for( int i = 0; i < 3; i++){
    Emiters.add(new Emiter(random(width), random(height)));
  }
}

void draw() {
  background(0);

    for( int i = 0; i < Emiters.size(); i++){
      Emiter temp = Emiters.get(i);
      temp.update();
    }

  for (int i = Sparkles.size() - 1; i > -1; i--) {
    Sparkle tempSparkle = Sparkles.get(i);

    if (tempSparkle.dead) {
      Sparkles.remove(tempSparkle);
    } else {
      tempSparkle.update();
      tempSparkle.display();
    }
  }
  
  text(floor(frameRate) + " " + Sparkles.size(), 10, 10);
}

PVector wrap(PVector pos) {
  float x = pos.x;
  float y = pos.y;
  if (x > width)
    x -= width; 
  else if (x < 0)
    x += width;
  if (y > height) 
    y -= height;
  else if (y < 0)
    y += height;

  return new PVector(x, y);
}