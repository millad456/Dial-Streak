float angle[] = new float [3];
PFont f;
String mess1[] = new String[12];
String mess2[] = new String[12];
String mess3[] = new String[12];

int ans1 = 0, ans2 = 0, ans3 = 0;//the values between that determine which letters are displayed
int var[] = new int[3];//variation values for each dial
float d[] = new float[3];//variation values for each dial
char c[] = new char[4];// the randomly generated characters
float dial = 0, temp1, temp2;
float timer = 100;
//"GN STREAKS";

void setup(){
    size(1280,720);
    background(255);
    stroke(0);
    fill(255);
    for (int i = 0; i < 3; i++){
      angle[i] = random(2*PI);
    }
    f = createFont("Arial",80,true);
    randWords();
}

void draw(){
 background(255);
 stroke(0);
 strokeWeight(1);
 if (timer > 0){
   findAngles();
   fill(255);
   dials();
   display();
   rotation();
   meter();
   if(!mess1[ans1].equals("GSES") || !mess2[ans2].equals("NTA") || !mess3[ans3].equals(" RK")){
     timer = timer - 0.5*(dial/4);
   }
   //println(angle[0] +", "+angle[1]+", "+angle[2]+", "+var[0]+", "+var[1]+", "+var[2] +", " + (dial));
 }
 else{
   fill(255);
   dials();
   display();
   meter();
 }
 
 
}

void findAngles(){
  for(int i = 0; i<3;i++){
    angle[i] = radians(degrees(angle[i]) % 360);//keep it, its good
  }
  //if (angle + var is too big, do radians(degrees(angle[i]) % 360))
  //left side + var[0]) % 360 
  
  //determines which number to print based off of the angle
  for (int i = 0; i <= 12;i++){
    //if the angle is positive
    if(angle[0] > 0){
      if (angle[0] > i*PI/6 && angle[0] < (i+1)*PI/6 )ans1 = (i);
    }
    else{
      if ((2*PI) + angle[0] > i*PI/6 && 2*PI + angle[0] < (i+1)*PI/6)ans1 = (i);
    }
  }
  
  for (int i = 0; i <= 12;i++){
    //if the angle is positive
    if(angle[1] > 0){
      if (angle[1] > i*PI/6 && angle[1] < (i+1)*PI/6 )ans2 = (i);
    }
    else{
      if ((2*PI) + angle[1] > i*PI/6 && 2*PI + angle[1] < (i+1)*PI/6)ans2 = (i);
    }
  }
  for (int i = 0; i <= 12;i++){
    //if the angle is positive
    if(angle[2] > 0){
      if (angle[2] > i*PI/6 && angle[2] < (i+1)*PI/6 )ans3 = (i);
    }
    else{
      if ((2*PI) + angle[2] > i*PI/6 && 2*PI + angle[2] < (i+1)*PI/6)ans3 = (i);
    }
  }
}

void randWords(){
  //generate random words
  for (int i = 0; i < 12;i++){
    for(int j = 0; j < 4; j++){
      c[j] = (char) int(random(65, 91));
    }
    mess1[i] = "" + c[0] + c[1] + c[2] + c[3];
    
    for(int j = 0; j < 3; j++){
      c[j] = (char) int(random(65, 91));
    }
    mess2[i] = "" + c[0] + c[1] + c[2];
    
    for(int j = 0; j < 3; j++){
      c[j] = (char) int(random(65, 91));
    }
    mess3[i] = "" + c[0] + c[1] + c[2];
  }
  
  //generate random variation values
  for (int i = 0; i < 3;i++){
    var[i] = (int) random(0, 12);
  }
  mess1[var[0]] = "GSES";
  mess2[var[1]] = "NTA";
  mess3[var[2]] = " RK";
}


