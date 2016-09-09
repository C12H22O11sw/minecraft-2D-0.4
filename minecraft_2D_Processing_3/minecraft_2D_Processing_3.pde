//imports
  import java.util.Random;
//varibles
  //ints
    int startBlockY = 100;
    int blockY = startBlockY;
    int randomSeed = 393344416;
    int blockRandom = (int)random(4);
    int blockSize = 16;
    int panX;
    int panY = 0;
    int seaLevel = 30;
  //floats/doubles
    float blockTrend;
  //chars
    char keyPRESSED = 's';
  //booleans
    boolean isWorldMade = false;
  //int arrays
    int[][] blockType = new int[1000][1000];
  //colors
    color   stone    =   color  ( 77,   77,   77);
    color   grass    =   color  (  0,  146,   69);
    color   dirt     =   color  ( 96,   56,   19);
    color   gold     =   color  (175,  175,   50);
    color   iron     =   color  (212,  187,  125);
    color   diamond  =   color  (  0,  255,  255);
    color   coal     =   color  ( 26,   26,   26);
    color   sky      =   color  (173,  255,  255);
  //images
    PImage skyBlock;         int skyID;
    PImage grassBlock;       int grassID;
    PImage dirtBlock;        int dirtID;
    PImage stoneBlock;       int stoneID;
    PImage coalOreBlock;     int coalOreID;
    PImage ironOreBlock;     int ironOreID;
    PImage goldOreBlock;     int goldOreID;
    PImage diamondOreBlock;  int diamondOreID;
    PImage emeraldOreBlock;  int emeraldOreID;
    PImage silverOreBlock;   int silverOreID; 
    PImage waterBlock;       int waterID;
    PImage lapisOreBlock;    int lapisOreID;
    PImage redstoneOreBlock; int redstoneOreID;
    PImage oakLogBlock;      int oakLogID;
    PImage gravleBlock;      int gravleID;
    PImage bedrockBlock;     int bedrockID;
    PImage snowyGrassBlock;  int snowyGrassID;
    PImage leafBlock;        int leafID;
    
    PImage displayImage;
    PImage zombieEntity; 
    PImage zombieEntityBackwards; 

  //minecraft objects
    World overworld = new World();
    Player player = new Player();

void setup(){
 size(1920,  1000);
 background(sky);
 frameRate(10);
 rand = new Random(randomSeed);
 skyBlock          =   loadImage("skyBlock.gif");          skyID = 0;
 grassBlock        =   loadImage("grassBlock.gif");        grassID = 1;
 dirtBlock         =   loadImage("dirtBlock.gif");         dirtID = 2;
 stoneBlock        =   loadImage("stoneBlock.gif");        stoneID = 3;
 coalOreBlock      =   loadImage("coalOreBlock.gif");      coalOreID = 4;
 ironOreBlock      =   loadImage("ironOreBlock.gif");      ironOreID = 5;
 goldOreBlock      =   loadImage("goldOreBlock.gif");      goldOreID = 6;
 diamondOreBlock   =   loadImage("diamondOreBlock.gif");   diamondOreID = 7;
 emeraldOreBlock   =   loadImage("emeraldOreBlock.gif");   emeraldOreID = 8;
 silverOreBlock    =   loadImage("silverOreBlock.gif");    silverOreID = 9;
 waterBlock        =   loadImage("waterBlock.gif");        waterID = 10;
 lapisOreBlock     =   loadImage("lapisOreBlock.gif");     lapisOreID = 11;
 redstoneOreBlock  =   loadImage("redstoneOreBlock.gif");  redstoneOreID = 12;
 oakLogBlock       =   loadImage("oakLogBlock.gif");       oakLogID = 13;
 gravleBlock       =   loadImage("gravleBlock.gif");       gravleID = 14;
 bedrockBlock      =   loadImage("bedrockBlock.gif");      bedrockID = 15;
 snowyGrassBlock   =   loadImage("snowyGrassBlock.gif");   snowyGrassID = 16;
 leafBlock         =   loadImage("leafBlock.gif");         leafID = 17;
 zombieEntity      =   loadImage("zombieEntity.gif");
 zombieEntityBackwards=loadImage("zombieEntityBackwards.gif");

  


 displayImage = loadImage("displayImage.gif");
}
Random rand;
int psudoRandom(int maxRange,int bias){
  return rand.nextInt(maxRange)-(maxRange/2)+bias;
}

