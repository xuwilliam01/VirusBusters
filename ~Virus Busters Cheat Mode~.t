% Virus Busters
% A side scroller game where you are an anti-virus software and clean malware in Mr. Ridout's computer
% Programmed by William Xu and Yulong Liu
% Date: May-June 2014

% Set the screen
View.Set ("graphics:1010;695,offscreenonly,position:centre;centre,nobuttonbar,title:Virus Buster")
colourback (black)

% To set the framerate properly per computer
var loopControl, loopControl2, delayPerFrame : int
delayPerFrame := 30

% Checking whether or not the player has clicked the exit button
var quitGame : boolean := false
var gameIsSaved : boolean := false

% For the instructions
var instructions1 := Pic.FileNew ("instructions1.bmp")
var instructions2 := Pic.FileNew ("instructions2.bmp")
var instructions3 := Pic.FileNew ("instructions3.bmp")

% For the store
var storePic := Pic.FileNew ("shop.jpg")
var backArrowButton := Pic.FileNew ("backArrow.bmp")
var backArrowButtonGlow := Pic.FileNew ("backArrowGlow.bmp")
var forwardArrowButton := Pic.FileNew ("forwardArrow.bmp")
var forwardArrowButtonGlow := Pic.FileNew ("forwardArrowGlow.bmp")
var offenseButton := Pic.FileNew ("offense1.jpeg")
var offenseButtonGlow := Pic.FileNew ("offense2.jpeg")
var defenseButton := Pic.FileNew ("defense1.jpeg")
var defenseButtonGlow := Pic.FileNew ("defense2.jpeg")
var description := Pic.FileNew ("description.bmp")

% For the skill points system
% It is seperated into 3 "categories"
% Have to make a "current points" variable and "points needed" variable for each character skill
% Increasing damage skills
var damageUpCurrentPoints := 0
var damageUpPointsNeeded := 3
var laserUpCurrentPoints := 0
var laserUpPointsNeeded := 3
var damageShieldCurrentPoints := 0
var damageShieldPointsNeeded := 3

% Increasing quantity or size skills
var multiShotsCurrentPoints := 0
var multiShotsPointsNeeded := 10
var lazerCurrentPoints := 0
var lazerPointsNeeded := 5
var bigShieldCurrentPoints := 0
var bigShieldPointsNeeded := 5

% General skills (in the general section)
var speedUpCurrentPoints := 0
var speedUpPointsNeeded := 10
var jumpHeightUpCurrentPoints := 0
var jumpHeightUpPointsNeeded := 5
var increaseMaxHealthCurrentPoints := 0
var increaseMaxHealthPointsNeeded := 5
var healthRegenCurrentPoints := 0
var healthRegenPointsNeeded := 3
var increaseMaxEnergyCurrentPoints := 0
var increaseMaxEnergyPointsNeeded := 5
var energyRegenCurrentPoints := 0
var energyRegenPointsNeeded := 3

% For the offense shop
var offenseShop := Pic.FileNew ("offenseStores.bmp")
var levelButton := Pic.FileNew ("levelButton.bmp")
var levelButtonGlow := Pic.FileNew ("levelButtonGlow.bmp")
var damageUp := Pic.FileNew ("damageUp.bmp")
var multiShot := Pic.FileNew ("multishot.bmp")
var damageShield := Pic.FileNew ("damageshield.bmp")
var bigShield := Pic.FileNew ("bigshield.bmp")
var laserUp := Pic.FileNew ("laserUp.bmp")
var lazer := Pic.FileNew ("lazer.bmp")

var damageUpInfo := Pic.FileNew ("damageUpInfo.bmp")
var multiShotInfo := Pic.FileNew ("multiShotInfo.bmp")
var lazerUpInfo := Pic.FileNew ("lazerUpInfo.bmp")
var lazerInfo := Pic.FileNew ("lazerInfo.bmp")
var damageShieldInfo := Pic.FileNew ("damageShieldInfo.bmp")
var bigShieldInfo := Pic.FileNew ("bigShieldInfo.bmp")

var damageUpCurrentLevel := 0
var damageUpMaxLevel := 10
var multiShotsCurrentLevel := 0
var multiShotsMaxLevel := 4
var laserUpCurrentLevel := 0
var laserUpMaxLevel := 10
var lazerCurrentLevel := 0
var lazerMaxLevel := 4
var damageShieldCurrentLevel := 0
var damageShieldMaxLevel := 4
var bigShieldCurrentLevel := 0
var bigShieldMaxLevel := 5

% Variables or the general shop
var generalShop := Pic.FileNew ("generalStores.bmp")
var speedUp := Pic.FileNew ("accelerate.bmp")
var jumpHeightUp := Pic.FileNew ("leap.bmp")
var increaseMaxHealth := Pic.FileNew ("healthUp.bmp")
var healthRegen := Pic.FileNew ("recovery.bmp")
var increaseMaxEnergy := Pic.FileNew ("energyUp.bmp")
var energyRegen := Pic.FileNew ("energize.bmp")

var speedUpInfo := Pic.FileNew ("speedUpInfo.bmp")
var jumpHeightUpInfo := Pic.FileNew ("jumpHeightUpInfo.bmp")
var increaseMaxHealthInfo := Pic.FileNew ("increaseMaxHealthInfo.bmp")
var healthRegenInfo := Pic.FileNew ("healthRegenInfo.bmp")
var increaseMaxEnergyInfo := Pic.FileNew ("increaseMaxEnergyInfo.bmp")
var energyRegenInfo := Pic.FileNew ("energyRegenInfo.bmp")

var speedUpCurrentLevel := 0
var speedUpMaxLevel := 3
var jumpHeightUpCurrentLevel := 0
var jumpHeightUpMaxLevel := 3
var increaseMaxHealthCurrentLevel := 0
var increaseMaxHealthMaxLevel := 10
var healthRegenCurrentLevel := 0
var healthRegenMaxLevel := 10
var increaseMaxEnergyCurrentLevel := 0
var increaseMaxEnergyMaxLevel := 10
var energyRegenCurrentLevel := 0
var energyRegenMaxLevel := 10

% Creating variables for the mouse and its buttons
var mouse_x, mouse_y, mouseButton : int
var buttonnumber, buttonupdown : int

% Creating the buttons on the main menu screen
const noOfButtons : int := 4
var button_x, button_y : array 1 .. noOfButtons of int

% Loading the matrix background animation on the main menu screen
var matrixPic : array 1 .. 27 of int
for no : 1 .. 27
    matrixPic (no) := Pic.FileNew ("matrix" + intstr (no) + ".jpg")
end for

% For the menu and login screen
var titlePic := Pic.FileNew ("title.bmp")
var newSavePic := Pic.FileNew ("newSave.jpeg")
var newSavePicGlow := Pic.FileNew ("newSaveGlow.jpeg")
var loadSavePic := Pic.FileNew ("loadSave.jpeg")
var loadSavePicGlow := Pic.FileNew ("loadSaveGlow.jpeg")
var creditsPic := Pic.FileNew ("credits.jpeg")
var creditsPicGlow := Pic.FileNew ("creditsGlow.jpeg")
var exitPic := Pic.FileNew ("exit.jpeg")
var exitGlowPic := Pic.FileNew ("exitGlow.jpeg")

% Creating an array for the desktop pictures
var desktop : array 1 .. 6 of int
var desktopNo : int := 1
var canPress : boolean := true

% Loading the pictures for the desktop
for no : 1 .. 6
    desktop (no) := Pic.FileNew ("desktopBackground" + intstr (no) + ".jpg")
end for

% Load the loading screens and the loading icon
var prepareDesktop : int := Pic.FileNew ("prepareDesktop.jpg")
var loginScreen : int := Pic.FileNew ("loginScreen.jpg")
var loading : array 1 .. 6 of int

% Load the pictures for the loading icon animation
for no : 1 .. 6
    loading (no) := Pic.FileNew ("loading" + intstr (no) + ".bmp")
end for

% Pictures for the icons on the desktop, the second one is the one that is displayed in reaction to the mouse
var recycleBin : int := Pic.FileNew ("recycleBin.bmp")
var recycleBin2 : int := Pic.FileNew ("recycleBin2.bmp")
var internetExplorer : int := Pic.FileNew ("internetExplorer.bmp")
var internetExplorer2 : int := Pic.FileNew ("internetExplorer2.bmp")
var windowsExplorer : int := Pic.FileNew ("windowsExplorer.bmp")
var windowsExplorer2 : int := Pic.FileNew ("windowsExplorer2.bmp")
var microsoftWord : int := Pic.FileNew ("microsoftWord.bmp")
var microsoftWord2 : int := Pic.FileNew ("microsoftWord2.bmp")
var paint : int := Pic.FileNew ("paint.bmp")
var paint2 : int := Pic.FileNew ("paint2.bmp")
var googleEarth : int := Pic.FileNew ("googleEarth.bmp")
var googleEarth2 : int := Pic.FileNew ("googleEarth2.bmp")
var mediaPlayer : int := Pic.FileNew ("mediaPlayer.bmp")
var mediaPlayer2 : int := Pic.FileNew ("mediaPlayer2.bmp")
var messenger : int := Pic.FileNew ("messenger.bmp")
var messenger2 : int := Pic.FileNew ("messenger2.bmp")
var movieMaker : int := Pic.FileNew ("movieMaker.bmp")
var movieMaker2 : int := Pic.FileNew ("movieMaker2.bmp")
var myComputer : int := Pic.FileNew ("myComputer.bmp")
var myComputer2 : int := Pic.FileNew ("myComputer2.bmp")
var store : int := Pic.FileNew ("store.bmp")
var store2 : int := Pic.FileNew ("store2.bmp")
var save : int := Pic.FileNew ("save.bmp")
var save2 : int := Pic.FileNew ("save2.bmp")
var instructions : int := Pic.FileNew ("instructions.bmp")
var instructions0 : int := Pic.FileNew ("instructions0.bmp")

% Creating a leveling system
var playerLevel : int := 1
var playerXP : int := 0
var playerMaxXP : int := 10

% Declare the variable for the key inputted and the save game file
var key : array char of boolean
var saveGame : int

% Variables for the player, speed of movement, jump height, and gravity, hitpoints, and energy
var playerName : string := ""
var playerMovement : real := 10
var playerJumpHeight : real := 24
var playerGravity : real := 3
var playerHP : real := 100
var playerEnergy : real := 100

% Changing the character that is used
var characterUsed : int := 1

% Set the maximum hitpoints and energy in the game
var playerMaxHP : real := 1000000
var playerMaxEnergy : real := 1000000

% Set the velocity and the direction + speed of movement of the character
var playerVSpeed : real := 0
var playerHSpeed : real := 0

% Set the regeneration speed of the hitpoints and energy
var playerHpRegen : real := 0.03
var playerEnergyRegen : real := 0.1

% Set the number of skillpoints that the player has, which increases by 3 every level they gain
var skillPoints : int := 0

% Calculating the distance an object is from the player, to set whether or not it is drawn (Objects off screen are not drawn)
var distanceFromPlayer : int := 9999

% Checking whether not the player is on a solid surface, which direction the player is facing, and the distance two objects are from eachother
var playerOnSurface : boolean := true
var direction : int := 1
var distance : real

% Setting the ground height to make way for the User Interface
var groundHeight : int := 150

% Set a variable "choice" for random integer calculations
var choice : int

% Variables for changing the room and the size of the shield
var changeRoom : boolean := true
var changeSize : boolean := true

% Variable for quitting the processes that are running
var endProcesses : boolean := true

% Set Fonts
var arial12 : int := Font.New ("arial:12")
var arial12Bold : int := Font.New ("arial:12:bold")
var cambria14Bold : int := Font.New ("cambria:14:bold")
var arial16Bold : int := Font.New ("arial:16:bold")
var arial20Bold : int := Font.New ("arial:20:bold")
var cambria36Bold : int := Font.New ("cambria:36:bold")
var calibriLight20 : int := Font.New ("Calibri Light:20")

% Variables for keeping track of animation
var player_frame : int := 0
var enemy_frame : int := 0

% Variables to check whether or not the player is able to fire the laser or projectiles
var canShootProjectile : boolean := true
var canShootLaser : boolean := true

% Loading the sprites for the player, the items and abilities, and the NPCs
% The projectile character
var player1_right1 : int := Pic.FileNew ("player_1_right.bmp")
var player1_right2 : int := Pic.FileNew ("player_2_right.bmp")
var player1_left1 : int := Pic.FileNew ("player_1_left.bmp")
var player1_left2 : int := Pic.FileNew ("player_2_left.bmp")
var player1_stand_right : int := Pic.FileNew ("player_stand_right.bmp")
var player1_stand_left : int := Pic.FileNew ("player_stand_left.bmp")

% The laser character
var player2_right1 : int := Pic.FileNew ("player2_1_right.bmp")
var player2_right2 : int := Pic.FileNew ("player2_2_right.bmp")
var player2_left1 : int := Pic.FileNew ("player2_1_left.bmp")
var player2_left2 : int := Pic.FileNew ("player2_2_left.bmp")
var player2_stand_right : int := Pic.FileNew ("player2_stand_right.bmp")
var player2_stand_left : int := Pic.FileNew ("player2_stand_left.bmp")

% The shield character
var player3_right1 : int := Pic.FileNew ("player3_1_right.bmp")
var player3_right2 : int := Pic.FileNew ("player3_2_right.bmp")
var player3_left1 : int := Pic.FileNew ("player3_1_left.bmp")
var player3_left2 : int := Pic.FileNew ("player3_2_left.bmp")
var player3_stand_right : int := Pic.FileNew ("player3_stand_right.bmp")
var player3_stand_left : int := Pic.FileNew ("player3_stand_left.bmp")

% His animated shield
var shield1 : int := Pic.FileNew ("shield1.bmp")
var shield2 : int := Pic.FileNew ("shield2.bmp")

% Loading the first character
var player_right1 : int := player1_right1
var player_right2 : int := player1_right2
var player_left1 : int := player1_left1
var player_left2 : int := player1_left2
var player_stand_right : int := player1_stand_right
var player_stand_left : int := player1_stand_left

% Changing the direction and animation of the player
var player_used1 : int
var player_used2 : int

% Setting the basic sprite for the player that is later used in Pic.Width and Pic.Height statements
var player_sprite : int := player1_stand_right

% Checking whether or not the player is animated or standing still
var playerMoving : boolean := false

% Loading the images for the character selection bar in the User Interface
var player1_head1 : int := Pic.FileNew ("player_head.bmp")
var player1_head2 : int := Pic.FileNew ("player_head2.bmp")

var player2_head1 : int := Pic.FileNew ("player2_head.bmp")
var player2_head2 : int := Pic.FileNew ("player2_head2.bmp")

var player3_head1 : int := Pic.FileNew ("player3_head.bmp")
var player3_head2 : int := Pic.FileNew ("player3_head2.bmp")

% Checking whether or not the player can jump, and whether or not the player is falling
var canJump : boolean := true
var playerFall : boolean := false

% Projectile sprites
var ball : int := Pic.FileNew ("ball.bmp")
var spywareShot_right : int := Pic.FileNew ("enemy4_projectile_right.bmp")
var spywareShot_left : int := Pic.FileNew ("enemy4_projectile_left.bmp")

% Picture for the explosion
var explosion : int := Pic.FileNew ("explosion.bmp")

% Location of player
var player_x : int := maxx div 2 + 50
var player_y : int := 0

% Loading the images for the enemy
var worm_1_right : int := Pic.FileNew ("enemy1_1_right.bmp")
var worm_2_right : int := Pic.FileNew ("enemy1_2_right.bmp")
var worm_1_left : int := Pic.FileNew ("enemy1_1_left.bmp")
var worm_2_left : int := Pic.FileNew ("enemy1_2_left.bmp")

var virus_1 : int := Pic.FileNew ("enemy2_1.bmp")
var virus_2 : int := Pic.FileNew ("enemy2_2.bmp")

var trojan_1_right : int := Pic.FileNew ("enemy3_1_right.bmp")
var trojan_2_right : int := Pic.FileNew ("enemy3_2_right.bmp")
var trojan_1_left : int := Pic.FileNew ("enemy3_1_left.bmp")
var trojan_2_left : int := Pic.FileNew ("enemy3_2_left.bmp")

var spyware_1_right : int := Pic.FileNew ("enemy4_1_right.bmp")
var spyware_2_right : int := Pic.FileNew ("enemy4_2_right.bmp")
var spyware_1_left : int := Pic.FileNew ("enemy4_1_left.bmp")
var spyware_2_left : int := Pic.FileNew ("enemy4_2_left.bmp")

var bot_1 : int := Pic.FileNew ("enemy5_1.bmp")
var bot_2 : int := Pic.FileNew ("enemy5_2.bmp")
var bot_jump : int := Pic.FileNew ("enemy5_jump.bmp")

var bug_1_right : int := Pic.FileNew ("enemy6_1_right.bmp")
var bug_2_right : int := Pic.FileNew ("enemy6_2_right.bmp")
var bug_1_left : int := Pic.FileNew ("enemy6_1_left.bmp")
var bug_2_left : int := Pic.FileNew ("enemy6_2_left.bmp")

var spam_1 : int := Pic.FileNew ("enemy7_1.bmp")
var spam_2 : int := Pic.FileNew ("enemy7_2.bmp")

var boss_1 : int := Pic.FileNew ("boss_1.bmp")
var boss_2 : int := Pic.FileNew ("boss_2.bmp")

% Variables for the enemy spawns
var enemySpawn : int := 1
var enemySpawnDelay : int := 3000

