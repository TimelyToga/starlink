import java.util.ArrayList;

float t = 0;

int numOrbitals = 24;
int numSats = 50;
float earthSize = 250;
float phaseOneOffset = 100;
float phaseOneRadius = (earthSize + phaseOneOffset) * 2;
float phaseOneRotationOffset = radians(360 / numOrbitals);
float phaseOneInclination = radians(22.5);

ArrayList<Orbital> orbitals;

Point center() {
 return new Point(0, 0, 0); 
}

void setup() {
  size(800, 640, P3D);
  smooth(4);
  
  orbitals = new ArrayList<Orbital>();
  
  for(float a = -PI; a < PI; a += phaseOneRotationOffset) {
    orbitals.add(new Orbital(center(),
      numSats,
      0.0,
      phaseOneRadius,
      phaseOneInclination,
      a));
  }
}

void draw() {
  lights();
  background(0, 0, 100);
  
  // Center Earth
  translate(400, 320, -300);
  
  for(Orbital o: orbitals) {
    o.draw(t);
  }
  
  // Earth
  fill(100, 45, 180);
  rotateY(t);
  noStroke();
  sphere(earthSize);

  // Earth cube
  noFill();
  stroke(255);
  box(earthSize * 3);
    
  t += 0.004;
}
