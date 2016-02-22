private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .5;  
private int grow=0;
private int growY=1;
public void setup() 
{   
  size(640,480);    
  //noLoop(); 
  //frameRate(5);
} 
public void draw() 
{   
  background(0);   
  stroke(50,111,32);   
  line(320+grow,500-growY,320+grow,380-grow);   
  drawBranches(320+grow,380-grow,100+grow,3*Math.PI/2); 

} 
public void keyPressed()
{
  if(key==CODED && keyCode==LEFT)
  branchAngle+=.1;
  if(key==CODED && keyCode==RIGHT)
  branchAngle-=.1;
  if(key==CODED && keyCode==UP)
  {grow++;
  growY--;}
  if(key==CODED && keyCode==DOWN)
  grow--;
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1=angle+branchAngle;
  double angle2=angle-branchAngle;
  branchLength*=fractionLength;
  int endX1, endY1, endX2, endY2;
  endX1=(int)(branchLength*Math.cos(angle1) + x);
    endY1=(int)(branchLength*Math.sin(angle1) + y);
    endX2=(int)(branchLength*Math.cos(angle2) + x);
    endY2=(int)(branchLength*Math.sin(angle2) + y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);

  if(branchLength>smallestBranch)
  {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  } 
  if(branchLength<smallestBranch)
  {
    //stroke(255, 0, 0);
    fill(249, 167, 235);
    ellipse(endX1, endY1, 5, 5);
    ellipse(endX2, endY2, 5, 5);
  }
} 
