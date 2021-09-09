"use strict"

var firstRectMidX;
var firstRectMidY;

var canvas = document.getElementById("modelEditCanvas");
var modelDiv = document.getElementById("modelEditDiv");
var divWidth = window.getComputedStyle(modelDiv, null).width;
var context = canvas.getContext('2d');
var positionChange = 1; //Adjust this to change how fast things move on the screen
var prevPosChange = positionChange;

var enzymeList = [];
var substrateList = [];
var productList = [];
var revList = [];
var xCoords = [];
var yCoords = [];
var dotPositions = []; //For each module, the (x, y) position of the "dot" representing the flow
var directions = [];
var prodSubValues = [];
var rxnDir = []; //The direction that the dot should be drawn, 1 for foward, and -1 for backwards
var kValues = []; //TODO: Determine if this is nessisary at all, stuff is pushed to it but it doesnt do anything
var highlightRects = []; //For each rectangular outline: [x, y, width, height, visible]
var db_modules = JSON.parse(document.getElementById('db-modules').textContent);
var db_substrates = JSON.parse(document.getElementById('db-substrates').textContent);
var db_products = JSON.parse(document.getElementById('db-products').textContent);
var modelNum = parseInt(document.getElementById('modelNum').textContent);
var xCoorNext = parseInt(document.getElementById('x-coor-next').textContent);
var yCoorNext = parseInt(document.getElementById('y-coor-next').textContent);
var pubModel = (document.getElementById('pubModel').textContent === "true");
var sliders = [];
var paused = false;
var subProdImage = document.getElementById('substr');
var dotOrientation = [];


var playPauseButton = document.getElementById("play-pause");
playPauseButton.addEventListener("click", playPauseCanvas);

var displayImages = true; //If true then it will display images instead of the typical dots

/*
    Plays/Pauses the pathway interactions on the canvas when called upon.
*/
function playPauseCanvas() {
    if (paused) {
        positionChange = prevPosChange;
        playPauseButton.innerHTML = "Pause";
    } else {
        positionChange = 0;
        playPauseButton.innerHTML = "Play";
    }
    paused = !paused;
}

// Description: This function calculates the x and y coordinates around a circle.
// Parameters:
//      numReactions: the number of total reactions
//      currentReaction: the current reaction number (ex. 4/10 then 5/10... etc)
//      centerX: x-coordinate of center of circle
//      centerY: y-coordinate of center of circle
//      r: radius
// Returns: a tuple with the calculated coordinate
function determineCoor(numReactions, currentReaction, centerX, centerY, r){
    let x = centerX + r*Math.cos((2*(currentReaction)*Math.PI)/(numReactions)),
        y = centerY + r*Math.sin((2*(currentReaction)*Math.PI)/(numReactions));

    return [x,y];
}

