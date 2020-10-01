import javax.swing.*;//Importing Swing library for JOptionPane
import processing.sound.*;//Importing Sound library for game sound effects

SoundFile startSound;//sound objects required for the game
SoundFile wallColl;
SoundFile flipperColl;
SoundFile targetHit;
SoundFile gameOver;
//Declaration of objects
Player player;
Pinball pinball;
Flipper flipper;
int diameterCircle=50;
Circle circle[];//array of circles of class Circle

//Starting shoot location
float rectX=40.0;//shoot location x
float rectY=700.0;//shoot location y
float rectWidth=20.0;
float rectHeight=100.0;

int livesLost=0;
int points=0;
int level=0;
int maxLivesPerGame=5;

int numberOfGames=3;
int gamesPlayed=0;

int diameterSmall=25;//red circle diameter
int time;
int flipperWidth;


void setup() {
 
  surface.setLocation(0, 0); //left top hand side for the output screen
  size(500, 800);
  noCursor();
  
 //Welcome message, user inputs player name
  JOptionPane.showMessageDialog(null, "Welcome to Pinball!!");
  player = new Player(JOptionPane.showInputDialog
  ("Please enter the Player name (max 10 chars)\n\nNames 'Pinball King' and 'I Love Arcades' is already taken"));
  
  //User defined Flipper Width
  flipperWidth=Integer.parseInt(JOptionPane.showInputDialog
  ("Hi "+player.getPlayerName()+
  "\nPlease enter the desired width of the Flipper (between 50 and 250):\n\nRemember, the SMALLER the Flipper the HIGHER the Points!",100));
  
//Initialising new object class Flipper with Width defined by the Player and hard coded height.
  flipper=new Flipper(flipperWidth,20);
  
  //check for validation within the Flipper class, determine level according to what has been passed in for Flipper Width
  if((flipper.getFlipperWidth()>=50)&&(flipper.getFlipperWidth()<=80)){
    level+=3;
  }
  else if((flipper.getFlipperWidth()>80)&&(flipper.getFlipperWidth()<=120)){
    level++;
  } 
  else{
    level=0;
  }
  
  //creating sound objects for the game
  startSound=new SoundFile(this,"fireball.mp3");  
  wallColl=new SoundFile(this,"mario2.mp3");
  flipperColl=new SoundFile(this,"whip.mp3");
  targetHit=new SoundFile(this,"bell.mp3");  
  gameOver=new SoundFile(this,"gameover.mp3");
  
  startSound.play();//loading sound 
  
  circle=new Circle[8];//initialising array of circles size 8.
  pinball=new Pinball(20.0);
  time=millis();
  
  
//Storing X and Y coordinates and diameter for the array of circles using 2 For loops 
  for (int i=0; i<circle.length/2; i++) {
    circle[i]=new Circle(i*150, 150, diameterSmall);//passing values into array of circles (horizontal row)
  }
  for(int i=circle.length/2;i<circle.length;i++){
    circle[i]=new Circle(250,i*100,diameterSmall);//passing value into array of circles (vertical row)
  }
}


