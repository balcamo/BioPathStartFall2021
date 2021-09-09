/*
Programmer(s): Hailey Mueller, Daniel Strub
Project: BioPath Tools for Biochemistry
Date Last Updated: May 3rd, 2021
Description: This file draws both linear and circular pathways.
*/

// setup() and draw() are built-in functions that set up the canvas and draw the code to the screen
// If you are not using processing, you will need to run the index.html file in order to see what's
// appearing the screen! :)

//Global Variables
//Get data from database
var db_modules = JSON.parse(document.getElementById('db-modules').textContent);
var db_substrates = JSON.parse(document.getElementById('db-substrates').textContent);
var db_products = JSON.parse(document.getElementById('db-products').textContent);
var modelNum = parseInt(document.getElementById('modelNum').textContent);
//I don't think these three variables are that important to the new code
var xCoorNext = parseInt(document.getElementById('x-coor-next').textContent);
var yCoorNext = parseInt(document.getElementById('y-coor-next').textContent);
var pubModel = (document.getElementById('pubModel').textContent === "true");
//Store data from database
var enzymeList = [];
var substrateList = [];
var productList = [];
//I don't think I need these variables
var revList = [];
var xCoords = [];
var yCoords = [];

var reactionsCpy;

//Current frame, resets to zero every 45th frame when a molecule spawns
var frame;

//List of molecules that are in the simulation
var molecules = [];
//Speed in the number of frames to go through one reaction
var moleculeSpeed = 90

let canvasWidth = 600;
let canvasHeight = 1000;

var isCircular;

function setup() {
  /* Built in p5.js function to setup the canvas
     setup() runs once
  
  Author(s): Hailey Mueller & Daniel Strub */

  //Initialize canvas
  var myCanvas = createCanvas(canvasWidth,canvasHeight);
  myCanvas.parent("modelEditDiv")
  
  frameRate(30);
  frame = 0; // initialize frame counter

  //Puts data from database in global var lists
  addValues();
}

function draw() {
  /* Built in p5.js function to start drawing things to the canvas.
    draw() loops forever
    
  Author(s): Hailey Mueller & Daniel Strub */

  clear();
  background('rgba(255,255,255, 0.80)');

  //Define Variables
  var size = substrateList.length;
  isCircular = true;

  //If glycolysis
  //This will change once circular is taken from database
  if(modelNum == 1){
    isCircular = false;
  }

  //This variable will need to be taken from the database eventually
  let reactions = [];

  //drawPathway(isCircular,size,-1,substrateList);
  //addText(db_modules[0].enzyme,50,0,17);
  var index = 1;
  var pie = 3.14159265358979323846;
  reactions.push(new Reaction(0,0,isCircular,0,0,size,-pie/2));
  reactions[0].drawReaction();
  var prevIndex = reactions[0].getSubstrateIndex();
  var prevCoors = reactions[0].getCoordinates();
  var prevAngle = reactions[0].getAngle();
  for(var i=2;i<size;i++){
    reactions.push(new Reaction(prevCoors[0],prevCoors[1],isCircular,index,prevIndex,size,prevAngle));
    reactions[i-1].drawReaction();
    prevIndex = reactions[i-1].getSubstrateIndex();
    prevCoors = reactions[i-1].getCoordinates();
    prevAngle = reactions[i-1].getAngle();
    index = index+1;
  }

  reactionsCpy = reactions;

  if (frame >= 45) { // Roughly every 1.5 seconds create a new Molecule
      spawnMolecule(); // appends a new Molecule to molecules which is a list of Molecules
    frame = 0;       // Reset frame counter
  }
  console.log("Num molecules: " + molecules.length);

  drawMolecules();  

  frame++;

}