//Description: This function creates a non-reversible reaction for a pathway.
//Parameters:
//      substrate: ??
//      product: ??
//      enzyme: ??
//      firstRecMidX: the x-coord of the first rectangle's midpoint
//      firstRectMidY: the y-coord of the first rectangle's midpoint
//      ctx: used to draw objects to the screen
//      moduleNumber: which reaction number is being created
function notRevStep(substrate, product, enzyme,
    firstRectMidX, firstRectMidY, ctx, moduleNumber) {
    // var secondSub;
    // var secondProd;
    //The current way to see if there are multiple products and substrates
    //We need to figure out a way of making a primary product or substrate
    //That goes into the green rectangle label. Currently whatever one is 
    //in the database first is put there.
    //Possible ideas could be adding a primary reactant column to the tables?
    // if(substrate.length > 1) {
    //     secondSub = substrate[1];
    //     substrate = substrate[0];
    // }
    // if(product.length > 1) {
    //     secondProd = product[1];
    //     product = product[0];
    // }
    //create starting protein (substrate/product)
    
    //Will be changed to a parameter later on
    var circular = true;
    if(circular){
        //1. Create starting protein (substrate/product)
        ctx.closePath();
        ctx.beginPath();
        //For 10 enzymeList.length, 300 is a good radius for a circle
        let coors = determineCoor(enzymeList.length,moduleNumber,400,325,300);
        ctx.rect(coors[0]-50,coors[1]-25,100,50);
        ctx.fillStyle = calculateColor(moduleNumber, 1);
        ctx.fill();
        ctx.closePath();
        
        let coors_end = determineCoor(enzymeList.length,moduleNumber+1,400,325,300);

        //Need to handle more than just one case! But how do you differentiate??
        //2. Create left arc arrow (Part 1)
        /*ctx.beginPath();
        //ctx.moveTo(coors[0]+50,coors[1]);
        ctx.arc(coors[0]+50, coors[1]+75, 75, -Math.PI/2, Math.PI/2)
        ctx.lineTo(coors_end[0]-50,coors_end[1]-25)//ctx.lineTo(coors[0], coors[1]+75+75);
        //ctx.lineTo(coors[0]+50, coors[1]+50);
        ctx.stroke();*/
        //ctx.closePath();

        //3. Create left arc arrow (Part 2)
        //Code
        //Create arrow lines
        ctx.beginPath();
        ctx.moveTo(coors[0],coors[1]);
        ctx.lineTo(coors_end[0], coors_end[1]);
        ctx.stroke();

        //4. Create second protein
        /*ctx.beginPath();
        coors = determineCoor(enzymeList.length,moduleNumber,400,325,250);
        ctx.rect(coors[0]-50,coors[1]-25,100,50);
        ctx.fillStyle = calculateColor(moduleNumber, 1);
        ctx.fill();
        ctx.closePath();*/

        //5. Create right arc arrow (Part 1)

        //6. Create right arc arrow (Part 2)

        //7. Create enzyme at center of reaction

        //8. Label the proteins(rectangles) and enzymes(oval)
        //Substrates
        ctx.beginPath();
        ctx.font = "20px Arial";
        ctx.fillStyle = "white";
        ctx.fillText(substrate, coors[0], coors[1]);
        ctx.stroke();
        //Products **Doesn't work...
        /*ctx.fillText(product, firstRectMidX - 90, firstRectMidY + 105);
        ctx.stroke();
        ctx.closePath();*/
        //Enzymes
        //ctx.beginPath();
        //ctx.fillStyle = "black";
        //ctx.font = "12px Arial";
        //STATEMENTS AREN'T WORKING????
        //ctx.fillText(enzyme, coors[0] + 50 - fontMeasures.width / 2, coors[1] + 54);
        /*// if(secondSub != null)
            ctx.fillText('ATP', coors[0] + 100, coors[1] + 13);
        // if(secondProd != null)
            ctx.fillText('ADP', coors[0] + 100, coors[1] + 97);*/
        //ctx.stroke();

    }else{
        //1. Create starting protein (substrate/product)
        ctx.closePath();
        ctx.beginPath();
        ctx.rect(firstRectMidX - 100, firstRectMidY - 25, 100, 50);
        ctx.fillStyle = calculateColor(moduleNumber, 1);
        ctx.fill();
        ctx.closePath();
        
        //2. Create left arc arrow (Part 1)
        //Creates a NE hemisphere arc that acts as the upper-part of an arrow
        ctx.beginPath();
        ctx.moveTo(firstRectMidX, firstRectMidY+8);
        ctx.arc(firstRectMidX+5, firstRectMidY+48,
            40,3*Math.PI/2, 0);
        ctx.stroke();
        ctx.closePath();

        //3. Create left arc arrow (Part 2)
        //Creates a SE hemisphere arc that acts as the lower-part of an arroa
        ctx.beginPath();
        ctx.arc(firstRectMidX+5, firstRectMidY+52,
            40,0, Math.PI/2);
        ctx.lineTo(firstRectMidX, firstRectMidY+92);
        //Create the arrow
        ctx.lineTo(firstRectMidX + 10, firstRectMidY + 82);
        ctx.moveTo(firstRectMidX + 10, firstRectMidY + 102);
        ctx.lineTo(firstRectMidX, firstRectMidY + 92);
        ctx.stroke();
        ctx.closePath();

        //4. Create second protein
        ctx.beginPath();
        ctx.rect(firstRectMidX - 100, firstRectMidY + 75, 100, 50);
        ctx.fillStyle = calculateColor(moduleNumber, 0);
        ctx.fill();
        ctx.closePath();

        //5. Create right arc arrow (Part 1)
        //Create arc for other substrates (inputs) into the reaction (such as ATP)
        //The if statement is used to have ireversible reactions with or without secondary subs
        //By default it just draws ATP and ADP on the side of irreversiable reactions
        // if(secondSub != null){
        ctx.beginPath();
        ctx.arc(firstRectMidX+95, firstRectMidY+48,
            40,3*Math.PI/2, Math.PI, true);
        ctx.stroke();
        // }
        //6. Create right arc arrow (Part 2)
        //Create arc for other products (outputs) to the reaction (such as ADP)
        // if(secondProd != null){
        ctx.beginPath();
        ctx.arc(firstRectMidX+95, firstRectMidY+52,
            40,Math.PI, Math.PI/2, true);
        ctx.stroke();
        ctx.lineTo(firstRectMidX + 85, firstRectMidY + 82);
        ctx.moveTo(firstRectMidX + 85, firstRectMidY + 102);
        ctx.lineTo(firstRectMidX + 95, firstRectMidY + 92);
        ctx.fillStyle = "black";
        ctx.stroke();
        // }

        //7. Create enzyme at center of reaction
        ctx.beginPath();
        ctx.font = "12px Arial";
        var fontMeasures = ctx.measureText(enzyme);
        var xCoord = firstRectMidX + 45 - (fontMeasures.width / 2);
        ctx.moveTo(xCoord, firstRectMidY + 50);
        ctx.bezierCurveTo(
            xCoord, firstRectMidY + 30,
            xCoord + fontMeasures.width + 10, firstRectMidY + 30,
            xCoord + fontMeasures.width + 10, firstRectMidY + 50);
        ctx.bezierCurveTo(
            xCoord + fontMeasures.width + 10, firstRectMidY + 70,
            xCoord, firstRectMidY + 70,
            xCoord, firstRectMidY + 50);
        ctx.fillStyle = "white";
        ctx.fill();

        //8. Label the proteins(rectangles) and enzymes(oval)
        ctx.font = "20px Arial";
        ctx.fillStyle = "white";
        ctx.fillText(substrate, firstRectMidX - 90, firstRectMidY + 5);
        ctx.fillText(product, firstRectMidX - 90, firstRectMidY + 105);
        ctx.stroke();
        ctx.closePath();
        ctx.beginPath();
        ctx.fillStyle = "black";
        ctx.font = "12px Arial";
        ctx.fillText(enzyme, firstRectMidX + 50 - fontMeasures.width / 2,
            firstRectMidY + 54);
        // if(secondSub != null)
            ctx.fillText('ATP', firstRectMidX + 100, firstRectMidY + 13);
        // if(secondProd != null)
            ctx.fillText('ADP', firstRectMidX + 100, firstRectMidY + 97);
        ctx.stroke();
    }

    var showTopCircle = false;
    if(showTopCircle){
        ctx.beginPath();
        ctx.arc(400,325,300,0,2*Math.PI,false);
        ctx.stroke();
        ctx.closePath();
        //For loop to get x/y coordinates around a circle
        for (var j=0; j<enzymeList.length; j++){
            let coors = determineCoor(enzymeList.length,j,400,325,300);
            ctx.beginPath();
            ctx.arc(coors[0],coors[1],10, 0, 2*Math.PI,false);
            ctx.stroke();
            ctx.closePath();
        }
    }
    
}