% To check if the processes have ended (In particular the enemy spawn
var allProcessesEnded : boolean := false

% The height above the ground that a flying enemy hovers
const enemyFlyHeight : int := 75

% Setting all the enemy variables
% Setting the number of enemies and the current enemy number (used in the createEnemy procedure)
var noOfEnemies : int := 50
var enemyNo : int := 1

% Checking the number of alive enemies at once to control the enemy amount on screen (reducing lag)
var noOfAlive : int := 0

% Setting the name of the enemy, amount of damage it does, the location of the enemy, its max hitpoints,
% the amount of xp the player gains when the enemy is eliminated, its number of hitpoints, whether or not it can jump over a box,
% its movement speed, its jump height, its horizontal speed and velocity, whether or not it's touching a surface, whether or not it's alive
% and whether or not it can turn around and move in the other direction
var enemyName : array 1 .. noOfEnemies of string
var enemyDMG : array 1 .. noOfEnemies of real
var enemy_x, enemy_y : array 1 .. noOfEnemies of int
var enemyMaxHP : array 1 .. noOfEnemies of int
var enemyXPDrop : array 1 .. noOfEnemies of int
var enemyHP : array 1 .. noOfEnemies of real
var enemyBoxJump : array 1 .. noOfEnemies of int
var enemyMovement, enemyJumpHeight : array 1 .. noOfEnemies of real
var enemyHSpeed, enemyVSpeed : array 1 .. noOfEnemies of real
var enemyOnSurface, enemyIsAlive, enemyCanTurn : array 1 .. noOfEnemies of boolean

var enemyDoesJump : array 1 .. noOfEnemies of boolean

var enemy_sprite : array 1 .. noOfEnemies of int

% Set the spawn locations
var stage1Spawn_x, stage1Spawn_y : array 1 .. 4 of int
var stage2Spawn_x, stage2Spawn_y : array 1 .. 6 of int
var stage3Spawn_x, stage3Spawn_y : array 1 .. 6 of int
var stage4Spawn_x, stage4Spawn_y : array 1 .. 4 of int
var stage5Spawn_x, stage5Spawn_y : array 1 .. 4 of int
var stage6Spawn_x, stage6Spawn_y : array 1 .. 4 of int
var stage7Spawn_x, stage7Spawn_y : array 1 .. 4 of int

% View location on the screen for scrolling
var xView := 0

% World Parameters
var world_x : array 1 .. 10 of int

% The current stage that the player is on, or screen, and the stages that are unlocked
var stage : int := -1
var stagesUnlocked : int := 7


% Loading the portal images
var leftPortal1 : int := Pic.FileNew ("leftPortal1.bmp")
var leftPortal2 : int := Pic.FileNew ("leftPortal2.bmp")
var rightPortal1 : int := Pic.FileNew ("rightPortal1.bmp")
var rightPortal2 : int := Pic.FileNew ("rightPortal2.bmp")

% Setting the locations of the portals
var leftPortal_x, leftPortal_y : int
var rightPortal_x, rightPortal_y : int

% Checking which portal that the player exits from
var enterFrom : string := "left"

% Setting the levels and their backgrounds, as well as the maximum number of enemies on the screen at once
var maxSpawn : array 1 .. 10 of int

for no : 1 .. 6
    maxSpawn (no) := 30
end for
maxSpawn (7) := 10

% Background for stage 1
var internetExplorerBackground : int := Pic.FileNew ("internetExplorerIcon.bmp")
var stage1Background : int := Pic.FileNew ("stage1Background.jpg")

% Stage 2
var recycleBinBackground : int := Pic.FileNew ("recycleBinBackground.bmp")
var stage2Background : int := Pic.FileNew ("stage2Background.jpg")

var window1 : int := Pic.FileNew ("window1.jpg")
var window2 : int := Pic.FileNew ("window2.jpg")
var window3 : int := Pic.FileNew ("window3.jpg")

% Stage 3
var stage3Background : int := Pic.FileNew ("stage3Background.jpg")

% Stage 4
var stage4Background : int := Pic.FileNew ("stage4Background.jpg")

% Stage 5
var stage5Background : int := Pic.FileNew ("stage5Background.jpg")

% Stage 6
var stage6Background : int := Pic.FileNew ("stage6Background.jpg")

% Stage 7
var stage7Background : int := Pic.FileNew ("stage7Background.jpg")


% Variables for the boxes, including the number of boxes, the max number of boxes (how many variables
var noOfBoxes : int := 0

var maxNoOfBoxes := 1000
var box_x1, box_y1, box_x2, box_y2, boxClr : array 1 .. maxNoOfBoxes of int

% Non-solid blocks are for changing the direction of enemies, platform blocks don't use side collision
var isPlatform, isSolid : array 1 .. maxNoOfBoxes of boolean
var boxCollidingWith : int := 0

% Laser variables
var laser_x1, laser_y1, laser_x2, laser_y2 : int
var laserDMG : int := 5
var shotLaser : boolean := false
var laserHitBox : int := 0
var laserDrain : boolean := false
var laserDrainAmount : real := 1
var laserSize : int := 1

% Projectile variables
var delayShot : boolean := false
var delayShotTime : int := 200

var projectileNo := 0
var noOfProjectiles := 300

var projectileType : array 1 .. noOfProjectiles of string
var projectile_x, projectile_y : array 1 .. noOfProjectiles of int
var projectileDirection, projectileVSpeed, projectileHSpeed, projectileSprite, projectileDMG : array 1 .. noOfProjectiles of int
var projectileExists, projectileHit, doesExplode : array 1 .. noOfProjectiles of boolean
var drawDMG, drawDMG_x, drawDMG_y, floatText : array 1 .. noOfProjectiles of int

% Controlling the damage of the player's projectiles
var lowestDMG : int := 10
var highestDMG : int := 20
var noOfShots : int := 1

% Shield variables
var shieldIsActive : boolean := false
var shieldDrainAmount : real := 0.2
var shieldSize : int := 1
var shieldDMG : real := 1

% Spawning locations for stage 1
stage1Spawn_x (1) := 100
stage1Spawn_y (1) := maxy

stage1Spawn_x (2) := 1600
stage1Spawn_y (2) := maxy

stage1Spawn_x (3) := 2700
stage1Spawn_y (3) := maxy

stage1Spawn_x (4) := 3600
stage1Spawn_y (4) := groundHeight + 100

% Spawning locations for stage 2
stage2Spawn_x (1) := 800
stage2Spawn_y (1) := 290

stage2Spawn_x (2) := 800
stage2Spawn_y (2) := 480

stage2Spawn_x (3) := 2300
stage2Spawn_y (3) := 290

stage2Spawn_x (4) := 2300
stage2Spawn_y (4) := 480

stage2Spawn_x (5) := 1600
stage2Spawn_y (5) := 160

stage2Spawn_x (6) := 2300
stage2Spawn_y (6) := 160

% Spawning locations for stage 3
stage3Spawn_x (1) := 800
stage3Spawn_y (1) := 700

stage3Spawn_x (2) := 3000
stage3Spawn_y (2) := 700

stage3Spawn_x (3) := 1500
stage3Spawn_y (3) := 200

stage3Spawn_x (4) := 1500
stage3Spawn_y (4) := 350

stage3Spawn_x (5) := 3000
stage3Spawn_y (5) := 200

stage3Spawn_x (6) := 3000
stage3Spawn_y (6) := 350

% Spawning locations for stage 4
stage4Spawn_x (1) := 800
stage4Spawn_y (1) := 290

stage4Spawn_x (2) := 800
stage4Spawn_y (2) := 480

stage4Spawn_x (3) := 2300
stage4Spawn_y (3) := 290

stage4Spawn_x (4) := 2300
stage4Spawn_y (4) := 480


% Spawning locations for stage 5
stage5Spawn_x (1) := 800
stage5Spawn_y (1) := 290

stage5Spawn_x (2) := 800
stage5Spawn_y (2) := 480

stage5Spawn_x (3) := 2300
stage5Spawn_y (3) := 290

stage5Spawn_x (4) := 2300
stage5Spawn_y (4) := 480


% Spawning locations for stage 6
stage6Spawn_x (1) := 800
stage6Spawn_y (1) := 290

stage6Spawn_x (2) := 800
stage6Spawn_y (2) := 480

stage6Spawn_x (3) := 2300
stage6Spawn_y (3) := 290

stage6Spawn_x (4) := 2300
stage6Spawn_y (4) := 480

% Spawning locations for stage 7
stage7Spawn_x (1) := 800
stage7Spawn_y (1) := 290

stage7Spawn_x (2) := 800
stage7Spawn_y (2) := 480

stage7Spawn_x (3) := 1300
stage7Spawn_y (3) := 290

stage7Spawn_x (4) := 1300
stage7Spawn_y (4) := 480


for no2 : 1 .. noOfEnemies
    enemyMaxHP (no2) := 0
    enemy_sprite (no2) := virus_1
    enemyMovement (no2) := 0
    enemyXPDrop (no2) := 0
    enemyDMG (no2) := 0
    enemyVSpeed (no2) := 0
    enemyHSpeed (no2) := 0
    enemyCanTurn (no2) := true
    enemy_x (no2) := 0
    enemy_y (no2) := 0
    enemyHP (no2) := 0
    enemyName (no2) := ""
    enemyOnSurface (no2) := false
    enemyIsAlive (no2) := false
end for

for no3 : 1 .. noOfProjectiles
    projectileHit (no3) := false
    drawDMG (no3) := 0
    floatText (no3) := 0
    projectileType (no3) := ""
    projectileDirection (no3) := 0
    projectile_x (no3) := 0
    projectile_y (no3) := 0
    projectileVSpeed (no3) := 0
    projectileHSpeed (no3) := 0
    projectileExists (no3) := false
    projectileSprite (no3) := ball
    doesExplode (no3) := false
end for

% Creating function for mouse location detection
function mouseOver (x1, y1, x2, y2 : int) : boolean
    mousewhere (mouse_x, mouse_y, mouseButton)
    if mouse_x >= x1 and mouse_x <= x2 and mouse_y >= y1 and mouse_y <= y2 then
	result true
    else
	result false
    end if
end mouseOver

% Creating function for click detection
function mouseClick (x1, y1, x2, y2 : int) : boolean
    if Mouse.ButtonMoved ("down") then
	Mouse.ButtonWait ("down", mouse_x, mouse_y, buttonnumber, buttonupdown)
	mousewhere (mouse_x, mouse_y, mouseButton)
    end if
    if mouse_x >= x1 and mouse_x <= x2 and mouse_y >= y1 and mouse_y <= y2 and not mouseButton = 0 then
	result true
    else
	result false
    end if
end mouseClick

% Allow for creating a projectile for the enemy
procedure createProjectile (Type : string, x, y, Direction, vSpeed : int)

    projectileNo := 1

    loop
	for no3 : 1 .. noOfProjectiles
	    if projectileExists (no3) = false and projectileHit (no3) = false then
		projectileNo := no3
		exit
	    end if
	end for
	exit when projectileNo > 0 and projectileNo <= noOfProjectiles
    end loop

    if projectileNo > 0 and projectileNo <= noOfProjectiles then
	projectileType (projectileNo) := Type
	projectileDirection (projectileNo) := Direction
	projectile_x (projectileNo) := x
	projectile_y (projectileNo) := y
	projectileVSpeed (projectileNo) := vSpeed
	projectileExists (projectileNo) := true
	projectileHit (projectileNo) := false
	drawDMG (projectileNo) := 0
	floatText (projectileNo) := 0
	doesExplode (projectileNo) := false

	if projectileType (projectileNo) = "Spyware Shot" then
	    projectileDMG (projectileNo) := 20
	    if projectileDirection (projectileNo) = 1 then
		projectileHSpeed (projectileNo) := 10
		projectileSprite (projectileNo) := spywareShot_right
	    else
		projectileHSpeed (projectileNo) := -10
		projectileSprite (projectileNo) := spywareShot_left
	    end if
	    delay (30)
	elsif projectileType (projectileNo) = "Player Ball" then
	    projectileDMG (projectileNo) := Rand.Int (lowestDMG, highestDMG)
	    if projectileDirection (projectileNo) = 1 then
		projectileHSpeed (projectileNo) := 30
		projectileSprite (projectileNo) := ball
	    else
		projectileHSpeed (projectileNo) := -30
		projectileSprite (projectileNo) := ball
	    end if
	end if
    end if

end createProjectile

% Procedure for creating boxes
procedure createBox (x1, y1, x2, y2, clr : int, platform, solid : boolean)
    noOfBoxes += 1
    box_x1 (noOfBoxes) := x1
    box_y1 (noOfBoxes) := y1
    box_x2 (noOfBoxes) := x2
    box_y2 (noOfBoxes) := y2
    boxClr (noOfBoxes) := clr
    isPlatform (noOfBoxes) := platform
    isSolid (noOfBoxes) := solid
end createBox

% Procedure for spawning enemies
procedure createEnemy (name : string, x, y : int)

    noOfAlive := 0

    for no2 : 1 .. noOfEnemies
	if enemyIsAlive (no2) then
	    noOfAlive += 1
	end if
    end for

    enemyNo := 1
    loop
	for no2 : 1 .. noOfEnemies
	    if not enemyIsAlive (no2) then
		enemyNo := no2
		exit
	    end if
	end for
	exit when enemyNo > 0
    end loop

    % To control the number of enemies on the screen at once
    % These are the variables for each enemy that declare their health, EXP dropped, damage and movement speed
    if noOfAlive < maxSpawn (stage) and enemyNo > 0 and enemyNo <= noOfEnemies then
	enemyName (enemyNo) := name

	if enemyName (enemyNo) = "Worm Lv 1" then
	    enemyMaxHP (enemyNo) := 100
	    enemy_sprite (enemyNo) := worm_1_left
	    enemyMovement (enemyNo) := Rand.Int (2, 4)
	    enemyXPDrop (enemyNo) := 5
	    enemyDMG (enemyNo) := 0.5
	end if
	if enemyName (enemyNo) = "Virus Lv 10" then
	    enemyMaxHP (enemyNo) := 400
	    enemy_sprite (enemyNo) := virus_1
	    enemyMovement (enemyNo) := Rand.Int (3, 5)
	    enemyXPDrop (enemyNo) := 20
	    enemyDMG (enemyNo) := 1
	end if
	if enemyName (enemyNo) = "Trojan Lv 20" then
	    enemyMaxHP (enemyNo) := 800
	    enemy_sprite (enemyNo) := trojan_1_left
	    enemyMovement (enemyNo) := Rand.Int (8, 12)
	    enemyXPDrop (enemyNo) := 75
	    enemyDMG (enemyNo) := 2
	end if
	if enemyName (enemyNo) = "Spyware Lv 30" then
	    enemyMaxHP (enemyNo) := 1500
	    enemy_sprite (enemyNo) := spyware_1_left
	    enemyMovement (enemyNo) := Rand.Int (2, 4)
	    enemyXPDrop (enemyNo) := 200
	    enemyDMG (enemyNo) := 1
	end if
	if enemyName (enemyNo) = "Bot Lv 40" then
	    enemyMaxHP (enemyNo) := 2000
	    enemy_sprite (enemyNo) := bot_1
	    enemyMovement (enemyNo) := Rand.Int (6, 8)
	    enemyXPDrop (enemyNo) := 80
	    enemyDMG (enemyNo) := 3
	end if
	if enemyName (enemyNo) = "Bug Lv 50" then
	    enemyMaxHP (enemyNo) := 3500
	    enemy_sprite (enemyNo) := bug_1_left
	    enemyMovement (enemyNo) := Rand.Int (2, 4)
	    enemyXPDrop (enemyNo) := 160
	    enemyDMG (enemyNo) := 4
	end if
	if enemyName (enemyNo) = "Spam Lv 60" then
	    enemyMaxHP (enemyNo) := 5000
	    enemy_sprite (enemyNo) := spam_1
	    enemyMovement (enemyNo) := Rand.Int (2, 4)
	    enemyXPDrop (enemyNo) := 150
	    enemyDMG (enemyNo) := 5
	end if
	if enemyName (enemyNo) = "The Corruptor" then
	    enemyMaxHP (enemyNo) := 30000
	    enemy_sprite (enemyNo) := boss_1
	    enemyMovement (enemyNo) := 6
	    enemyXPDrop (enemyNo) := 100000
	    enemyDMG (enemyNo) := 10
	end if

	enemyVSpeed (enemyNo) := 0
	enemyCanTurn (enemyNo) := true
	enemy_x (enemyNo) := x
	enemy_y (enemyNo) := y
	enemyHP (enemyNo) := enemyMaxHP (enemyNo)

	enemyOnSurface (enemyNo) := false
	enemyIsAlive (enemyNo) := true

	% Used for enemy direction when they spawn
	loop
	    choice := Rand.Int (-1, 1)
	    exit when choice not= 0
	end loop

	% Determines their direction
	enemyHSpeed (enemyNo) := enemyMovement (enemyNo) * choice
	enemyVSpeed (enemyNo) := 0
	delay (30)
    end if


end createEnemy

% Procedure for input
procedure input

    % Check the inputted keys
    Input.KeyDown (key)

    % Allow the player to jump
    if key ('w') and playerOnSurface and canJump then
	playerVSpeed := playerJumpHeight
	player_y += round (playerVSpeed)
	playerOnSurface := false
	canJump := false
    elsif key ('w') and characterUsed = 3 and playerVSpeed < -4 then
	playerVSpeed := -4
    elsif not key ('w') then
	canJump := true
    end if

    if key ('s') and playerOnSurface and playerFall = false and player_y > groundHeight + 24 then
	playerFall := true
	playerOnSurface := false
    else
	playerFall := false
    end if

    % Allow the player to move left
    if key ('a') then
	playerMoving := true
	boxCollidingWith := 0
	for no : 1 .. noOfBoxes
	    distance := Math.DistancePointLine (player_x, player_y, box_x2 (no) + xView, box_y1 (no), box_x2 (no) + xView, box_y2 (no))
	    if distance <= playerMovement and isPlatform (no) = false and isSolid (no) then
		boxCollidingWith := no
	    end if
	end for
	if boxCollidingWith = 0 then
	    direction := -1
	    if player_x + Pic.Width (player_sprite) div 2 - xView < maxx div 2 or xView + world_x (stage) - (player_x + Pic.Width (player_sprite) div 2) < maxx div 2 then
		player_x -= round (playerMovement)
		playerHSpeed := 0
	    else
		playerHSpeed := playerMovement
	    end if
	elsif boxCollidingWith not= 0 and box_y2 (boxCollidingWith) - player_y <= 25 then
	    player_y := box_y2 (boxCollidingWith)
	    direction := -1
	    if player_x + Pic.Width (player_sprite) div 2 - xView < maxx div 2 or xView + world_x (stage) - (player_x + Pic.Width (player_sprite) div 2) < maxx div 2 then
		player_x -= round (playerMovement)
		playerHSpeed := 0
	    else
		playerHSpeed := playerMovement
	    end if

	elsif (boxCollidingWith not= 0 and box_y2 (boxCollidingWith) - player_y > 25) or player_x - playerMovement <= 0 then
	    playerHSpeed := 0
	end if
    end if

    % Allow the player to move right
    if key ('d') then
	playerMoving := true
	boxCollidingWith := 0
	for no : 1 .. noOfBoxes
	    distance := Math.DistancePointLine (player_x + Pic.Width (player_sprite), player_y, box_x1 (no) + xView, box_y1 (no), box_x1 (no) + xView, box_y2 (no))
	    if distance <= playerMovement and isPlatform (no) = false and isSolid (no) then
		boxCollidingWith := no
	    end if
	end for

	if boxCollidingWith = 0 then
	    direction := 1
	    if player_x + Pic.Width (player_sprite) div 2 - xView < maxx div 2 or xView + world_x (stage) - (player_x + Pic.Width (player_sprite) div 2) < maxx div 2 then
		player_x += round (playerMovement)
		playerHSpeed := 0
	    else
		playerHSpeed := -playerMovement
	    end if
	elsif boxCollidingWith not= 0 and box_y2 (boxCollidingWith) - player_y <= 25 then
	    player_y := box_y2 (boxCollidingWith)
	    direction := 1
	    if player_x + Pic.Width (player_sprite) div 2 - xView < maxx div 2 or xView + world_x (stage) - (player_x + Pic.Width (player_sprite) div 2) < maxx div 2 then
		player_x += round (playerMovement)
		playerHSpeed := 0
	    else
		playerHSpeed := -playerMovement
	    end if
	elsif (boxCollidingWith not= 0 and box_y2 (boxCollidingWith) - player_y > 25) or player_x + Pic.Width (player_sprite) + playerMovement >= maxx then
	    playerHSpeed := 0
	end if
    end if

    % Allow animation for movement
    if not key ('d') and not key ('a') then
	playerMoving := false
	playerHSpeed := 0
    end if

    % Shoot the projectile
    if key (' ') then
	if characterUsed = 1 and canShootProjectile = true then
	    shotLaser := false
	    delayShot := true
	    canShootProjectile := false
	    if direction = 1 then
		if noOfShots = 1 then
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, 0)
		elsif noOfShots = 2 then
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, 2)
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, -2)
		elsif noOfShots = 3 then
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, 0)
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, 3)
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, -3)
		elsif noOfShots = 4 then
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, 3)
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, 1)
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, -1)
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, -3)
		elsif noOfShots = 5 then
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, 3)
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, 2)
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, 0)
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, -2)
		    createProjectile ("Player Ball", player_x + Pic.Width (player_sprite) - xView, player_y + Pic.Height (player_sprite) div 2 - 10, 1, -3)
		end if
	    elsif direction = -1 then
		if noOfShots = 1 then
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, 0)
		elsif noOfShots = 2 then
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, 2)
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, -2)
		elsif noOfShots = 3 then
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, 0)
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, 3)
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, -3)
		elsif noOfShots = 4 then
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, 3)
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, 1)
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, -1)
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, -3)
		elsif noOfShots = 5 then
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, 3)
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, 2)
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, 0)
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, -2)
		    createProjectile ("Player Ball", player_x - 25 - xView, player_y + Pic.Height (player_sprite) div 2 - 10, -1, -3)
		end if
	    end if
	end if

	if characterUsed = 2 and canShootLaser then
	    playerEnergy -= laserDrainAmount
	    shotLaser := true
	else
	    shotLaser := false
	end if

	if characterUsed = 3 and playerEnergy >= 0 then
	    playerEnergy -= shieldDrainAmount
	    shieldIsActive := true
	else
	    shieldIsActive := false
	end if

    else

	shotLaser := false
	shieldIsActive := false

    end if

    % Allow the player to change characters
    if key ('j') then
	characterUsed := 1
	player_right1 := player1_right1
	player_right2 := player1_right2
	player_left1 := player1_left1
	player_left2 := player1_left2
	player_stand_right := player1_stand_right
	player_stand_left := player1_stand_left
    elsif key ('k') then
	characterUsed := 2
	player_right1 := player2_right1
	player_right2 := player2_right2
	player_left1 := player2_left1
	player_left2 := player2_left2
	player_stand_right := player2_stand_right
	player_stand_left := player2_stand_left
    elsif key ('l') then
	characterUsed := 3
	player_right1 := player3_right1
	player_right2 := player3_right2
	player_left1 := player3_left1
	player_left2 := player3_left2
	player_stand_right := player3_stand_right
	player_stand_left := player3_stand_left
    end if


    % CHEAT -- Add a level
    if key (KEY_ENTER) and canPress = true then
	playerXP := playerMaxXP
	canPress := false
    elsif not key (KEY_ENTER) then
	canPress := true
    end if

end input



% Procedure for movement
procedure movement

    if player_y = 0 then
	playerOnSurface := true
    else
	playerOnSurface := false
    end if

end movement

% Procedure for creating projectile
procedure projectile

    for no3 : 1 .. noOfProjectiles
	if projectileExists (no3) then


	    % Check collision with boxes
	    for no : 1 .. noOfBoxes

		if projectileType (no3) = "Player Ball" then
		    if isSolid (no) and not (direction = 1 and (player_x + Pic.Width (player_sprite) - xView < box_x2 (no) and player_x + Pic.Width (player_sprite) - xView - playerMovement >
			    box_x1 (no)
			    and player_y + Pic.Height (player_sprite) -
			    Pic.Height (player_sprite)
			    div 2 - 10 +
			    Pic.Width (ball) >
			    box_y1 (no) and player_y + Pic.Height (player_sprite) - Pic.Height (player_sprite) div 2 - 10 < box_y2 (no))) and not
			    (direction = -1 and (player_x - 25 - xView + Pic.Width (ball) + playerMovement < box_x2 (no) and player_x - 25 - xView > box_x1 (no) and player_y +
			    Pic.Height (player_sprite) - Pic.Height (player_sprite) div 2
			    - 10 + Pic.Width (ball) > box_y1 (no)
			    and player_y + Pic.Height (player_sprite) - Pic.Height (player_sprite) div 2 - 10 < box_y2 (no))) then

			if box_x2 (no) + xView >= projectile_x (no3) + xView and box_x1 (no) + xView <= projectile_x (no3) + xView + Pic.Width (ball) and box_y2 (no) >= projectile_y (no3) and
				box_y1 (no) <= projectile_y (no3) + Pic.Height (ball) then
			    projectileExists (no3) := false
			    projectileDMG (no3) := 0
			    drawDMG_x (no3) := projectile_x (no3) + Rand.Int (-10, 10)
			    drawDMG_y (no3) := projectile_y (no3)
			    projectileHit (no3) := true
			    doesExplode (no3) := true
			end if
		    end if

		else

		    if isSolid (no) and box_x2 (no) + xView >= projectile_x (no3) + xView and box_x1 (no) + xView <= projectile_x (no3) + xView + Pic.Width (projectileSprite (no3)) and box_y2 (no) >=
			    projectile_y (no3) and
			    box_y1 (no) <= projectile_y (no3) + Pic.Height (projectileSprite (no3)) then
			projectileExists (no3) := false
			drawDMG_x (no3) := projectile_x (no3) + Rand.Int (-10, 10)
			drawDMG_y (no3) := projectile_y (no3)
			projectileHit (no3) := true
			projectileDMG (no3) := 0

		    end if
		end if
	    end for

	    % Check collision with enemies
	    for no2 : 1 .. noOfEnemies
		if projectileType (no3) = "Player Ball" and enemyIsAlive (no2) then
		    if enemy_x (no2) + Pic.Width (enemy_sprite (no2)) + xView >= projectile_x (no3) + xView and enemy_x (no2) + xView <= projectile_x (no3) + xView + Pic.Width (ball) and
			    enemy_y (no2) +
			    Pic.Height (enemy_sprite (no2)) >=
			    projectile_y (no3) and
			    enemy_y (no2) <= projectile_y (no3) + Pic.Height (ball) then
			drawDMG (no3) := projectileDMG (no3)
			drawDMG_x (no3) := projectile_x (no3) + Rand.Int (-5, 5)
			drawDMG_y (no3) := projectile_y (no3) + Rand.Int (-5, 5)
			projectileHit (no3) := true
			doesExplode (no3) := true
			enemyHP (no2) -= projectileDMG (no3)
			projectileExists (no3) := false
		    end if
		end if
	    end for


	    % Check collision with player
	    if projectileType (no3) not= "Player Ball" then
		if player_x + Pic.Width (player_sprite) >= projectile_x (no3) + xView and player_x <= projectile_x (no3) + xView + Pic.Width (projectileSprite (no3)) and
			player_y +
			Pic.Height (player_sprite) >=
			projectile_y (no3) and
			player_y <= projectile_y (no3) + Pic.Height (projectileSprite (no3)) then

		    projectileExists (no3) := false
		    drawDMG (no3) := projectileDMG (no3)
		    drawDMG_x (no3) := projectile_x (no3) + Rand.Int (-5, 5)
		    drawDMG_y (no3) := projectile_y (no3) + Rand.Int (-5, 5)
		    projectileHit (no3) := true


		    playerHP -= projectileDMG (no3)
		end if
	    end if

	end if
    end for


