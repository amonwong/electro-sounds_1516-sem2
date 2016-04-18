//CONTROL
void keyPressed() {
 switch(key) {
   case('1'):
   for (Box box : boxes) {
     box.change(0, 0.2);
   }
   break;
   case('2'):
   for (Box box : boxes) {
     box.change(random(5, 30), 0.02);
   }
   break;
   case('3'):
   for (Box box : boxes) {
     box.change(random(10, 30), 0.001);
   }
   break;
 }
}