//create a reversible reaction
function revStep(firstText, secondText, enzyme, firstRectMidX, firstRectMidY,
    nextX, nextY, ctx, moduleNumber) {
    //create first protein
    ctx.font = "20px Arial";
    var circular = true;
    if(circular){
        ctx.closePath();
        //Create substrate rectangle
        ctx.beginPath();
        let coors = determineCoor(enzymeList.length,moduleNumber,400,325,300);
        ctx.rect(coors[0]-50,coors[1]-25,100,50);
        ctx.fillStyle = calculateColor(moduleNumber, 1);
        ctx.fill();
        ctx.closePath();

        //Create left arc arrow
        //let coors_2 = determineCoor(enzymeList.length,1,400,325,250);
        /*ctx.beginPath();
        ctx.moveTo(coors[0]+25,coors[1]+15);
        ctx.lineTo(coors[0] + (coors_2[0]/2),coors[1] + (coors_2[1]/2));
        ctx.stroke();*/
        //ctx.endPath();
        //Create right arc arrow

        //Create product rectangle
        /*ctx.beginPath();
        coors = determineCoor(enzymeList.length,1,400,325,250);
        ctx.rect(coors[0]-50,coors[1]-35,100,50);
        ctx.fillStyle = calculateColor(moduleNumber, 1);
        ctx.fill();
        ctx.closePath();*/
        ctx.fillStyle = "white";
        ctx.font = "20px Arial";
        ctx.beginPath();
        ctx.fillText(firstText, coors[0]-20, coors[1]);
        if (!nextY) {
            //add label to second protein
            ctx.fillText(secondText, coors[0] - 90, coors[1] + 105);
        }
        ctx.stroke();
    }else{
        //create first protein
        ctx.closePath();
        ctx.beginPath();
        ctx.font = "20px Arial";
        //color = yourFunction(max)
        ctx.rect(firstRectMidX - 100, firstRectMidY - 25, 100, 50);
        ctx.fillStyle = calculateColor(moduleNumber, 1);
        ctx.fill();
        ctx.closePath();
        ctx.beginPath();
        //draw arrows between proteins
        if (nextX) {
            if (nextX === firstRectMidX) { //reactions are formatted normally
                ctx.moveTo(firstRectMidX - 65, firstRectMidY + 35);
                ctx.lineTo(firstRectMidX - 55, firstRectMidY + 25);
                ctx.lineTo(firstRectMidX - 55, firstRectMidY + 75);
                ctx.moveTo(firstRectMidX - 45, firstRectMidY + 25);
                ctx.lineTo(firstRectMidX - 45, firstRectMidY + 75);
                ctx.lineTo(firstRectMidX - 35, firstRectMidY + 65);
                ctx.stroke();
                ctx.closePath();
                ctx.beginPath();
                //create second protein
                ctx.rect(firstRectMidX - 100, firstRectMidY + 75, 100, 50);
                ctx.fillStyle = calculateColor(moduleNumber, 0);
                ctx.fill();
                ctx.closePath();
                ctx.beginPath();
            } else {
                if (nextY === firstRectMidY) { //reactions horizontally connected
                    ctx.moveTo(firstRectMidX + 10, firstRectMidY - 15);
                    ctx.lineTo(firstRectMidX, firstRectMidY - 5);
                    ctx.lineTo(firstRectMidX + 50, firstRectMidY - 5);
                    ctx.moveTo(firstRectMidX, firstRectMidY + 5);
                    ctx.lineTo(firstRectMidX + 50, firstRectMidY + 5);
                    ctx.lineTo(firstRectMidX + 40, firstRectMidY + 15);
                    ctx.stroke();
                    ctx.closePath();
                    ctx.beginPath();
                    ctx.rect(firstRectMidX + 50, firstRectMidY - 25, 100, 50);
                    ctx.fillStyle = calculateColor(moduleNumber, 0);
                    ctx.fill();
                    ctx.closePath();
                    ctx.beginPath();
                } else { //reactions diagonally connected
                    ctx.moveTo(firstRectMidX - 55, firstRectMidY + 25);
                    ctx.lineTo(firstRectMidX - 55, firstRectMidY + 50);
                    ctx.lineTo(firstRectMidX - 130, firstRectMidY + 75);
                    ctx.moveTo(firstRectMidX - 55, firstRectMidY + 50);
                    ctx.lineTo(firstRectMidX + 20, firstRectMidY + 75);
                    ctx.moveTo(firstRectMidX - 45, firstRectMidY + 25);
                    ctx.lineTo(firstRectMidX - 45, firstRectMidY + 50);
                    ctx.lineTo(firstRectMidX - 120, firstRectMidY + 75);
                    ctx.moveTo(firstRectMidX - 45, firstRectMidY + 50);
                    ctx.lineTo(firstRectMidX + 30, firstRectMidY + 75);
                    ctx.stroke();
                    ctx.closePath();
                    ctx.beginPath();
                    ctx.rect(firstRectMidX - 175, firstRectMidY + 75, 100, 50);
                    ctx.rect(firstRectMidX - 25, firstRectMidY + 75, 100, 50);
                    ctx.fillStyle = calculateColor(moduleNumber, 0);
                    ctx.fill();
                    ctx.closePath();
                    ctx.beginPath();
                }
            }
        } else {
            ctx.moveTo(firstRectMidX - 65, firstRectMidY + 35);
            ctx.lineTo(firstRectMidX - 55, firstRectMidY + 25);
            ctx.lineTo(firstRectMidX - 55, firstRectMidY + 75);
            ctx.moveTo(firstRectMidX - 45, firstRectMidY + 25);
            ctx.lineTo(firstRectMidX - 45, firstRectMidY + 75);
            ctx.lineTo(firstRectMidX - 35, firstRectMidY + 65);
            ctx.stroke();
            ctx.closePath();
            ctx.beginPath();
            //create second protein
            ctx.rect(firstRectMidX - 100, firstRectMidY + 75, 100, 50);
            ctx.fillStyle = calculateColor(moduleNumber, 0);
            ctx.fill();
            ctx.closePath();
            ctx.beginPath();

        }
        //Enzyme
        ctx.beginPath();
        ctx.font = "12px Arial";
        var fontMeasures = ctx.measureText(enzyme);

        var xCoord;
        var yCoord;
        if (nextX && (nextY === firstRectMidY)) {
            xCoord = firstRectMidX + 20 - (fontMeasures.width / 2);
            yCoord = firstRectMidY;
        } else {
            xCoord = firstRectMidX - 55 - (fontMeasures.width / 2);
            yCoord = firstRectMidY + 50;
        }
        ctx.moveTo(xCoord, yCoord);
        ctx.bezierCurveTo(
            xCoord, yCoord - 20,
            xCoord + fontMeasures.width + 10, yCoord - 20,
            xCoord + fontMeasures.width + 10, yCoord);
        ctx.bezierCurveTo(
            xCoord + fontMeasures.width + 10, yCoord + 20,
            xCoord, yCoord + 20,
            xCoord, yCoord);
        ctx.fillStyle = "white";
        ctx.fill();

        ctx.fillStyle = "white";
        ctx.font = "20px Arial";
        ctx.stroke();
        ctx.closePath();
        ctx.beginPath();
        //add label to first protein
        ctx.fillText(firstText, firstRectMidX - 90, firstRectMidY + 5);
        if (!nextY) {
            //add label to second protein
            ctx.fillText(secondText, firstRectMidX - 90, firstRectMidY + 105);
        }
        ctx.stroke();
        ctx.closePath();
        ctx.beginPath();
        ctx.fillStyle = "black";
        ctx.font = "12px Arial";
        ctx.fillText(enzyme, xCoord + 5, yCoord + 4);
        //draw everything to the screen
        ctx.stroke();
    }
    //color = yourFunction(max)
    /*
    */
}

