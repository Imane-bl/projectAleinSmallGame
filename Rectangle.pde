class Rectangle {
  float x7, y7, w7, h7, v7;
  float v=3;

  Rectangle(float x7, float y7, float w7, float h7, float v7) {
    this.x7 = x7;//pour faire rfrnc a linstance actuelle de la classe
    this.y7 = y7;//diferencier les var locale avec les var instance de class
    this.w7 = w7;
    this.h7 = h7;
    this.v7 = v7;
  }

  void decendre() {
    y7 += v7;
    if (y7 > height) {
      y7 = random(-200, -10);
      x7 = random(width);
    }
  }

  void affiche() {
    
    fill(250, 45, 86);
    rect(x7, y7, w7, h7);
    fill(changec);
    //ca pour dessigner les ellipse pour les fleurs
      ellipse(x7+3, y7+10, w7+3, h7+3);//BAS
    ellipse(x7+(2.5), y7-4, w7+3, h7+3);//HAUT
    ellipse(x7+10 , y7+2, w7+3, h7+3);//DROIT
    ellipse(x7-5, y7+3, w7+3, h7+3);//LEFT
    changec=(changec +v)% width;//pour changer la coleur progerssivm
fill(255);

   
}
boolean touch(float rx, float ry, float rw, float rh) { 
    return (x7 > rx && x7 < rx + rw && y7 > ry && y7 < ry + rh);
  }
} //c  méthode de type bool qui vérifie si lerec actuel entre
// collision avec un autre rec jai le défini par les prmtr rx, ry, rw et rh
//cordn x / y /h/wr  du deuxieme rectangle
