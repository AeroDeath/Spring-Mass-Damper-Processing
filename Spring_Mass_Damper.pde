Spring A = new Spring();
Spring B = new Spring();
Spring C = new Spring();
Mass D = new Mass();
Mass E = new Mass();
System S = new System();

void setup(){
  size(720, 720);
  D.init(5, 240, 360, 100);
  E.init(5, 480, 360, 100);
  A.init(10, 50, 1000, 10, 10, 360, 215, 360);
  B.init(10, 50, 1000, 10, 265, 360, 455, 360);
  C.init(10, 50, 1000, 10, 505, 360, width - 10, 360);
  S.init(D, E, A, B, C);
  println(degrees(A.angle));
  S.applyDeflection(100, -100);
}

void draw(){
  background(255);
  S.update();
  S.show();
}