class Enzyme {
  /* This class holds all of the information for an enzyme in a given reaction,
  and draws the given enzyme if necessary.
  Author: Hailey Mueller
  */
  constructor(x,y,index){
    /*
    Constructor that defines all the necessary properties of an enzyme.

    Args:
      x(int): x-coordinate
      y(int): y-coordinate
      index(int): enzyme index (used for getting enzyme from database)
    */

    //Circle
    this.diameter = 30;
    this.width = 30; //default, possibly changed by checkWidth()
    //Text
    this.size = 15;
    //Location
    this.x = x;
    this.y = y;
    //Enzyme Information
    this.index = index;
    this.name = enzymeList[this.index];

    //Changes width if text doesn't fit
    this.checkWidth();
  }
  drawEnzyme(){
    /*
    Calls all the necessary functions to draw an enzyme.
    Usually called with enzyme initialization.
    */

    this.drawCircle();
    this.drawText();
  }
  drawCircle(){
    /*
    Draws enzyme circle.
    */

    fill(255,204,0);
    stroke(0);
    ellipse(this.x,this.y,this.width,this.diameter);
  }
  drawText(){
    /*
    Draws enzyme text (taken from database).
    */

    fill(0);
    noStroke();
    textSize(this.size);
    textAlign(CENTER,CENTER);
    text(this.name,this.x,this.y);
  }
  checkWidth(){
    /*
    Checks to make sure the enzyme text will fit inside the enzyme circle.
    If not, the circle's width will change accordingly.
    */

    textSize(this.size);
    textWidth = textSize()*this.name.length;
    if(textWidth > this.diameter){
      this.width = textWidth;
    }
  }
}

class SubstrateProduct{
  /*
  This class holds all the properties of a given substrate or product.
  Instead of having two separate classes for substrates/products, I decided
  to combine them based on how information from the database is stored within
  the array lists (indexing is easier).
  Author: Hailey Mueller
  */
  constructor(x,y,index,width,height){
    /*
    Constructor that defines all the necessary properties of an substrate or product.

    Args:
      x(int): x-coordinate
      y(int): y-coordinate
      index(int): enzyme index (used for getting enzyme from database)
      width(int): width of the rectangle
      height(int): height of the rectangle
    */

    //Location
    this.x = x-height;
    this.y = y-(height/2);
    //Dimensions
    this.width = width;
    this.height = height;
    //Text
    this.size = 20;
    //Substrate Information
    this.index = index;
    this.name = substrateList[this.index];

    if(this.name == ""){
      this.name = substrateList[0];
    }
  }
  getX() {
    /* Getter function that returns the x-coordinate. */
    return this.x;
  }
  getY() {
    /* Getter function that returns the y-coordinate. */
    return this.y;
  }
  drawSubstrateProduct(){
    /*
    Calls all the necessary functions to draw a product or substrate.
    */
    this.drawRectangle();
    this.drawText();
  }
  drawRectangle(){
    /*
    Draws rectangle for substrate/product.
    */

    fill('rgb(80,184,111)');
    noStroke();
    rect(this.x,this.y,this.width,this.height);
  }
  drawText(){
    /*
    Draws text for substrate/product.
    */

    //TODO: Might also need to check the width of the rectangle
    // to make sure the text fits
    fill(250); //white
    noStroke();
    textSize(this.size);
    textAlign(LEFT,TOP);
    text(this.name,this.x+3,this.y+2);
  }
}