// Calculates the x-value of a point on a circle (of radius r) given the y value
//WARNING: This function is kinda janky and if you change R too much the dots go
//all over the place.
//Get dot pos is kinda a mess
function calculateX(y, centerX, centerY) {
    var x;
    var r = 46;
    x = centerX + Math.sqrt(-1 * Math.pow((y - centerY), 2) + Math.pow(r,2));
    if (Number.isNaN(x)) {
        return centerX;
    } else {
        return x;
    }
}

//This function checks to see if the current reation is "full"
//If it is it reverses the direction the dot is drawn by changing rxnDir
function checkRatio(moduleNumber) {
    var prodNum = prodSubValues[moduleNumber][0];
    if (prodNum >= 20.0) {
        rxnDir[moduleNumber] = -1;
    } else {
        rxnDir[moduleNumber] = 1;
    }
}

// Description: This function calculates the x-value of the molecule in the reacion.
//      the height changes by a consistent value each time but the horizontal position
//      can change if it's following a non-reversible reaction.
// Parameters:
//      moduleNumber: ???
// Returns: ???
function getDotPos(moduleNumber) {
    //find whether module is reversible
    //find module start and end positions
    //if irreversible:
    //semicircular path
    //else:
    //if startX == endX:
    //vertical path
    //else:
    //if startY == endY:
    //horizontal path
    //else:
    //weird path

    /*for(var i=0;i<db_modules.length;i++){
        document.write(db_modules[i].xCoor, ", ", db_modules[i].yCoor)
        document.write("\n")
    }*/

    var startX = xCoords[moduleNumber];
    var startY = yCoords[moduleNumber];
    //document.write(startX, startY);
    var endX;
    var endY;
    var x;
    var y;


    if (moduleNumber === xCoords.length - 1) {
        endX = xCoords[moduleNumber];
        endY = yCoords[moduleNumber] + 1;
    } else {
        endX = xCoords[moduleNumber + 1];
        endY = yCoords[moduleNumber + 1];
    }

    var dotStartX = dotPositions[moduleNumber][0];
    var dotStartY = dotPositions[moduleNumber][1];
    var dotStartX2;
    var dotStartY2;

    if (dotPositions[moduleNumber].length === 4) {
        dotStartX2 = dotPositions[moduleNumber][2];
        dotStartY2 = dotPositions[moduleNumber][3];
    }
    
    var revMod = revList[moduleNumber];
    if (revMod.toLowerCase() === "irreversible") {
        var currSlider = document.getElementById(enzymeList[moduleNumber]);
        var irrPositionChange = positionChange * (parseInt(currSlider.value) / 50) * (Math.PI / 2);
        checkRatio(moduleNumber);
        if (rxnDir[moduleNumber] === 1) {
            directions[moduleNumber] = 1;
        }
        if (dotPositions[moduleNumber][0] <= (startX * 75 + canvas.clientWidth / 2 + 50)) {
            if (dotPositions[moduleNumber][1] === startY * 100 + 5) {
                dotPositions[moduleNumber][0] += directions[moduleNumber] * irrPositionChange;
            } else {
                dotPositions[moduleNumber][0] -= directions[moduleNumber] * irrPositionChange;
            }
        } else {
            dotPositions[moduleNumber][1] += directions[moduleNumber] * irrPositionChange;
            dotPositions[moduleNumber][0] = calculateX(dotPositions[moduleNumber][1],
                (startX * 75 + canvas.clientWidth / 2 + 50), startY * 100 + 50);
        }
        if (dotPositions[moduleNumber][1] >= endY * 100 - 5 && dotPositions[moduleNumber][0] <
            (endX * 75) + canvas.clientWidth / 2) { //if reaches end of reaction
            prodSubValues[moduleNumber][0] += 1;
            prodSubValues[moduleNumber][1] -= 1;
            if (moduleNumber != prodSubValues.length - 1) {
                prodSubValues[moduleNumber + 1][1] += 1;
            }
            if (moduleNumber != 0) {
                prodSubValues[moduleNumber - 1][0] -= 1;
            }

            dotPositions[moduleNumber] = [startX * 75 + canvas.clientWidth / 2, startY * 100 + 5];
            checkRatio(moduleNumber);
            if (rxnDir[moduleNumber] != 1) {
                directions[moduleNumber] = 0;
            }
        }
    } else {
        if (startX === endX) { //vertical
            dotPositions[moduleNumber][1] += directions[moduleNumber] * positionChange;
            if (dotPositions[moduleNumber][1] >= endY * 100 - 5) {
                prodSubValues[moduleNumber][0] += 1;
                prodSubValues[moduleNumber][1] -= 1;
                if (moduleNumber != prodSubValues.length - 1) {
                    prodSubValues[moduleNumber + 1][1] += 1;
                }
                if (moduleNumber != 0) {
                    prodSubValues[moduleNumber - 1][0] -= 1;
                }
                checkRatio(moduleNumber);
                if (rxnDir[moduleNumber] === 0 || rxnDir[moduleNumber] === -1) {
                    directions[moduleNumber] = -1;
                } else {
                    dotPositions[moduleNumber][0] = startX * 75 + canvas.clientWidth / 2;
                    dotPositions[moduleNumber][1] = startY * 100 + 5;
                    directions[moduleNumber] = 1;
                }
            } else if (dotPositions[moduleNumber][1] <= startY * 100 + 5) {
                prodSubValues[moduleNumber][0] -= 1;
                prodSubValues[moduleNumber][1] += 1;
                if (moduleNumber != prodSubValues.length - 1) {
                    prodSubValues[moduleNumber + 1][1] -= 1;
                }
                if (moduleNumber != 0) {
                    prodSubValues[moduleNumber - 1][0] += 1;
                }
                checkRatio(moduleNumber);
                if (rxnDir[moduleNumber] === 0 || rxnDir[moduleNumber] === 1) {
                    directions[moduleNumber] = 1;
                } else {
                    dotPositions[moduleNumber][0] = endX * 75 + canvas.clientWidth / 2;
                    dotPositions[moduleNumber][1] = endY * 100 - 5;
                    directions[moduleNumber] = -1;
                }
            }
        } else {
            if (startY === endY) { //horizontal
                var currPosChange = (3 / 2) * positionChange
                dotPositions[moduleNumber][0] += directions[moduleNumber] * currPosChange;
                if (dotPositions[moduleNumber][0] >= (endX * 75) + canvas.clientWidth / 2) {
                    prodSubValues[moduleNumber][0] += 1;
                    prodSubValues[moduleNumber][1] -= 1;
                    if (moduleNumber != prodSubValues.length - 1) {
                        prodSubValues[moduleNumber + 1][1] += 1;
                    }
                    if (moduleNumber != 0) {
                        prodSubValues[moduleNumber - 1][0] -= 1;
                    }
                    checkRatio(moduleNumber);
                    if (rxnDir[moduleNumber] === 0 || rxnDir[moduleNumber] === -1) {
                        directions[moduleNumber] = -1;
                    } else {
                        dotPositions[moduleNumber][0] = startX * 75 + canvas.clientWidth / 2;
                        dotPositions[moduleNumber][1] = startY * 100 + 5;
                        directions[moduleNumber] = 1;
                    }
                } else if (dotPositions[moduleNumber][0] <= (startX * 75) +
                    canvas.clientWidth / 2) {
                    prodSubValues[moduleNumber][0] -= 1;
                    prodSubValues[moduleNumber][1] += 1;
                    if (moduleNumber != prodSubValues.length - 1) {
                        prodSubValues[moduleNumber + 1][1] -= 1;
                    }
                    if (moduleNumber != 0) {
                        prodSubValues[moduleNumber - 1][0] += 1;
                    }
                    checkRatio(moduleNumber);
                    if (rxnDir[moduleNumber] === 0 || rxnDir[moduleNumber] === 1) {
                        directions[moduleNumber] = 1;
                    } else {
                        dotPositions[moduleNumber][0] = endX * 75 + canvas.clientWidth / 2;
                        dotPositions[moduleNumber][1] = endY * 100 - 5;
                        directions[moduleNumber] = -1;
                    }
                }
            } else { //weird
                var midPoint = (yCoords[moduleNumber] * 100) + 50;
                var botMidPoint = midPoint + 25;
                if (dotPositions[moduleNumber][2] === 'undefined') { //If the reaction has not reached the midpoint before
                    dotPositions[moduleNumber].append(0);
                    dotPositions[moduleNumber].append(0);
                }
                if (dotPositions[moduleNumber][1] >= midPoint) {
                    dotPositions[moduleNumber][1] += directions[moduleNumber] * positionChange;
                    if (dotPositions[moduleNumber][1] < botMidPoint) {
                        dotPositions[moduleNumber][0] = (startX * 75 + canvas.clientWidth / 2) +
                            directions[moduleNumber] * 3 * (dotPositions[moduleNumber][1] -
                                midPoint);
                    }
                    dotPositions[moduleNumber][3] = dotPositions[moduleNumber][1];
                    if (dotPositions[moduleNumber][3] < botMidPoint) {
                        dotPositions[moduleNumber][2] = (startX * 75 + canvas.clientWidth / 2) -
                            directions[moduleNumber] * 3 * (dotPositions[moduleNumber][1] -
                                midPoint);
                    }
                } else {
                    dotPositions[moduleNumber][0] = startX * 75 + canvas.clientWidth / 2;
                    dotPositions[moduleNumber][1] += directions[moduleNumber] * positionChange;
                    dotPositions[moduleNumber][2] = startX * 75 + canvas.clientWidth / 2;
                    dotPositions[moduleNumber][3] = dotPositions[moduleNumber][1];
                }
                if (dotPositions[moduleNumber][1] >= endY * 100 - 5 && dotPositions[moduleNumber][0] >=
                    (endX * 75) + canvas.clientWidth / 2) {
                    prodSubValues[moduleNumber][0] += 1;
                    prodSubValues[moduleNumber][1] -= 1;
                    if (moduleNumber != prodSubValues.length - 1) {
                        prodSubValues[moduleNumber + 1][1] += 1;
                    }
                    if (moduleNumber != 0) {
                        prodSubValues[moduleNumber - 1][0] -= 1;
                    }
                    checkRatio(moduleNumber);
                    if (rxnDir[moduleNumber] === 0 || rxnDir[moduleNumber] === -1) {
                        directions[moduleNumber] = -1;
                    } else {
                        dotPositions[moduleNumber][0] = startX * 75 + canvas.clientWidth / 2;
                        dotPositions[moduleNumber][1] = startY * 100 + 5;
                        dotPositions[moduleNumber][2] = startX * 75 + canvas.clientWidth / 2;
                        dotPositions[moduleNumber][3] = startY * 100 + 5;
                        directions[moduleNumber] = 1;
                    }
                } else if (dotPositions[moduleNumber][1] <= startY * 100 + 5 &&
                    dotPositions[moduleNumber][0] <= (startX * 75) +
                    canvas.clientWidth / 2) {
                    prodSubValues[moduleNumber][0] -= 1;
                    prodSubValues[moduleNumber][1] += 1;
                    if (moduleNumber != prodSubValues.length - 1) {
                        prodSubValues[moduleNumber + 1][1] -= 1;
                    }
                    if (moduleNumber != 0) {
                        prodSubValues[moduleNumber - 1][0] += 1;
                    }
                    checkRatio(moduleNumber);
                    if (rxnDir[moduleNumber] === 0 || rxnDir[moduleNumber] === 1) {
                        directions[moduleNumber] = 1;
                    } else {
                        dotPositions[moduleNumber][0] = endX * 75 + canvas.clientWidth / 2;
                        dotPositions[moduleNumber][1] = endY * 100 - 5;
                        dotPositions[moduleNumber][2] = startX * 75 + canvas.clientWidth / 2;
                        dotPositions[moduleNumber][3] = startY * 100 + 5;
                        directions[moduleNumber] = -1;
                    }
                }
            }
        }
    }
    if (moduleNumber === 0) {
        prodSubValues[moduleNumber][1] += 1;
        if (prodSubValues[moduleNumber][1] >= 5) {
            prodSubValues[moduleNumber][1] = 5;
        }
    }
    if (moduleNumber === prodSubValues.length - 1) {
        prodSubValues[moduleNumber][0] -= 1;
        if (prodSubValues[moduleNumber][0] <= 1) {
            prodSubValues[moduleNumber][0] = 1;
        }
    }

    calculateOrientation(moduleNumber, dotStartX, dotStartY, false);
    if (dotPositions[moduleNumber].length === 4) {
        calculateOrientation(moduleNumber, dotStartX2, dotStartY2, true);
    }
    
    //console.log("x: " + xCoords[4]);
    //console.log("y: " + yCoords[4]);
}

