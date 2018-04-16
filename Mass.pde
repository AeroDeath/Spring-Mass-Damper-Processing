class Mass{
  PVector position = new PVector();
  PVector initial_position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  float mass;
  float size;
  
  void init(float mass, float x_position, float y_position, float size){
    this.position = new PVector(x_position, y_position);
    this.velocity = new PVector(0,0);
    this.initial_position = new PVector(x_position, y_position);
    this.acceleration = new PVector(0,0);
    this.size = size;
    this.mass = mass;
  }
  
  void show(){
    rectMode(CENTER);
    rect(this.position.x, this.position.y, this.size, this.size);
  }
  
}