class Reaction{
  /*
  This class holds all the properties for each reaction within a pathway.
  This makes it easier to call each reaction one at a time for student models.
  Author: Hailey Mueller
  */
  constructor(x,y,circular,enzymeIndex,substrateIndex,size,prevAngle){
    /*
    Constructor that defines all the necessary properties of an substrate or product.

    Args:
      x(int): x-coordinate
      y(int): y-coordinate
      circular(boolean): true if circular, false if linear
      enzymeIndex(int): index of the enzyme for the given reaction
      substrateIndex(int): index of the substrate for the given reaction
      size(int): the number of reactions in the pathway
    */

    //Parameter variables
    this.size = size; //number of substrates
    this.enzymeIndex = enzymeIndex; //index of enzyme being added
    this.index = substrateIndex; //index of substrate being added
    this.circular = circular; //true if circualr, false if linear
    this.prevAngle = prevAngle;

    this.substrate; 
    this.product;
    this.product2;
    
    //Determines if reaction is reversible
    //addText(db_modules[this.enzymeIndex].reversible.toLowerCase(),50,50+(20*this.enzymeIndex),18);
    if(db_modules[this.enzymeIndex].reversible.toLowerCase() == "reversible"){
      this.reversible = true;
    }else{
      this.reversible = false;
    }

    //Design variables
    this.distance = 90; //distance between top of last product and top of substrate
    this.rectHeight = 40; //height of substrate/product rectangles
    this.rectWidth = 80; //width of substrate/product rectangles

    //Location of substrate
    let coors = determineCoor(this.size,this.index,300,300,200);
    if(this.circular){
      this.x = coors[0];
      this.y = coors[1];
    }else{
      if(this.index == 0){
        this.x = coors[0];
        this.y = coors[1];
      }else{
        this.x = x;
        this.y = y + this.distance;
      }
    }

  }
  getSubstrateIndex(){
    /* Getter function that returns the index of the substrate. */
    return this.index;
  }
  getCoordinates(){
    /* Getter function that returns x and y coordinates. */
    return [this.x,this.y];
  }
  drawSubstrate(){
    /*
    This function is only called for the first reaction. Everything after the first
    reaction is just a product, so this function won't need to be called.
    */

    this.substrate = new SubstrateProduct(this.x,this.y,this.index,this.rectWidth,this.rectHeight);
    this.substrate.drawSubstrateProduct();

    this.index = this.index+1;
  }
  drawEnzyme(){
    /*
    This function is called to draw an enzyme for a given reaction.
    */

    if(this.circular){
      //Circular reaction

      this.circStep();

    }else{
      //Linear reaction
      if(this.reversible){
        //Reversible reaction

        //addText("hi",this.x,this.y,18);
        if(substrateList[this.index-1] == productList[this.index-2][0] && productList[this.index-1] == productList[this.index-2][1]){
          //addText("no",this.x,this.y,18);
          this.linRevHorizontal();
        }else{
          this.linRevStep();
        }
      }else{
        //Irreversible reaction
        this.linNonRev();
      }
    }
  }
  drawProduct(){
    /*
    This function is called to draw a product.
    */

    if(this.circular){
      //Circular reaction

      this.product = new SubstrateProduct(this.x,this.y,this.index,this.rectWidth,this.rectHeight);
      this.product.drawSubstrateProduct();

    }else{
      //Linear reaction
      if(productList[this.index-1].length == 1){
        //1 product

        this.product = new SubstrateProduct(this.x,this.y,this.index,this.rectWidth,this.rectHeight);
        this.product.drawSubstrateProduct();
      }else{
        //More than 1 product
        var dist = 70;
        this.product = new SubstrateProduct(this.x-dist,this.y,this.index,this.rectWidth,this.rectHeight);
        this.product.drawSubstrateProduct();
        this.product2 = new SubstrateProduct(this.x+dist,this.y,this.index+1,this.rectWidth,this.rectHeight);
        this.product2.drawSubstrateProduct();

        this.x = this.x + dist;
        this.index = this.index + 1;
      }
    }
    this.index = this.index + 1;
  }
  drawReaction(){
    /*
    This function is called when the reaction object is initialized to draw the given reaction.
    */

    //Draw enzyme
    this.drawEnzyme();

    //Draw substrate (only for first reaction)
    //Every other reaction just adds product to pathway
    if(this.index == 0){
      this.drawSubstrate();
      //Need to determine x/y locations
      if(this.circular){
        let coors = determineCoor(this.size,this.index,300,300,200);
        this.x = coors[0];
        this.y = coors[1];
      }else{
        this.y = this.y + this.distance;
      }
    }else{
      // TODO: Hopefully if the arc functionality works, you won't need to redraw the substrate
      // The only problem with redrawing the substrate is when functionality for changing the colors
      // with the new code happens, it might be difficult to index the objects and change their colors.
      // However, if this can be avoided then the arcs won't have to be redrawn.
      if(this.circular){
        let new_coors = determineCoor(this.size,this.index-1,300,300,200);
        this.substrate = new SubstrateProduct(new_coors[0],new_coors[1],this.index-1,this.rectWidth,this.rectHeight)
        this.substrate.drawSubstrateProduct();
      }
    }

    //Draw product
    this.drawProduct();

    if(this.index == this.size){
      //Draw last enzyme
      this.enzymeIndex = enzymeList.length-1;
      //addText(this.enzymeIndex,300,300,18);
      this.drawEnzyme();
      if(this.circular){
        var new_coors = determineCoor(this.size,this.size-1,300,300,200);
        this.substrate = new SubstrateProduct(new_coors[0],new_coors[1],this.size-1,this.rectWidth,this.rectHeight);
        this.substrate.drawSubstrateProduct();
        //Draw last product (ie. first substrate)
        var new_coors = determineCoor(this.size,0,300,300,200);
        this.product = new SubstrateProduct(new_coors[0],new_coors[1],0,this.rectWidth,this.rectHeight);
        this.product.drawSubstrateProduct();
      }
    }
  }
  circStep(){
    /* This function draws both an irreversible or reversible reaction in within
      a circular pathway.
      NOTE: Once cofactors are added to the database, a lot of hard-coding will
      need to be changed here. */

    noFill();
    stroke(0);
    //Start at -PI/2
    var currIndex = 0;
    var prevIndex = 0;
    if(this.index==0){
      currIndex = 1;
    }else{
      currIndex = this.index;
      prevIndex = this.index-1;
    }

    let angle = findAngle(prevIndex,currIndex,this.size,this.rectHeight,this.rectWidth,300,300,200);
    var newAngle = this.prevAngle+angle;

    /*if(currIndex == 2){
      addText(newAngle,200,100,18);
      addText(this.prevAngle,200,200,18);
      noFill();
    }*/

    var oldCoors = determineCoor(this.size,this.index,300,300,200);
    var newCoors = determineXCoor(oldCoors[0],oldCoors[1],300,300,200,this.rectHeight,this.rectWidth);
    var value1 = Math.pow(newCoors[0]-oldCoors[0],2);
    var value2 = Math.pow(newCoors[1]-oldCoors[1],2);
    var sqrRoot = Math.sqrt(value1+value2);
    let arcSine = asin(sqrRoot/(2*200));
    
    if(this.reversible){
      //Outside arc
      arc(300,300,410,410,this.prevAngle,newAngle);
      //Inside arc
      arc(300,300,390,390,this.prevAngle,newAngle);
    }else{
      arc(300,300,400,400,this.prevAngle,newAngle);
    }
    //let startCoors = determineCoor(this.size,0,300,300,200);
    /*var oldCoors = determineCoor(this.size,this.index,300,300,200);
    var newCoors = determineXCoor(oldCoors[0],oldCoors[1],300,300,200,this.rectHeight,this.rectWidth);
    var value1 = Math.pow(newCoors[0]-oldCoors[0],2);
    var value2 = Math.pow(newCoors[1]-oldCoors[1],2);
    var sqrRoot = Math.sqrt(value1+value2);
    let arcSine = asin(sqrRoot/(2*200));*/
    //this.setAngle(arcSine);
    //addText(arcSine,100,100,18);
    this.setAngle(newAngle);

    // Hard coded! Will need to change after database is refactored.
    var array = []
    for(var i=0;i<13;i++){
      array.push(db_products[i].abbr)
    }
    const findIndex = (element) => element == productList[this.index];
    var foundIndex = array.findIndex(findIndex);
    //addText(foundIndex,100,100+50*this.index,18);
    
    if(db_products[foundIndex+1].abbr == "NADH" || db_products[foundIndex+1].abbr == "FADH2" || db_products[foundIndex+1].abbr == "GTP"){
      //Add cofactor names
      var currReact = 0;
      if(this.index == this.size -1){
        currReact = foundIndex+1;
      }else{
        currReact = foundIndex;
      }
      var cofactor = new ReactionArrow(this.x,this.y,foundIndex+1,this.distance,this.circular).addCofactor(0,this.size,currReact+2);
    }

    //Calculate enzyme x/y coordinates
    let enzyme_coors = determineCoor(this.size*2,this.enzymeIndex*2+1,300,300,200)
    //Draw enzyme
    var enzyme = new Enzyme(enzyme_coors[0], enzyme_coors[1], this.enzymeIndex).drawEnzyme();

  }
  linRevStep(){
    /* This function draws a typical linear pathway reversible reaction (vertical). */

    var additional_dist = 0;
    if(this.index != 0){
      additional_dist = -this.distance;
    }

    //Draws linear non-reversible arrow
    //addText("hi",this.x,this.y,18);

    var arrow = new ReactionArrow(this.x-this.rectHeight,this.y-(this.rectHeight/2),this.index,this.distance,this.circular).linearReversibleArrow(this.rectHeight,this.rectWidth);
    
    //Draws enzyme circle/name
    var enzyme = new Enzyme(this.x+(this.rectWidth/2)-this.rectHeight,this.y-(this.rectHeight/2)+this.rectHeight+((this.distance-this.rectHeight)/2)+additional_dist,this.enzymeIndex).drawEnzyme();
  
  }
  linNonRev(){
    /* This function draws a typical linear pathway irreversible reaction (vertical). */

    var extraWidth = 15; //makes circle more like oval

    //Helps correct y-values based on if this is the first reaction or not
    var additional_dist = 0;
    if(this.index != 0){
      additional_dist = -this.distance;
    }

    //Draws linear non-reversible arrow
    var arrow = new ReactionArrow(this.x+this.rectWidth-this.rectHeight,this.y+additional_dist,this.index,this.distance,this.circular).linearNonReversibleArrow();

    //Draws enzyme circle/name
    var enzyme = new Enzyme(this.x+this.rectWidth-this.rectHeight+((this.distance+extraWidth)/2),this.y-(this.rectHeight/2)+this.rectHeight+((this.distance-this.rectHeight)/2)+additional_dist,this.enzymeIndex).drawEnzyme();
    
  }
  linRevHorizontal(){
    /* This function draws a linear horizontal reaction between 2 products.
      NOTE: This function currently does not work properly and needs to be fixed. */

    var additional_dist = 0;
    if(this.index != 0){
      additional_dist = -this.distance;
    }

    //Draws linear non-reversible arrow
    //addText("hi",this.x,this.y,18);
    var arrow = new ReactionArrow(this.x,this.y,this.index,this.distance,this.circular).linearHorizontalArrow(70);
    
    //Draws enzyme circle/name
    //var enzyme = new Enzyme(this.x+(this.rectWidth/2)-this.rectHeight,this.y-(this.rectHeight/2)+this.rectHeight+((this.distance-this.rectHeight)/2)+additional_dist,this.enzymeIndex).drawEnzyme();
  
  }
  setAngle(angle){
    /* Setter function that sets previous angle to new angle. */
    this.prevAngle = angle;
  }
  getAngle(){
    /* Getter function that gets angle. */
    return this.prevAngle;
  }
}