end projectile


% Procedure for drawing images
procedure draw

    % Drawing the background
    if stage = 1 then
	Pic.Draw (stage1Background, round (xView / 1.3), groundHeight, picCopy)

	if Math.Distance (xView + 200, 0, maxx div 2, 0) <= maxx div 2 or Math.Distance (xView + 200 + Pic.Width (internetExplorerBackground), 0, maxx div 2,
		0) <= maxx div 2 then
	    Pic.Draw (internetExplorerBackground, xView + 200, groundHeight + 30, picMerge)
	end if

	if Math.Distance (xView + 1300, 0, maxx div 2, 0) <= maxx div 2 or Math.Distance (xView + 1300 + Pic.Width (internetExplorerBackground), 0, maxx div 2,
		0) <= maxx div 2 then
	    Pic.Draw (internetExplorerBackground, xView + 1300, groundHeight - 30, picMerge)
	end if

	if Math.Distance (xView + 2600, 0, maxx div 2, 0) <= maxx div 2 or Math.Distance (xView + 2600 + Pic.Width (internetExplorerBackground), 0, maxx div 2,
		0) <= maxx div 2 then
	    Pic.Draw (internetExplorerBackground, xView + 2600, groundHeight + 30, picMerge)
	end if

    elsif stage = 2 then
	Pic.Draw (stage2Background, round (xView / 1.3), groundHeight, picCopy)
	Pic.Draw (recycleBinBackground, xView + 1650, groundHeight - 30, picMerge)

    elsif stage = 3 then
	Pic.Draw (stage3Background, round (xView / 1.3), groundHeight, picCopy)

	if Math.Distance (xView + 200, 0, maxx div 2, 0) <= maxx div 2 or Math.Distance (xView + 200 + Pic.Width (window1), 0, maxx div 2,
		0) <= maxx div 2 then
	    Pic.Draw (window1, xView + 200, groundHeight, picCopy)
	end if
	if Math.Distance (xView + 1200, 0, maxx div 2, 0) <= maxx div 2 or Math.Distance (xView + 1200 + Pic.Width (window2), 0, maxx div 2,
		0) <= maxx div 2 then
	    Pic.Draw (window2, xView + 1200, groundHeight + 150, picCopy)
	end if
	if Math.Distance (xView + 1400, 0, maxx div 2, 0) <= maxx div 2 or Math.Distance (xView + 1400 + Pic.Width (window3), 0, maxx div 2,
		0) <= maxx div 2 then
	    Pic.Draw (window3, xView + 1400, groundHeight + 30, picCopy)
	end if
	if Math.Distance (xView + 2000, 0, maxx div 2, 0) <= maxx div 2 or Math.Distance (xView + 2000 + Pic.Width (window2), 0, maxx div 2,
		0) <= maxx div 2 then
	    Pic.Draw (window2, xView + 2000, groundHeight, picCopy)
	end if
	if Math.Distance (xView + 2600, 0, maxx div 2, 0) <= maxx div 2 or Math.Distance (xView + 2600 + Pic.Width (window1), 0, maxx div 2,
		0) <= maxx div 2 then
	    Pic.Draw (window1, xView + 2600, groundHeight + 300, picCopy)
	end if
	if Math.Distance (xView + 3400, 0, maxx div 2, 0) <= maxx div 2 or Math.Distance (xView + 3400 + Pic.Width (window3), 0, maxx div 2,
		0) <= maxx div 2 then
	    Pic.Draw (window3, xView + 3400, groundHeight - 20, picCopy)
	end if
	if Math.Distance (xView + 4050, 0, maxx div 2, 0) <= maxx div 2 or Math.Distance (xView + 4050 + Pic.Width (window2), 0, maxx div 2,
		0) <= maxx div 2 then
	    Pic.Draw (window2, xView + 4050, groundHeight + 120, picCopy)
	end if
	if Math.Distance (xView + 3800, 0, maxx div 2, 0) <= maxx div 2 or Math.Distance (xView + 3800 + Pic.Width (window1), 0, maxx div 2,
		0) <= maxx div 2 then
	    Pic.Draw (window1, xView + 3800, groundHeight + 40, picCopy)
	end if
    elsif stage = 4 then
	Pic.Draw (stage4Background, round (xView / 1.3), groundHeight, picCopy)
    elsif stage = 5 then
	Pic.Draw (stage5Background, round (xView / 1.3), groundHeight, picCopy)
    elsif stage = 6 then
	Pic.Draw (stage6Background, round (xView / 1.3), groundHeight, picCopy)
    elsif stage = 7 then
	Pic.Draw (stage7Background, round (xView / 1.3), groundHeight, picCopy)
    end if

    % Draw the boxes
    for no : 1 .. noOfBoxes
	if Math.DistancePointLine (maxx div 2, 0, box_x1 (no) + xView, 0, box_x2 (no) + xView, 0) < maxx div 2 and isSolid (no) then
	    Draw.FillBox (box_x1 (no) + xView, box_y1 (no), box_x2 (no) + xView, box_y2 (no), boxClr (no))
	    Draw.Box (box_x1 (no) + xView, box_y1 (no), box_x2 (no) + xView, box_y2 (no), black)
	end if
    end for

    % Draw the portals
    if enemy_frame = 0 then
	Pic.Draw (rightPortal1, rightPortal_x + xView, rightPortal_y, picMerge)
	Pic.Draw (leftPortal1, leftPortal_x + xView, leftPortal_y, picMerge)
    elsif enemy_frame = 1 then
	Pic.Draw (rightPortal2, rightPortal_x + xView, rightPortal_y, picMerge)
	Pic.Draw (leftPortal2, leftPortal_x + xView, leftPortal_y, picMerge)
    end if



    % Drawing the enemy
    for no2 : 1 .. noOfEnemies

	if enemyIsAlive (no2) then

	    % Drawing the actual enemy
	    Pic.Draw (enemy_sprite (no2), enemy_x (no2) + xView, enemy_y (no2), picMerge)

	    % Only drawing if the player is close to the enemy
	    if Math.Distance (enemy_x (no2) + Pic.Width (enemy_sprite (no2)) + xView, 0, maxx div 2, 0) <= maxx div 2 or Math.Distance (enemy_x (no2) + xView,
		    0, maxx div 2,
		    0) <= maxx div 2 and enemyHP (no2) > 0
		    then

		% Drawing the health bar and name on top of the enemy
		Draw.FillBox (enemy_x (no2) + xView, enemy_y (no2) + Pic.Height (enemy_sprite (no2)) + 10, enemy_x (no2) + Pic.Width (enemy_sprite (no2)) +
		    xView, enemy_y (no2) +
		    Pic.Height (enemy_sprite (no2)) + 18, brightred)
		Draw.FillBox (enemy_x (no2) + xView, enemy_y (no2) + Pic.Height (enemy_sprite (no2)) + 10, enemy_x (no2) + Pic.Width (enemy_sprite (no2)) +
		    xView + round ((enemyHP (no2) -
		    enemyMaxHP (no2)) / (enemyMaxHP (no2)
		    / (enemy_x (no2) + Pic.Width (enemy_sprite (no2)) -
		    enemy_x (no2)))), enemy_y (no2) + Pic.Height (enemy_sprite (no2)) + 18, brightgreen)

		Draw.Text (enemyName (no2), enemy_x (no2) + xView + Pic.Width (enemy_sprite (no2)) div 2 - Font.Width (enemyName (no2), cambria14Bold) div 2,
		    enemy_y (no2) +
		    Pic.Height (enemy_sprite (no2))
		    + 23,
		    cambria14Bold, brightred)

		% Changing the sprite of the enemy for animation
		if enemyName (no2) = "Worm Lv 1" then
		    if enemyHSpeed (no2) > 0 then
			if enemy_frame = 0 then
			    enemy_sprite (no2) := worm_1_right
			elsif enemy_frame = 1 then
			    enemy_sprite (no2) := worm_2_right
			end if
		    elsif enemyHSpeed (no2) < 0 then
			if enemy_frame = 0 then
			    enemy_sprite (no2) := worm_1_left
			elsif enemy_frame = 1 then
			    enemy_sprite (no2) := worm_2_left
			end if
		    end if
		elsif enemyName (no2) = "Virus Lv 10" then
		    if enemy_frame = 0 then
			enemy_sprite (no2) := virus_1
		    elsif enemy_frame = 1 then
			enemy_sprite (no2) := virus_2
		    end if
		elsif enemyName (no2) = "Trojan Lv 20" then
		    if enemyHSpeed (no2) > 0 then
			if enemy_frame = 0 then
			    enemy_sprite (no2) := trojan_1_right
			elsif enemy_frame = 1 then
			    enemy_sprite (no2) := trojan_2_right
			end if
		    elsif enemyHSpeed (no2) < 0 then
			if enemy_frame = 0 then
			    enemy_sprite (no2) := trojan_1_left
			elsif enemy_frame = 1 then
			    enemy_sprite (no2) := trojan_2_left
			end if
		    end if
		elsif enemyName (no2) = "Spyware Lv 30" then
		    if enemyHSpeed (no2) > 0 then
			if enemy_frame = 0 then
			    enemy_sprite (no2) := spyware_1_right
			elsif enemy_frame = 1 then
			    enemy_sprite (no2) := spyware_2_right
			end if
		    elsif enemyHSpeed (no2) < 0 then
			if enemy_frame = 0 then
			    enemy_sprite (no2) := spyware_1_left
			elsif enemy_frame = 1 then
			    enemy_sprite (no2) := spyware_2_left
			end if
		    end if
		elsif enemyName (no2) = "Bot Lv 40" then
		    if enemyOnSurface (no2) = false then
			enemy_sprite (no2) := bot_jump
		    else
			if enemy_frame = 0 then
			    enemy_sprite (no2) := bot_1
			elsif enemy_frame = 1 then
			    enemy_sprite (no2) := bot_2
			end if
		    end if
		elsif enemyName (no2) = "Bug Lv 50" then
		    if enemyHSpeed (no2) > 0 then
			if enemy_frame = 0 then
			    enemy_sprite (no2) := bug_1_right
			elsif enemy_frame = 1 then
			    enemy_sprite (no2) := bug_2_right
			end if
		    elsif enemyHSpeed (no2) < 0 then
			if enemy_frame = 0 then
			    enemy_sprite (no2) := bug_1_left
			elsif enemy_frame = 1 then
			    enemy_sprite (no2) := bug_2_left
			end if
		    end if
		elsif enemyName (no2) = "Spam Lv 60" then
		    if enemy_frame = 0 then
			enemy_sprite (no2) := spam_1
		    elsif enemy_frame = 1 then
			enemy_sprite (no2) := spam_2
		    end if
		elsif enemyName (no2) = "The Corruptor" then
		    if enemy_frame = 0 then
			enemy_sprite (no2) := boss_1
		    elsif enemy_frame = 1 then
			enemy_sprite (no2) := boss_2
		    end if
		end if
	    end if

	end if


    end for

    % Changing the frames of the player
    if player_frame = 0 then
	if direction = 1 then
	    player_sprite := player_stand_right
	elsif direction = -1 then
	    player_sprite := player_stand_left
	end if
    elsif player_frame = 1 then
	if direction = 1 then
	    player_sprite := player_right1
	elsif direction = -1 then
	    player_sprite := player_left1
	end if

    elsif player_frame = 2 then
	if direction = 1 then
	    player_sprite := player_right2
	elsif direction = -1 then
	    player_sprite := player_left2
	end if
    end if

    % Changing the size of the shield
    if shieldSize = 1 and changeSize then
	shield1 := Pic.Scale (shield1, 110, 110)
	shield2 := Pic.Scale (shield2, 110, 110)
	changeSize := false
    elsif shieldSize = 2 and changeSize then
	shield1 := Pic.Scale (shield1, 150, 150)
	shield2 := Pic.Scale (shield2, 150, 150)
	changeSize := false
    elsif shieldSize = 3 and changeSize then
	shield1 := Pic.Scale (shield1, 190, 190)
	shield2 := Pic.Scale (shield2, 190, 190)
	changeSize := false
    elsif shieldSize = 4 and changeSize then
	shield1 := Pic.Scale (shield1, 230, 230)
	shield2 := Pic.Scale (shield2, 230, 230)
	changeSize := false
    elsif shieldSize = 5 and changeSize then
	shield1 := Pic.Scale (shield1, 270, 270)
	shield2 := Pic.Scale (shield2, 270, 270)
	changeSize := false
    end if


    % Drawing the player's shield
    if shieldIsActive and playerEnergy > 0 then
	if enemy_frame = 0 then
	    Pic.Draw (shield1, player_x + Pic.Width (player_sprite) div 2 - Pic.Width (shield1) div 2, player_y + Pic.Height (player_sprite) div 2 - Pic.Height (shield1) div 2, picMerge)
	elsif enemy_frame = 1 then
	    Pic.Draw (shield2, player_x + Pic.Width (player_sprite) div 2 - Pic.Width (shield1) div 2, player_y + Pic.Height (player_sprite) div 2 - Pic.Height (shield1) div 2, picMerge)
	end if
    end if

    Draw.FillBox (-maxx div 2, 0, world_x (stage) + maxx div 2, groundHeight, grey)
    Draw.Box (-maxx div 2, 0, world_x (stage) + maxx div 2, groundHeight, black)

    % Drawing the player
    Pic.Draw (player_sprite, player_x, player_y, picMerge)

    % Drawing the Name and Level above the character
    Draw.Text (playerName, player_x + Pic.Width (player_sprite) div 2 - Font.Width (playerName + "Lv " + intstr (playerLevel), cambria14Bold) div 2, player_y +
	Pic.Height (player_sprite)
	+ 5,
	cambria14Bold, brightgreen)
    Draw.Text (" Lv " + intstr (playerLevel), player_x + Pic.Width (player_sprite) div 2 -
	Font.Width (playerName + "Lv " + intstr (playerLevel), cambria14Bold) div 2 + Font.Width (playerName, cambria14Bold), player_y +
	Pic.Height (player_sprite) + 5, cambria14Bold, white)


    % Move and draw the projectile if spaces are free
    for no3 : 1 .. noOfProjectiles

	if projectileHit (no3) then
	    floatText (no3) += 1

	    % Draw only when the player is close
	    if Math.Distance (drawDMG_x (no3) + xView, 0, maxx div 2, 0) <= maxx div 2 + Pic.Width (player_sprite) then

		% Draw the floating numbers indicating the dmg
		if drawDMG (no3) > 0 then
		    Draw.Text (intstr (drawDMG (no3)), drawDMG_x (no3) + xView, drawDMG_y (no3) + floatText (no3), arial16Bold, brightred)
		end if

		% Draw the explosion
		if floatText (no3) < 10 and doesExplode (no3) then
		    Pic.Draw (explosion, drawDMG_x (no3) + xView, drawDMG_y (no3), picMerge)
		end if
	    end if

	    if floatText (no3) >= 50 then
		projectileHit (no3) := false
		doesExplode (no3) := false
		drawDMG (no3) := 0
		floatText (no3) := 0
	    end if

	end if

	if projectileExists (no3) then
	    if Math.Distance (projectile_x (no3) + xView, 0, maxx div 2, 0) <= maxx div 2 then
		Pic.Draw (projectileSprite (no3), xView + projectile_x (no3), projectile_y (no3), picMerge)
	    end if

	    projectile_x (no3) += projectileHSpeed (no3)
	    projectile_y (no3) += projectileVSpeed (no3)
	end if

    end for

    % Drawing the GUI
    Draw.FillBox (0, groundHeight - 20, maxx, groundHeight, darkgrey)

    Draw.Text ("Health", 340, 91, calibriLight20, black)
    Draw.Text ("Energy", 340, 51, calibriLight20, black)
    Draw.Text ("Experience", 340, 11, calibriLight20, black)

    % Draw the HP Bar
    Draw.FillBox (10, 90, 330, 115, darkgrey)

    if playerHP > 0 then
	Draw.FillBox (10, 90, 330 + round ((playerHP - playerMaxHP) / (playerMaxHP / 320)), 115, brightred)         % 3200 is difference between the two x values
	Draw.Text (intstr (round (playerHP)) + " / " + intstr (round (playerMaxHP)), 110, 91, arial20Bold, black)
    else
	Draw.Text ("You LOSE", 100, 91, arial20Bold, black)
    end if

    Draw.Box (10, 90, 330, 115, black)

    % Draw the energy bar
    Draw.FillBox (10, 50, 330, 75, darkgrey)

    Draw.FillBox (10, 50, 330 + round ((playerEnergy - playerMaxEnergy) / (playerMaxEnergy / 320)), 75, 11)         % 320 is difference between the two x values
    Draw.Text (intstr (round (playerEnergy)) + " / " + intstr (round (playerMaxEnergy)), 110, 51, arial20Bold, black)

    Draw.Box (10, 50, 330, 75, black)

    % Drawing the XP bar
    Draw.FillBox (10, 10, 330, 35, darkgrey)

    Draw.FillBox (10, 10, 330 + round ((playerXP - playerMaxXP) / (playerMaxXP / 320)), 35, yellow)         % 320 is difference between the two x values
    Draw.Text (intstr (playerXP) + " / " + intstr (playerMaxXP), 110, 11, arial20Bold, black)

    Draw.Box (10, 10, 330, 35, black)

    % Drawing the player level
    Draw.Text ("LvL:", 800, 15, cambria36Bold, red)
    Draw.Text (intstr (playerLevel), 800 + Font.Width ("Lvl:  ", cambria36Bold), 15, cambria36Bold, blue)

    % Draw boxes that show the characters
    Draw.FillBox (500, 50, 688, 114, black)
    if characterUsed = 1 then
	Pic.Draw (player1_head2, 502, 52, picCopy)
	Pic.Draw (player2_head1, 564, 52, picCopy)
	Pic.Draw (player3_head1, 626, 52, picCopy)
    elsif characterUsed = 2 then
	Pic.Draw (player1_head1, 502, 52, picCopy)
	Pic.Draw (player2_head2, 564, 52, picCopy)
	Pic.Draw (player3_head1, 626, 52, picCopy)
    elsif characterUsed = 3 then
	Pic.Draw (player1_head1, 502, 52, picCopy)
	Pic.Draw (player2_head1, 564, 52, picCopy)
	Pic.Draw (player3_head2, 626, 52, picCopy)
    end if

    Draw.Text ("J", 544, 52, arial20Bold, brightgreen)
    Draw.Text ("K", 606, 52, arial20Bold, brightgreen)
    Draw.Text ("L", 668, 52, arial20Bold, brightgreen)


    % Give Credit
    Draw.Text ("William Xu and Yulong Liu", 800, 110, arial12, red)

end draw


% Procedure for something happening constantly
procedure always

    % Regenerate Health
    if playerHP < playerMaxHP then
	playerHP += playerHpRegen
    end if

    % Regenerate Energy
    if playerEnergy < playerMaxEnergy and canShootLaser then
	playerEnergy += playerEnergyRegen
    end if

    % Make sure the bar doesn't go lower than 0
    if playerEnergy < 0 then
	playerEnergy := 0
    end if

    % The player dies if they fall too far down
    if player_y + Pic.Height (player_sprite) + 100 < groundHeight then
	playerHP := 0
    end if

    % Setting collision boxes

    if playerHSpeed not= 0 then
	player_x := maxx div 2 - Pic.Width (player_sprite) div 2
    end if

    % For the enemy
    for no2 : 1 .. noOfEnemies

	if enemyIsAlive (no2) then
	    if enemyHP (no2) <= 0 then
		playerXP += enemyXPDrop (no2)
		enemyIsAlive (no2) := false
		enemy_x (no2) := -999
		enemy_y (no2) := -999
	    end if

	    if enemyVSpeed (no2) < -24 then
		enemyVSpeed (no2) := -24
	    end if

	    enemy_y (no2) += round (enemyVSpeed (no2))
	    enemy_x (no2) += round (enemyHSpeed (no2))
	end if

    end for

    if playerVSpeed < -36 then
	playerVSpeed := -36
    end if

    xView += round (playerHSpeed)
    player_y += round (playerVSpeed)

    % Changing direction of the character
    if direction = 1 then
	player_used1 := player_right1
	player_used2 := player_right2
    elsif direction = -1 then
	player_used1 := player_left1
	player_used2 := player_left2
    end if

end always

% Create a leveling system with XP and such
procedure levelSystem

    if playerXP >= playerMaxXP and playerLevel < 100 then
	playerXP -= playerMaxXP

	playerMaxXP := round (playerMaxXP * 1.15) + 10
	playerLevel += 1

	% Increase the max HP and max Energy
	playerMaxHP += 20
	playerMaxEnergy += 20

	% Refill the player
	playerHP := playerMaxHP
	playerEnergy := playerMaxEnergy

	% Add three skillpoints
	skillPoints += 5

    end if