// Description: This function calculates the orientation of a dot based on its starting X and
//      Y and its current X and Y.
// Parameters:
//      moduleNumber: ???
//      dotStartX: ???
//      dotStartY: ???
//      secondDot: signifies if there is a split in the pathway
// Returns: ???
function calculateOrientation(moduleNumber, dotStartX, dotStartY, secondDot) {
    
    var deltaX;
    var deltaY;

    var oldDotOrientation;
    var orientation;
    if (!secondDot) {
        deltaX = dotPositions[moduleNumber][0] - dotStartX;
        deltaY = dotPositions[moduleNumber][1] - dotStartY;
        oldDotOrientation = dotOrientation[moduleNumber][0];
    }
    else {
        deltaX = dotPositions[moduleNumber][2] - dotStartX;
        deltaY = dotPositions[moduleNumber][3] - dotStartY;
        oldDotOrientation = dotOrientation[moduleNumber][1];
    }
    orientation = Math.atan(deltaY/deltaX);
    if (deltaX > 0) {
        if (deltaY > 0) { // X and Y positive
            //dotOrientation[moduleNumber] *= -1; 
        }
        else if (deltaY < 0) { // X positive Y negative
            orientation *= -1;
        }
        else {
            // stay the same
        }
    }
    else if (deltaX < 0) {
        if (deltaY > 0) { // X negative or zero and Y positive
            orientation += Math.PI;
        }
        else if (deltaY < 0) { // X negative or zero and Y negative
            orientation = Math.PI - orientation;
        }
        else {
            orientation = -Math.PI;
        }
    }
    else { // No change in X
        if (deltaY > 0) {
            orientation = Math.PI/2;
        }
        else if (deltaY < 0) {
            orientation = -Math.PI/2;
        }
        else { // If there is not change in Y or X keep the same orientation
            orientation = oldDotOrientation;
        }
    }

    if (!secondDot) {
        dotOrientation[moduleNumber][0] = orientation;
    }
    else {
        dotOrientation[moduleNumber][1] = orientation;
    }
}