class ReactionArrow{
  /*
  This class draws the reaction arrows for both circular and linear pathways.
  Author: Hailey Mueller
  */
  constructor(x,y,index,diameter,circular){
    /*
    Constructor that defines all the necessary properties of reaction arrow.

    Args:
      x(int): x-coordinate
      y(int): y-coordinate
      index(int): index of the product or substrate
      diameter(int): currently a value that is hard-coded to be 90 in the constructor
        of reaction
      circular(bool): true if circular, false if linear
    */

    this.x = x;
    this.y = y;
    this.index = index;
    this.diameter = diameter;
    this.circular = circular;

  }
  linearNonReversibleArrow(){
    /* This function draws a irreversible reaction arrow for a linear reaction. */

    noFill();
    stroke(0);
    var extraWidth = 15; //makes circle more like an oval to fit enzyme
    arc(this.x,this.y+(this.diameter/2),this.diameter+extraWidth,this.diameter,-HALF_PI,HALF_PI);
    drawArrow(this.x,this.y+this.diameter,"left");

    //This if statement adds a cofactor arrow if needed
    //TODO: Possibly find a way to make this more modular? ie. no == "ADP"
    //      Possibly need to change it if there are multiple substrates??
    if(db_products[this.index+1].abbr == "ADP"){
      //Add cofactor names
      this.addCofactor(extraWidth);
    }
  }
  linearReversibleArrow(rectHeight,rectWidth){
    /* This function draws a reversible reaction arrow for a linear reaction.
    
    Args:
      rectHeight(int): height of the substrate/product rectangle.
      rectWidth(int): width of the substrate/product rectangle.

    */

    //Initialize Variables
    noFill();
    stroke(0);
    var z = 7;
    var distance = this.diameter;

    var additional_dist = 0;
      if(this.index != 0){
        additional_dist = rectHeight-distance;
      }

    //Draws reversible enzyme depending on number of products
    if(productList[this.index-1].length > 1){
      //Multiple products

      //Left Line
      line(this.x-z+(rectWidth/2),this.y+additional_dist,this.x-z+(rectWidth/2),this.y-((distance-rectHeight)/2));
      //Right Line
      line(this.x+z+(rectWidth/2),this.y+additional_dist,this.x+z+(rectWidth/2),this.y-((distance-rectHeight)/2));
      //Left Product
      //TODO: REMOVE HARD CODING
      line(this.x-z+(rectWidth/2),this.y-((distance-rectHeight)/2),this.x-z+(rectWidth/2)-60,this.y);
      line(this.x+z+(rectWidth/2),this.y-((distance-rectHeight)/2),this.x+z+(rectWidth/2)-60,this.y);
      //Right Product
      line(this.x-z+(rectWidth/2),this.y-((distance-rectHeight)/2),this.x-z+(rectWidth/2)+60,this.y);
      line(this.x+z+(rectWidth/2),this.y-((distance-rectHeight)/2),this.x+z+(rectWidth/2)+60,this.y);
      //TODO: Add enzyme/reversible between the two products
    }else{
      //One product

      //Left Line
      line(this.x-z+(rectWidth/2),this.y+additional_dist,this.x-z+(rectWidth/2),this.y);
      drawArrow(this.x-z+(rectWidth/2),this.y-distance+rectHeight,"up");
      //Right Line
      line(this.x+z+(rectWidth/2),this.y+additional_dist,this.x+z+(rectWidth/2),this.y);
      drawArrow(this.x+z+(rectWidth/2),this.y,"down");
    }
  }
  linearHorizontalArrow(distance){
    /* This function draws a reversible reaction arrow for a linear reaction
      between two products (horizontal).
    
    Args:
      distance(int): distance between the two products?

    */

    noFill();
    stroke(0);
    //Top Line
    line(this.x-(distance/2),this.y-7,this.x+distance,this.y-7);
    //Top Arrow
    line(this.x-(distance/2),this.y-7,this.x-(distance/2)+5,this.y-7-5);
    //Bottom Line
    line(this.x-(distance/2),this.y+7,this.x+distance,this.y+7);
  }
  addCofactor(extraWidth=0,numReactions=0,currentReaction=0){
    /* This function adds a cofactor arrow to a given reaction.
    
    Args:
      extraWidth(int): a hard-coded value (15) that adds some distance for drawing text.
      numReactions(int): number of reactions in the pathway.
      currentReaction(int): current reaction being drawn in the pathway.

    */

    if(this.circular){
      //if circular
      //addText(currentReaction,300,100+20*this.index,18);
      let word_coors_input = determineCoor(numReactions*3,(currentReaction*3/2)+1,300,300,280);
      let word_coors_output = determineCoor(numReactions*3,(currentReaction*3/2)+2,300,300,280);
      addText(db_substrates[this.index].abbr,word_coors_input[0],word_coors_input[1],16);
      addText(db_products[this.index].abbr,word_coors_output[0],word_coors_output[1],16);
      
      let coors = determineCoor(numReactions*2,currentReaction+1,300,300,250);
      angleMode(RADIANS);
      
      // The following code uses trigonometry and geometry to find the angle
      // value where the new enzyme will be located in order to rotate the arrow
      // the right amount.
      let coors1 = determineCoor(numReactions*2,0,300,300,200);
      let coors2 = determineCoor(numReactions*2,currentReaction+1,300,300,200);
      let value1 = Math.pow(coors2[0]-coors1[0],2);
      let value2 = Math.pow(coors2[1]-coors1[1],2);
      let sqrRoot = Math.sqrt(value1+value2);
      let arcSine = asin(sqrRoot/(2*200));
      let angle = 2*arcSine;
      
      noFill();
      //Rotate the arrows according to the given angle and location
      translate(coors[0],coors[1]);
      if(coors1[0]>coors2[0]){
        rotate(-angle);
      }else{
        rotate(angle);
      }
      stroke(0);
      arc(0,0,100,100,0,PI);

      //Arrows
      var line_x = 50;
      var line_y = 0;
      var x_len = 7;
      var y_len = 10;
      line(line_x,line_y,line_x+x_len,line_y+y_len);
      line(line_x,line_y,line_x-x_len,line_y+y_len);

      resetMatrix();
    }else{
      //Add cofactor names
      addText(db_substrates[this.index+1].abbr,this.x+this.diameter+extraWidth+5,this.y,17);
      addText(db_products[this.index+1].abbr,this.x+this.diameter+extraWidth+5,this.y+this.diameter,17);
      //Create arrow
      noFill();
      stroke(0);
      arc(this.x+this.diameter+extraWidth,this.y+(this.diameter/2),this.diameter+extraWidth,this.diameter,HALF_PI,-HALF_PI);
      this.index = this.index+1;
      drawArrow(this.x+this.diameter+extraWidth,this.y+this.diameter,"right");
    }
  }
}

