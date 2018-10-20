// Math model by Vasista Ayyagari. Contact vasista1997@gmail.com

class System{
  Mass M1;
  Mass M2;
  Spring S1;
  Spring S2;
  Spring S3;
  float d1;
  float d2;
  float angle;
  
  void init(Mass M1, Mass M2, Spring S1, Spring S2, Spring S3){
    this.M1 = M1;
    this.M2 = M2;
    this.S1 = S1;
    this.S2 = S2;
    this.S3 = S3;
    
    this.angle = atan2(this.S1.start_position.y - this.S3.end_position.y,
    this.S1.start_position.x - this.S3.end_position.x);
  }
  
  void applyDeflection(float d1, float d2){
    this.d1 = d1;
    this.d2 = d2;
    
  }
  
  void update(){
    
    // Use standard Dynamics Techniques like langrangian or energy approach to obtain the accelerations of each body
    this.M1.acceleration.x = (-(this.S1.stiffness + this.S2.stiffness)*this.d1 + this.S2.stiffness*this.d2 - this.S1.damping*this.M1.velocity.x - 
    this.S2.damping*(this.M1.velocity.x - this.M2.velocity.x))/(this.M1.mass);
    this.M2.acceleration.x = (-(this.S2.stiffness+this.S3.stiffness)*this.d2 + this.d1*this.S2.stiffness - this.S3.damping*this.M2.velocity.x + 
    this.S2.damping*(this.M1.velocity.x - this.M2.velocity.x))/(this.M2.mass);
    // Use kinematic equations to obtain Positions and Velocities of the Bodies. We can integrate accelerations with initial conditions to obtain Position and Velocity
    this.M1.position.x += this.M1.velocity.x/60 + this.M1.acceleration.x/7200;
    this.M2.position.x += this.M2.velocity.x/60 + this.M2.acceleration.x/7200;
    this.M1.velocity.x += this.M1.acceleration.x/60;
    this.M2.velocity.x += this.M2.acceleration.x/60;
    println(this.M1.acceleration.x);
    println(this.M2.acceleration.x);
    this.d1 = this.M1.position.x - this.M1.initial_position.x;
    this.d2 = this.M2.position.x - this.M2.initial_position.x;
    
    this.S1.update(this.S1.start_position.x, this.S1.start_position.y, this.M1.position.x - this.M1.size/2, this.M1.position.y);
    this.S2.update(this.M1.position.x + this.M1.size/2, this.M1.position.y, this.M2.position.x - this.M2.size/2, this.M2.position.y);
    this.S3.update(this.M2.position.x + this.M2.size/2, this.M2.position.y, this.S3.end_position.x, this.S3.end_position.y);
  }
  
  void show(){
    this.M1.show();
    this.M2.show();
    this.S1.show();
    this.S2.show();
    this.S3.show();
  }
}