public class Player
{
  private String playerName;
  private int points[];
  private int count;
  
  public Player(String playerName)
  {
    setPlayerName(playerName);
    points=new int[3];
    count=0;
  }
  
  //getter converting player name to upper case
  public String getPlayerName()
  {
    return playerName.toUpperCase();
  }
  
  //setter with length validation for Player name
  public void setPlayerName(String playerName){
   if(playerName.length()<10){
      this.playerName=playerName;
    }
    else{
      this.playerName=playerName.substring(0,10);
    }
  }
  
  
//Method adding current game score to the next element of the array  
  public void addScores(int score)
  {
    if(score>=0){
      points[count]=score;
      count++;
    }
  }

/*Private helper method to calculate the highest score stored in the array, 
used within the Player class in toString method below.
*/
  private int highestScore(){
    int highestScore=points[0];
    for(int i=1;i<count;i++){
      if(points[i]>highestScore){
        highestScore=points[i];
      }
    }
    return highestScore;
  }
   
//String method to print the highest score   
  public String toString(){
    String stats = "\nYour highest score was: "+highestScore();   
    return stats;
  }
}