function drawArrow(x,y,orientation){
  /* This function draws the end of an arrow.

  Args:
    x(int): calculated x-coordinate
    y(int): calculated y-coordinate
    orientation(string): either "left", "right", "up", or "down"
      depending on which way the arrow is facing

  Author(s): Hailey Mueller */

  //These variables are values I randomly picked to decide
  //how to draw the arrow head. Can be changed if desired.
  var x_len = 10;
  var y_len = 7;

  //Draws arrow head depending on the direction of the arrow
  if(orientation == "left"){
    line(x,y,x+x_len,y-y_len);
    line(x,y,x+x_len,y+y_len);
  }else if(orientation == "right"){
    line(x,y,x-x_len,y-y_len);
    line(x,y,x-x_len,y+y_len);
  }else if(orientation == "up"){
    line(x,y,x-y_len,y+x_len);
  }else if(orientation == "down"){
    line(x,y,x+7,y-10);
  }

}

function addText(name,x,y,size){
  /* This is a function that adds text to the screen.

  Args:
    name(str): value being drawn on screen
    x(int): value of the x-coordinate
    y(int): value of the y-coordinate
    size(int): determines which size of text is being added

  Author(s): Hailey Mueller */

  fill(0);
  noStroke();
  textSize(size);
  if(size==20){ //products/substrates
    fill(250);
    textAlign(LEFT,TOP);
  }else if(size==17){ //cofactors
    textAlign(LEFT,CENTER);

  }else if(size==16){
    textAlign(CENTER,BASELINE);
  }else{ //other text
    textAlign(CENTER,CENTER);
  }
  text(name,x,y);
}

