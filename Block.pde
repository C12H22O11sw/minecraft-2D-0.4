int IDTracker = 0;

class Block{
  int x;
  int y;
  int type = 0;
  Block(int x, int y, int type){
    this.x = x;
    this.y = y;
    this.type = type;
  }
    Block(int x, int y){
    this.x = x;
    this.y = y;
  }
  void makeBlock(){
    switch(type){
      case 0:   displayImage = skyBlock;             break;
      case 1:   displayImage = grassBlock;           break;
      case 2:   displayImage = dirtBlock;            break;
      case 3:   displayImage = stoneBlock;           break;
      case 4:   displayImage = coalOreBlock;         break;
      case 5:   displayImage = ironOreBlock;         break;
      case 6:   displayImage = goldOreBlock;         break;
      case 7:   displayImage = diamondOreBlock;      break;
      case 8:   displayImage = emeraldOreBlock;      break;
      case 9:   displayImage = silverOreBlock;       break;
      case 10:  displayImage = waterBlock;           break;
      case 11:  displayImage = lapisOreBlock;        break;
      case 12:  displayImage = redstoneOreBlock;     break;
      case 13:  displayImage = oakLogBlock;          break;
      case 14:  displayImage = gravleBlock;          break;
      case 15:  displayImage = bedrockBlock;         break;
      case 16:  displayImage = snowyGrassBlock;      break;
      case 17:  displayImage = leafBlock;            break;
  }
     //rect((x-1)*blockSize+100,height-(y*blockSize),blockSize,blockSize);
     if(x*blockSize-panX<width && x*blockSize-panX>-blockSize*3){
       if(type != snowyGrassID)
         image(displayImage, (x-1)*blockSize+100 - panX, height-(y*blockSize)+panY, blockSize, blockSize);
       else
         image(displayImage, (x-1)*blockSize+100 - panX, height-(y*blockSize)+panY, blockSize, (blockSize*17)/16);
      }
  }
  boolean isSolid(){
   if(type == 0) return false;
   else return true;
  }
}