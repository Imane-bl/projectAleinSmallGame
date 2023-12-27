float a=0;
float r=11.5;//rayon des petites circles
float v=2;//pour la vitesse
boolean visible=true;
boolean texte=false;//pour keypressed
float i, j, t, s, h, w, x, y;

float d=1;
float V=400, M=400;//pour le circle avec petite c q roll
float xb, yb;
float m1= width-200;
float m2= height-200;
float z1=100;
float z2=20;
float r1=1.5;
/////pour le strat
float vi=8;
float b=random(TWO_PI);
float alx=vi*cos(b);
float aly=vi*cos(b);
float al1, al2;
float ra=25;
///////////////

float changec=random(20,200);

//pour movement de circle alien
float rc=85;
float vc=3;
float xm1=rc;
float c1=rc;
//pour condition de machine
float rm=100;
float X=100  ;//pour lumirere de machine
//POUR LA PMANET
float a2=0;
float x4=650;
float y4=100;
// les trucs qui tombe
float x5=random(width);
float y5=random(height);
//POUR LA PLUIE /////////////////
float xt, yt, vt;
tombe[] tombes=new tombe[600];//pour faire bcp on doit utiliser array
float x7, y7, w7, h7, v7;
Rectangle[] rectangles = new Rectangle[3];//pour les fleurs qui tombent
float xr, yr;//pour lr petit rec qui touche la fleur
float cpt=0;//pour calcule le score
float cpt2=15;//pour  LA VIE

int r6 = 29;
float x6;
float y6;
float v1 = 5;
float alpha = random(TWO_PI);
float vx6 = v1 * cos(alpha);
float vy6 = v1 * sin(alpha);
boolean vrai=true;
float px, py, pr;
float ar=0;//pour la planet qui bouge
float x1, y1;

void setup() {
  size(800, 600);

  //pour le start//////
  al1=random(ra, width-ra);
  al2=random(ra, height-ra);

  //Pour la pluit
  for (int i=0; i<tombes.length; i++) {
    tombes[i]=new tombe();
  }
  //pour les fleurs
  for (int i = 0; i < 3; i++) {//je peut utiliser Rectangle.length
    rectangles[i] = new Rectangle(random(width), 0, 7, 7, random(1, 2));//le vitesse
  }


  x6 = random(r6, width - r6);
  y6 = random(r6, height - r6);
  stroke(0);
  px=360;
  py=-10;
  ar=0;
  y1=-10;
  x1=390;

  pr=10;
}