end levelSystem


% Procedure for gravity
procedure gravity
    if characterUsed = 1 or characterUsed = 2 then
	playerGravity := 3
    elsif characterUsed = 3 then
	playerGravity := 2
	if playerVSpeed < 0 and playerOnSurface = false then
	    playerMoving := true
	end if
    end if

    if not playerOnSurface then
	playerVSpeed -= playerGravity
    else
	playerVSpeed := 0
    end if

    % Gravity for the enemies, which is different for flying characters
    for no2 : 1 .. noOfEnemies
	if not enemyOnSurface (no2) then
	    if enemyName (no2) = "Spyware Lv 30" or enemyName (no2) = "Bug Lv 50" then
		enemy_y (no2) -= 3
	    elsif not enemyName (no2) = "The Corruptor" then
		enemyVSpeed (no2) -= playerGravity
	    end if
	else
	    enemyVSpeed (no2) := 0
	end if
    end for

end gravity

% Procedure for controlling the frame rate
procedure loopTimeControl

    loop
	loopControl2 := Time.Elapsed
	if loopControl2 - loopControl > delayPerFrame then
	    exit
	end if
    end loop

end loopTimeControl


% Process for collisions
procedure collisions

    for no2 : 1 .. noOfEnemies
	if enemyIsAlive (no2) then

	    % Check collision of enemy and player
	    if enemy_x (no2) + Pic.Width (enemy_sprite (no2)) + xView >= player_x and enemy_x (no2) + xView <= player_x + Pic.Width (player_sprite) and
		    enemy_y (no2) +
		    Pic.Height (enemy_sprite (no2)) >= player_y and enemy_y (no2)
		    <=
		    player_y +
		    Pic.Height (player_sprite) then

		if shieldIsActive and playerEnergy >= enemyDMG (no2) then
		    playerEnergy -= enemyDMG (no2)
		    enemyHP (no2) -= shieldDMG
		else
		    playerHP -= enemyDMG (no2)
		end if
	    end if

	    % Check collision of enemy and laser
	    if shotLaser and enemy_x (no2) + Pic.Width (enemy_sprite (no2)) >= laser_x1 and enemy_x (no2) <= laser_x2 and enemy_y (no2) +
		    Pic.Height (enemy_sprite (no2)) >= laser_y1 and
		    enemy_y (no2) <= laser_y2 then
		enemyHP (no2) -= laserDMG
	    end if


	    % Set that the enemy is not colliding with anything
	    enemyBoxJump (no2) := 0

	    for no : 1 .. noOfBoxes

		% Checking collision with box and enemy

		if box_x2 (no) >= enemy_x (no2) and box_x1 (no) <= enemy_x (no2) + Pic.Width (enemy_sprite (no2)) and box_y2 (no) >= enemy_y (no2) and
			box_y1 (no) <= enemy_y (no2) +
			Pic.Height (enemy_sprite (no2)) then
		    if box_y2 (no) - enemy_y (no2) <= 50 and enemyName (no2) = "Worm Lv 1" and isSolid (no) then
			enemy_y (no2) := box_y2 (no)
			enemyBoxJump (no2) := no
		    elsif box_y2 (no) - enemy_y (no2) <= 50 and enemyName (no2) = "Virus Lv 10" and isSolid (no) then
			enemy_y (no2) := box_y2 (no)
			enemyBoxJump (no2) := no
		    elsif box_y2 (no) - enemy_y (no2) <= 25 and enemyName (no2) = "Trojan Lv 20" and isSolid (no) then
			enemy_y (no2) := box_y2 (no)
			enemyBoxJump (no2) := no
		    elsif box_y2 (no) - enemy_y (no2) <= 50 and enemyName (no2) = "Bot Lv 40" and isSolid (no) then
			enemy_y (no2) := box_y2 (no)
			enemyBoxJump (no2) := no
		    elsif box_y2 (no) - enemy_y (no2) <= 50 and enemyName (no2) = "Spam Lv 60" and isSolid (no) then
			enemy_y (no2) := box_y2 (no)
			enemyBoxJump (no2) := no
		    elsif box_y2 (no) - enemy_y (no2) <= 50 and enemyName (no2) = "The Corruptor" and isSolid (no) then
			enemy_y (no2) := box_y2 (no)
			enemyBoxJump (no2) := no
		    elsif enemyCanTurn (no2) and isPlatform (no) = false then
			enemyHSpeed (no2) *= -1
			enemy_x (no2) += round (enemyHSpeed (no2))
			enemyCanTurn (no2) := false
		    end if
		else
		    enemyCanTurn (no2) := true
		end if


		% Separate collision check for flying enemies

		if box_x2 (no) >= enemy_x (no2) and box_x1 (no) <= enemy_x (no2) + Pic.Width (enemy_sprite (no2)) and box_y2 (no) + enemyFlyHeight >
			enemy_y (no2) and box_y1 (no) <=
			enemy_y (no2) +
			Pic.Height (enemy_sprite (no2)) then
		    if box_y2 (no) - enemy_y (no2) <= 0 and enemyName (no2) = "Spyware Lv 30" and isSolid (no) and enemy_y (no2) < box_y2 (no) + enemyFlyHeight
			    then
			enemy_y (no2) += 3
			enemyBoxJump (no2) := no
		    elsif box_y2 (no) - enemy_y (no2) <= 0 and enemyName (no2) = "Bug Lv 50" and isSolid (no) and enemy_y (no2) < box_y2 (no) + enemyFlyHeight
			    then
			enemy_y (no2) += 3
			enemyBoxJump (no2) := no
		    end if
		else
		    enemyCanTurn (no2) := true
		end if

		% If the enemy hopped onto a box
		if enemyBoxJump (no2) = 0 then
		    enemyOnSurface (no2) := false
		else
		    enemyOnSurface (no2) := true
		end if
	    end for
	end if

    end for


    % Checking collision for player
    for no : 1 .. noOfBoxes

	if playerVSpeed < 0 and playerFall = false then
	    % checking collision with box and player
	    if box_x2 (no) + xView >= player_x and box_x1 (no) + xView <= player_x + Pic.Width (player_sprite) and box_y2 (no) >= player_y and box_y2 (no) +
		    playerVSpeed <= player_y and
		    isSolid (no)
		    then
		playerOnSurface := true
		if player_y < box_y2 (no) then
		    player_y := box_y2 (no)
		end if
	    end if
	end if
    end for

    % Checking collisions with portals
    if leftPortal_x + Pic.Width (leftPortal1) div 2 + xView >= player_x and leftPortal_x + Pic.Width (leftPortal1) div 2 + xView <= player_x + Pic.Width (player_sprite) and
	    leftPortal_y + Pic.Height (leftPortal1) >= player_y and leftPortal_y <= player_y + Pic.Height (player_sprite) then
	changeRoom := true
	stage -= 1
	endProcesses := true
	enterFrom := "right"
    end if

    if rightPortal_x + Pic.Width (rightPortal1) div 2 + xView >= player_x and rightPortal_x + Pic.Width (rightPortal1) div 2 + xView <= player_x + Pic.Width (player_sprite) and
	    rightPortal_y + Pic.Height (rightPortal1) >= player_y and rightPortal_y <= player_y + Pic.Height (player_sprite) then
	changeRoom := true
	if stage < 7 then
	    stage += 1
	else
	    stage := 0
	end if
	endProcesses := true
	enterFrom := "left"
    end if

end collisions

% The instructions
procedure drawInstructions1
    loop
	Pic.Draw (instructions1, 0, 0, picCopy)
	Pic.Draw (forwardArrowButton, 800, 50, picMerge)
	Pic.Draw (backArrowButton, 740, 50, picMerge)
	if mouseOver (740, 50, 740 + Pic.Width (backArrowButton), 50 + Pic.Height (backArrowButton)) then
	    Pic.Draw (backArrowButtonGlow, 740, 50, picCopy)
	    if mouseClick (740, 50, 740 + Pic.Width (backArrowButton), 50 + Pic.Height (backArrowButton)) then
		stage := 0
		changeRoom := true
	    end if
	end if
	if mouseOver (800, 50, 800 + Pic.Width (forwardArrowButton), 50 + Pic.Height (forwardArrowButton)) then
	    Pic.Draw (forwardArrowButtonGlow, 800, 50, picCopy)
	    if mouseClick (800, 50, 800 + Pic.Width (forwardArrowButton), 50 + Pic.Height (forwardArrowButton)) then
		stage := -6
		changeRoom := true
	    end if
	end if
	delay (30)
	View.Update
	cls
	exit when changeRoom
    end loop
end drawInstructions1

procedure drawInstructions2
    loop
	Pic.Draw (instructions2, 0, 0, picCopy)
	Pic.Draw (forwardArrowButton, 200, 50, picMerge)
	Pic.Draw (backArrowButton, 140, 50, picMerge)
	if mouseOver (140, 50, 140 + Pic.Width (backArrowButton), 50 + Pic.Height (backArrowButton)) then
	    Pic.Draw (backArrowButtonGlow, 140, 50, picCopy)
	    if mouseClick (140, 50, 140 + Pic.Width (backArrowButton), 50 + Pic.Height (backArrowButton)) then
		stage := -5
		changeRoom := true
	    end if
	end if
	if mouseOver (200, 50, 200 + Pic.Width (forwardArrowButton), 50 + Pic.Height (forwardArrowButton)) then
	    Pic.Draw (forwardArrowButtonGlow, 200, 50, picCopy)
	    if mouseClick (200, 50, 800 + Pic.Width (forwardArrowButton), 50 + Pic.Height (forwardArrowButton)) then
		stage := -7
		changeRoom := true
	    end if
	end if
	delay (30)
	View.Update
	cls
	exit when changeRoom
    end loop
end drawInstructions2

procedure drawInstructions3
    loop
	Pic.Draw (instructions3, 0, 0, picCopy)
	Pic.Draw (forwardArrowButton, 800, 50, picMerge)
	Pic.Draw (backArrowButton, 740, 50, picMerge)
	if mouseOver (740, 50, 740 + Pic.Width (backArrowButton), 50 + Pic.Height (backArrowButton)) then
	    Pic.Draw (backArrowButtonGlow, 740, 50, picCopy)
	    if mouseClick (740, 50, 740 + Pic.Width (backArrowButton), 50 + Pic.Height (backArrowButton)) then
		stage := -6
		changeRoom := true
	    end if
	end if
	if mouseOver (800, 50, 800 + Pic.Width (forwardArrowButton), 50 + Pic.Height (forwardArrowButton)) then
	    Pic.Draw (forwardArrowButtonGlow, 800, 50, picCopy)
	    if mouseClick (800, 50, 800 + Pic.Width (forwardArrowButton), 50 + Pic.Height (forwardArrowButton)) then
		stage := 0
		changeRoom := true
	    end if
	end if
	delay (30)
	View.Update
	cls
	exit when changeRoom
    end loop
end drawInstructions3




% The store
procedure drawShop
    loop
	Pic.Draw (storePic, 0, 0, picCopy)
	Pic.Draw (backArrowButton, 30, 620, picCopy)
	Pic.Draw (offenseButton, 157, 145, picMerge)
	Pic.Draw (defenseButton, 623, 145, picMerge)
	Draw.Text (intstr (skillPoints), 800, 608, calibriLight20, black)

	if mouseOver (157, 145, 157 + Pic.Width (offenseButton), 145 + Pic.Height (offenseButton)) then
	    Pic.Draw (offenseButtonGlow, 157, 145, picMerge)
	    if mouseClick (157, 145, 157 + Pic.Width (offenseButton), 145 + Pic.Height (offenseButton)) then
		changeRoom := true
		stage := -3
	    end if
	end if

	if mouseOver (624, 145, 623 + Pic.Width (offenseButton), 145 + Pic.Height (offenseButton)) then
	    Pic.Draw (offenseButtonGlow, 623, 145, picMerge)
	    if mouseClick (623, 145, 623 + Pic.Width (offenseButton), 145 + Pic.Height (offenseButton)) then
		changeRoom := true
		stage := -4
	    end if
	end if

	if mouseOver (623, 145, 623 + Pic.Width (defenseButton), 145 + Pic.Height (defenseButton)) then
	    Pic.Draw (defenseButtonGlow, 623, 145, picMerge)
	end if

	if mouseOver (30, 620, 30 + Pic.Width (backArrowButton), 620 + Pic.Height (backArrowButton)) then
	    Pic.Draw (backArrowButtonGlow, 30, 620, picCopy)
	    if mouseClick (30, 620, 30 + Pic.Width (backArrowButton), 620 + Pic.Height (backArrowButton)) then
		stage := 0
		changeRoom := true
	    end if
	end if



	delay (30)
	View.Update
	cls
	exit when changeRoom
    end loop
end drawShop

% Offense shop
procedure drawOffenseShop
    loop
	% Drawing the shop and the buttons
	Pic.Draw (offenseShop, 0, 0, picCopy)
	Pic.Draw (description, 628, 208, picCopy)
	Pic.Draw (backArrowButton, 30, 620, picCopy)
	Pic.Draw (damageUp, 225, 510, picCopy)
	Pic.Draw (multiShot, 225, 410, picCopy)
	Pic.Draw (laserUp, 225, 310, picCopy)
	Pic.Draw (lazer, 225, 210, picCopy)
	Pic.Draw (damageShield, 225, 110, picCopy)
	Pic.Draw (bigShield, 225, 10, picCopy)
	Draw.Text (intstr (skillPoints), 800, 608, calibriLight20, black)

	% Drawing the "+1" buttons to allow the user to add points
	Pic.Draw (levelButton, 520, 530, picMerge)
	Pic.Draw (levelButton, 520, 430, picMerge)
	Pic.Draw (levelButton, 520, 330, picMerge)
	Pic.Draw (levelButton, 520, 230, picMerge)
	Pic.Draw (levelButton, 520, 130, picMerge)
	Pic.Draw (levelButton, 520, 30, picMerge)

	% Highlight the the " +1 " button when hovered over
	if mouseOver (520, 530, 520 + Pic.Width (levelButton), 530 + Pic.Height (levelButton)) then
	    Pic.Draw (levelButtonGlow, 520, 530, picMerge)
	elsif mouseOver (520, 430, 520 + Pic.Width (levelButton), 430 + Pic.Height (levelButton)) then
	    Pic.Draw (levelButtonGlow, 520, 430, picMerge)
	elsif mouseOver (520, 330, 520 + Pic.Width (levelButton), 330 + Pic.Height (levelButton)) then
	    Pic.Draw (levelButtonGlow, 520, 330, picMerge)
	elsif mouseOver (520, 230, 520 + Pic.Width (levelButton), 230 + Pic.Height (levelButton)) then
	    Pic.Draw (levelButtonGlow, 520, 230, picMerge)
	elsif mouseOver (520, 130, 520 + Pic.Width (levelButton), 130 + Pic.Height (levelButton)) then
	    Pic.Draw (levelButtonGlow, 520, 130, picMerge)
	elsif mouseOver (520, 30, 520 + Pic.Width (levelButton), 30 + Pic.Height (levelButton)) then
	    Pic.Draw (levelButtonGlow, 520, 30, picMerge)
	end if

	% Display info of a skill when mouse is hovered over it
	if mouseOver (225, 510, 225 + Pic.Width (damageUp), 510 + Pic.Height (damageUp)) then
	    Pic.Draw (damageUpInfo, 628, 208, picCopy)
	    Draw.FillBox (670, 280, 940, 330, white)
	    Draw.FillBox (670, 280, 940 + round ((damageUpCurrentPoints - damageUpPointsNeeded) / (damageUpPointsNeeded / 270)), 330, yellow)
	    Draw.Box (670, 280, 940, 330, black)
	    Draw.Text (intstr (damageUpCurrentLevel), 750, 440, calibriLight20, black)
	    Draw.Text (intstr (damageUpMaxLevel), 750, 405, calibriLight20, black)
	    if damageUpCurrentLevel not= damageUpMaxLevel then
		Draw.Text (intstr (round (damageUpCurrentPoints)) + " / " + intstr (round (damageUpPointsNeeded)), 780, 293, arial20Bold, black)
	    else
		Draw.Text ("MAX LEVEL", 751, 296, calibriLight20, black)
	    end if
	elsif mouseOver (225, 410, 225 + Pic.Width (multiShot), 410 + Pic.Height (multiShot)) then
	    Pic.Draw (multiShotInfo, 628, 208, picCopy)
	    Draw.FillBox (670, 280, 940, 330, white)
	    Draw.FillBox (670, 280, 940 + round ((multiShotsCurrentPoints - multiShotsPointsNeeded) / (multiShotsPointsNeeded / 270)), 330, yellow)
	    Draw.Box (670, 280, 940, 330, black)
	    Draw.Text (intstr (multiShotsCurrentLevel), 750, 440, calibriLight20, black)
	    Draw.Text (intstr (multiShotsMaxLevel), 750, 405, calibriLight20, black)
	    if multiShotsCurrentLevel not= multiShotsMaxLevel then
		Draw.Text (intstr (round (multiShotsCurrentPoints)) + " / " + intstr (round (multiShotsPointsNeeded)), 780, 293, arial20Bold, black)
	    else
		Draw.Text ("MAX LEVEL", 751, 296, calibriLight20, black)
	    end if
	elsif mouseOver (225, 310, 225 + Pic.Width (laserUp), 310 + Pic.Height (laserUp)) then
	    Pic.Draw (lazerUpInfo, 628, 208, picCopy)
	    Draw.FillBox (670, 280, 940, 330, white)
	    Draw.FillBox (670, 280, 940 + round ((laserUpCurrentPoints - laserUpPointsNeeded) / (laserUpPointsNeeded / 270)), 330, yellow)
	    Draw.Box (670, 280, 940, 330, black)
	    Draw.Text (intstr (laserUpCurrentLevel), 750, 440, calibriLight20, black)
	    Draw.Text (intstr (laserUpMaxLevel), 750, 405, calibriLight20, black)
	    if laserUpCurrentLevel not= laserUpMaxLevel then
		Draw.Text (intstr (round (laserUpCurrentPoints)) + " / " + intstr (round (laserUpPointsNeeded)), 780, 293, arial20Bold, black)
	    else
		Draw.Text ("MAX LEVEL", 751, 296, calibriLight20, black)
	    end if
	elsif mouseOver (225, 210, 225 + Pic.Width (lazer), 210 + Pic.Height (lazer)) then
	    Pic.Draw (lazerInfo, 628, 208, picCopy)
	    Draw.FillBox (670, 280, 940, 330, white)
	    Draw.FillBox (670, 280, 940 + round ((lazerCurrentPoints - lazerPointsNeeded) / (lazerPointsNeeded / 270)), 330, yellow)
	    Draw.Box (670, 280, 940, 330, black)
	    Draw.Text (intstr (lazerCurrentLevel), 750, 440, calibriLight20, black)
	    Draw.Text (intstr (lazerMaxLevel), 750, 405, calibriLight20, black)
	    if lazerCurrentLevel not= lazerMaxLevel then
		Draw.Text (intstr (round (lazerCurrentPoints)) + " / " + intstr (round (lazerPointsNeeded)), 780, 293, arial20Bold, black)
	    else
		Draw.Text ("MAX LEVEL", 751, 296, calibriLight20, black)
	    end if
	elsif mouseOver (225, 110, 225 + Pic.Width (damageShield), 110 + Pic.Height (damageShield)) then
	    Pic.Draw (damageShieldInfo, 628, 208, picCopy)
	    Draw.FillBox (670, 280, 940, 330, white)
	    Draw.FillBox (670, 280, 940 + round ((damageShieldCurrentPoints - damageShieldPointsNeeded) / (damageShieldPointsNeeded / 270)), 330, yellow)
	    Draw.Box (670, 280, 940, 330, black)
	    Draw.Text (intstr (damageShieldCurrentLevel), 750, 440, calibriLight20, black)
	    Draw.Text (intstr (damageShieldMaxLevel), 750, 405, calibriLight20, black)
	    if damageShieldCurrentLevel not= damageShieldMaxLevel then
		Draw.Text (intstr (round (damageShieldCurrentPoints)) + " / " + intstr (round (damageShieldPointsNeeded)), 780, 293, arial20Bold, black)
	    else
		Draw.Text ("MAX LEVEL", 751, 296, calibriLight20, black)
	    end if
	elsif mouseOver (225, 10, 225 + Pic.Width (bigShield), 10 + Pic.Height (bigShield)) then
	    Pic.Draw (bigShieldInfo, 628, 208, picCopy)
	    Draw.FillBox (670, 280, 940, 330, white)
	    Draw.FillBox (670, 280, 940 + round ((bigShieldCurrentPoints - bigShieldPointsNeeded) / (bigShieldPointsNeeded / 270)), 330, yellow)
	    Draw.Box (670, 280, 940, 330, black)
	    Draw.Text (intstr (bigShieldCurrentLevel), 750, 440, calibriLight20, black)
	    Draw.Text (intstr (bigShieldMaxLevel), 750, 405, calibriLight20, black)
	    if bigShieldCurrentLevel not= bigShieldMaxLevel then
		Draw.Text (intstr (round (bigShieldCurrentPoints)) + " / " + intstr (round (bigShieldPointsNeeded)), 780, 293, arial20Bold, black)
	    else
		Draw.Text ("MAX LEVEL", 751, 296, calibriLight20, black)
	    end if
	end if

	if mouseClick (520, 530, 520 + Pic.Width (levelButton), 530 + Pic.Height (levelButton)) and canPress then
	    canPress := false
	    if skillPoints > 0 and damageUpCurrentLevel < damageUpMaxLevel then
		skillPoints -= 1
		damageUpCurrentPoints += 1
		if damageUpCurrentPoints = damageUpPointsNeeded and damageUpCurrentLevel <= damageUpMaxLevel then
		    damageUpCurrentLevel += 1
		    damageUpPointsNeeded += 2
		    damageUpCurrentPoints := 0
		    lowestDMG += damageUpCurrentLevel
		    highestDMG += damageUpCurrentLevel * 2
		end if
	    end if
	elsif buttonmoved ("up") then
	    canPress := true
	end if

	if mouseClick (520, 430, 520 + Pic.Width (levelButton), 430 + Pic.Height (levelButton)) and canPress then
	    canPress := false
	    if skillPoints > 0 and multiShotsCurrentLevel < multiShotsMaxLevel then
		skillPoints -= 1
		multiShotsCurrentPoints += 1
		if multiShotsCurrentPoints = multiShotsPointsNeeded and multiShotsCurrentLevel <= multiShotsMaxLevel then
		    multiShotsCurrentLevel += 1
		    multiShotsPointsNeeded += 6
		    multiShotsCurrentPoints := 0
		    noOfShots += 1
		end if
	    end if
	elsif buttonmoved ("up") then
	    canPress := true
	end if
	if mouseClick (520, 330, 520 + Pic.Width (levelButton), 330 + Pic.Height (levelButton)) and canPress then
	    canPress := false
	    if skillPoints > 0 and laserUpCurrentLevel < laserUpMaxLevel then
		skillPoints -= 1
		laserUpCurrentPoints += 1
		if laserUpCurrentPoints = laserUpPointsNeeded and laserUpCurrentLevel <= laserUpMaxLevel then
		    laserUpCurrentLevel += 1
		    laserUpPointsNeeded += 2
		    laserUpCurrentPoints := 0
		    laserDMG += laserUpCurrentLevel
		    laserDrainAmount += 1
		end if
	    elsif buttonmoved ("up") then
		canPress := true
	    end if
	end if


	if mouseClick (520, 230, 520 + Pic.Width (levelButton), 230 + Pic.Height (levelButton)) and canPress then
	    canPress := false
	    if skillPoints > 0 and lazerCurrentLevel < lazerMaxLevel then
		skillPoints -= 1
		lazerCurrentPoints += 1
		if lazerCurrentPoints = lazerPointsNeeded and lazerCurrentLevel <= lazerMaxLevel then
		    lazerCurrentLevel += 1
		    lazerPointsNeeded += 5
		    lazerCurrentPoints := 0
		    laserSize += 1
		end if
	    end if
	elsif buttonmoved ("up") then
	    canPress := true
	end if

	if mouseClick (520, 130, 520 + Pic.Width (levelButton), 130 + Pic.Height (levelButton)) and canPress then
	    canPress := false
	    if skillPoints > 0 and damageShieldCurrentLevel < damageShieldMaxLevel then
		skillPoints -= 1
		damageShieldCurrentPoints += 1
		if damageShieldCurrentPoints >= damageShieldPointsNeeded and damageShieldCurrentLevel <= damageShieldMaxLevel then
		    damageShieldCurrentLevel += 1
		    damageShieldPointsNeeded += 2
		    damageShieldCurrentPoints := 0
		    shieldDMG += 1
		end if
	    end if
	elsif buttonmoved ("up") then
	    canPress := true
	end if

	if mouseClick (520, 30, 520 + Pic.Width (levelButton), 30 + Pic.Height (levelButton)) and canPress then
	    canPress := false
	    if skillPoints > 0 and bigShieldCurrentLevel < bigShieldMaxLevel then
		skillPoints -= 1
		bigShieldCurrentPoints += 1
		if bigShieldCurrentPoints >= bigShieldPointsNeeded and bigShieldCurrentLevel <= bigShieldMaxLevel then
		    bigShieldCurrentLevel += 1
		    bigShieldPointsNeeded += 5
		    bigShieldCurrentPoints := 0
		    shieldSize += 1
		    changeSize := true
		end if
	    end if
	elsif buttonmoved ("up") then
	    canPress := true
	end if

	if mouseOver (30, 620, 30 + Pic.Width (backArrowButton), 620 + Pic.Height (backArrowButton)) then
	    Pic.Draw (backArrowButtonGlow, 30, 620, picCopy)
	end if

	if mouseClick (30, 620, 30 + Pic.Width (backArrowButton), 620 + Pic.Height (backArrowButton)) then
	    stage := -2
	    changeRoom := true
	end if
	delay (30)
	View.Update
	cls
	exit when changeRoom
    end loop