void draw() {
  
  background(0);  
  
//drawing 3 circular obstacles with a bumper using a While loop at 3 different locations on the screen  
  int j=0;
  while(j<3){
    fill(255,0,0);
    ellipse(j*width/2, height/3, diameterCircle+50, diameterCircle+50);
    fill(0,255,0);
    noStroke();
    ellipse(j*width/2, height/3, diameterCircle, diameterCircle);
    j++;
  }
  
  
//Drawing the shoot with hard coded values for parameters   
  fill(#0C11F2);
  stroke(#0C11F2);
  rect(rectX, rectY, rectWidth, rectHeight);
  
//text output to screen for scores, level and Player name
  textSize(24);
  fill(255);
  text(player.getPlayerName(),300,40);
  text("Points: "+points, 200, 100);
  text("Level: "+level,200,70);
  
//show "Initialising.." for 0.8 a second
  if(millis()<time+800){
    text("Initialising..",20,100);    
  }
  
//Update Flipper location and display in that new location
  flipper.updateFlipper();
  flipper.displayFlipper();

/*Testing for life loss. If the pinball has left the screen on the bottom, record lives lost, reset pinball 
at the launch position (private helper method within Pinball Class
*/
  if (pinball.updatePinball()==true) {    
    livesLost++;     
   }   

  else if (livesLost<maxLivesPerGame) {  //if the Player still has lives left reset the pinball    
    pinball.displayPinball();   
  }
//If player has no Lives left add score for the current game to the points[] array in Player class, increment gamesPlayed  
  else {
    player.addScores(points);
    gamesPlayed++;
    if(gamesPlayed<numberOfGames){//If player still has games left to play ask whether he/she wants to continue or leave the game early
      gameOver.play();
      int nextGame=JOptionPane.showConfirmDialog(null,
            "Game Over!"+"\n\nYou scored: " + points +"\nLives lost: "+livesLost+"\nLevel played: "+level+"\nYou have "+(numberOfGames-gamesPlayed)+
            " game(s) left to play ","Play next game?",JOptionPane.YES_NO_OPTION);
         if(nextGame==JOptionPane.YES_OPTION){//If player wants to continue reset points and lives to 0 for the new game
           points=0;
           livesLost=0;            
         }
         else{//otherwise show final statistics and exit the game
           gameOver.play();
           gameOver();                  
         }
    }                        
     else{//otherwise show final statistics and exit the game
       gameOver.play();
       gameOver();    
  }
}

/*test for collision with Flipper, if thrue pinball changes direction along the Y-axis as well as 
adding 50 pixels to the YCoord to create an effect of Pinball jumping up after having been hit.
*/
  boolean collisionFlipper=hitFlipper(flipper, pinball);
  if (collisionFlipper==true) {
    flipperColl.play();
    pinball.collisionFlipper();      
    }
    
  boolean collisionShoot=hitShoot(pinball);//test for collision with shoot, reverse direction if collision detected
  if (collisionShoot==true) {
    pinball.collision();
  }  
  
  for (int i=0; i<circle.length; i++) {  //display array of circles, colour depends on mouse movement    
    circle[i].colour(mouseX,0,mouseY);
    circle[i].display();
  }
//test for obstacle collision with small and large circular objects  
  collisionSmallCircle();
  collisionLargeCircle();   
}




/*Method checks for collision with Flipper using the Pythagoras theorem. Checks the position of the pinball and 
flipper as well as flipper width by calling accessors from class Pinball and Flipper and 
compares the distance between the objects
*/
boolean hitFlipper(Flipper flipper, Pinball pinball)
{
  float flipperDistanceX=abs(pinball.getXcoord()-flipper.getXcoord()-flipper.getFlipperWidth()/2);
  float flipperDistanceY=abs(pinball.getYcoord()-flipper.getYcoord());

  if (flipperDistanceY>(pinball.getDiameter()/2)) {
    return false;
  } 
  else if (flipperDistanceX>(flipper.getFlipperWidth()/2+pinball.getDiameter()/2)) {
    return false;
  }
  return true;
} 



/*Methods checks for collision with the shoot through accessing Pinball location and comparing to 
the shoot location. If the Pinball is above and outside the shoot, return false, if the pinball 
touches the shoot the method returns true
*/
boolean hitShoot(Pinball pinball)
{
  float pinballX=pinball.getXcoord()+pinball.getDiameter()/2;
  float pinballY=pinball.getYcoord()+pinball.getDiameter()/2;  
  if ((pinballX<=rectX)&&(pinballY>rectY)) {
    return false;
  }
  else if (pinballX>rectX+rectWidth) {
    return false;
  }
  else if ((pinballY<rectY)) {
    return false;
  } 
  else{
    
    return true;
  }
}  

/* The following method test for Pinball collision with small and large circles using the Pythagoras theorem.
Using a For loop to go through 3 circles coordinates and a accessor form the Pinball class this method when called
adds points and reverses Pinball directions as well as increasing speed.
*/
void collisionLargeCircle(){
  for(int k=0;k<3;k++){
    float a=abs(pinball.getXcoord()-k*width/2);
    float b=abs(pinball.getYcoord()-height/3);    
    if((pow(a,2)+pow(b,2))<=(pow((diameterCircle/2+pinball.getDiameter()/2),2))){      
      background(#F20CC8); 
      targetHit.play();
      points+=12;
      pinball.collision();
    }
  }
}
    
/*This method tests for collision with small circles by checking the coordinated of each element of the array
and the Pinball. It also checks for FlipperWidth and adds points accordingly. 
*/
void collisionSmallCircle() {
  for (int i=0; i<circle.length; i++) { 
    float a=abs(pinball.getXcoord()-circle[i].getXcoord());
    float b=abs(pinball.getYcoord()-circle[i].getYcoord());    
    if ((pow(a, 2)+pow(b, 2))<(pow((diameterSmall/2+pinball.getDiameter()/2), 2))) {         
      targetHit.play();
      pinball.collision();
      if(flipper.getFlipperWidth()<=80){
      points+=10;        
    }
      else if((flipper.getFlipperWidth()>80)&&(flipper.getFlipperWidth()<=120)){
    points+=5;
    }   
      else{
        points++;
      }
  }
}      
}

void gameOver()
{
  JOptionPane.showMessageDialog(null, player.getPlayerName() + ", your pinball adventure is over! \n"  
  + "\n\nNumber of games played: " + gamesPlayed +"\nYou played at level: "+level+player.toString());                            
   exit(); 
}