function animate() {
    canvas = document.getElementById("modelEditCanvas");
    render();
    window.requestAnimationFrame(animate);
}

// specifies which steps of the pathway to draw and draws them
function render() {
    var ctx = canvas.getContext("2d");
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    var varList = document.getElementsByClassName("inner-flex-horiz");
    var orientationDegrees;
    //Draw each step of the pathway, including reversible and non-reversible steps
    for (var i = 0; i < enzymeList.length; i++) {
        getDotPos(i);
        //set speed
        if (i === 0) {
            firstRectMidX = xCoords[i] * 75 + (canvas.clientWidth / 2 + 50);
            firstRectMidY = yCoords[i] * 100;
        }
        if (revList[i].toLowerCase() === "reversible") {
            var nextX;
            var nextY;
            if (i != enzymeList.length) {
                nextX = xCoords[i + 1] * 75 + (canvas.clientWidth / 2 + 50);
                nextY = yCoords[i + 1] * 100;
            } else {
                nextX = xCoords[i] * 75 + (canvas.clientWidth / 2 + 50);
                nextY = yCoords[i] * 100;
            }
            revStep(substrateList[i][0], productList[i][0], enzymeList[i],
                xCoords[i] * 75 + (canvas.clientWidth / 2 + 50), yCoords[i] * 100,
                nextX, nextY, ctx, i);
        } else {
            notRevStep(substrateList[i][0], productList[i][0], enzymeList[i],
                xCoords[i] * 75 + (canvas.clientWidth / 2 + 50), yCoords[i] * 100,
                ctx, i);
        }
        if (varList[i].getAttribute("drawRect") === "true") {
            ctx.beginPath();
            ctx.rect(highlightRects[i][0], highlightRects[i][1], highlightRects[i][2],
                highlightRects[i][3]);
            ctx.stroke();
        }
    }
    ctx.stroke();
    ctx.closePath();
    ctx.beginPath();

    //This is the area you need to change if you want to make the blue dot
    //something else. As for changing the color, you'd need to pass some flag
    //between get dot pos and here for each of the different dots
    //Comment out the arc line (611) and uncomment the image line (612)
    //to see a test image instead of blue dots
    for (var i = 0; i < dotPositions.length; i++) {
        ctx.beginPath();
        
        if (!displayImages) {
            if (directions[i] != 1) {
                ctx.fillStyle = "blue";
            }
            else {
                ctx.fillStyle = "green";
            }
        }

        ctx.moveTo(dotPositions[i][0] + 5, dotPositions[i][1]);

        if (!displayImages) {
            ctx.arc(dotPositions[i][0], dotPositions[i][1], 5, 0, 2 * Math.PI);
        }
        else {

            ctx.save();
            ctx.translate(dotPositions[i][0], dotPositions[i][1]);
            ctx.rotate(dotOrientation[i][0]);
            ctx.drawImage(subProdImage,0,0,20,20);
            ctx.restore();
        }

        if (dotPositions[i].length === 4) {
            ctx.moveTo(dotPositions[i][2] + 5, dotPositions[i][3]);

            if (!displayImages) {
                ctx.arc(dotPositions[i][2], dotPositions[i][3], 5, 0, 2 * Math.PI);
            }
            else {
                ctx.save();
                ctx.translate(dotPositions[i][2], dotPositions[i][3]);
                ctx.rotate(dotOrientation[i][1]);
                ctx.drawImage(subProdImage,0,0,20,20);
                ctx.restore();
            }
        }
        ctx.fill();
    }
    ctx.fill();
}