end drawOffenseShop

%  General shop
procedure drawGeneralShop
    loop
	% Drawing the shop and the buttons
	Pic.Draw (generalShop, 0, 0, picCopy)
	Pic.Draw (description, 628, 208, picCopy)
	Pic.Draw (backArrowButton, 30, 620, picCopy)
	Pic.Draw (speedUp, 225, 510, picCopy)
	Pic.Draw (jumpHeightUp, 225, 410, picCopy)
	Pic.Draw (increaseMaxHealth, 225, 310, picCopy)
	Pic.Draw (healthRegen, 225, 210, picCopy)
	Pic.Draw (increaseMaxEnergy, 225, 110, picCopy)
	Pic.Draw (energyRegen, 225, 10, picCopy)
	Draw.Text (intstr (skillPoints), 800, 608, calibriLight20, black)

	% Drawing the "+1" buttons to allow the user to add points
	Pic.Draw (levelButton, 520, 530, picMerge)
	Pic.Draw (levelButton, 520, 430, picMerge)
	Pic.Draw (levelButton, 520, 330, picMerge)
	Pic.Draw (levelButton, 520, 230, picMerge)
	Pic.Draw (levelButton, 520, 130, picMerge)
	Pic.Draw (levelButton, 520, 30, picMerge)

	% Highlight the the " +1 " button when hovered over
	if mouseOver (520, 530, 520 + Pic.Width (levelButton), 530 + Pic.Height (levelButton)) then
	    Pic.Draw (levelButtonGlow, 520, 530, picMerge)
	elsif mouseOver (520, 430, 520 + Pic.Width (levelButton), 430 + Pic.Height (levelButton)) then
	    Pic.Draw (levelButtonGlow, 520, 430, picMerge)
	elsif mouseOver (520, 330, 520 + Pic.Width (levelButton), 330 + Pic.Height (levelButton)) then
	    Pic.Draw (levelButtonGlow, 520, 330, picMerge)
	elsif mouseOver (520, 230, 520 + Pic.Width (levelButton), 230 + Pic.Height (levelButton)) then
	    Pic.Draw (levelButtonGlow, 520, 230, picMerge)
	elsif mouseOver (520, 130, 520 + Pic.Width (levelButton), 130 + Pic.Height (levelButton)) then
	    Pic.Draw (levelButtonGlow, 520, 130, picMerge)
	elsif mouseOver (520, 30, 520 + Pic.Width (levelButton), 30 + Pic.Height (levelButton)) then
	    Pic.Draw (levelButtonGlow, 520, 30, picMerge)
	end if

	if mouseOver (225, 510, 225 + Pic.Width (speedUp), 510 + Pic.Height (speedUp)) then
	    Pic.Draw (speedUpInfo, 628, 208, picCopy)
	    Draw.FillBox (670, 280, 940, 330, white)
	    Draw.FillBox (670, 280, 940 + round ((speedUpCurrentPoints - speedUpPointsNeeded) / (speedUpPointsNeeded / 270)), 330, yellow)
	    Draw.Box (670, 280, 940, 330, black)
	    Draw.Text (intstr (speedUpCurrentLevel), 750, 440, calibriLight20, black)
	    Draw.Text (intstr (speedUpMaxLevel), 750, 405, calibriLight20, black)
	    if speedUpCurrentLevel not= speedUpMaxLevel then
		Draw.Text (intstr (round (speedUpCurrentPoints)) + " / " + intstr (round (speedUpPointsNeeded)), 780, 293, arial20Bold, black)
	    else
		Draw.Text ("MAX LEVEL", 751, 296, calibriLight20, black)
	    end if
	elsif mouseOver (225, 410, 225 + Pic.Width (jumpHeightUp), 410 + Pic.Height (jumpHeightUp)) then
	    Pic.Draw (jumpHeightUpInfo, 628, 208, picCopy)
	    Draw.FillBox (670, 280, 940, 330, white)
	    Draw.FillBox (670, 280, 940 + round ((jumpHeightUpCurrentPoints - jumpHeightUpPointsNeeded) / (jumpHeightUpPointsNeeded / 270)), 330, yellow)
	    Draw.Box (670, 280, 940, 330, black)
	    Draw.Text (intstr (jumpHeightUpCurrentLevel), 750, 440, calibriLight20, black)
	    Draw.Text (intstr (jumpHeightUpMaxLevel), 750, 405, calibriLight20, black)
	    if jumpHeightUpCurrentLevel not= jumpHeightUpMaxLevel then
		Draw.Text (intstr (round (jumpHeightUpCurrentPoints)) + " / " + intstr (round (jumpHeightUpPointsNeeded)), 780, 293, arial20Bold, black)
	    else
		Draw.Text ("MAX LEVEL", 751, 296, calibriLight20, black)
	    end if
	elsif mouseOver (225, 310, 225 + Pic.Width (increaseMaxHealth), 310 + Pic.Height (increaseMaxHealth)) then
	    Pic.Draw (increaseMaxHealthInfo, 628, 208, picCopy)
	    Draw.FillBox (670, 280, 940, 330, white)
	    Draw.FillBox (670, 280, 940 + round ((increaseMaxHealthCurrentPoints - increaseMaxHealthPointsNeeded) / (increaseMaxHealthPointsNeeded / 270)), 330, yellow)
	    Draw.Box (670, 280, 940, 330, black)
	    Draw.Text (intstr (increaseMaxHealthCurrentLevel), 750, 440, calibriLight20, black)
	    Draw.Text (intstr (increaseMaxHealthMaxLevel), 750, 405, calibriLight20, black)
	    if increaseMaxHealthCurrentLevel not= increaseMaxHealthMaxLevel then
		Draw.Text (intstr (round (increaseMaxHealthCurrentPoints)) + " / " + intstr (round (increaseMaxHealthPointsNeeded)), 780, 293, arial20Bold, black)
	    else
		Draw.Text ("MAX LEVEL", 751, 296, calibriLight20, black)
	    end if
	elsif mouseOver (225, 210, 225 + Pic.Width (healthRegen), 210 + Pic.Height (healthRegen)) then
	    Pic.Draw (healthRegenInfo, 628, 208, picCopy)
	    Draw.FillBox (670, 280, 940, 330, white)
	    Draw.FillBox (670, 280, 940 + round ((healthRegenCurrentPoints - healthRegenPointsNeeded) / (healthRegenPointsNeeded / 270)), 330, yellow)
	    Draw.Box (670, 280, 940, 330, black)
	    Draw.Text (intstr (healthRegenCurrentLevel), 750, 440, calibriLight20, black)
	    Draw.Text (intstr (healthRegenMaxLevel), 750, 405, calibriLight20, black)
	    if healthRegenCurrentLevel not= healthRegenMaxLevel then
		Draw.Text (intstr (round (healthRegenCurrentPoints)) + " / " + intstr (round (healthRegenPointsNeeded)), 780, 293, arial20Bold, black)
	    else
		Draw.Text ("MAX LEVEL", 751, 296, calibriLight20, black)
	    end if
	elsif mouseOver (225, 110, 225 + Pic.Width (increaseMaxEnergy), 110 + Pic.Height (increaseMaxEnergy)) then
	    Pic.Draw (increaseMaxEnergyInfo, 628, 208, picCopy)
	    Draw.FillBox (670, 280, 940, 330, white)
	    Draw.FillBox (670, 280, 940 + round ((increaseMaxEnergyCurrentPoints - increaseMaxEnergyPointsNeeded) / (increaseMaxEnergyPointsNeeded / 270)), 330, yellow)
	    Draw.Box (670, 280, 940, 330, black)
	    Draw.Text (intstr (increaseMaxEnergyCurrentLevel), 750, 440, calibriLight20, black)
	    Draw.Text (intstr (increaseMaxEnergyMaxLevel), 750, 405, calibriLight20, black)
	    if increaseMaxEnergyCurrentLevel not= increaseMaxEnergyMaxLevel then
		Draw.Text (intstr (round (increaseMaxEnergyCurrentPoints)) + " / " + intstr (round (increaseMaxEnergyPointsNeeded)), 780, 293, arial20Bold, black)
	    else
		Draw.Text ("MAX LEVEL", 751, 296, calibriLight20, black)
	    end if
	elsif mouseOver (225, 10, 225 + Pic.Width (energyRegen), 10 + Pic.Height (energyRegen)) then
	    Pic.Draw (energyRegenInfo, 628, 208, picCopy)
	    Draw.FillBox (670, 280, 940, 330, white)
	    Draw.FillBox (670, 280, 940 + round ((energyRegenCurrentPoints - energyRegenPointsNeeded) / (energyRegenPointsNeeded / 270)), 330, yellow)
	    Draw.Box (670, 280, 940, 330, black)
	    Draw.Text (intstr (energyRegenCurrentLevel), 750, 440, calibriLight20, black)
	    Draw.Text (intstr (energyRegenMaxLevel), 750, 405, calibriLight20, black)
	    if energyRegenCurrentLevel not= energyRegenMaxLevel then
		Draw.Text (intstr (round (energyRegenCurrentPoints)) + " / " + intstr (round (energyRegenPointsNeeded)), 780, 293, arial20Bold, black)
	    else
		Draw.Text ("MAX LEVEL", 751, 296, calibriLight20, black)
	    end if
	end if

	if mouseClick (520, 530, 520 + Pic.Width (levelButton), 530 + Pic.Height (levelButton)) and canPress then
	    canPress := false
	    if skillPoints > 0 and speedUpCurrentLevel < speedUpMaxLevel then
		skillPoints -= 1
		speedUpCurrentPoints += 1
		if speedUpCurrentPoints = speedUpPointsNeeded and speedUpCurrentLevel <= speedUpMaxLevel then
		    speedUpCurrentLevel += 1
		    speedUpPointsNeeded += 10
		    speedUpCurrentPoints := 0
		    playerMovement += 2
		end if
	    end if
	elsif buttonmoved ("up") then
	    canPress := true
	end if

	if mouseClick (520, 430, 520 + Pic.Width (levelButton), 430 + Pic.Height (levelButton)) and canPress then
	    canPress := false
	    if skillPoints > 0 and jumpHeightUpCurrentLevel < jumpHeightUpMaxLevel then
		skillPoints -= 1
		jumpHeightUpCurrentPoints += 1
		if jumpHeightUpCurrentPoints = jumpHeightUpPointsNeeded and jumpHeightUpCurrentLevel <= jumpHeightUpMaxLevel then
		    jumpHeightUpCurrentLevel += 1
		    jumpHeightUpPointsNeeded += 5
		    jumpHeightUpCurrentPoints := 0
		    playerJumpHeight += 1
		end if
	    end if
	elsif buttonmoved ("up") then
	    canPress := true
	end if

	if mouseClick (520, 330, 520 + Pic.Width (levelButton), 330 + Pic.Height (levelButton)) and canPress then
	    canPress := false
	    if skillPoints > 0 and increaseMaxHealthCurrentLevel < increaseMaxHealthMaxLevel then
		skillPoints -= 1
		increaseMaxHealthCurrentPoints += 1
		if increaseMaxHealthCurrentPoints = increaseMaxHealthPointsNeeded and increaseMaxHealthCurrentLevel <= increaseMaxHealthMaxLevel then
		    increaseMaxHealthCurrentLevel += 1
		    increaseMaxHealthPointsNeeded += 5
		    increaseMaxHealthCurrentPoints := 0
		    playerMaxHP += 50 * increaseMaxHealthCurrentLevel
		end if
	    end if
	elsif buttonmoved ("up") then
	    canPress := true
	end if

	if mouseClick (520, 230, 520 + Pic.Width (levelButton), 230 + Pic.Height (levelButton)) and canPress then
	    canPress := false
	    if skillPoints > 0 and healthRegenCurrentLevel < healthRegenMaxLevel then
		skillPoints -= 1
		healthRegenCurrentPoints += 1
		if healthRegenCurrentPoints = healthRegenPointsNeeded and healthRegenCurrentLevel <= healthRegenMaxLevel then
		    healthRegenCurrentLevel += 1
		    healthRegenPointsNeeded += 3
		    healthRegenCurrentPoints := 0
		    playerHpRegen += 0.03
		end if
	    end if
	elsif buttonmoved ("up") then
	    canPress := true
	end if

	if mouseClick (520, 130, 520 + Pic.Width (levelButton), 130 + Pic.Height (levelButton)) and canPress then
	    canPress := false
	    if skillPoints > 0 and increaseMaxEnergyCurrentLevel < increaseMaxEnergyMaxLevel then
		skillPoints -= 1
		increaseMaxEnergyCurrentPoints += 1
		if increaseMaxEnergyCurrentPoints = increaseMaxEnergyPointsNeeded and increaseMaxEnergyCurrentLevel <= increaseMaxEnergyMaxLevel then
		    increaseMaxEnergyCurrentLevel += 1
		    increaseMaxEnergyPointsNeeded += 5
		    increaseMaxEnergyCurrentPoints := 0
		    playerMaxEnergy += 50 * increaseMaxEnergyCurrentLevel
		end if
	    end if
	elsif buttonmoved ("up") then
	    canPress := true
	end if

	if mouseClick (520, 30, 520 + Pic.Width (levelButton), 30 + Pic.Height (levelButton)) and canPress then
	    canPress := false
	    if skillPoints > 0 and energyRegenCurrentLevel < energyRegenMaxLevel then
		skillPoints -= 1
		energyRegenCurrentPoints += 1
		if energyRegenCurrentPoints = energyRegenPointsNeeded and energyRegenCurrentLevel <= energyRegenMaxLevel then
		    energyRegenCurrentLevel += 1
		    energyRegenPointsNeeded += 3
		    energyRegenCurrentPoints := 0
		    playerEnergyRegen += 0.1
		end if
	    end if
	elsif buttonmoved ("up") then
	    canPress := true
	end if

	if mouseOver (30, 620, 30 + Pic.Width (backArrowButton), 620 + Pic.Height (backArrowButton)) then
	    Pic.Draw (backArrowButtonGlow, 30, 620, picCopy)
	end if

	if mouseClick (30, 620, 30 + Pic.Width (backArrowButton), 620 + Pic.Height (backArrowButton)) then
	    stage := -2
	    changeRoom := true
	end if
	delay (30)
	View.Update
	cls
	exit when changeRoom
    end loop
end drawGeneralShop

% The main menu
procedure mainMenu
    Music.PlayFileStop
    Music.PlayFileLoop ("nightTownSurpass.mp3")

    loop
	for no : 1 .. 27
	    Pic.Draw (matrixPic (no), 0, 0, picCopy)
	    Pic.Draw (titlePic, 250, 530, picMerge)
	    Pic.Draw (newSavePic, (maxx - Pic.Width (newSavePic)) div 2, 430, picMerge)
	    Pic.Draw (loadSavePic, (maxx - Pic.Width (loadSavePic)) div 2, 350, picMerge)
	    Pic.Draw (exitPic, (maxx - Pic.Width (exitPic)) div 2, 270, picMerge)
	    if mouseOver ((maxx - Pic.Width (newSavePic)) div 2, 430, (maxx - Pic.Width (newSavePic)) div 2 + Pic.Width (newSavePic), 430 +
		    Pic.Height (newSavePic)) then
		Pic.Draw (newSavePicGlow, (maxx - Pic.Width (newSavePicGlow)) div 2, 430, picMerge)
		if mouseClick ((maxx - Pic.Width (newSavePicGlow)) div 2, 430, (maxx - Pic.Width (newSavePicGlow)) div 2 + Pic.Width (newSavePicGlow), 430 +
			Pic.Height (newSavePicGlow))
			then
		    changeRoom := true
		    exit
		end if
	    elsif

		    mouseOver ((maxx - Pic.Width (loadSavePic)) div 2, 350, (maxx - Pic.Width (loadSavePic)) div 2 + Pic.Width (loadSavePic), 350 +
		    Pic.Height (newSavePic)) then
		Pic.Draw (loadSavePicGlow, (maxx - Pic.Width (loadSavePicGlow)) div 2, 350, picMerge)

		if mouseClick ((maxx - Pic.Width (loadSavePic)) div 2, 350, (maxx - Pic.Width (loadSavePic)) div 2 + Pic.Width (newSavePicGlow), 350 +
			Pic.Height (newSavePicGlow))
			then


		    % Open up the save file and read in the saved game information
		    open : saveGame, "savegame.txt", get
		    get : saveGame, playerName : *
		    get : saveGame, playerLevel
		    get : saveGame, playerMaxXP
		    get : saveGame, playerMovement
		    get : saveGame, playerJumpHeight
		    get : saveGame, playerMaxHP
		    get : saveGame, playerMaxEnergy
		    get : saveGame, skillPoints
		    get : saveGame, laserSize
		    get : saveGame, noOfShots
		    get : saveGame, highestDMG
		    get : saveGame, lowestDMG
		    get : saveGame, shieldSize
		    get : saveGame, damageUpCurrentLevel
		    get : saveGame, multiShotsCurrentLevel
		    get : saveGame, laserUpCurrentLevel
		    get : saveGame, lazerCurrentLevel
		    get : saveGame, damageShieldCurrentLevel
		    get : saveGame, bigShieldCurrentLevel
		    get : saveGame, speedUpCurrentLevel
		    get : saveGame, jumpHeightUpCurrentLevel
		    get : saveGame, increaseMaxHealthCurrentLevel
		    get : saveGame, healthRegenCurrentLevel
		    get : saveGame, increaseMaxEnergyCurrentLevel
		    get : saveGame, energyRegenCurrentLevel
		    get : saveGame, stagesUnlocked

		    % Close the save file
		    close : saveGame

		    changeRoom := true
		    stage := 0
		    exit

		end if

	    elsif
		    mouseOver ((maxx - Pic.Width (exitPic)) div 2, 270, (maxx - Pic.Width (exitPic)) div 2 + Pic.Width (exitPic), 270 + Pic.Height (exitPic))
		    then
		Pic.Draw (exitGlowPic, (maxx - Pic.Width (exitGlowPic)) div 2, 270, picMerge)
		if mouseClick ((maxx - Pic.Width (exitPic)) div 2, 270, (maxx - Pic.Width (exitPic)) div 2 + Pic.Width (exitPic), 270 + Pic.Height (exitPic))
			then
		    quitGame := true

		    exit
		end if
	    end if

	    delay (50)
	    View.Update
	    cls
	end for
	exit when changeRoom or quitGame
    end loop
