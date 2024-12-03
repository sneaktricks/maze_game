# Maze Game

Maze Game is a physics-based 2D platformer game set within a maze, where the goal
is to guide a ball through a procedurally-generated maze to the exit.

To move the ball, the player must drag on it to launch it in the desired direction.
The player can launch the ball both on the ground as well as in midair. Reaching the exit
requires the player to utilize physics, which includes ricocheting the ball off walls as well as
juggling the ball in midair.

## Try it Online

The game is available at https://flutter-maze-game.web.app/.

## User Manual

### Objective

Move the ball through the maze to the exit in as few moves as possible. Launching the ball
counts as a move. A lower score is better.

### Screens and the Gameplay Loop

The application features four views: the Start Screen, Level Select, Game Screen,
and the Result Screen.

The application starts on the Start Screen, where the player can click on the start button
to navigate to the Level Select. The level select screen contains four levels: 3x3, 6x6,
12x12, and 18x18. These level names represent maze dimensions. The level cards
show which levels the player has completed, their personal best score on each level, and the developer
scores that the player can attempt to beat.

The player can select a level by clicking on its level card. This takes the player to the Game Screen with
a maze and a red ball. The ball is in the upper-left corner of the maze, and the goal is to move it to the exit
located in the bottom-right corner.

Once the ball reaches the exit, the player is taken to the Result Screen.
The Result Screen shows the number of moves the user took to reach the exit, as well as their personal best
score (lowest number of moves to complete). The screen also has a button that takes the player back to the level screen.

The gameplay loop is: Start -> Level Select -> Game -> Results -> Level Select -> ...

### How to Move and Reach the Exit

To move the ball, drag on it to see an orange trajectory line. Upon release, the ball is launched in the direction
of this trajectory line. Dragging further applies more force to the ball. The ball can be launched both on the ground
and in midair. Additionally, the ball bounces off walls, which can be utilized to navigate the maze.

Maze difficulty depends on its size, where a higher-dimension maze is more complex and has a smaller ball.
The most difficult mazes demand extreme precision to move a smaller ball. However, to alleviate this challenge,
more force can be applied to smaller balls.
