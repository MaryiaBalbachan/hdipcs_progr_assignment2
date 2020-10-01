public class Circle
{
  private float xCoord;
  private float yCoord;
  private float diameter;
  private int red;
  private int green;
  private int blue;
  
  
//getters  
  public float getXcoord(){
    return xCoord;
  }
  public float getYcoord(){
    return yCoord;
  }
  public float getDiameter(){
    return diameter;
  }
  
 //Class constructor with 3 parameters 
  public Circle(float xCoord,float yCoord, float diameter){
    this.xCoord=xCoord;
    this.yCoord=yCoord;
    this.diameter=diameter;
  }
  
  //Display method 
  public void display(){    
    ellipse(xCoord,yCoord,diameter,diameter);
  
  }
  //Colour method
  public void colour(int red, int green, int blue){
    this.red=red;
    this.green=green;
    this.blue=blue;
    fill(red,green,blue);
  }
}