end mainMenu

% Create a login screen where the user can write his/her name
procedure login

    Music.PlayFileStop
    var name : string := ""

    % Create a new game, reset everything
    playerLevel := 1
    playerMaxXP := 10

    playerName := ""
    playerMovement := 10
    playerJumpHeight := 24
    playerGravity := 3
    playerMaxHP := 100000

    stagesUnlocked := 7
    skillPoints := 10000

    playerMaxEnergy := 100000

    laserSize := 1
    noOfShots := 1
    highestDMG := 20
    lowestDMG := 10
    shieldSize := 1

    damageUpCurrentLevel := 0
    multiShotsCurrentLevel := 0
    laserUpCurrentLevel := 0
    lazerCurrentLevel := 0
    damageShieldCurrentLevel := 0
    bigShieldCurrentLevel := 0
    speedUpCurrentLevel := 0
    jumpHeightUpCurrentLevel := 0
    increaseMaxHealthCurrentLevel := 0
    healthRegenCurrentLevel := 0
    increaseMaxEnergyCurrentLevel := 0
    energyRegenCurrentLevel := 0

    loop
	% Allow player to continue or erase

	% Add characters to the name
	if hasch and canPress then
	    name += getchar ()
	    canPress := false
	elsif not hasch then
	    canPress := true
	end if

	Input.KeyDown (key)
	exit when key (KEY_ENTER)

	if key (KEY_BACKSPACE) and canPress then
	    name := ""
	end if

	% Draw
	Pic.Draw (loginScreen, 0, 0, picCopy)
	Draw.Text ("Enter your name", 415, 250, arial16Bold, white)
	Draw.Text ("Press ENTER to continue...", 370, 220, arial16Bold, white)

	Draw.Text (name + "|", 490 - Font.Width (name, cambria36Bold) div 2, 320, cambria36Bold, white)

	View.Update
	delay (1)
	cls
    end loop

    % To get rid of the enter symbol
    for pos : 1 .. length (name) - 1
	playerName += name (pos)
    end for

    stage := 0
    changeRoom := true

end login

% Running the desktop screen
procedure desktopMenu

    % Show that the game has not yet been saved
    gameIsSaved := false

    % Have a loading screen before the desktop for fun
    for times : 1 .. 2
	for no : 1 .. 6

	    Pic.Draw (prepareDesktop, 0, 0, picCopy)
	    Pic.Draw (loading (no), 310, 377, picMerge)

	    % Showing that the player has perished if it is so
	    if playerHP <= 0 then
		Draw.Text ("YOU WERE DELETED", maxx div 2 - Font.Width ("YOU WERE DELETED", cambria36Bold) div 2, 300, cambria36Bold, red)
	    end if

	    View.Update
	    delay (75)
	    cls
	end for
    end for

    % Reset enemies and projectiles
    for no2 : 1 .. noOfEnemies
	enemyMaxHP (no2) := 0
	enemy_sprite (no2) := virus_1
	enemyMovement (no2) := 0
	enemyXPDrop (no2) := 0
	enemyDMG (no2) := 0
	enemyVSpeed (no2) := 0
	enemyHSpeed (no2) := 0
	enemyCanTurn (no2) := true
	enemy_x (no2) := 0
	enemy_y (no2) := 0
	enemyHP (no2) := 0
	enemyName (no2) := ""
	enemyOnSurface (no2) := false
	enemyIsAlive (no2) := false
    end for

    for no3 : 1 .. noOfProjectiles
	projectileHit (no3) := false
	drawDMG (no3) := 0
	floatText (no3) := 0
	projectileType (no3) := ""
	projectileDirection (no3) := 0
	projectile_x (no3) := 0
	projectile_y (no3) := 0
	projectileVSpeed (no3) := 0
	projectileHSpeed (no3) := 0
	projectileExists (no3) := false
	projectileSprite (no3) := ball
	doesExplode (no3) := false
    end for


    % Restore the Player's Health and Energy
    playerHP := playerMaxHP
    playerEnergy := playerMaxEnergy

    % Make sure the player enters from the left when he/she enters a room
    enterFrom := "left"

    Music.PlayFileStop
    Music.PlayFileLoop ("elevatorMusic.mp3")

    loop

	% Allow player to scroll through the different desktop backgrounds
	Input.KeyDown (key)

	if key (KEY_RIGHT_ARROW) and canPress then
	    canPress := false
	    if desktopNo < 6 then
		desktopNo += 1
	    else
		desktopNo := 1
	    end if

	end if

	if key (KEY_LEFT_ARROW) and canPress then
	    canPress := false
	    if desktopNo > 1 then
		desktopNo -= 1
	    else
		desktopNo := 6
	    end if
	end if

	if not key (KEY_RIGHT_ARROW) and not key (KEY_LEFT_ARROW) then
	    canPress := true
	end if

	% Draw the desktop
	Pic.Draw (desktop (desktopNo), 0, 0, picCopy)

	% Write text on the desktop to guide the player
	Draw.Text ("<-- Click an icon to enter a stage", 300, 620, arial16Bold, yellow)
	Draw.Text ("They are in order of difficulty", 340, 590, arial16Bold, yellow)

	Draw.Text ("Here is the shop, enter to Upgrade", 500, 520, arial16Bold, white)
	Draw.Text ("---->", 750, 490, arial16Bold, white)

	Draw.Text ("Left and Right arrow keys to scroll backgrounds < >", 280, 15, arial16Bold, yellow)
	Draw.Text (playerName + " Lv " + intstr (playerLevel), maxx - Font.Width (playerName + " Lv " + intstr (playerLevel), arial16Bold) - 10, 15, arial16Bold, white)
	Draw.Text ("<-- Back to Main Menu", 60, 15, arial12Bold, yellow)


	% Drawing each icon
	% Draw Internet Explorer
	if mouseOver (20, 600, 20 + Pic.Width (internetExplorer), 600 + Pic.Height (internetExplorer)) then
	    Pic.Draw (internetExplorer2, 20, 600, picMerge)
	else
	    Pic.Draw (internetExplorer, 20, 600, picMerge)
	end if

	if mouseClick (20, 600, 20 + Pic.Width (internetExplorer), 600 + Pic.Height (internetExplorer)) then
	    stage := 1
	    changeRoom := true
	    exit
	end if

	Draw.Text ("1. Internet Explorer", 5, 580, arial12, white)

	% Draw recycle bin
	if mouseOver (20, 470, 20 + Pic.Width (recycleBin), 470 + Pic.Height (recycleBin)) then
	    Pic.Draw (recycleBin2, 20, 470, picMerge)
	else
	    Pic.Draw (recycleBin, 20, 470, picMerge)
	end if

	if mouseClick (20, 470, 20 + Pic.Width (recycleBin), 470 + Pic.Height (recycleBin)) then
	    if stagesUnlocked >= 2 then
		stage := 2
		changeRoom := true
		exit
	    else
		Draw.Text ("STAGE LOCKED", 5, 500, arial16Bold, brightred)
	    end if
	end if


	Draw.Text ("2. Recycle Bin", 10, 450, arial12, white)


	% Draw windows explorer
	if mouseOver (20, 340, 20 + Pic.Width (windowsExplorer), 340 + Pic.Height (windowsExplorer)) then
	    Pic.Draw (windowsExplorer2, 20, 340, picMerge)
	else
	    Pic.Draw (windowsExplorer, 20, 340, picMerge)
	end if

	if mouseClick (20, 340, 20 + Pic.Width (windowsExplorer), 340 + Pic.Height (windowsExplorer)) then
	    if stagesUnlocked >= 3 then
		stage := 3
		changeRoom := true
		exit
	    else
		Draw.Text ("STAGE LOCKED", 5, 380, arial16Bold, brightred)
	    end if
	end if

	Draw.Text ("3. Windows Explorer", 5, 320, arial12, white)


	% Draw microsoft word
	if mouseOver (20, 210, 20 + Pic.Width (microsoftWord), 210 + Pic.Height (microsoftWord)) then
	    Pic.Draw (microsoftWord2, 20, 210, picMerge)
	else
	    Pic.Draw (microsoftWord, 20, 210, picMerge)
	end if

	if mouseClick (20, 210, 20 + Pic.Width (microsoftWord), 210 + Pic.Height (microsoftWord)) then
	    if stagesUnlocked >= 4 then
		stage := 4
		changeRoom := true
		exit
	    else
		Draw.Text ("STAGE LOCKED", 5, 250, arial16Bold, brightred)
	    end if
	end if

	Draw.Text ("4. Microsoft Word", 5, 190, arial12, white)


	% Draw paint
	if mouseOver (20, 80, 20 + Pic.Width (mediaPlayer), 80 + Pic.Height (mediaPlayer)) then
	    Pic.Draw (mediaPlayer2, 20, 80, picMerge)
	else
	    Pic.Draw (mediaPlayer, 20, 80, picMerge)
	end if

	if mouseClick (20, 80, 20 + Pic.Width (mediaPlayer), 80 + Pic.Height (mediaPlayer)) then
	    if stagesUnlocked >= 5 then
		stage := 5
		changeRoom := true
		exit
	    else
		Draw.Text ("STAGE LOCKED", 5, 120, arial16Bold, brightred)
	    end if
	end if

	Draw.Text ("5. Media Player", 15, 60, arial12, white)

	% Draw Google Earth
	if mouseOver (170, 600, 170 + Pic.Width (googleEarth), 600 + Pic.Height (googleEarth)) then
	    Pic.Draw (googleEarth2, 170, 600, picMerge)
	else
	    Pic.Draw (googleEarth, 170, 600, picMerge)
	end if

	if mouseClick (170, 600, 170 + Pic.Width (googleEarth), 600 + Pic.Height (googleEarth)) then
	    if stagesUnlocked >= 6 then
		stage := 6
		changeRoom := true
		exit
	    else
		Draw.Text ("STAGE LOCKED", 150, 640, arial16Bold, brightred)
	    end if
	end if

	Draw.Text ("6. Google Earth", 155, 580, arial12, white)

	% Draw Windows Media Player
	if mouseOver (170, 470, 170 + Pic.Width (myComputer), 470 + Pic.Height (myComputer)) then
	    Pic.Draw (myComputer2, 170, 470, picMerge)
	else
	    Pic.Draw (myComputer, 170, 470, picMerge)
	end if

	if mouseClick (170, 470, 170 + Pic.Width (myComputer), 470 + Pic.Height (myComputer)) then
	    if stagesUnlocked >= 7 then
		stage := 7
		changeRoom := true
		exit
	    else
		Draw.Text ("STAGE LOCKED", 150, 510, arial16Bold, brightred)
	    end if
	end if

	Draw.Text ("7. My Computer", 155, 450, arial12, white)

	% Draw save icon
	if mouseOver (900, 80, 900 + Pic.Width (paint), 80 + Pic.Height (paint)) then
	    Pic.Draw (save2, 900, 80, picMerge)
	else
	    Pic.Draw (save, 900, 80, picMerge)
	end if

	Draw.Text ("Save", 920, 60, arial12, white)

	% Draw instructions icon
	if mouseOver (900, 210, 900 + Pic.Width (instructions), 210 + Pic.Height (instructions)) then
	    Pic.Draw (instructions0, 900, 210, picMerge)
	else
	    Pic.Draw (instructions, 900, 210, picMerge)
	end if
	if mouseClick (900, 210, 900 + Pic.Width (instructions), 210 + Pic.Height (instructions)) then
	    stage := -5
	    changeRoom := true
	    exit
	end if

	Draw.Text ("Instructions", 900, 190, arial12, white)

	% Clicking the save icon
	if mouseClick (900, 80, 900 + Pic.Width (store), 80 + Pic.Height (store)) then

	    % Open up the save file and read in the saved game information
	    open : saveGame, "savegame.txt", put
	    put : saveGame, playerName
	    put : saveGame, playerLevel
	    put : saveGame, playerMaxXP
	    put : saveGame, playerMovement
	    put : saveGame, playerJumpHeight
	    put : saveGame, playerMaxHP
	    put : saveGame, playerMaxEnergy
	    put : saveGame, skillPoints
	    put : saveGame, laserSize
	    put : saveGame, noOfShots
	    put : saveGame, highestDMG
	    put : saveGame, lowestDMG
	    put : saveGame, shieldSize
	    put : saveGame, damageUpCurrentLevel
	    put : saveGame, multiShotsCurrentLevel
	    put : saveGame, laserUpCurrentLevel
	    put : saveGame, lazerCurrentLevel
	    put : saveGame, damageShieldCurrentLevel
	    put : saveGame, bigShieldCurrentLevel
	    put : saveGame, speedUpCurrentLevel
	    put : saveGame, jumpHeightUpCurrentLevel
	    put : saveGame, increaseMaxHealthCurrentLevel
	    put : saveGame, healthRegenCurrentLevel
	    put : saveGame, increaseMaxEnergyCurrentLevel
	    put : saveGame, energyRegenCurrentLevel
	    put : saveGame, stagesUnlocked

	    gameIsSaved := true

	    % Close the save file
	    close : saveGame
	end if

	if gameIsSaved then
	    Draw.Text ("Game Saved", 875, 100, arial16Bold, brightred)
	end if

	% Draw microsoft store
	if mouseOver (900, 470, 900 + Pic.Width (store), 470 + Pic.Height (store)) then
	    Pic.Draw (store2, 900, 470, picCopy)
	else
	    Pic.Draw (store, 900, 470, picCopy)
	end if

	Draw.Text ("Store", 920, 450, arial12, white)

	% Clicking the store
	if mouseClick (900, 470, 900 + Pic.Width (store), 470 + Pic.Height (store)) then
	    stage := -2
	    changeRoom := true
	    exit
	end if

	% Clicking the start button
	if mouseClick (0, 0, 50, 50) or key (KEY_ESC) then
	    stage := -1
	    changeRoom := true
	    exit
	end if

	View.Update
	delay (30)
	cls
    end loop
end desktopMenu

% Creating the stages
procedure stage1

    % Reset enemies and projectiles
    for no2 : 1 .. noOfEnemies
	enemyMaxHP (no2) := 0
	enemy_sprite (no2) := virus_1
	enemyMovement (no2) := 0
	enemyXPDrop (no2) := 0
	enemyDMG (no2) := 0
	enemyVSpeed (no2) := 0
	enemyHSpeed (no2) := 0
	enemyCanTurn (no2) := true
	enemy_x (no2) := 0
	enemy_y (no2) := 0
	enemyHP (no2) := 0
	enemyName (no2) := ""
	enemyOnSurface (no2) := false
	enemyIsAlive (no2) := false
    end for

    for no3 : 1 .. noOfProjectiles
	projectileHit (no3) := false
	drawDMG (no3) := 0
	floatText (no3) := 0
	projectileType (no3) := ""
	projectileDirection (no3) := 0
	projectile_x (no3) := 0
	projectile_y (no3) := 0
	projectileVSpeed (no3) := 0
	projectileHSpeed (no3) := 0
	projectileExists (no3) := false
	projectileSprite (no3) := ball
	doesExplode (no3) := false
    end for

    % Start the music
    Music.PlayFileStop
    Music.PlayFileLoop ("angelicBreakBeats.mp3")

    % Create the stage
    noOfBoxes := 0


    % Set the world size
    world_x (stage) := 4000


    % Set the portal location
    rightPortal_x := world_x (stage) - 70
    rightPortal_y := groundHeight + 20

    leftPortal_x := 70 - Pic.Width (leftPortal1)
    leftPortal_y := groundHeight + 20

    % Creating the boxes that make the level
    createBox (400, groundHeight, 1700, 175, cyan, false, true)
    createBox (500, 175, 1600, 200, 43, false, true)
    createBox (600, 200, 1500, 225, cyan, false, true)
    createBox (700, 225, 1400, 250, 43, false, true)
    createBox (800, 250, 1300, 275, cyan, false, true)
    createBox (900, 275, 1200, 300, 43, false, true)

    createBox (1500, 325, 2100, 345, 76, true, true)


    createBox (2000, groundHeight, 2700, 170, 53, false, true)
    createBox (2050, 170, 2650, 190, 53, false, true)
    createBox (2100, 190, 2600, 210, 53, false, true)
    createBox (2150, 210, 2550, 230, 53, false, true)
    createBox (2200, 230, 2500, 250, 53, false, true)
    createBox (2250, 250, 2450, 270, 53, false, true)
    createBox (2300, 270, 2400, 290, 53, false, true)

    createBox (3000, groundHeight, 3700, 175, 78, false, true)
    createBox (3100, 175, 3600, 200, 77, false, true)
    createBox (3200, 200, 3500, 225, 76, false, true)
    createBox (3300, 225, 3400, 250, 53, false, true)

    % The ground and the side walls so the player does not fall through the level
    createBox (-maxx div 2, 0, world_x (stage) + maxx div 2, groundHeight, grey, false, true)
    createBox (-50, groundHeight, 0, maxy, black, false, true)
    createBox (world_x (stage), groundHeight, world_x (stage) + 50, maxy, black, false, true)


    % Enemy turn points (invisible non-solid boxes)
    createBox (10, groundHeight, 15, 400, white, false, false)
    createBox (world_x (stage) - 10, groundHeight, world_x (stage) - 10, 400, white, false, false)
    createBox (1500, 350, 1510, 400, white, false, false)
    createBox (2090, 350, 2100, 400, white, false, false)

    % Spawning locations
    % If user enters or leaves from portal
    if enterFrom = "right" then
	xView := -world_x (stage) + maxx
	player_x := maxx - Pic.Width (player_sprite) - 100
	direction := -1
    elsif enterFrom = "left" then
	player_x := 150
	xView := 0
	direction := 1
    end if

    player_y := groundHeight

    loop
	% Running the procedures
	loopControl := Time.Elapsed
	draw
	input
	gravity
	movement
	projectile
	always
	levelSystem
	collisions

	exit when changeRoom

	% Go back to the menu screen
	if key (KEY_ESC) or playerHP <= 0 then
	    stage := 0
	    changeRoom := true
	    playerXP := 0
	    exit
	end if

	View.Update
	loopTimeControl
	cls
    end loop

    % Reset the stage
    for no2 : 1 .. noOfEnemies
	enemyIsAlive (no2) := false
	enemy_x (no2) := 0
	enemy_y (no2) := 0
    end for

    for no : 1 .. noOfBoxes
	box_x1 (no) := 0
	box_y1 (no) := 0
    end for
    noOfBoxes := 0

end stage1

procedure stage2

    for no2 : 1 .. noOfEnemies
	enemyMaxHP (no2) := 0
	enemy_sprite (no2) := virus_1
	enemyMovement (no2) := 0
	enemyXPDrop (no2) := 0
	enemyDMG (no2) := 0
	enemyVSpeed (no2) := 0
	enemyHSpeed (no2) := 0
	enemyCanTurn (no2) := true
	enemy_x (no2) := 0
	enemy_y (no2) := 0
	enemyHP (no2) := 0
	enemyName (no2) := ""
	enemyOnSurface (no2) := false
	enemyIsAlive (no2) := false
    end for

    for no3 : 1 .. noOfProjectiles
	projectileHit (no3) := false
	drawDMG (no3) := 0
	floatText (no3) := 0
	projectileType (no3) := ""
	projectileDirection (no3) := 0
	projectile_x (no3) := 0
	projectile_y (no3) := 0
	projectileVSpeed (no3) := 0
	projectileHSpeed (no3) := 0
	projectileExists (no3) := false
	projectileSprite (no3) := ball
	doesExplode (no3) := false
    end for

    % Player the music
    Music.PlayFileStop
    Music.PlayFileLoop ("nowLoading.mp3")

    % If not unlocked, unlock this stage
    if stagesUnlocked < 2 then
	stagesUnlocked := 2
    end if

    % Create the stage
    noOfBoxes := 0
    xView := 0

    % Set the world size
    world_x (stage) := 3840

    % Set the portal location
    rightPortal_x := world_x (stage) - 70
    rightPortal_y := groundHeight + 30

    leftPortal_x := 70 - Pic.Width (leftPortal1)
    leftPortal_y := groundHeight + 30

    % The ground and the side walls so the player does not fall through the level
    createBox (-maxx div 2, 0, world_x (stage) + maxx div 2, groundHeight, grey, false, true)
    createBox (-50, groundHeight, 0, maxy, black, false, true)
    createBox (world_x (stage), groundHeight, world_x (stage) + 50, maxy, black, false, true)

    % Creating the boxes that make the level
    createBox (0, 360, 100, 370, darkgrey, true, true)
    createBox (3740, 355, 3840, 370, darkgrey, true, true)
    createBox (1830, 360, 2000, 375, darkgrey, true, true)
    createBox (1770, groundHeight, 2070, 23 + groundHeight, darkgrey, false, true)
    createBox (200, 260, 1720, 280, grey, true, true)
    createBox (2120, 260, 3640, 280, grey, true, true)
    createBox (2120, 450, 3640, 470, grey, true, true)
    createBox (200, 450, 1720, 470, grey, true, true)
    createBox (400, 470, 500, 490, darkgrey, false, true)
    createBox (0, groundHeight, 200, 180, darkgrey, false, true)
    createBox (3700, groundHeight, world_x (stage) + 50, 180, darkgrey, false, true)
    createBox (600, groundHeight, 800, 160, darkgrey, false, true)
    createBox (2500, groundHeight, 2700, 170, darkgrey, false, true)

    % Invisible non solid blocks for changing the direction of the enemy
    createBox (190, groundHeight, 210, 205, darkgrey, false, false)
    createBox (3690, groundHeight, world_x (stage) + 50, 205, darkgrey, false, false)

    createBox (1710, 290, 1720, 470, white, false, false)
    createBox (190, 290, 200, 470, white, false, false)

    createBox (1710, 475, 1720, 690, white, false, false)
    createBox (190, 475, 200, 690, white, false, false)

    createBox (3630, 290, 3640, 470, white, false, false)
    createBox (2110, 290, 2120, 470, white, false, false)

    createBox (3630, 475, 3640, 690, white, false, false)
    createBox (2110, 475, 2120, 690, white, false, false)

    % If user enters or leaves from portal
    if enterFrom = "right" then
	xView := -world_x (stage) + maxx
	player_x := maxx - Pic.Width (player_sprite) - 100
	direction := -1
    elsif enterFrom = "left" then
	player_x := 150
	xView := 0
	direction := 1
    end if

    % Spawning locations
    player_y := 260



    loop
	% Running the procedures
	loopControl := Time.Elapsed
	draw
	input
	gravity
	movement
	projectile
	always
	levelSystem
	collisions

	exit when changeRoom

	% Go back to the menu screen
	if key (KEY_ESC) or playerHP <= 0 then
	    stage := 0
	    changeRoom := true
	    playerXP := 0
	    exit
	end if

	View.Update
	loopTimeControl
	cls
    end loop

    % Reset the stage
    for no2 : 1 .. noOfEnemies
	enemyIsAlive (no2) := false
	enemy_x (no2) := 0
	enemy_y (no2) := 0
    end for


    for no : 1 .. noOfBoxes
	box_x1 (no) := 0
	box_y1 (no) := 0
    end for
    noOfBoxes := 0