function convertIdToText(id) {
    var stringArr = id.split("_");
    var textStr = stringArr.join(" ");
    return textStr;
}

function convertTextToId(text) {
    var txtArr = text.split(" ");
    var idStr = txtArr.join("_");
    return idStr;
}

//This looks like where K is calculated and deltaG is actually used
//TODO: Find where to integrate this into the code to more accuratly render the pathway
function calculateK(moduleNumber) {
    var deltaG = db_modules[moduleNumber].deltaG
    var deltaGNaughtPrime = db_modules[moduleNumber].deltaGNaughtPrime
    var k = Math.exp(deltaGNaughtPrime / (-0.008314 * 298));
    return k;
}

//This function isn't used anywhere
//TODO: Decide if we should delete it or not
function deleteValues() {
    enzymeList = [];
    productList = [];
    substrateList = [];
    prodSubValues = [];
}

//resets values of sliders on page (re)load
function reset() {
    var varList = document.getElementsByClassName("inner-flex-horiz");
    document.getElementById("clearModelButton").addEventListener("submit",
        function() { window.reload(true) });
    for (var i = 0; i < db_modules.length; i++) {
        if (db_modules[i].modelID_id === modelNum) {
            if (db_modules[i].reversible.toLowerCase() === 'irreversible') {
                var enSlider = document.getElementById(db_modules[i].enzymeAbbr);
                enSlider.value = "50";
                var numId = db_modules[i].enzymeAbbr + "Value";
                enSlider.oninput = function() {
                    var sliderId = convertTextToId(this.id) + "Value";
                    document.getElementById(sliderId).innerHTML = this.value;
                }
            }
            var currModuleIndex = enzymeList.indexOf(db_modules[i].enzymeAbbr)
            highlightRects.push([db_modules[i].xCoor * 75 + canvas.clientWidth / 2 - 130,
                db_modules[i].yCoor * 100 - 30, 260, 160, false
            ]);
            var indexAttrib = document.createAttribute("drawRect");
            indexAttrib.value = "false";
            varList[currModuleIndex].setAttributeNode(indexAttrib);
            varList[currModuleIndex].addEventListener("mouseenter", function(event) {
                this.setAttribute("drawRect", "true");
            }, false);
            varList[currModuleIndex].addEventListener("mouseenter", function(event) {
                this.setAttribute("drawRect", "false");
            }, false)
            dotPositions.push([db_modules[i].xCoor * 75 + (canvas.clientWidth / 2),
                db_modules[i].yCoor * 100 + 5
            ])
            dotOrientation.push([0, 0]);
            
            directions.push(1);
            rxnDir.push(1);
            if (enzymeList.indexOf(db_modules.enzymeAbbr) == 0) {
                prodSubValues.push([10.0, 13.0]);
            } else {
                prodSubValues.push([10.0, 10.0]);
            }
            kValues.push(calculateK(i));
        }
    }
}



