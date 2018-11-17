class KeplerianContext {
  float radius;
  
  // Theta in Polar coordinates
  float inclination;
  
  // Phi in polar coordinates
  float orientation;
  
  float phaseOffset;
  
  // angles in radians
  public KeplerianContext(float radius, float inclination, float orientation, float phaseOffset){
    this.radius = radius;
    this.inclination = inclination;
    this.orientation = orientation;
    this.phaseOffset = phaseOffset;
  }
  
  public Point locate(float t) {
    return new Point(0, 0, 0); 
  }
}