void keyPressed(){
  keyPRESSED = key;
}  


void draw(){
  fill(255,0,0);
  if(keyPressed){
    fill(0,255,0);
  }
  rect(width-200,height-200,100,100);
  if(!isWorldMade){
    overworld.generateTerain();
    overworld.makeWorld();
    isWorldMade = true;
  }
  else{
    if(blockType[player.x][player.y-1] == skyID && player.y>0){
      player.fall();
    }
    else if(blockType[player.x][player.y]!=skyID){
      player.moveY(1);
    }
    else if(keyPRESSED == ' ' && keyPressed){
        player.jump();
    }
    if(keyPRESSED == 'd' && keyPressed){
      if(blockType[player.x+1][player.y] == skyID){
        player.moveX(1);
      }else if(blockType[player.x+1][player.y+1] == skyID){
        player.moveX(1);
        player.moveY(1);
      }
    }
    else if(keyPRESSED == 'a' && keyPressed && player.x > 1){
      text("wtsvf",500,500);
      if(blockType[player.x-1][player.y]  == skyID){
        player.moveX(-1);
      }else if(blockType[player.x-1][player.y+1] == skyID){
        player.moveX(-1);
        player.moveY(1);
      }     
    }

      overworld.remakeWorld(player.x,player.y,5);
      player.drawPlayer();
  }
  
  
  
  
  if(mousePressed){
    //((x-1)*blockSize) = +100 - panX = mouseX, height-(y*blockSize)+panY, blockSize, blockSize);
    blockType[(((mouseX)+panX)/blockSize)-5][(-((mouseY)-panY)/blockSize)+62] = skyID;
    overworld.makeWorld();
  }
  fill(0,0,0);
  rect(50,50,100,100);
  fill(255,0,0);
  text(player.y +" "+player.x,100,100);
 // blocker.refresh(player.x,player.y);
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 if(keyPRESSED == '8' && keyPressed){
    panY+=blockSize*10; 
    overworld.makeWorld();
 } if(keyPRESSED == '2' && keyPressed){
    panY-=blockSize*10; 
    overworld.makeWorld();
 } if(keyPRESSED == '4' && keyPressed){
    panX+=blockSize*10; 
    overworld.makeWorld();
 } if(keyPRESSED == '6' && keyPressed){
    panX-=blockSize*10; 
    overworld.makeWorld();
 }if(keyPRESSED == '-' && keyPressed){
    blockSize /= 2; 
    overworld.makeWorld();
 }if(keyPRESSED == '+' && keyPressed){
    blockSize *= 2; 
    overworld.makeWorld();
 }
}

package display;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.swing.JOptionPane;

public class Block {
  int x,y;
  BufferedImage bufferdImage = null;
  Block(int x, int y, String imageName){
  // Buffered Image{
    
  // try
    try{
      bufferdImage = ImageIO.read(this.getClass().getResourceAsStream("dirtBlock.gif"));
    }
  // catch
    catch(Exception e){
      System.err.println("There was an error loading your image.");
    }
  // }Buffered Image
  }  
  void update(){
  
  }
  void draw(Graphics g){
    g.drawImage(bufferdImage, x, y, null);
  }



}
package display;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.Timer;

public class GamePanel extends JPanel implements ActionListener{
  
  
  Timer timer;
  Block block[][] = new Block[10][10];  
  GamePanel(){
    timer = new Timer(1000/60,this);
    timer.start();
  }
  
  @Override 
  public void paintComponent(Graphics g){
    block[0][0] = new Block(1,1,"");
    block[0][0].draw(g);
  }
  
  @Override
  public void actionPerformed(ActionEvent e) {
    // TODO Auto-generated method stub
    //System.out.println("timing");
    repaint();
    
  }

}
package display;

import javax.swing.JFrame;

public class GameWindow {
  int width;
  int height;
  JFrame frame;
  GamePanel gamepanel;
  public static void main(String[] args) {
    GameWindow window = new GameWindow(1080,800);
  }
  GameWindow(int width, int height){
    this.width = width;
    this.height = height;
    frame = new JFrame();
    gamepanel = new GamePanel();
    frame.add(gamepanel);
    frame.setSize(width, height);
    frame.setVisible(true);
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  }
  void update(){
  }
}

