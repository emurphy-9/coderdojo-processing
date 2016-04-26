class Bullet
{
   int x;
   int y;
   boolean finished;
 
   Bullet(int x, int y)
   {
     this.x = x;
     this.y = y;
   
     finished = true;
   }
 
   void bulletDraw()
   {
     fill(0, 200, 0);
     rect(x, y, 5, 5);
     x = x + 1 ;
     
     if (x > 800)
     {
       finished = true;
     }
   }
  
   
}