end stage2


proc stage3

    % Enemy variables
    for no2 : 1 .. noOfEnemies
	enemyMaxHP (no2) := 0
	enemy_sprite (no2) := virus_1
	enemyMovement (no2) := 0
	enemyXPDrop (no2) := 0
	enemyDMG (no2) := 0
	enemyVSpeed (no2) := 0
	enemyHSpeed (no2) := 0
	enemyCanTurn (no2) := true
	enemy_x (no2) := 0
	enemy_y (no2) := 0
	enemyHP (no2) := 0
	enemyName (no2) := ""
	enemyOnSurface (no2) := false
	enemyIsAlive (no2) := false
    end for

    for no3 : 1 .. noOfProjectiles
	projectileHit (no3) := false
	drawDMG (no3) := 0
	floatText (no3) := 0
	projectileType (no3) := ""
	projectileDirection (no3) := 0
	projectile_x (no3) := 0
	projectile_y (no3) := 0
	projectileVSpeed (no3) := 0
	projectileHSpeed (no3) := 0
	projectileExists (no3) := false
	projectileSprite (no3) := ball
	doesExplode (no3) := false
    end for

    Music.PlayFileStop
    Music.PlayFileLoop ("meitaZoEndingGa.mp3")

    % If not unlocked, unlock this stage
    if stagesUnlocked < 3 then
	stagesUnlocked := 3
    end if

    % Create the stage
    noOfBoxes := 0
    xView := 0

    % Set the world size
    world_x (stage) := 4000

    % Set portal locations
    rightPortal_x := world_x (stage) - 70
    rightPortal_y := 550

    leftPortal_x := 100 - Pic.Width (leftPortal1)
    leftPortal_y := 555

    % The ground and the side walls so the player does not fall through the level
    createBox (-maxx div 2, 0, world_x (stage) + maxx div 2, groundHeight, grey, false, true)
    createBox (-50, groundHeight, 0, maxy, black, false, true)
    createBox (world_x (stage), groundHeight, world_x (stage) + 50, maxy, black, false, true)

    createBox (-10, groundHeight, 190, 550, 114, false, true)
    createBox (3800, groundHeight, 4100, 550, 114, false, true)
    createBox (500, 240, 520, 500, 114, true, true)
    createBox (520, 470, 3420, 500, 114, true, true)
    createBox (3420, 240, 3440, 500, 41, true, true)
    createBox (190, 480, 500, 500, 41, true, true)
    createBox (190, 380, 500, 400, 41, true, true)
    createBox (190, 280, 500, 300, 41, true, true)
    createBox (190, 190, 300, 200, 41, true, true)
    createBox (3440, 480, 3800, 500, 41, true, true)
    createBox (3440, 380, 3800, 400, 41, true, true)
    createBox (3440, 280, 3800, 300, 41, true, true)
    createBox (3640, 190, 3800, 200, 41, true, true)

    createBox (700, 300, 2100, 320, 40, true, true)
    createBox (2500, 300, 3300, 320, 40, true, true)
    createBox (2200, groundHeight, 2400, 300, 40, false, true)
    createBox (520, 240, 610, 255, 40, true, true)
    createBox (3340, 240, 3420, 255, 40, true, true)

    createEnemy ("Spyware Lv 30", 2300, 310)
    createEnemy ("Trojan Lv 20", 2300, 700)
    createEnemy ("Trojan Lv 20", 2300, 700)
    createEnemy ("Trojan Lv 20", 2300, 700)
    createEnemy ("Trojan Lv 20", 2300, 700)

    % Invisible non solid blocks for changing the direction of the enemy
    createBox (700, 300, 715, 450, white, false, false)
    createBox (3285, 300, 3300, 450, white, false, false)

    createBox (2080, 300, 2200, 410, white, false, false)
    createBox (2400, 300, 2520, 410, white, false, false)

    createBox (190, 470, 200, 580, white, false, false)
    createBox (3790, 470, 3800, 580, white, false, false)

    % Where the player enters from
    if enterFrom = "right" then
	xView := -world_x (stage) + maxx
	player_x := maxx - Pic.Width (player_sprite) - 100
	direction := -1
    elsif enterFrom = "left" then
	player_x := 150
	xView := 0
	direction := 1
    end if

    % Player spawning location
    player_y := 570


    loop
	% Running the procedures
	loopControl := Time.Elapsed
	draw
	input
	gravity
	movement
	projectile
	always
	levelSystem
	collisions

	exit when changeRoom

	% Go back to the menu screen
	if key (KEY_ESC) or playerHP <= 0 then
	    stage := 0
	    changeRoom := true
	    playerXP := 0
	    exit
	end if

	View.Update
	loopTimeControl
	cls
    end loop

    % Reset the stage
    for no2 : 1 .. noOfEnemies
	enemyIsAlive (no2) := false
	enemy_x (no2) := 0
	enemy_y (no2) := 0
    end for


    for no : 1 .. noOfBoxes
	box_x1 (no) := 0
	box_y1 (no) := 0
    end for
    noOfBoxes := 0
end stage3

proc stage4

    for no2 : 1 .. noOfEnemies
	enemyMaxHP (no2) := 0
	enemy_sprite (no2) := virus_1
	enemyMovement (no2) := 0
	enemyXPDrop (no2) := 0
	enemyDMG (no2) := 0
	enemyVSpeed (no2) := 0
	enemyHSpeed (no2) := 0
	enemyCanTurn (no2) := true
	enemy_x (no2) := 0
	enemy_y (no2) := 0
	enemyHP (no2) := 0
	enemyName (no2) := ""
	enemyOnSurface (no2) := false
	enemyIsAlive (no2) := false
    end for

    for no3 : 1 .. noOfProjectiles
	projectileHit (no3) := false
	drawDMG (no3) := 0
	floatText (no3) := 0
	projectileType (no3) := ""
	projectileDirection (no3) := 0
	projectile_x (no3) := 0
	projectile_y (no3) := 0
	projectileVSpeed (no3) := 0
	projectileHSpeed (no3) := 0
	projectileExists (no3) := false
	projectileSprite (no3) := ball
	doesExplode (no3) := false
    end for

    Music.PlayFileStop
    Music.PlayFileLoop ("biasHacker.mp3")

    % If not unlocked, unlock this stage
    if stagesUnlocked < 4 then
	stagesUnlocked := 4
    end if

    % Create the stage
    noOfBoxes := 0
    xView := 0

    world_x (stage) := 4000

    rightPortal_x := world_x (stage) - 70
    rightPortal_y := groundHeight + 60

    leftPortal_x := 100 - Pic.Width (leftPortal1)
    leftPortal_y := 555

    createBox (-maxx div 2, 0, world_x (stage) + maxx div 2, groundHeight, grey, false, true)
    createBox (-50, groundHeight, 0, maxy, black, false, true)
    createBox (world_x (stage), groundHeight, world_x (stage) + 50, maxy, black, false, true)

    createBox (-10, groundHeight, 190, 550, grey, false, true)
    createBox (190, 530, 310, 550, grey, false, true)

    createBox (400, 400, 1450, 420, grey, true, true)
    createBox (1600, 400, 2900, 420, grey, true, true)
    createBox (3050, 380, 3650, 400, grey, true, true)

    createBox (3700, 280, 3900, 300, grey, true, true)
    createBox (2700, groundHeight, 3700, groundHeight + 25, grey, false, true)
    createBox (3700, groundHeight, 4100, groundHeight + 50, grey, false, true)

    createBox (1300, groundHeight, 2700, 175, grey, false, true)
    createBox (1400, 175, 2600, 200, grey, false, true)
    createBox (1500, 200, 2500, 225, grey, false, true)
    createBox (1600, 225, 2400, 250, grey, false, true)
    createBox (1700, 250, 2300, 275, grey, false, true)

    % Invisible non solid blocks for changing the direction of the enemy
    createBox (world_x (stage) - 100, world_x (stage), 1720, 470, white, false, false)

    createEnemy ("Bot Lv 40", 300, 435)

    if enterFrom = "right" then
	xView := -world_x (stage) + maxx
	player_x := maxx - Pic.Width (player_sprite) - 100
	player_y := groundHeight + 100
	direction := -1
    elsif enterFrom = "left" then
	player_x := 150
	player_y := 570
	xView := 0
	direction := 1
    end if

    loop
	% Running the procedures
	loopControl := Time.Elapsed
	draw
	input
	gravity
	movement
	projectile
	always
	levelSystem
	collisions

	exit when changeRoom

	% Go back to the menu screen
	if key (KEY_ESC) or playerHP <= 0 then
	    stage := 0
	    changeRoom := true
	    playerXP := 0
	    exit
	end if

	View.Update
	loopTimeControl
	cls
    end loop

    % Reset the stage
    for no2 : 1 .. noOfEnemies
	enemyIsAlive (no2) := false
	enemy_x (no2) := 0
	enemy_y (no2) := 0
    end for


    for no : 1 .. noOfBoxes
	box_x1 (no) := 0
	box_y1 (no) := 0
    end for
    noOfBoxes := 0
end stage4

proc stage5
    % Enemy variables
    for no2 : 1 .. noOfEnemies
	enemyMaxHP (no2) := 0
	enemy_sprite (no2) := virus_1
	enemyMovement (no2) := 0
	enemyXPDrop (no2) := 0
	enemyDMG (no2) := 0
	enemyVSpeed (no2) := 0
	enemyHSpeed (no2) := 0
	enemyCanTurn (no2) := true
	enemy_x (no2) := 0
	enemy_y (no2) := 0
	enemyHP (no2) := 0
	enemyName (no2) := ""
	enemyOnSurface (no2) := false
	enemyIsAlive (no2) := false
    end for

    for no3 : 1 .. noOfProjectiles
	projectileHit (no3) := false
	drawDMG (no3) := 0
	floatText (no3) := 0
	projectileType (no3) := ""
	projectileDirection (no3) := 0
	projectile_x (no3) := 0
	projectile_y (no3) := 0
	projectileVSpeed (no3) := 0
	projectileHSpeed (no3) := 0
	projectileExists (no3) := false
	projectileSprite (no3) := ball
	doesExplode (no3) := false
    end for

    Music.PlayFileStop
    Music.PlayFileLoop ("noGameNoLife.mp3")

    % If not unlocked, unlock this stage
    if stagesUnlocked < 5 then
	stagesUnlocked := 5
    end if

    % Create the stage
    noOfBoxes := 0
    xView := 0

    world_x (stage) := 3840

    % Set the portal location
    rightPortal_x := world_x (stage) - 70
    rightPortal_y := groundHeight + 30

    leftPortal_x := 70 - Pic.Width (leftPortal1)
    leftPortal_y := groundHeight + 30

    % The ground and the side walls so the player does not fall through the level
    createBox (-maxx div 2, 0, world_x (stage) + maxx div 2, groundHeight, grey, false, true)
    createBox (-50, groundHeight, 0, maxy, black, false, true)
    createBox (world_x (stage), groundHeight, world_x (stage) + 50, maxy, black, false, true)

    %spawning platform above left spawn
    createBox (0, 360, 100, 370, 53, true, true)

    %spawning platform above right spawn
    createBox (3740, 355, 3840, 370, 12, true, true)

    % platform and boxes in middle
    createBox (1830, 360, 2000, 375, 40, true, true)
    createBox (1770, groundHeight, 2070, 23 + groundHeight, darkgrey, false, true)

    %first level of platforms
    createBox (200, 260, 1720, 280, 54, true, true)
    createBox (2120, 260, 3640, 280, 43, true, true)

    %second level of platforms
    createBox (2120, 450, 3640, 470, 2, true, true)
    createBox (200, 450, 1720, 470, 34, true, true)

    createBox (400, 470, 500, 490, 35, false, true)

    %spawning box
    createBox (0, groundHeight, 200, 180, darkgrey, false, true)
    createBox (3700, groundHeight, world_x (stage) + 50, 180, darkgrey, false, true)

    createBox (600, groundHeight, 800, 160, darkgrey, false, true)
    createBox (1200, groundHeight, 1300, 180, darkgrey, false, true)
    createBox (2500, groundHeight, 2700, 170, darkgrey, false, true)

    % Invisible non solid blocks for changing the direction of the enemy
    createBox (190, groundHeight, 210, 205, darkgrey, false, false)
    createBox (3690, groundHeight, world_x (stage) + 50, 205, darkgrey, false, false)

    createBox (1710, 290, 1720, 470, white, false, false)
    createBox (190, 290, 200, 470, white, false, false)

    createBox (3630, 290, 3640, 470, white, false, false)
    createBox (2110, 290, 2120, 470, white, false, false)

    % If player enters or leaves from portal
    if enterFrom = "right" then
	xView := -world_x (stage) + maxx
	player_x := maxx - Pic.Width (player_sprite) - 100
	direction := -1
    elsif enterFrom = "left" then
	player_x := 150
	xView := 0
	direction := 1
    end if

    % Player spawning locations
    player_y := 250


    loop
	% Running the procedures
	loopControl := Time.Elapsed
	draw
	input
	gravity
	movement
	projectile
	always
	levelSystem
	collisions

	exit when changeRoom

	% Go back to the menu screen
	if key (KEY_ESC) or playerHP <= 0 then
	    stage := 0
	    changeRoom := true
	    playerXP := 0
	    exit
	end if

	View.Update
	loopTimeControl
	cls
    end loop

    % Reset the stage
    for no2 : 1 .. noOfEnemies
	enemyIsAlive (no2) := false
	enemy_x (no2) := 0
	enemy_y (no2) := 0
    end for


    for no : 1 .. noOfBoxes
	box_x1 (no) := 0
	box_y1 (no) := 0
    end for
    noOfBoxes := 0
end stage5

proc stage6

    for no2 : 1 .. noOfEnemies
	enemyMaxHP (no2) := 0
	enemy_sprite (no2) := virus_1
	enemyMovement (no2) := 0
	enemyXPDrop (no2) := 0
	enemyDMG (no2) := 0
	enemyVSpeed (no2) := 0
	enemyHSpeed (no2) := 0
	enemyCanTurn (no2) := true
	enemy_x (no2) := 0
	enemy_y (no2) := 0
	enemyHP (no2) := 0
	enemyName (no2) := ""
	enemyOnSurface (no2) := false
	enemyIsAlive (no2) := false
    end for

    for no3 : 1 .. noOfProjectiles
	projectileHit (no3) := false
	drawDMG (no3) := 0
	floatText (no3) := 0
	projectileType (no3) := ""
	projectileDirection (no3) := 0
	projectile_x (no3) := 0
	projectile_y (no3) := 0
	projectileVSpeed (no3) := 0
	projectileHSpeed (no3) := 0
	projectileExists (no3) := false
	projectileSprite (no3) := ball
	doesExplode (no3) := false
    end for

    Music.PlayFileStop
    Music.PlayFileLoop ("yakusokuNoParadigm.mp3")

    % If not unlocked, unlock this stage
    if stagesUnlocked < 6 then
	stagesUnlocked := 6
    end if

    % Create the stage
    noOfBoxes := 0
    xView := 0

    % Set the world size
    world_x (stage) := 4000


    % Set the portal location
    rightPortal_x := world_x (stage) - 70
    rightPortal_y := groundHeight + 20

    leftPortal_x := 70 - Pic.Width (leftPortal1)
    leftPortal_y := groundHeight + 20

    % Creating the level with boxes
    createBox (400, groundHeight, 1700, 175, 2, false, true)
    createBox (500, 175, 1600, 200, 54, false, true)
    createBox (600, 200, 1500, 225, 2, false, true)
    createBox (700, 225, 1400, 250, 54, false, true)
    createBox (800, 250, 1300, 275, 2, false, true)
    createBox (900, 275, 1200, 300, 54, false, true)

    createBox (1500, 325, 2100, 345, 76, true, true)


    createBox (2000, groundHeight, 2700, 170, 44, false, true)
    createBox (2050, 170, 2650, 190, 45, false, true)
    createBox (2100, 190, 2600, 210, 46, false, true)
    createBox (2150, 210, 2550, 230, 47, false, true)
    createBox (2200, 230, 2500, 250, 48, false, true)
    createBox (2250, 250, 2450, 270, 49, false, true)
    createBox (2300, 270, 2400, 290, 50, false, true)

    createBox (3000, groundHeight, 3700, 175, 78, false, true)
    createBox (3100, 175, 3600, 200, 77, false, true)
    createBox (3200, 200, 3500, 225, 76, false, true)
    createBox (3300, 225, 3400, 250, 53, false, true)

    % The ground and the side walls so the player does not fall through the level
    createBox (-maxx div 2, 0, world_x (stage) + maxx div 2, groundHeight, grey, false, true)
    createBox (-50, groundHeight, 0, maxy, black, false, true)
    createBox (world_x (stage), groundHeight, world_x (stage) + 50, maxy, black, false, true)


    % Enemy turn points (invisible non-solid boxes)
    createBox (10, groundHeight, 15, 400, white, false, false)
    createBox (world_x (stage) - 10, groundHeight, world_x (stage) - 10, 400, white, false, false)
    createBox (1500, 350, 1510, 400, white, false, false)
    createBox (2090, 350, 2100, 400, white, false, false)

    % If user enters or leaves from portal
    if enterFrom = "right" then
	xView := -world_x (stage) + maxx
	player_x := maxx - Pic.Width (player_sprite) - 100
	direction := -1
    elsif enterFrom = "left" then
	player_x := 150
	xView := 0
	direction := 1
    end if

    % Player spawning locations
    player_y := groundHeight

    loop
	% Running the procedures
	loopControl := Time.Elapsed
	draw
	input
	gravity
	movement
	projectile
	always
	levelSystem
	collisions

	exit when changeRoom

	% Go back to the menu screen
	if key (KEY_ESC) or playerHP <= 0 then
	    stage := 0
	    changeRoom := true
	    playerXP := 0
	    exit
	end if

	View.Update
	loopTimeControl
	cls
    end loop

    % Reset the stage
    for no2 : 1 .. noOfEnemies
	enemyIsAlive (no2) := false
	enemy_x (no2) := 0
	enemy_y (no2) := 0
    end for


    for no : 1 .. noOfBoxes
	box_x1 (no) := 0
	box_y1 (no) := 0
    end for
    noOfBoxes := 0
end stage6

proc stage7

    for no2 : 1 .. noOfEnemies
	enemyMaxHP (no2) := 0
	enemy_sprite (no2) := virus_1
	enemyMovement (no2) := 0
	enemyXPDrop (no2) := 0
	enemyDMG (no2) := 0
	enemyVSpeed (no2) := 0
	enemyHSpeed (no2) := 0
	enemyCanTurn (no2) := true
	enemy_x (no2) := 0
	enemy_y (no2) := 0
	enemyHP (no2) := 0
	enemyName (no2) := ""
	enemyOnSurface (no2) := false
	enemyIsAlive (no2) := false
    end for

    for no3 : 1 .. noOfProjectiles
	projectileHit (no3) := false
	drawDMG (no3) := 0
	floatText (no3) := 0
	projectileType (no3) := ""
	projectileDirection (no3) := 0
	projectile_x (no3) := 0
	projectile_y (no3) := 0
	projectileVSpeed (no3) := 0
	projectileHSpeed (no3) := 0
	projectileExists (no3) := false
	projectileSprite (no3) := ball
	doesExplode (no3) := false
    end for

    Music.PlayFileStop
    Music.PlayFileLoop ("gateOfSteiner.mp3")

    % If not unlocked, unlock this stage
    if stagesUnlocked < 7 then
	stagesUnlocked := 7
    end if

    % Create the stage
    noOfBoxes := 0
    xView := 0

    world_x (stage) := 2000

    % Set the portal location
    rightPortal_x := world_x (stage) - 70
    rightPortal_y := groundHeight + 30

    leftPortal_x := 70 - Pic.Width (leftPortal1)
    leftPortal_y := groundHeight + 30

    createBox (-maxx div 2, 0, world_x (stage) + maxx div 2, groundHeight, 52, false, true)
    createBox (-50, groundHeight, 0, maxy, black, false, true)
    createBox (world_x (stage), groundHeight, world_x (stage) + 50, maxy, black, false, true)

    %spawning platform above left spawn
    createBox (0, 360, 100, 370, 53, true, true)

    %spawning platform above right spawn
    createBox (3740, 355, 3840, 370, 12, true, true)

    % platform and boxes in middle
    createBox (1830, 360, 2000, 375, 40, true, true)
    createBox (1770, groundHeight, 2070, 23 + groundHeight, 52, false, true)

    %first level of platforms
    createBox (200, 260, 1720, 280, 54, true, true)

    %second level of platforms
    createBox (200, 450, 1720, 470, 34, true, true)

    createBox (400, 470, 500, 490, 35, true, true)

    %spawning box
    createBox (0, groundHeight, 200, 180, 52, false, true)
    createBox (3700, groundHeight, world_x (stage) + 50, 180, 52, false, true)

    createBox (600, groundHeight, 800, 160, 52, false, true)

    % Invisible non solid blocks for changing the direction of the enemy
    createBox (0, groundHeight, 10, 205, white, false, false)
    createBox (1990, groundHeight, world_x (stage) + 50, 205, white, false, false)

    if enterFrom = "right" then
	xView := -world_x (stage) + maxx
	player_x := maxx - Pic.Width (player_sprite) - 100
	direction := -1
    elsif enterFrom = "left" then
	player_x := 150
	xView := 0
	direction := 1
    end if

    % The boss
    createEnemy ("The Corruptor", world_x (stage) div 2, groundHeight + 50)

    % Player spawning locations
    player_y := 300

    loop
	% Running the procedures
	loopControl := Time.Elapsed
	draw
	input
	gravity
	movement
	projectile
	always
	levelSystem
	collisions

	exit when changeRoom

	% Go back to the menu screen
	if key (KEY_ESC) or playerHP <= 0 then
	    stage := 0
	    changeRoom := true
	    playerXP := 0
	    exit
	end if

	View.Update
	loopTimeControl
	cls
    end loop

    % Reset the stage
    for no2 : 1 .. noOfEnemies
	enemyIsAlive (no2) := false
	enemy_x (no2) := 0
	enemy_y (no2) := 0
    end for


    for no : 1 .. noOfBoxes
	box_x1 (no) := 0
	box_y1 (no) := 0
    end for
    noOfBoxes := 0
