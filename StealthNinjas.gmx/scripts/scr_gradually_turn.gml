///gradually_turn(objToTurn, target, turnSpeed, accuracy)
//
// <objToTurn> takes an object
// <target> takes an object
// <turnSpeed> takes a number
// <accuracy> takes a number between 0 and 1
//

var objToTurn = argument0;
var target = argument1;
var turnSpeed = argument2 / 100000;             // Tweak the 100000 if you're not getting the desired results
var accuracy = clamp(argument3, 0.05, 0.95);    // Don't want perfect accuracy or perfect inaccuracy

// Test if parameters are valid
if(!instance_exists(objToTurn)) return -1;
//if(!instance_exists(target)) return -1;

// Reverse nomalize accuracy for calculations
accuracy = abs(accuracy - 1.0);

// Get the target direction and facing direction
//var targetDir = point_direction(objToTurn.x, objToTurn.y, target.x, target.y);
var facingDir = objToTurn.direction;

// Calculate the difference between target direction and facing direction
var facingMinusTarget = facingDir - target;
var angleDiff = facingMinusTarget;
if(abs(facingMinusTarget) > 180)
{
    if(facingDir > target)
    {
        angleDiff = -1 * ((360 - facingDir) + target);
    }
    else
    {
        angleDiff = (360 - target) + facingDir;
    }
}

// Gradually rotate object
var leastAccurateAim = 10;
if(angleDiff > leastAccurateAim * accuracy)
{
    objToTurn.direction -= turnSpeed * delta_time;
    
    if(objToTurn.direction <= target +1 and objToTurn.direction >= target -1)
    {
        objToTurn.direction = target;
        return true;
    }
}
else if(angleDiff < leastAccurateAim * accuracy)
{
    objToTurn.direction += turnSpeed * delta_time;
    
    if(objToTurn.direction <= target +1 and objToTurn.direction >= target -1)
    {
        objToTurn.direction = target;
        return true;
    }
}

return false;





