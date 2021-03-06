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
    float curOffset = phaseOffset + t;
    float x = (radius) * sin(inclination) * cos(orientation);
    float y = (radius) * sin(inclination) * sin(orientation);
    float z = (radius) * cos(inclination);

    return new Point(x, y, z); 
  }
}
