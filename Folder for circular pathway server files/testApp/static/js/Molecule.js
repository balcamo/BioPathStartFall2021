    // Molecules are the arrows that flow through the pathway.
    // This class handles the movement calculations and the animations
    //   using P5.js to draw them to the screen
    // Created by: Daniel Strub
    // Modified last: 4/17/2021

class Molecule {
  
    constructor() {

        this.x = reactionsCpy[0].substrate.getX() + (reactionsCpy[0].rectWidth / 2);
        this.y = reactionsCpy[0].substrate.getY() + (reactionsCpy[0].rectHeight / 2);
        this.destX = reactionsCpy[0].product.getX() + (reactionsCpy[0].rectWidth / 2);
        this.destY = reactionsCpy[0].product.getY() + (reactionsCpy[0].rectHeight / 2);
        this.curReaction = reactionsCpy[0];
        this.reactionIndex = 0;
        this.srcX = reactionsCpy[0].substrate.getX() + (reactionsCpy[0].rectWidth / 2);
        this.srcY = reactionsCpy[0].substrate.getY() + (reactionsCpy[0].rectHeight / 2);

        this.orientation = 0;

        console.log("Molecule created");
    }
  
    calculateOrientation(nextX, nextY) {
        // Calculates the orientation of the triangle to be drawn given its starting location
        //   which is this.x and this.y and its ending location this.destX and this.destY.
        // Subtracting by pi / 2 is necessary to get the molecules oriented correctly
        // Updates: this.orientation
        this.orientation = Math.atan2(nextY - this.y, nextX - this.x) - (Math.PI / 2);
    }
  
    progressMovement() {
        // Logic for calculating distance movement and
        // next destination go here
        // Updates: this.x, this.y, this.startLoc, this.destLoc, this.destX,
        //   this.destY, this.orientation (through calculateOrientation)
    
        // TODO: Complete this entire func
        var newX;
        var newY;

        var deletedMolecule = false;


        if (this.atNextLoc()) {
            //console.log("Molecule at next location")
            // Need to change destination or need to delete molecule
            if (this.reactionIndex == (reactionsCpy.length - 1)) {
                //console.log("Deleting molecule");
                // Molecule is at the end of the pathway, so get rid of it
                molecules.splice(molecules.indexOf(this), 1);
                deletedMolecule = true; 
            }
            else {
                //console.log("Molecule is at the end of a reaction, but not the pathway")
                // Molecule is not at the end of the pathway, but is at the end of
                // a reaction so move it to the next reaction
                this.reactionIndex += 1;
                this.curReaction = reactionsCpy[this.reactionIndex];
                
                this.srcX = this.destX;
                this.srcY = this.destY;

                this.destX = reactionsCpy[this.reactionIndex].product.getX() + (reactionsCpy[this.reactionIndex].rectWidth / 2);
                this.destY = reactionsCpy[this.reactionIndex].product.getY() + (reactionsCpy[this.reactionIndex].rectHeight / 2);
               
            }
        }
        if (!deletedMolecule) {
            //console.log("Molecule is moving");
            // If molecule is not deleted, update position and class variables
            var xy = this.distBetweenLocs();

            newX = this.x + (xy['x'] / moleculeSpeed);
            newY = this.y + (xy['y'] / moleculeSpeed);
            //console.log("Changing y by " + xy['y'] / moleculeSpeed);
            console.log()

            if (this.testPastDest()) {
                //console.log("Molecule is past it's destination, setting newX, newY to the dest coords")
                newX = this.destX;
                newY = this.destY;
            }
            this.calculateOrientation(newX, newY);
            this.x = newX;
            this.y = newY;
            //console.log("New x: " + newX + ", New y: " + newY);
        }

    
        
    }
  
    draw() {
        // Calls progressMovement to get the next coordinates and orientation to draw with
        //   and then draws them to the screen
        // Updates: Nothing
    
        this.progressMovement();

        //console.log("Drawing molecule at " + this.x + " " + this.y);
        
        push();
        translate(this.x, this.y);
        stroke(0);
        rotate(this.orientation);
        triangle(-5, -5, 0, 10, 5, -5);
        pop();
    }

    testPastDest() {
        var srcXSign = this.srcX - this.destX;
        var srcYSign = this.srcY - this.destY;
        var moleculeXSign = this.x - this.destX;
        var moleculeYSign = this.y - this.destY;
        //console.log("Sign of srcX is: " + Math.sign(srcXSign));
        //console.log("Sign of srcY is: " + Math.sign(srcYSign));
        //console.log("Sign of moleculeX is: " + Math.sign(moleculeXSign));
        //console.log("Sign of moleculeY is: " + Math.sign(moleculeYSign));


        if (Math.sign(srcXSign) != Math.sign(moleculeXSign)) {
            
            return true;
        }
        if (Math.sign(srcYSign) != Math.sign(moleculeYSign)) {
            return true;
        }
        return false;
    }

    atNextLoc() {
        if ((this.x == this.destX) && (this.y == this.destY)) {
            return true;
        }
        return false;
    }

    distBetweenLocs() {
        return {'x': this.destX - this.srcX, 'y': this.destY - this.srcY};
    }
}