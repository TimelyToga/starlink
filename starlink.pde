float t = 0;

int numOrbitals = 24;
float earthSize = 250;
float phaseOneOffset = 100;
float phaseOneSize = (earthSize + phaseOneOffset) * 2;

void setup() {
  size(600, 480, P3D);
}

void draw() {
  lights();
  background(0, 0, 100);
  
  // Center Earth
  translate(300, 240, -500);

  float phaseOneRotationOffset = 360 / numOrbitals;
  stroke(255);
  noFill();
  rotateY(t);
  pushMatrix();
  rotateX(PI/2);
  for(int a = 0; a < numOrbitals; a++) {  
      stroke(255);
      ellipse(0, 0, phaseOneSize, phaseOneSize);
      rotateY(radians(15));
      rotateZ(radians(phaseOneRotationOffset));
      //rotateX(phaseOneRotationOffset);
  }
  //rotateY(15);
  popMatrix();
  
  // Rotate Earth
  //pushMatrix();
  fill(0);
  rotateY(t);
  sphere(earthSize);
  //popMatrix();
    
  t += 0.01;
}
