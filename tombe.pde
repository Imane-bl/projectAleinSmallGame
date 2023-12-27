
class tombe{
  
float xt=random(width);
float yt=random(-200,-100);
float vt=random(3,9);

void fall(){
 yt=yt+vt;
   vt=vt+0.03;//pour un peu gravity
  if(yt>height){
    yt=random(-200,-100);//Je donne la meme premier val
 vt=random(3,9);//un peu gravity
        }
}
//ligne 270.. pouer le key pressed
void show(){
  stroke(#216A2F);
  strokeWeight(0.6);
  line(xt,yt,xt,yt+9);//dessigner mes lignes
  
    }
}
