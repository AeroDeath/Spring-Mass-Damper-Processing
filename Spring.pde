class Spring{
  PVector start_position = new PVector(0,0);
  PVector end_position = new PVector(0,0);
  float angle;
  int num_turns;
  float breadth;
  float stiffness;
  float length_of_turn;
  float damping;
  
  void init(int num_turns, float breadth, float stiffness, float damping,
  float start_x, float start_y, float end_x, float end_y){
    this.num_turns = num_turns;
    this.breadth = breadth;
    this.stiffness = stiffness;
    this.damping = damping;
    this.start_position = new PVector(start_x, start_y);
    this.end_position = new PVector(end_x, end_y);
    this.angle = atan2(this.start_position.y - this.end_position.y,
    this.start_position.x - this.end_position.x);
    this.length_of_turn = this.start_position.dist(this.end_position)/this.num_turns;
  }
  
  void update(float start_x, float start_y, float end_x, float end_y){
    this.start_position = new PVector(start_x, start_y);
    this.end_position = new PVector(end_x, end_y);
    this.angle = atan2(this.start_position.y - this.end_position.y,
    this.start_position.x - this.end_position.x);
    this.length_of_turn = this.start_position.dist(this.end_position)/this.num_turns;
  }
  
  void show(){
    
    this.drawEnds();
    this.drawCoil();
    
  }
  
  void drawEnds(){
    strokeWeight(2);
    line(this.start_position.x + this.breadth*cos(this.angle - PI/2)/2,
    this.start_position.y + this.breadth*sin(this.angle - PI/2)/2,
    this.start_position.x + this.breadth*cos(this.angle + PI/2)/2,
    this.start_position.y + this.breadth*sin(this.angle + PI/2)/2);
    
    strokeWeight(2);
    line(this.end_position.x + this.breadth*cos(this.angle - PI/2)/2,
    this.end_position.y + this.breadth*sin(this.angle - PI/2)/2,
    this.end_position.x + this.breadth*cos(this.angle + PI/2)/2,
    this.end_position.y + this.breadth*sin(this.angle + PI/2)/2);
  }
  
  void drawCoil(){
    strokeWeight(2);
      
      int half_coil = 1;
      
      while(half_coil < 2*this.num_turns + 1){
      line(this.start_position.x + this.breadth*cos(this.angle - PI/2)/2 - this.length_of_turn * cos(this.angle) * (half_coil-1)/2,
      this.start_position.y + this.breadth*sin(this.angle - PI/2)/2 - this.length_of_turn * sin(this.angle) * (half_coil-1)/2,
      this.start_position.x + this.breadth*cos(this.angle + PI/2)/2 - this.length_of_turn * cos(this.angle) * half_coil/2,
      this.start_position.y + this.breadth*sin(this.angle + PI/2)/2 - this.length_of_turn * sin(this.angle) * half_coil/2);
      half_coil+=1;
      line(this.start_position.x + this.breadth*cos(this.angle + PI/2)/2 - this.length_of_turn * cos(this.angle) * (half_coil-1)/2,
      this.start_position.y + this.breadth*sin(this.angle + PI/2)/2 - this.length_of_turn * sin(this.angle) * (half_coil-1)/2,
      this.start_position.x + this.breadth*cos(this.angle - PI/2)/2 - this.length_of_turn * cos(this.angle) * half_coil/2,
      this.start_position.y + this.breadth*sin(this.angle - PI/2)/2 - this.length_of_turn * sin(this.angle) * half_coil/2);
      half_coil+=1;
      }
      
  }
}