end stage7

procedure changeStageScreen


    loop
	exit when allProcessesEnded
	Draw.Text ("Loading your next room, please wait...", maxx div 2 - Font.Width ("Loading your next room, please wait...", arial16Bold) div 2, maxy div 2, arial16Bold, white)
	View.Update
	delay (10)
	cls
    end loop


end changeStageScreen



% Processes for image animations
process player

    loop
	exit when endProcesses
	if playerMoving = true then
	    delay (100)
	    player_frame := 1
	    delay (100)
	    player_frame := 2
	else
	    player_frame := 0
	end if
    end loop
end player


process enemy

    loop
	exit when endProcesses
	delay (200)
	enemy_frame := 0
	delay (200)
	enemy_frame := 1
    end loop

end enemy

% Process for calculating the delay of a shot
process shotDelay

    loop
	exit when endProcesses
	if delayShot = true then
	    delay (delayShotTime - 10)
	    canShootProjectile := true
	    delayShot := false
	end if
	delay (10)
    end loop

end shotDelay

% Process for delaying the laser if user drains the entire bar
process laserDelay

    loop
	exit when endProcesses
	if playerEnergy <= 0 then
	    canShootLaser := false
	    delay (1000)
	    canShootLaser := true
	    playerEnergy += 1
	end if
	delay (10)
    end loop

end laserDelay

var amountDelayed : int := 0
% Process for random calculations using choice and things happening at random intervals
process random
    loop
	exit when endProcesses
	% For the enemies
	for no2 : 1 .. noOfEnemies
	    if enemyIsAlive (no2) then
		if enemyName (no2) = "Spyware Lv 30" then
		    choice := Rand.Int (1, 7)
		    if choice = 1 then
			if enemyHSpeed (no2) > 0 then
			    createProjectile ("Spyware Shot", enemy_x (no2) + Pic.Width (enemy_sprite (no2)), enemy_y (no2) + 15 -
				Pic.Height (spywareShot_right) div
				2, 1, 0)
			elsif enemyHSpeed (no2) < 0 then
			    createProjectile ("Spyware Shot", enemy_x (no2), enemy_y (no2) + 15 - Pic.Height (spywareShot_right) div 2, -1, 0)
			end if
		    end if
		end if

		if enemyName (no2) = "Bot Lv 40" then
		    choice := Rand.Int (1, 3)
		    if choice = 1 and enemyOnSurface (no2) then
			enemyOnSurface (no2) := false
			enemy_y (no2) += 1
			enemyVSpeed (no2) := 36
		    end if
		end if
	    end if
	    amountDelayed += 30
	    delay (30)
	end for
	delay (1000 - amountDelayed)
	amountDelayed := 0
    end loop
end random

% Process for the spawn rate
process spawn

    % Start spawning only after a delay
    delay (1000)

    % Spawning variables for each stage
    loop
	exit when endProcesses

	if stage = 1 then
	    enemySpawnDelay := 5000
	    loop
		enemySpawn := Rand.Int (1, 4)
		exit when Math.Distance (stage1Spawn_x (enemySpawn) + xView, 0, player_x, 0) > maxx
	    end loop

	    choice := Rand.Int (1, 5)
	    if choice >= 1 and choice <= 4 then
		createEnemy ("Worm Lv 1", stage1Spawn_x (enemySpawn), stage1Spawn_y (enemySpawn))
	    elsif choice = 5 then
		createEnemy ("Virus Lv 10", stage1Spawn_x (enemySpawn), stage1Spawn_y (enemySpawn))
	    end if

	elsif stage = 2 then
	    enemySpawnDelay := 3000
	    loop
		enemySpawn := Rand.Int (1, 6)
		exit when Math.Distance (stage2Spawn_x (enemySpawn) + xView, 0, player_x, 0) > maxx
	    end loop

	    choice := Rand.Int (1, 5)
	    if choice >= 1 and choice <= 3 then
		createEnemy ("Virus Lv 10", stage2Spawn_x (enemySpawn), stage2Spawn_y (enemySpawn))
	    elsif choice = 4 then
		createEnemy ("Worm Lv 1", stage2Spawn_x (enemySpawn), stage2Spawn_y (enemySpawn))
	    elsif choice = 5 then
		createEnemy ("Trojan Lv 20", stage2Spawn_x (enemySpawn), stage2Spawn_y (enemySpawn))
	    end if

	elsif stage = 3 then
	    enemySpawnDelay := 3000
	    loop
		enemySpawn := Rand.Int (1, 6)
		exit when Math.Distance (stage3Spawn_x (enemySpawn) + xView, 0, player_x, 0) > maxx
	    end loop

	    choice := Rand.Int (1, 4)
	    if choice >= 1 and choice <= 3 then
		createEnemy ("Trojan Lv 20", stage3Spawn_x (enemySpawn), stage3Spawn_y (enemySpawn))
	    elsif choice = 4 then
		createEnemy ("Spyware Lv 30", stage3Spawn_x (enemySpawn), stage3Spawn_y (enemySpawn))
	    end if

	elsif stage = 4 then
	    enemySpawnDelay := 3000
	    loop
		enemySpawn := Rand.Int (1, 4)
		exit when Math.Distance (stage4Spawn_x (enemySpawn) + xView, 0, player_x, 0) > maxx
	    end loop

	    choice := Rand.Int (1, 3)
	    if choice >= 1 and choice <= 2 then
		createEnemy ("Spyware Lv 30", stage4Spawn_x (enemySpawn), stage4Spawn_y (enemySpawn))
	    elsif choice = 3 then
		createEnemy ("Bot Lv 40", stage4Spawn_x (enemySpawn), stage4Spawn_y (enemySpawn))
	    end if

	elsif stage = 5 then
	    enemySpawnDelay := 3000
	    loop
		enemySpawn := Rand.Int (1, 4)
		exit when Math.Distance (stage5Spawn_x (enemySpawn) + xView, 0, player_x, 0) > maxx
	    end loop

	    choice := Rand.Int (1, 6)
	    if choice >= 1 and choice <= 2 then
		createEnemy ("Bot Lv 40", stage5Spawn_x (enemySpawn), stage5Spawn_y (enemySpawn))
	    elsif choice = 3 then
		createEnemy ("Spyware Lv 30", stage5Spawn_x (enemySpawn), stage5Spawn_y (enemySpawn))
	    elsif choice = 4 then
		createEnemy ("Bug Lv 50", stage5Spawn_x (enemySpawn), stage5Spawn_y (enemySpawn))
	    end if
	elsif stage = 6 then
	    enemySpawnDelay := 3000
	    loop
		enemySpawn := Rand.Int (1, 4)
		exit when Math.Distance (stage6Spawn_x (enemySpawn) + xView, 0, player_x, 0) > maxx
	    end loop

	    choice := Rand.Int (1, 4)
	    if choice >= 1 and choice <= 2 then
		createEnemy ("Bug Lv 50", stage6Spawn_x (enemySpawn), stage6Spawn_y (enemySpawn))
	    elsif choice = 4 then
		createEnemy ("Spam Lv 60", stage6Spawn_x (enemySpawn), stage6Spawn_y (enemySpawn))
	    end if
	elsif stage = 7 then
	    enemySpawnDelay := 3000
	    enemySpawn := Rand.Int (1, 4)
	    choice := Rand.Int (1, 8)
	    if choice <= 4 then
		createEnemy ("Spam Lv 60", stage7Spawn_x (enemySpawn), stage7Spawn_y (enemySpawn))
	    elsif choice = 5 or choice = 6 then
		createEnemy ("Bug Lv 50", stage7Spawn_x (enemySpawn), stage7Spawn_y (enemySpawn))
	    elsif choice = 7 then
		createEnemy ("Bot Lv 40", stage7Spawn_x (enemySpawn), stage7Spawn_y (enemySpawn))
	    elsif choice = 8 then
		createEnemy ("Spyware Lv 30", stage7Spawn_x (enemySpawn), stage7Spawn_y (enemySpawn))
	    end if
	end if

	% Spawn the enemy
	delay (enemySpawnDelay)
    end loop
    allProcessesEnded := true

end spawn
% Shooting the laser from character 2
process laser
    loop
	exit when endProcesses
	if shotLaser then
	    laserDrain := true

	    % Controlling the size of the laser
	    if laserSize = 1 then
		laser_y1 := player_y + round (Pic.Height (player_sprite) / 2.3) + 5
		laser_y2 := player_y + Pic.Height (player_sprite) - round (Pic.Height (player_sprite) / 2.3) + 5

	    elsif laserSize = 2 then
		laser_y1 := player_y + round (Pic.Height (player_sprite) / 2.8) + 5
		laser_y2 := player_y + Pic.Height (player_sprite) - round (Pic.Height (player_sprite) / 2.8) + 5

	    elsif laserSize = 3 then
		laser_y1 := player_y + round (Pic.Height (player_sprite) / 3.5) + 5
		laser_y2 := player_y + Pic.Height (player_sprite) - round (Pic.Height (player_sprite) / 3.5) + 5

	    elsif laserSize = 4 then
		laser_y1 := player_y + round (Pic.Height (player_sprite) / 4.2) + 5
		laser_y2 := player_y + Pic.Height (player_sprite) - round (Pic.Height (player_sprite) / 4.2) + 5

	    elsif laserSize = 5 then
		laser_y1 := player_y + 5
		laser_y2 := player_y + Pic.Height (player_sprite) + 5
	    end if


	    % For right direction
	    if direction = 1 then
		laser_x1 := player_x + Pic.Width (player_sprite) - xView

		laserHitBox := 0


		% Collision of laser and box
		for no : 1 .. noOfBoxes
		    if box_x2 (no) + xView >= laser_x1 + xView and box_x1 (no) + xView <= laser_x2 + xView and box_y2 (no) >= laser_y1 and
			    box_y1 (no) <= laser_y2 and isSolid (no) then

			if Math.Distance (box_x1 (no) + xView, 0, player_x + Pic.Width (player_sprite), 0) < distanceFromPlayer then
			    distanceFromPlayer := round (Math.Distance (box_x1 (no) + xView, 0, player_x + Pic.Width (player_sprite), 0))
			    laserHitBox := no
			end if
		    end if

		end for

		% Reset the distance to a large number
		distanceFromPlayer := 99999

		% Draw the laser
		Draw.FillBox (laser_x1 + xView, laser_y1, laser_x2 + xView, laser_y2, 9)
		Draw.FillBox (laser_x1 + xView, laser_y1 + (laser_y2 - laser_y1) div 5, laser_x2 + xView, laser_y2 - (laser_y2 - laser_y1) div 5, 11)

		if laserHitBox = 0 or (laser_x1 <= box_x2 (laserHitBox) and laser_x1 >= box_x1 (laserHitBox) and laser_y2 >= box_y1 (laserHitBox) and laser_y1
			<=
			box_y2 (laserHitBox)) then
		    laser_x2 += 24
		else
		    laser_x2 := box_x1 (laserHitBox)
		end if
	    end if

	    % For left direction
	    if direction = -1 then

		laser_x2 := player_x - xView

		laserHitBox := 0

		for no : 1 .. noOfBoxes
		    if box_x2 (no) + xView >= laser_x1 + xView and box_x1 (no) + xView <= laser_x2 + xView and box_y2 (no) >= laser_y1 and
			    box_y1 (no) <= laser_y2 and isSolid (no) then

			if Math.Distance (box_x2 (no) + xView, 0, player_x, 0) < distanceFromPlayer then
			    distanceFromPlayer := round (Math.Distance (box_x2 (no) + xView, 0, player_x, 0))
			    laserHitBox := no
			end if
		    end if

		end for

		% Reset the distance to a large number
		distanceFromPlayer := 99999

		% Draw the laser
		Draw.FillBox (laser_x2 + xView, laser_y1, laser_x1 + xView, laser_y2, 9)
		Draw.FillBox (laser_x2 + xView, laser_y1 + (laser_y2 - laser_y1) div 5, laser_x1 + xView, laser_y2 - (laser_y2 - laser_y1) div 5, 11)


		if laserHitBox = 0 or (laser_x2 <= box_x2 (laserHitBox) and laser_x2 >= box_x1 (laserHitBox) and laser_y2 >= box_y1 (laserHitBox) and laser_y1
			<=
			box_y2 (laserHitBox)) then
		    laser_x1 -= 24
		else
		    laser_x1 := box_x2 (laserHitBox)
		end if
	    end if
	else
	    laserDrain := false
	    if direction = 1 then
		laser_x1 := player_x + Pic.Width (player_sprite) - xView
		laser_x2 := player_x + Pic.Width (player_sprite) - xView
	    elsif direction = -1 then
		laser_x1 := player_x - xView
		laser_x2 := player_x - xView
	    end if

	end if
	delay (1)
    end loop
end laser

% Start processes and procedures
% Different screen for each stage
loop
    % The game will quit if the user wishes to end


    if stage = -1 and changeRoom then
	changeRoom := false
	endProcesses := true
	mainMenu
	exit when quitGame
	if stage = -1 then
	    login
	end if
    elsif stage = -2 and changeRoom then
	changeRoom := false
	endProcesses := true
	drawShop
    elsif stage = -3 and changeRoom then
	changeRoom := false
	endProcesses := true
	drawOffenseShop
    elsif stage = -4 and changeRoom then
	changeRoom := false
	endProcesses := true
	drawGeneralShop
    elsif stage = -5 and changeRoom then
	changeRoom := false
	endProcesses := true
	drawInstructions1
    elsif stage = -6 and changeRoom then
	changeRoom := false
	endProcesses := true
	drawInstructions2
    elsif stage = -7 and changeRoom then
	changeRoom := false
	endProcesses := true
	drawInstructions3

    elsif stage = 0 and changeRoom then
	changeRoom := false
	endProcesses := true
	desktopMenu
    elsif stage >= 1 and changeRoom then
	changeRoom := false
	endProcesses := false

	fork player
	fork enemy
	fork shotDelay
	fork random
	fork laserDelay
	fork laser
	fork spawn
	fork random

	% Assigning the stages to the levels
	if stage = 1 then
	    stage1
	elsif stage = 2 then
	    stage2
	elsif stage = 3 then
	    stage3
	elsif stage = 4 then
	    stage4
	elsif stage = 5 then
	    stage5
	elsif stage = 6 then
	    stage6
	elsif stage = 7 then
	    stage7
	end if

	if stage not= 0 then
	    endProcesses := true
	    changeStageScreen
	    allProcessesEnded := false
	end if
    end if

end loop

% Stop the music
Music.PlayFileStop

% Free the pics and fonts
Pic.Free (instructions1)
Pic.Free (instructions2)
Pic.Free (instructions3)
Pic.Free (storePic)
Pic.Free (backArrowButton)
Pic.Free (backArrowButtonGlow)
Pic.Free (forwardArrowButton)
Pic.Free (forwardArrowButtonGlow)
Pic.Free (offenseButton)
Pic.Free (offenseButtonGlow)
Pic.Free (defenseButton)
Pic.Free (defenseButtonGlow)
Pic.Free (description)
Pic.Free (offenseShop)
Pic.Free (levelButton)
Pic.Free (levelButtonGlow)
Pic.Free (damageUp)
Pic.Free (multiShot)
Pic.Free (damageShield)
Pic.Free (bigShield)
Pic.Free (laserUp)
Pic.Free (lazer)
Pic.Free (damageUpInfo)
Pic.Free (multiShotInfo)
Pic.Free (lazerUpInfo)
Pic.Free (lazerInfo)
Pic.Free (damageShieldInfo)
Pic.Free (bigShieldInfo)
Pic.Free (generalShop)
Pic.Free (speedUp)
Pic.Free (jumpHeightUp)
Pic.Free (increaseMaxHealth)
Pic.Free (healthRegen)
Pic.Free (increaseMaxEnergy)
Pic.Free (energyRegen)
Pic.Free (speedUpInfo)
Pic.Free (jumpHeightUpInfo)
Pic.Free (increaseMaxHealthInfo)
Pic.Free (healthRegenInfo)
Pic.Free (increaseMaxEnergyInfo)
Pic.Free (energyRegenInfo)
for no : 1 .. 27
    Pic.Free (matrixPic (no))
end for
Pic.Free (titlePic)
Pic.Free (newSavePic)
Pic.Free (newSavePicGlow)
Pic.Free (loadSavePic)
Pic.Free (loadSavePicGlow)
Pic.Free (creditsPic)
Pic.Free (creditsPicGlow)
Pic.Free (exitPic)
Pic.Free (exitGlowPic)
for no : 1 .. 6
    Pic.Free (desktop (no))
end for
Pic.Free (prepareDesktop)
Pic.Free (loginScreen)
for no : 1 .. 6
    Pic.Free (loading (no))
end for
Pic.Free (recycleBin)
Pic.Free (recycleBin2)
Pic.Free (internetExplorer)
Pic.Free (internetExplorer2)
Pic.Free (windowsExplorer)
Pic.Free (windowsExplorer2)
Pic.Free (microsoftWord)
Pic.Free (microsoftWord2)
Pic.Free (paint)
Pic.Free (paint2)
Pic.Free (googleEarth)
Pic.Free (googleEarth2)
Pic.Free (mediaPlayer)
Pic.Free (mediaPlayer2)
Pic.Free (messenger)
Pic.Free (messenger2)
Pic.Free (movieMaker)
Pic.Free (movieMaker2)
Pic.Free (myComputer)
Pic.Free (myComputer2)
Pic.Free (store)
Pic.Free (store2)
Pic.Free (save)
Pic.Free (save2)
Pic.Free (player1_right1)
Pic.Free (player1_right2)
Pic.Free (player1_left1)
Pic.Free (player1_left2)
Pic.Free (player1_stand_right)
Pic.Free (player1_stand_left)
Pic.Free (player2_right1)
Pic.Free (player2_right2)
Pic.Free (player2_left1)
Pic.Free (player2_left2)
Pic.Free (player2_stand_right)
Pic.Free (player2_stand_left)
Pic.Free (player3_right1)
Pic.Free (player3_right2)
Pic.Free (player3_left1)
Pic.Free (player3_left2)
Pic.Free (player3_stand_right)
Pic.Free (player3_stand_left)
Pic.Free (shield1)
Pic.Free (shield2)
Pic.Free (player1_head1)
Pic.Free (player1_head2)
Pic.Free (player2_head1)
Pic.Free (player2_head2)
Pic.Free (player3_head1)
Pic.Free (player3_head2)
Pic.Free (ball)
Pic.Free (spywareShot_right)
Pic.Free (spywareShot_left)
Pic.Free (explosion)
Pic.Free (worm_1_right)
Pic.Free (worm_2_right)
Pic.Free (worm_1_left)
Pic.Free (worm_2_left)
Pic.Free (virus_1)
Pic.Free (virus_2)
Pic.Free (trojan_1_right)
Pic.Free (trojan_2_right)
Pic.Free (trojan_1_left)
Pic.Free (trojan_2_left)
Pic.Free (spyware_1_right)
Pic.Free (spyware_2_right)
Pic.Free (spyware_1_left)
Pic.Free (spyware_2_left)
Pic.Free (bot_1)
Pic.Free (bot_2)
Pic.Free (bot_jump)
Pic.Free (bug_1_right)
Pic.Free (bug_2_right)
Pic.Free (bug_1_left)
Pic.Free (bug_2_left)
Pic.Free (spam_1)
Pic.Free (spam_2)
Pic.Free (boss_1)
Pic.Free (boss_2)
Pic.Free (leftPortal1)
Pic.Free (leftPortal2)
Pic.Free (rightPortal1)
Pic.Free (rightPortal2)
Pic.Free (internetExplorerBackground)
Pic.Free (stage1Background)
Pic.Free (recycleBinBackground)
Pic.Free (stage2Background)
Pic.Free (window1)
Pic.Free (window2)
Pic.Free (window3)
Pic.Free (stage3Background)
Pic.Free (stage4Background)
Pic.Free (stage5Background)
Pic.Free (stage6Background)
Pic.Free (stage7Background)
Pic.Free (instructions)
Pic.Free (instructions0)
Font.Free (arial12)
Font.Free (arial12Bold)
Font.Free (cambria14Bold)
Font.Free (arial16Bold)
Font.Free (arial20Bold)
Font.Free (cambria36Bold)
Font.Free (calibriLight20)

% End of program