function determineCoor(numReactions, currentReaction, centerX, centerY, r){
  /* This function calculates the x and y coordinates around a circle.

  Args:
    numReactions(int): the number of total reactions
    currentReaction(int): the current reaction number (ex. 4/10 then 5/10... etc)
    centerX(int): x-coordinate of center of circle
    centerY(int): y-coordinate of center of circle
    r(int): radius

  Returns: a tuple with the calculated coordinate

  Author(s): Hailey Mueller and Brandon Clark */

  let x = centerX + r*Math.cos(((2*(currentReaction)*Math.PI)/(numReactions))-(Math.PI/2)),
      y = centerY + r*Math.sin(((2*(currentReaction)*Math.PI)/(numReactions))-(Math.PI/2));

  return [x,y];
}

function determineXCoor(prevX, prevY, centerX, centerY, r, rectHeight, rectWidth){
  /* This function calculates the x coordinate of a circle given a y coordinate.

  Args:
    prevX(int): previous x-coordinate
    prevY(int): previous y-coordinate
    centerX(int): x-coordinate of center of circle
    centerY(int): y-coordinate of center of circle
    r(int): radius
  
  Returns: a float value that holds the calculated x-coordinate.
  
  Author(s): Hailey Mueller */

  yCoor = 0; // new y-coordinate
  yLength = 0; // length of y
  r_sqr = Math.pow(r,2);
  if(prevX > centerX){
    if(prevY > centerY){
      //Bottom-right quadrant
      yCoor = prevY + (rectHeight/2);
      yLength = yCoor - centerY; //prevY - centerY + (rectHeight)

    }else if(prevY < centerY){
      //Upper-right quadrant
      yCoor = prevY + (rectHeight/2);
      yLength = centerY - yCoor;

    }else{
      //Right x-axis
      yCoor = prevY + (rectHeight/2);
      yLength = rectHeight/2;

    }

    y_sqr = Math.pow(yLength,2);
    xCoor = Math.sqrt(r_sqr - y_sqr) + centerX;

  }else if(prevX < centerX){
    if(prevY > centerY){
      //Bottom-left quadrant
      yCoor = prevY - (rectHeight/2);
      yLength = yCoor - centerY; //prevY - centerY - (rectHeight)

    }else if(prevY < centerY){
      //Upper-left quadrant
      yCoor = prevY - (rectHeight/2);
      yLength = centerY - yCoor;

    }else{
      //Left x-axis
      yCoor = prevY - (rectHeight/2);
      yLength = rectHeight/2;

    }

    y_sqr = Math.pow(yLength,2);
    xCoor = centerX - Math.sqrt(r_sqr - y_sqr);

  }else{
    //Will solve for y-coor using x-coor
    xCoor = 0
    xLength = 0
    if(prevY > centerY){
      //Bottom y-axis
      xCoor = prevX - (rectWidth/2);
      xLength = rectWidth/2;

      x_sqr = Math.pow(xLength,2);
      yCoor = Math.sqrt(r_sqr - x_sqr) + centerY;

    }else if(prevY < centerY){
      //Upper y-axis
      //NOT SURE IF THIS NEEDS TO BE HERE...
      xCoor = prevX + (rectWidth/2);
      xLength = rectWidth/2;

      x_sqr = Math.pow(xLength,2);
      yCoor = centerY - Math.sqrt(r_sqr - x_sqr);

    }
  }
  return [xCoor, yCoor];
}