// Assumes that there are at least one substrate, at least one product,
// exactly one enzyme, and exactly one boolean for reversible/irreversible
//TODO:Decide if we want to keep this, not called anywhere
function parseThrough(stringToParse) {
    //on chrome the wrong information is being stored as an enzyme
    try {
        var tmpArr = stringToParse.split(">");
    } catch (e) {
        return null
    }
    var newArr = tmpArr[1].split("<");
    var evenNewer = newArr[1].split(";");
    // fullArr now contains
    // [0]: substrates (inputs)
    // [1]: enzyme
    // [2]: products (outputs)
    // [3]: reversible? (boolean)
    fullArr = [tmpArr[0], newArr[0], evenNewer[0], evenNewer[1]];
    subsArr = fullArr[0].split("+");
    prodArr = fullArr[2].split("+");
    return [subsArr, fullArr[1], prodArr, fullArr[3]]
}

//This fuction parses through the database information and
//populates the various arrays
function addValues() {
    for (var i = 0; i < db_modules.length; i++) {
        if (db_modules[i].modelID_id === modelNum) {
            var moduleNum = db_modules[i].id
            enzymeList.push(db_modules[i].enzymeAbbr)
            revList.push(db_modules[i].reversible.toLowerCase())
            xCoords.push(db_modules[i].xCoor) //determines xcoord
            yCoords.push(db_modules[i].yCoor) //determines ycoord
            var subList = []
            //TODO: Below here the code exludes ATP and ADP from the substrates
            //and products lists. If we want different substrates and products
            //to be drawn as the secondary part of an irreversible reacion,
            //we will need to get rid of these exclusions
            for (var j = 0; j < db_substrates.length; j++) {
                if (db_substrates[j].moduleID_id === moduleNum&&
                    db_substrates[j].abbr !== "ATP" &&
                    db_substrates[j].abbr !== "ADP") {
                    subList.push(db_substrates[j].abbr)
                }
            }
            substrateList.push(subList)
            var prodList = []
            for (var j = 0; j < db_products.length; j++) {
                if (db_products[j].moduleID_id === moduleNum &&
                    db_products[j].abbr !== "ATP" &&
                    db_products[j].abbr !== "ADP") {
                    prodList.push(db_products[j].abbr)
                }
            }
            productList.push(prodList)
        }
    }
    //The height of each rectangle is 50 and we approximated 
    //the 115 from that.  This line ensures that the canvas
    //is approximately the same height as the whole pathway
    //This is working as of 11/15/2019: might not work for
    //pathways that are more horizontal.
    if((enzymeList.length+1) * 115 >= 650)
    {
        canvas.height = (enzymeList.length+1) * 115;
    }
}

function redirect(modNum, x, y) {
    var posX = 1;
    var absX = 0;
    if (x < 0) {
        posX = 0;
        absX = -x;
    } else {
        absX = x;
    }
    var url = "/testApp/moduleEdit/" + modelNum + "/" + modNum + "/" + absX +
        "/" + y + "/" + posX;
    location.href = url;
}

/*
    Creates the sliders and buttons for each variable for the chosen pathway to 
    allow the user to modify them.
*/
function createSliders() {
    var button = document.getElementById("new-reaction");
    var clearModelButton = document.getElementById("clearModelButton");

    if (pubModel === true) {
        button.style.display = "none";
        clearModelButton.style.display = "none";
    } else {
        button.setAttribute("onclick", "redirect(0, xCoorNext, yCoorNext);");
        button.onclick = function() { redirect(0, xCoorNext, yCoorNext); };
    }
    for (var i = 0; i < db_modules.length; i++) {
        if (db_modules[i].modelID_id === modelNum) {
            var sliderHolder = document.getElementById("slider-holder");
            var varHolder = document.createElement('div');
            varHolder.setAttribute("class", "variable-holder");
            var enzLabel = document.createElement('label');
            enzLabel.setAttribute("for", db_modules[i].enzymeAbbr);
            enzLabel.className = "sliderLabel";
            enzLabel.innerHTML = convertIdToText(db_modules[i].enzyme);
            varHolder.appendChild(enzLabel);
            var inner = document.createElement('div');
            inner.setAttribute("class", "inner-flex-horiz");
            if (db_modules[i].reversible.toLowerCase() === 'irreversible') {
                //Set slider attributes
                var inputItem = document.createElement('input');
                inputItem.setAttribute("type", "range");
                inputItem.setAttribute("min", "0");
                inputItem.setAttribute("max", "100");
                inputItem.setAttribute("value", "50");
                inputItem.setAttribute("step", "10");
                inputItem.setAttribute("class", "variables");
                inputItem.setAttribute("id", db_modules[i].enzymeAbbr);
                inputItem.setAttribute("class", "slider-appearance");
                inner.appendChild(inputItem);
                var header = document.createElement('div');
                header.setAttribute("id", db_modules[i].enzymeAbbr + "Value");
                header.setAttribute("class", "variable-value-appearance");
                header.innerHTML = "50";
                inner.appendChild(header);
            }
            var editButton = document.createElement('button');
            if (pubModel === true) {
                editButton.innerHTML = "View";
            } else {
                editButton.innerHTML = "Edit"
            }
            editButton.setAttribute("class", "edit-button");
            // var functionString = "redirect(" + (i+1) + ", " + db_modules[i].xCoor
            //     + ", " + db_modules[i].yCoor + ");"
            //Dynamically grab module id
            var functionString = "redirect(" + db_modules[i].id + ", " + db_modules[i].xCoor +
                ", " + db_modules[i].yCoor + ");"
            editButton.setAttribute("onclick", functionString);
            editButton.setAttribute("type", "button");
            inner.appendChild(editButton);
            varHolder.appendChild(inner);
            sliderHolder.append(varHolder);
        }
    }
}

function calculateColor(moduleNumber, index) {
    var currNum = prodSubValues[moduleNumber][index];
    if (currNum >= 20.0) {
        return "red";
    } else if (currNum >= 14.0) {
        return "orange";
    } else {
        return "#4CAF50";
    }
}

function main() {
    createSliders();
    addValues();
    reset();
    render();
    window.requestAnimationFrame(animate);
}


window.onload = main();

//module.exports = getDotPos;