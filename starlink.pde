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
  size(600, 480, P3D);
  
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
  translate(300, 240, -800);
  
  //// Orbitals
  //pushMatrix();

  
  ////// All orbitals need these rotations 
  ////for(float a = -PI; a < PI; a += radians(phaseOneRotationOffset)) {  
  ////  pushMatrix();
  ////  //rotateX(radians(15));
  ////  rotateX(PI/2);
  ////  rotateZ(a - t);
  ////  rotateY(radians(20));
  ////  ellipse(0, 0, phaseOneSize, phaseOneSize);
  ////  popMatrix();
  ////}
  ////rotateY(15);
  //popMatrix();
  for(Orbital o: orbitals) {
    o.draw(t);
  }
  
  // Rotate Earth
  //pushMatrix();
  fill(100, 45, 180);
  rotateY(t);
  noStroke();
  sphere(earthSize);
  //popMatrix();
    
  t += 0.007;
}