void draw() {


  t=width/2;
  s=height/2+120;
  w=25;
  h=2;
  background(0);
  //dessiner  LE RECT BLANC lalien/////cote noir//////////
 // fill(255);
  noFill();
  noStroke();
  float  xr=mouseX-22;
  float  yr=mouseY-3;
 rect(xr, yr, w+20, h+3);
 //ca c la zone si la fleur touche cett zone cbn

  ////c pour les fleurs aussi decendent   et laffichage*****************
  for (int i = 0; i < 3; i++) {
    rectangles[i].decendre();
    rectangles[i].affiche();
   //*******************************************


    //pour verifier si les fleurs touchent le rec**********
    if (rectangles[i].touch(xr, yr, w+20, h+3)) {// crdn de 2 rec
     rectangles[i].y7=-10;//donc y7 va desends-(-1)psk deja y=0 donc..
      cpt++;//pour incrimenter la val de score
    }
  }

  //POUR CHNAGER LA LUMIERE long stoke RANDMly DE MACHINE

  if (random(1)<0.02) {//genere un nbr aleatoire entre 0 et 1
  //Lorsque random(1) dnc  un peut de tmp ., la var visible est 
    visible=!visible;
  }
  if (visible) {//donc on va dessigner la limier 
    stroke(246, 250, 66, 50);
    strokeWeight(120);
    line(X, Y+270, X, Y+height);
  }



  //le ciel
  for (int i=0; i<50; i++) {
    float x = random(width);
    float y = random(height);
    float rc=1;
    fill(255, 255, a, 150);
    noStroke();
    ellipse(x, y, rc*2, rc*6);
    // x=x+ random(-4,1);
    a = (a + v) % (width / 4);//pour changer la color
  }
  //fin de ciel


  strokeWeight(0.2);
  // pour la terre
  fill(random(255), 0, 0);
  fill(216, 160, 85);
  ellipse(width/2, height, width, height/8);
  noStroke();
  fill(#D18B30);
  ellipse(width/2, height, width-20, 60);
  fill(#D69745);
  ellipse(width/2, height, width-150, 45);
  fill(#E8B470);
  ellipse(width/2, height, width-200, 25);
  fill(#F0C48A);
  ellipse(width/2, height, width-400, 15);
  fill(#F0DDC4);
  ellipse(width/2, height, width-500, 5);
  //FIN DE TERRE

  //pour la machine le grande cercle
  stroke(0.5);
  fill(#AAB4B7);
  float Y=height-350;
  ellipse(X, Y, 140, 60);
  fill(196, 222, 240, 200);
  ellipse(X, Y-15, rm, 52);

  fill(255, 255, a, 150);
  ellipse(X-45, Y+10, r, r);
  ellipse(X, Y+20, r, r);
  ellipse(X+45, Y+10, r, r);

  a=(a+v)%(width/4);//pour chnger les coleurs de machine petites circles 3

  //la condition pour le mouvement de la machine///
  X+=v;

  if (X<rm|| X>width-rm)
  {
    v=-v;
  }

  //pour la machine va a linvrs

  if (mouseY> height-300) { //pour lalien dissparetre

    //le corp

    fill(30, 90, 69);
    triangle(mouseX-35, mouseY+120, mouseX, mouseY+60,
      mouseX+35, mouseY+120);
    fill(74, 216, 125);
    rect(mouseX-40, mouseY+120, 80, 20);
    fill(81, 196, 155);
    ellipse(mouseX, mouseY+40, 70, 70);
    //ca c pour lellipse transparant un peu
    fill(247, 249, 250, 150);
    ellipse(mouseX, mouseY+40, rc, rc);

    //YEUX
    fill(0);
    rect(mouseX-30, mouseY+30, 20, 20);
    rect(mouseX-25, mouseY+35, 20, 20);
    fill(255);
    rect(mouseX-25, mouseY+35, 10, 10);
    fill(0);
    rect(mouseX-20, mouseY+40, 20, 20);
    fill(255);
    rect(mouseX-15, mouseY+45, 5, 5);


    //YEUX
    fill(0);
    rect(mouseX+16, mouseY+30, 20, 20);
    rect(mouseX+11, mouseY+35, 20, 20);
    fill(255);
    rect(mouseX+20, mouseY+35, 10, 10);
    fill(0);
    rect(mouseX+6, mouseY+40, 20, 20);
    fill(255);
    rect(mouseX+15, mouseY+45, 5, 5);
    ///alien bouge////
  }


  //POUR LE GAME OVER*/

  fill(255);
  textAlign(RIGHT);
  textSize(20);
  float vie=cpt2; //comptur dr vie
  text("point de VIE: " + vie, width-25, 25);




  /****pour le score**************************/
  fill(255);
  textAlign(LEFT);
  textSize(20);
  float score=cpt;
  text("SCORE: " + score, 5, 25);
  //**pour le score gagner******/
  if (cpt==6) {
    background(97, 131, 201);
    textSize(100);
    fill(#FAFBFC);
    stroke(0);
    strokeWeight(1);

    text("You Won!", width/3-70, height/2);
  }


  //////KEY PRESSED//////////////////////////////////////////////////////////

  if (texte) {//rien
  } else {
    background(103, 227, 147, 150);
    //pour pluie******************************
    for (int i=0; i<tombes.length; i++) {

      tombes[i].fall();
      tombes[i].show();
    }



    //*************pour circle  qui bouge dans linterface 

    stroke(97, 139, 74, 200);
    strokeWeight(0.9);
    noFill();
    ellipse(x6, y6, r6+10, r6+10);
    x6 += vx6;
    y6 += vy6;
    
 if (x6 < r6 || x6 > width - r6) {

      fill(255);
      vx6 = -vx6;
    }

    if (y6 < r6 || y6 > height - r6) {
      vy6 = -vy6;
      fill(35, 219, 150, 130);
    }




    //////KEY PRESSEDD DEBUT
    fill(255);


    textSize(90);
    fill(13, 90, 61, 199);

    text("start", width/3+50, height/2);
    textSize(20);
    text("click sur keypressed", width/3+50, height/2+40);
    noFill();
    noStroke();
    
    ellipse( 240, 148, 177, 150);
    rect(width/3, 200, 200, 40);
    
    //pour les cecles qui bougent entre le start
    noFill();
    stroke(0);
    strokeWeight(0.5);
    rotate(PI/4.5);
    noStroke();
    
    fill(13, 90, 61, 299);
    float xb1=x1+ 10*cos(ar);
    float yb1=y1+  170*sin(ar);

    float pxb=px+ 170*cos(ar);
    float pyb=py+ 10*sin(ar);

    ellipse(pxb+100, pyb, 10, 10);
    ellipse(xb1+150, yb1, 10, 10);
    ar+=0.04;
    //fin des circles
    
  }//ca pour else  de keypressed
  


  if (X >mouseX- rc-50 && X<mouseX +rc-50 &&  Y>mouseY-rc-50 && Y<mouseY+rc-50   && visible) {
    //le corp
    noStroke();
    fill(0);
    triangle(mouseX-35, mouseY+120, mouseX, mouseY+60,
      mouseX+35, mouseY+120);
    noStroke();
    fill(0);

    rect(mouseX-40, mouseY+120, 80, 20);
    noStroke();
    fill(0);
    ellipse(mouseX, mouseY+40, 70, 70);

    //ca c pour lellipse transparant un peu
    noStroke();
    fill(0);
    ellipse(mouseX, mouseY+40, rc, rc);

    //YEUX1
    noStroke();
    fill(0);
    rect(mouseX-30, mouseY+30, 20, 20);
    rect(mouseX-25, mouseY+35, 20, 20);
    fill(0);
    rect(mouseX-25, mouseY+35, 10, 10);
    fill(0);
    rect(mouseX-20, mouseY+40, 20, 20);
    fill(0);
    rect(mouseX-15, mouseY+45, 5, 5);


    //YEUX2
    fill(0);
    rect(mouseX+16, mouseY+30, 20, 20);
    rect(mouseX+11, mouseY+35, 20, 20);
    fill(0);
    rect(mouseX+20, mouseY+35, 10, 10);
    fill(0);
    rect(mouseX+6, mouseY+40, 20, 20);
    fill(0);
    rect(mouseX+15, mouseY+45, 5, 5);
  }





  //*VLE POUR CALCULE LA VIE QUI REST POUR LALIEN*/
  do {
    if (X>mouseX-rc+50 && X<mouseX+rc -50 && visible) {
      cpt2-=1;
    }
  } while (vie==0);
  
  //interface lost
  if (cpt2==0) {
    background(255, 86, 77, 30);
    fill(250,109,120,120);
    noStroke();
    ellipse(width/2,height/2,400,200);
    textSize(65);
    fill(#FAFBFC);
    stroke(0);
    strokeWeight(1);
    fill(255);
    text("You Lost:(", width/3-10, height/2));
    fill(255, 86, 77, 30);
    //  rect(690,100,200,200);
  }
  //*****************************************************/
}



void keyPressed() {
  texte=!texte;
}


/*****************************************************************************************/
