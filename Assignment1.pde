//Egg man game
//Author:Raghavender Goud Yadagiri 
///Poly id:0514197, rg2455

/**********************************Game play instructions *************************************************************/
//use left and right keys on the keyboard to play the game
//After every 5 hits the game speed increases 
//After every 3 misses the game is over
/************************************************************************************************************************/



/****************************************************Global Variables Declaration******************************************/
float the_dude_x,the_dude_y;
float current_direction;
PImage img;
PImage egg_image;
float egg_x,egg_y;
float egg_speed=1;
float egg_step=5;
float the_dude_step=10;
float count=0;
int hit=0;
int miss=0;
/********************************************end of Global Variables Declaration********************************************/


/***************************************************************************************************************************/
/*********************************************************setup************************************************************/
void setup()
{
    size(720, 620);
    img = loadImage("eggman.bmp");//load image the_egg_man
    egg_image= loadImage("myegg.bmp");//load egg image
    egg_x=get_random();
    egg_y=10;
    the_dude_x=width/2;
    the_dude_y=height-img.height;
    background(255);     //clear background
    textSize(15);   //set text size
}
/************************************************************end of setup*****************************************************/



/*************************************************************daw()***********************************************************/
void draw()
{  
  background(255);
  fill(0, 255, 0, 255);
  //make the the_dude go up
  
  
  if(current_direction==4)//move the egg man left
  {
  if(the_dude_x>the_dude_step)
  the_dude_x-=the_dude_step;
  }
  else if(current_direction==6)//move the egg man right
  {
  if(the_dude_x<(width-img.width))
  the_dude_x+=the_dude_step;  
  }
  
  image(img, the_dude_x, the_dude_y);//draw the egg man
 
  count++;//use this variable to control the egg speed
  if(count%egg_speed==0)
  {
   egg_y+=egg_step;//move the egg down 
  if(egg_y>(height-img.height-egg_image.height))//check if the egg is in the basket or not
   {
       if(egg_x>=the_dude_x && egg_x<(the_dude_x+img.width))//check if the egg is in the basket
       {
         hit++;
         println("hit="+hit);
         if(hit%5==0)
         egg_step+=4;
       }
       else //if not in the basket its a miss
       {
         miss++;
         println("miss="+miss);
       }
       egg_y=10;
      egg_x=get_random();    
   } 
  }
  if(miss==3)
  exit();
  fill(0, 102, 153, 204);
  text("hit="+hit+" miss="+miss, width-150, 20);//display score on the top left of the screen
  image(egg_image, egg_x, egg_y);//draw the egg
}


/*******************************************************************end of draw************************************/



/*************************************************************keypressed************************************************/

//update the direction variable when key is pressed
void keyPressed() {
  if (key == CODED)
  {    
     if (keyCode == LEFT)
    {
    print("left\n");  
    current_direction=4;  
    }
    else if (keyCode == RIGHT)
    {
    print("right\n");  
    current_direction=6;  
    } 
  } 
  else
  {
    print("something else\n");
    current_direction=0;
  }
}//end of keyPressed


/**************************************************************end of keypressed********************************************************/



/**************************************************************get_random***************************************************************/

//Description:This function returns a random value
//Arguments:none
//Return value: interger random value 
int get_random()
{
  int i=0;
  int random_number=0;
  //average the random value and return it
  for(i=0;i<3;i++)
  {
    random_number+=random(10,(width-egg_image.width));
  }
  return random_number/3;//return the random value
}//end of get random

/***********************************************************end of get_random****************************************************/

/*************************************************************keyreleased*******************************************************/


//make the current direction Zero so that the egg man wil stop moving once the key is released 
void keyReleased() 
{
current_direction=0;
}//end of keyreleased


/****************************************************************end of keyReleased***********************************************/
