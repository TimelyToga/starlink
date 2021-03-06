import java.util.ArrayList;

class Orbital implements Drawable{
  Point center;
  KeplerianContext kContext;
  ArrayList<KeplerianContext> sContexts;
  
  public Orbital(Point center,
    int numSats,
    float phaseOffset,
    float radius,
    float inclination,
    float orientation) {
      this.center = center;
      this.kContext = new KeplerianContext(radius, inclination, orientation, phaseOffset);
      
      // Create kContext for all sats
      this.sContexts = new ArrayList<KeplerianContext>();
      float offsetDelta = radians(360/numSats);
      float curDelta = phaseOffset;
      for(int s = 0; s < numSats; s++){
        this.sContexts.add(new KeplerianContext(radius / 2, inclination, orientation, curDelta));
        curDelta += offsetDelta;
      }
  }
  
  public void draw(float t) {
    // Draw orbital
    pushMatrix();
    stroke(255);
    strokeWeight(2);
    noFill();
    
    rotateX(PI/2);
    rotateZ(kContext.orientation - t);
    //rotateZ(kContext.orientation);
    rotateY(kContext.inclination);
    //translate(0, 0, center.z);
    ellipse(center.x, center.y, kContext.radius, kContext.radius);
    
     // Draw all satellites
     for(KeplerianContext s: this.sContexts) {
       pushMatrix();
       Point satCenter = s.locate(t);
       //rotateY(kContext.orientation);
       translate(cos(s.phaseOffset - t)*s.radius, s.radius*sin(s.phaseOffset - t), 0);
       box(5);
       popMatrix();
     }
    popMatrix();
  }
}