function addValues() {
  /* This function adds values from the database to the various lists depending on
     which pathway is being drawn.
  
  NOTE: This function was taken word for word from the first BioPath group's code.
    However, new cofactors for the citric acid cycle was added.
  
  Author(s): First BioPath group & Hailey Mueller */

  for (var i = 0; i < db_modules.length; i++) {
      if (db_modules[i].modelID_id === modelNum) {
          var moduleNum = db_modules[i].id
          enzymeList.push(db_modules[i].enzymeAbbr)
          revList.push(db_modules[i].reversible.toLowerCase())
          xCoords.push(db_modules[i].xCoor) //determines xcoord
          yCoords.push(db_modules[i].yCoor) //determines ycoord
          var subList = []

          // TODO: Below here the code exludes ATP and ADP from the substrates
          //and products lists. If we want different substrates and products
          //to be drawn as the secondary part of an irreversible reacion,
          //we will need to get rid of these exclusions
          // TODO: For Citric Acid Cycle, more cofactors were added that need
          // to be excluded from the substrate and product list. A good place
          // for a new team to start would be to create a place on the website
          // that differentiates between substrates/products and cofactors,
          // and then stores the cofactors separately in the database.
          for (var j = 0; j < db_substrates.length; j++) {
              if (db_substrates[j].moduleID_id === moduleNum&&
                  db_substrates[j].abbr !== "ATP" &&
                  db_substrates[j].abbr !== "ADP" &&
                  db_substrates[j].abbr !== "NAD+" &&
                  db_substrates[j].abbr !== "NADH" &&
                  db_substrates[j].abbr !== "GDP" &&
                  db_substrates[j].abbr !== "GTP" &&
                  db_substrates[j].abbr !== "FAD" &&
                  db_substrates[j].abbr !== "FADH2" &&
                  db_substrates[j].abbr !== "CoASH" &&
                  db_substrates[j].abbr !== "CO2") {
                  subList.push(db_substrates[j].abbr)
              }
          }
          substrateList.push(subList)
          var prodList = []
          for (var j = 0; j < db_products.length; j++) {
              if (db_products[j].moduleID_id === moduleNum &&
                  db_products[j].abbr !== "ATP" &&
                  db_products[j].abbr !== "ADP" &&
                  db_products[j].abbr !== "NAD+" &&
                  db_products[j].abbr !== "NADH" &&
                  db_products[j].abbr !== "GDP" &&
                  db_products[j].abbr !== "GTP" &&
                  db_products[j].abbr !== "FAD" &&
                  db_products[j].abbr !== "FADH2" &&
                  db_products[j].abbr !== "CoASH" &&
                  db_products[j].abbr !== "CO2") {
                  prodList.push(db_products[j].abbr)
              }
          }
          productList.push(prodList)
      }
  }
}


