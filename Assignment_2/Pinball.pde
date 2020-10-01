public class Pinball
{
  private float xCoord;
  private float yCoord;
  private float diameter;
  private float speedX;
  private float speedY;
  

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
 
 //setter
 
 public void setDiameter(float diameter){ //check for reasonable value
   if((diameter>=10)&&(diameter<=30)){
     this.diameter=diameter;
   }
   else{
     this.diameter=20;
   }
 }  
    
//Constructor with parameter diameter    
 public Pinball(float diameter){
   setDiameter(diameter);
   resetPinball();     
    }  
    
    
//Method to draw a pinball on the display window    
 public void displayPinball(){
      fill(255);
      noStroke();
      ellipse(xCoord,yCoord,diameter,diameter);
    }

/*Private helper method used in the constructor. Resets the ball in the left bottom corner,
with random speed along the Y coord.
*/
 private void resetPinball(){      
   xCoord=5;
   yCoord=height;
   speedX=1;
   speedY=random(-10,-5);//moving up along y axes
   startSound.play();//reloading pinball sound    
    }
    

//boolean method, updates the pinball position and returns True if pinball leaves the bottom of the screen    
 public boolean updatePinball(){
   boolean lifeLost=false;
   xCoord=xCoord+speedX;
   yCoord=yCoord+speedY;
      
    if(yCoord>height+diameter/2){//pinball leaves screen on the bottom, returns lifeLost True
      resetPinball();//reloads pinball at the launch position
      lifeLost=true;
    }
    else if(yCoord<diameter/2){//hits top, reverse direction on Y-axis
      yCoord=diameter/2;
      speedY=speedY*-1;
      wallColl.play();
    }
    else if(xCoord<diameter/2){//hits left side and bounces, reverse direction on the X-axis
      xCoord=diameter/2;
      speedX=speedX*-1;
       
    }
    else if(xCoord>width-diameter/2){//hits right side and bounces, reverse direction on the X-axis
      xCoord=width-diameter/2;
      speedX=speedX*-1;
        
     }
           
    return lifeLost;
    }    
/*pinball changes direction and bounces back only along the Y axis, -20 pixels gives it an effect of having 
been hit by the flipper. The Pinball tends to stay on the left handside of the screen, so I'm addind +20 to xCoord
to make it move more to the right
*/
 public void collisionFlipper(){
   speedY*=-1;  
   xCoord+=speedX+20;
   yCoord+=speedY-20;
}


/* pinball changes direction upon collision with an object along both X and Y axis, as the pinball hits different
obstacles its speed increases 
*/
 public void collision(){  
   speedY*=-1.2;
   yCoord+=speedY;
   speedX*=-1.2;
   xCoord+=speedX;
 }
}
