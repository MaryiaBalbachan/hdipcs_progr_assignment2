/* Reflection

Name : Maryia Balbachan

Student Number:20029834
Video link https://youtu.be/6fpPQi_cSv4 


Part A - Mark (5 /5)
-----------------------------
Having reviewed my work against the rubric provided, in relation to inclusion
of the Readme and Reflection files and my Video following the structure outlined,
I am scoring myself an excellent mark of 100%. 5/5.


Part B - Mark (5 /5)
-----------------------------
Having reviewed my work against the rubric provided, in relation to naming (meaningful CamelCase names for Methods 
and Variables),commenting (single and multiple lines, every method described) and indentation, 
I am scoring myself an excellent mark of 100%. 5/5.


Part C - Mark (3 /5)
-----------------------------
Use of if and loop statements:

I have used multiple if statements (multiple branches and nested), several for loops and 1 while loop.
I haven't used any while do loops in my programme. I'm recording a very good mark for this part: 69%. 3/5

IF statements:
Main Sketch
line 55:       multiple branches to validate user input for FlipperWidth
line 118:      single statement using (millis) for text display
lines 129-154: multiple branches and nested statements to increment LivesLost, determine whether Player still 
               has lives and games left to play. If yes, give an option to continue or exit. If no lives and 
               games left to GameOver and final stats.
line 164:      single statement testing for boolean condition.
line 170:      single statement testing for boolean condition.
line 195:      branched statement within a boolean method to test for collision with Flipper.
line 214:      branched statement within a boolean method to test for collision with launch shoot.
   
Flipper Class
line 28:       branched statement within the setter to validate flipperWidth entered by Player.
line 38:       branched statement within the setter to validate flipperHeight hardcoded in the main sketch.
line 69:       multiple branches to check and update Flipper position on the screen.

Pinball Class
line 24:       branched statement within the setter to validate pinball diameter hardcoded in the main sketch.
line 64:       multiple branches to check and update Pinball position on the screen.

Player Class
line 22:       branched statement within the setter to validate Player name entered by Player.

FOR Loops:
Main Sketch
line 80,83:    single for loop to pass in parameters into the Array of class Circle.
line 175:      single for loop to display and colour the array of circles.
line 234:      nested if statement within a for loop to test for collision with Large circles.
line 250:      double nested if statements within a for loop to check for collision with the array of small
               circles and award different points depending on flipperWidth entered by Player.

Player Class
line 45:       nested if within a for loop, method determines the highest score.

WHILE loop:
Main sketch
line 95:       single while loop to display large circles.


Part D - Mark (3 /5)
-----------------------------
Working game with inclusion of bespoke methods in the main sketch.
I have a working game, that draws several obstacles that the player is trying to hit to earn points. Pinball bounces
off the obstacle, edges of the screen and Flipper, changes direction, sound and light effects are triggered by collision 
detection. I haven't used collision avoidance, hence I score myself a Good mark:59%. Rounded up to 3/5

bespoke methods:
line 190:      hitFlipper method, detects collision with Flipper, Pinball bounces up.
line 210:      hitShoot method, detects collision with launch shoot, Pinball bounces off.
line 233:      collisionLargeCircle method, detects collision with large circles, Pinball bounces off, targeHit sound 
               plays, background colour flashes, points are earned.
line 249:      collisionSmallCircle method, detects collision with small circles, Pinball bounces off, points earned
               according to FlipperWidth.
               
               

Part E1 - Mark (6 /10)
-----------------------------
User-defined class with appropriate fields, constructors, getters, setters

I am using 4 user defined classes. I have declared them using overloaded constructors taking parameters. 
I score myself Good for this part: 59%. Rounded up to 6/10.

line 43:         object player, taking a String parameter entered by Player.
line 52:         object flipper, taking user defined Width parameter.
line 74:         array of object class Circle, fixed size.
line 75:         object pinball with hardcoded parameter diameter.

I have created appropriate accessors and mutators within the class where needed.
line 48,113:     player name accessor is used to printout player greeting.
line 55-58:      flipperWidth accessor is used to determine game level.
line 190:        accessors for Pinball xCoord, yCoord and diameter as well as accessor for FlipperWidth are used 
                 within a method to determine whether Flipper and Pinball overlap, i.e. collide.
line 210:        accessors for Pinball xCoord, yCoord and diameter are used within a method to check for collision with
                 the launch shoot.
line 233:        accessors for Pinball xCoord, yCoord and diameter are used within a method to check for collision with
                 large circles. 
line 249:        accessors for Pinball xCoord, yCoord and diameter are used within a method to check for collision with
                 small circles.
line 269:        accessor for Player name is used for JOptionPane message.

Class Flipper:
line 49:         mutators with validation clause are used in the Flipper constructor for flipperWidth and Height.
Class Pinball:
line 33:         mutator for Pinball diameter is used in the Pinball constructor after it passes validation clause.
Class Player:
line 9:          mutator for Player Name is used in the Player constructor after being checked for length.




Part E2 - Mark (10 /15)
-----------------------------

Class bespoke methods:

I have used several Class bespoke methods throughout the game, 2 take a parameter, 3 return values. I am scoring myself
a Very Good mark for this section: 65%. Rounded up to 10/15

Class Circle:
line 35:        circle.colour() takes in parameters, called in line 175 in the main sketch. Returns no value.
Class Flipper:
line 67:        flipper.updateFlipper() takes no parameters, has branched IF statements, called in line 123. 
                Returns no value.
Class Pinball:
line 59:        pinball.updatePinball() takes no parameters, has branched IF statements, called in line 129. 
                Returns a boolean value.
Class Player:
line 32:        player.addScores() takes 1 parameter type int, has a single If statement, called in line 138. 
                Returns no value.
line 43:        player.highestScore() takes no parameters, has a nested in Loop statement, called in line 55 in the Class sketch. 
                Returns value type int.
line 54:        player.toString() takes no parameters, called in line 272. Returns value class String.

Part E3 - Mark (9 /15)
-----------------------------

The user-defined class(es) are used in an appropriate manner

I have multiple user-defined classes in the game. However, I make only a single object declaration for each of them. I use 
overloaded constructors that take parameters. I also use getters/setters appropriately.
I'm scoring myself a Good mark for this section: 59%. Rounded up to 9/15

line 43:         object player, taking a String parameter entered by Player.
line 52:         object flipper, taking user defined Width parameter.
line 74:         array of object class Circle, fixed size.
line 75:         object pinball with hardcoded parameter diameter.

line 10:         player class Player;
line 11:         pinball class Pinball;
line 12:         flipper class Flipper;
line 14:         array of class Circle;

I do declare 5 objects of class SoundFile in lines 4-8, however, it was not user defined. 


Part F1 - Mark (12/20)
-----------------------------
- Use of a data structure to store information i.e. array

I have used 2 Array structures in the game, both arrays are of fixed size, circle[] array values are filled by 
initialisation, points[] values are filled by Player scores. I am scoring myself a Good mark for this part: 59%.
Rounded up to 12/20.

Object array circle[] class Circle, fixed size, values filled by initialisation
line 14:         array of class Circle is declared.
line 74:         initialised to be size 8.
line 80, 83:     values passed to the fields of the object circle.
line 174-176:    array of circles displayed.
line 249:        in the collisionSmall Circle method each element of the array is examined for collision with PinBall.

Primitive type array points[] within the Player class, fixed size, values filled by recording Player scores.
line 4:          array type int declaration.
line 10:         initialised to be size 3.
line 32:         addScore method stores point values into each element of the array.
line 43:         highestScore method examines every element to determine the highest score of the 3 games stored.



Part F2 - Mark (13 /20)
-----------------------------
- Calculations performed on the information stored

I am examining each element of the arrays, using values to perform a calculation of the highest score and 
collision detection with Pinball (using the length property), but not updating any of the elements in either arrays.
I'm recording a Very Good mark for this: 65%. 13/20

circle[]:
line 174:      each element of the array is checked through a for loop using the length property, 
               values are used to display and colour the array of circles.
line 249:      collisionSmallCircle method examines each element of the array though a for loop,
               using the length property to determine collision with Pinball.
               
points[]: Player class
line 43:       highestScore method loops through every element of the array, compares it to the previous one
               and saves the highest value to the variable highestScore.

*/