function findAngle(index1,index2,size,rectHeight,rectWidth,centerX,centerY,radius){
  /* This function finds the angle between two points of a circle.

  Args:
    index1(int): the index of the first point on the circle
    index2(int): the index of the second point on the circle
    size(int): the number of points on the circle
    centerX(int): the x-coordinate of the center of the circle
    centerY(int): the y-coordinate of the center of the circle
    radius(int): the radius of the circle

  Returns:
    float: returns the angle between the two points on the circle

  Author(s): Hailey Mueller */

  let coors1 = determineCoor(size,index1,centerX,centerY,radius);
  //addText(coors1[0],100,50,18);
  //addText(coors1[1],100,100,18);
  let adj_coors = determineXCoor(coors1[0],coors1[1],centerX,centerY,radius,rectHeight,rectWidth);
  //addText(adj_coors[0],300,50,18);
  //addText(adj_coors[1],350,100,18);
  let coors2 = determineCoor(size,index2,centerX,centerY,radius);
  let value1 = Math.pow(coors2[0]-coors1[0],2);
  let value2 = Math.pow(coors2[1]-coors1[1],2);
  /*let value1 = Math.pow(coors2[0]-adj_coors[0],2);
  let value2 = Math.pow(coors2[1]-adj_coors[1],2);*/
  let sqrRoot = Math.sqrt(value1+value2);
  let arcSine = asin(sqrRoot/(2*radius));

  return 2*arcSine;

}
  
 function spawnMolecule() {
  // Pushes a Molecule into the molecules list
  // Author: Daniel Strub

  molecules.push(new Molecule()) //TODO: finish molecule constructor arguments with proper info
}

function drawMolecules() {
  // Calls draw on every molecule
  // Author: Daniel Strub

  for (var i = 0; i < molecules.length; i++) {
    molecules[i].draw();
  } 
}