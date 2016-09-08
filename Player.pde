class Player{
  // varibles
  int x = 1;
  int y = 1;
  int currentLocomotion = 0;
  int velocity = 0;
   // other varibles 
  int walking = 0;
  int flying = 1;
  int swimming = 2;
  byte direction = 1;
  // constructors
  
  // void methods
  void moveX(int amount){
    x+= amount;
    direction = (byte)amount;
  }
  void moveY(int y){
    this.y += y;
  }
  void setY(int y){
    this.y = y;
  }
  void jump(){
    y+=2;
  }
  void fly(int h){
    y+=h;
    currentLocomotion = flying;
  }
  void land(){
    currentLocomotion = walking;
  }
  void fall(){
    if(currentLocomotion != flying){
      y-= 1;
    }
  }
  void snapToGridY(){
    int closestBlock = y;
    //y = closestBlock;
  }
  void drawPlayer(){
    if(direction == -1)
      image(zombieEntity,(x-1)*blockSize+100 - panX, height-(y*blockSize)+panY-(blockSize), blockSize, blockSize*2);
    else if(direction == 1)
      image(zombieEntityBackwards,(x-1)*blockSize+100 - panX, height-(y*blockSize)+panY-(blockSize), blockSize, blockSize*2);
    text(y +" "+ panY,1000,900);
  } 
  boolean isFlying(){
     if(this.currentLocomotion == flying){
       return true;
     }
     else{
       return false;
     }
  }
}