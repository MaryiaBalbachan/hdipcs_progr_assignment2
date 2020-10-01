public class Flipper
{
  private float xCoord;
  private float yCoord;
  private int flipperWidth;
  private int flipperHeight;
 
  
//getters
  public float getXcoord(){
    return xCoord;
  }
  public float getYcoord(){
    return yCoord;
  }
  public int getFlipperWidth(){
    return flipperWidth;
  }
 //Accessor method for flipper height is not used by the game so there was no need to write the code for it in this particular instance.
  
  
/* setters

Validation is perfomed on user entered Flipper Width, if an invalide value is enetered 
by the Player, width sets to 100 by default
*/
  public void setFlipperWidth(int flipperWidth){
    if((flipperWidth>=50)&&(flipperWidth<=width/2)){
      this.flipperWidth=flipperWidth;
    }
    else{
      this.flipperWidth=100;
    }
  }
  
 // Validation for flipper height with default value of 20.
    public void setFlipperHeight(int flipperHeight){
      if((flipperHeight<=10)&&(flipperHeight<=30)){
        this.flipperHeight=flipperHeight;
      }
      else{
        this.flipperHeight=20;
      }      
    }    
    
      
//Constructor with 2 parameters
    
    public Flipper(int flipperWidth,int flipperHeight){
      setFlipperWidth(flipperWidth);
      setFlipperHeight(flipperHeight);
      xCoord=width/2+(flipperWidth/2)+rectX+rectWidth;
      yCoord=height-this.flipperHeight;
    }
    
//Method draws Flipper on the display window    
    public void displayFlipper(){
      fill(#F4F516);
      noStroke();
      rect(xCoord,yCoord,flipperWidth,flipperHeight);
    }
    
    
/* Method is displaying Flipper at mouseX for xCoord and height-flipperHeight at yCoord, testing for location in relation to the 
shoot on the left and edge of screen on the right  
*/
    public void updateFlipper(){
      xCoord=mouseX-flipperWidth/2;//set xCoord to move with the mouse on the X axis
      if(xCoord<rectX+rectWidth){//allows flipper to move up and over to the left edge to avoid pinball falling back through the shoot
        xCoord=0;
        yCoord=rectY-flipperHeight;
      }      
      else if(xCoord>(width-flipperWidth)){//reset the xCoord if flipper outside the screen on the right
        xCoord=width-flipperWidth;
        yCoord=height-flipperHeight;
      }
      else{
        yCoord=height-flipperHeight;//in any other case reset flipper yCoord to the bottom of the screen
    }
  }
}