void dials(){
  for (int i = 1; i <= 3; i++){
    pushMatrix();
    translate(i*width/4,3*height/5);
    //pointers
    fill(255,0,0);
    strokeWeight(2);
    triangle(0,-width/10,width/40,-width/8,-width/40,-width/8);
    
    //dials
    noFill();
    strokeWeight(2);
    fill(222);
    rotate(angle[i-1]);
    circle(0,0,3*width/16);
    strokeWeight(1);
    fill(0);
    circle(0,0 - 4*height/30, width/57);
    popMatrix();
  }
}
void rotation(){
  //draw boxes
  strokeWeight(1);
  for(int i = 1; i<=3; i++){
    textFont(f,height/14.4);
    //left
    if(mouseX >= (i*width/4-width/320)-3*width/32 && mouseX <= (i*width/4-width/320) && mouseY >= 19*height/24 && mouseY <= (19*height/24) + height/12){
      fill(127);
      angle[i-1] = angle[i-1]- 0.03;
    }
    else fill(255);
    rect(i*width/4-width/320,19*height/24,-3*width/32,height/12);
    
    //right
    if(mouseX >= (i*width/4+width/320) && mouseX <= (i*width/4+width/320)+(3*width/32) && mouseY >= 19*height/24 && mouseY <= (19*height/24) + height/12){
      fill(127);
      angle[i-1] = angle[i-1]+ 0.03;
    }
    else fill(255);
    rect(i*width/4+width/320,19*height/24,3*width/32,height/12);
      //the letters inside
    fill(0);
    text("L",i*width/4-width/17, 20*height/24+height/45);
    text("R",i*width/4+width/28, 20*height/24+height/45);
  }
  
}

void display(){
  
  fill(250);
  rect(2*width/10,height/12,7*width/10,width/10);
  strokeWeight(8);
  circle(5*width/40,height/6, width/8);
  
  fill(0);
    textFont(f,height/20);
    if(timer >0) text("Timer: " + nf((timer), 0, 2), 2*width/10+width/43,height/14);
    else text("Timer: " + 0.00, 2*width/10+width/43,height/14);
    
    
  
    textFont(f,height/7.2);
  if (timer > 0){
    //text("GN STREAKS",2*width/10+width/43,height/12+100);
    for (int i = 0; i < 4; i++){
      fill(0);
      text(mess1[ans1].charAt(i), 2*width/10+width/43 + i*width/5,height/12+height/7.2);
    }
    for (int i = 0; i < 3; i++){
      fill(0);
      text(mess2[ans2].charAt(i), 2*width/10+width/43 + i*width/5 + width/15,height/12+height/7.2);
    }
    for (int i = 0; i < 3; i++){
      fill(0);
      text(mess3[ans3].charAt(i), 2*width/10+width/43 + i*width/5 + 2*width/15,height/12+height/7.2);
    }
  }
  else{
    text("GAME OVER ", 2*width/10+width/43,height/12+height/7.2);
  }
}

void meter(){
  //|(var + PI/12) - angle| for every angle and divide the whole thing by 3. thats S
  noFill();
  
  pushMatrix();
  translate(5*width/40,height/6);
  rotate(3*PI/4);
  //outline
  stroke(0);
  strokeWeight(10);
  arc(0,0, width/8-width/40,width/8-width/40,0,3*PI/2);
  //colours
  strokeWeight(8);
  stroke(0,255,0);
  arc(0,0, width/8-width/40,width/8-width/40,0,6*PI/4);
  stroke(255,255,0);
  arc(0,0, width/8-width/40,width/8-width/40,0,9*PI/8);
  stroke(255,0,0);
  arc(0,0, width/8-width/40,width/8-width/40,0,3*PI/4);
  popMatrix();
  
  //for the dial... 
  //this is absolute hell
  //we see if the angle is above or below zero, then calculate the distance between the angles both clockwise and counter clockwise(temp1 and temp2)
  //the smaller number is the one we use
  for(int i = 0; i<3;i++){
    if (angle[i] > 0){
      temp1 = abs(((var[i]*PI/6) + PI/12) - angle[i]);
      temp2 = abs( (2*PI-((var[i]*PI/6) + PI/12)) +angle[i] );
      if (temp1 <= temp2) d[i] = temp1/3*PI/8;
      else d[i] = temp2/3*PI/8;
      //d[i] = abs(((var[i]*PI/6) + PI/12) - angle[i])/3*PI/8;
    }
    else{
      temp1 = abs(((var[i]*PI/6) + PI/12) - (2*PI + angle[i]));
      temp2 = abs((2*PI-((var[i]*PI/6) + PI/12)) + (2*PI + angle[i]));
      if (temp1 <= temp2) d[i] = temp1/3*PI/8;
      else d[i] = temp2/3*PI/8;
    } 
    
    //d[i] = abs(((var[i]*PI/6) + PI/12) - ((2*PI) + angle[i]))/3*PI/8;
  }
  dial = 1- ((d[0] + d[1] + d[2])/3);
  
  pushMatrix();
  strokeWeight(2);
  stroke(0);
  translate(5*width/40,height/6);
  rotate(3*PI/4 + (dial   * (6*PI/4)));
  line(0,0,width/24,0);
  circle(0,0,width/128);
  popMatrix();

}
