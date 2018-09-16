#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
#include "Candle_2.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 75      // front view
                            location  <0.0 , 1.0 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 3.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_0}
// sun ---------------------------------------------------------------------
light_source{<1500,2500,-2500> color White}
// sky ---------------------------------------------------------------------
light_source{ <-1000, 800, 3000> 
              color White
              looks_like{ sphere{ <1500,0,0>,300 
                                  texture{ pigment{ color White }
                                           normal { bumps 0.5
                                                    scale 50    }
                                           finish { ambient 0.8   
                                                    diffuse 0.2
                                                    phong 1     }
                                                  
                                         } // end of texture
                                } // end of sphere
                        } //end of looks_like
            } //end of light_source
// sky --------------------------------------------------------------------
  // the dark blue
plane{ <0,1,0>,1 hollow  
       texture{ pigment { color rgb <0.20, 0.20, 1.0> }
                finish  { ambient 0.25 diffuse 0 } 
              }      
       scale 10000}
  // the clouds 
plane{<0,1,0>,1 hollow  
       texture{pigment{ bozo turbulence 0.76
                        color_map { [0.5 rgbf<1.0,1.0,1.0,1.0> ]
                                    [0.6 rgb <1.0,1.0,1.0>     ]
                                    [1.0 rgb <0.5,0.5,0.5>     ]}
                       }
               finish { ambient 0.25 diffuse 0} 
              }      
       scale 500}



// fog ---------------------------------------------------------------------

fog{ fog_type   2
     distance   50
     color      White
     fog_offset 0.1
     fog_alt    2.0
     turbulence 0.8
   }
// ground ------------------------------------------------------------------

plane { <0,1,0>, 0 
        texture { pigment{ color rgb<0.35,0.65,0.0>*0.72}
                  normal { bumps 0.75 scale 0.015  }
                  finish { phong 0.1 }
                }
      }                                    
      
//---------------------------------------------------------------------
height_field{ png "Mount2.png" smooth double_illuminate
              // file types: 
              // gif | tga | pot | png | pgm | ppm | jpeg | tiff | sys
              // [water_level N] // truncate/clip below N (0.0 ... 1.0)
              translate<-.5,-0.0,-0.5>
              scale<5, 1.5, 9>*2 
              texture{ pigment { color rgb <0.82,0.6,0.4>}
                       normal  { bumps 0.75 scale 0.025  }
                     } // end of texture
              rotate<0,-110,0>
              translate<-2,0,7
              >
            } 
                                            
  ///////BRAZIER1//////             
  
  #declare ScaleBrazier=.10;
  
  #declare petale_tripod =
intersection
 {
  box{ <-0.125,-1,0> <+0.125,1,1.2> }
  difference
   {
    difference
     {
      sphere { <0,0,0> 1.1 }     
      sphere { <0,0,0> 1 }
     }
    box { <-1.1,-0.5,-1.1> <1.1,1.1,1.1> }
   }
   scale ScaleBrazier
 }

#declare egypta_tripod_leg =
 union
  {
   difference
    {
     difference
      {
       cylinder { <-0.10,0,0> <+0.10,0,0> 0.2 }
       cylinder { <-0.10,0,0> <+0.10,0,0> 0.1 }       
      }
     box { <-0.3,0,-0.25> <+0.3,+0.25,+0.25> }
    }
   box { <-0.10,0,-0.2> <+0.10,1.8,-0.1> } 
  }

#declare egypta_tripod_burner =
union
 {
  union // petales
   {
    object { petale_tripod rotate <0, 00 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 01 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 02 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 03 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 04 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 05 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 06 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 07 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 08 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 09 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 10 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 11 * 30,0> translate <0,1,0> }
    translate <0,2,0>   
   }
  object // cup
   {
    difference
     {
      difference 
       {
        sphere { <0,0,0> 1 }
        sphere { <0,0,0> 0.95 }
       }
      box { <-1,-0.45,-1> <1,1,1> }
     }
    translate <0,3,0>   
    
   }
   
  union // pattes
   {
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 0*120, 0>  }
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 1*120, 0>  }
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 2*120, 0>  }
   } 
  cylinder { <0,1,0> <0,1.25,0> 0.5 open }
                                        
                                        
//////////////////AREA TO BRAZIER MOD/////////////                                        
  scale ScaleBrazier                              
  translate <.6,0,-.8>
  
//////////////////END BRAZIER MOD/////////////////
 }
 
#declare tripod_smoke_and_flame =
cone
 {
  <0,0,0> 1 <0,2,0> 0 
  
 }


#include "metals.inc"
//camera{location <0,3.5,-3> look_at<0,1.5,0>}
//light_source{<10,10,-30> color rgb 2}
object{egypta_tripod_burner texture{T_Brass_1E}}
//object{tripod_smoke_and_flame pigment{rgb<1,0,0>}}
                                                      
                                                      
//////////BRAZIER 2///////////////////////////////

///////BRAZIER1//////             
  
  #declare ScaleBrazier=.10;
  
  #declare petale_tripod =
intersection
 {
  box{ <-0.125,-1,0> <+0.125,1,1.2> }
  difference
   {
    difference
     {
      sphere { <0,0,0> 1.1 }     
      sphere { <0,0,0> 1 }
     }
    box { <-1.1,-0.5,-1.1> <1.1,1.1,1.1> }
   }
   scale ScaleBrazier
 }

#declare egypta_tripod_leg =
 union
  {
   difference
    {
     difference
      {
       cylinder { <-0.10,0,0> <+0.10,0,0> 0.2 }
       cylinder { <-0.10,0,0> <+0.10,0,0> 0.1 }       
      }
     box { <-0.3,0,-0.25> <+0.3,+0.25,+0.25> }
    }
   box { <-0.10,0,-0.2> <+0.10,1.8,-0.1> } 
  }

#declare egypta_tripod_burner =
union
 {
  union // petales
   {
    object { petale_tripod rotate <0, 00 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 01 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 02 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 03 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 04 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 05 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 06 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 07 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 08 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 09 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 10 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 11 * 30,0> translate <0,1,0> }
    translate <0,2,0>   
   }
  object // cup
   {
    difference
     {
      difference 
       {
        sphere { <0,0,0> 1 }
        sphere { <0,0,0> 0.95 }
       }
      box { <-1,-0.45,-1> <1,1,1> }
     }
    translate <0,3,0>   
    
   }
   
  union // pattes
   {
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 0*120, 0>  }
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 1*120, 0>  }
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 2*120, 0>  }
   } 
  cylinder { <0,1,0> <0,1.25,0> 0.5 open }
                                        
                                        
//////////////////AREA TO BRAZIER MOD/////////////                                        
  scale ScaleBrazier                              
  translate <1.5,0,-.3>
                                                    
                                                    
                                                    
//////////////////END BRAZIER MOD/////////////////
 }
 



#include "metals.inc"
//camera{location <0,3.5,-3> look_at<0,1.5,0>}
//light_source{<10,10,-30> color rgb 2}
object{egypta_tripod_burner texture{T_Brass_1E}}
//object{tripod_smoke_and_flame pigment{rgb<1,0,0>}}          



/////////////////////////////////////END BRAZIER2 /////////////////////////////////// 




///////BRAZIER3//////             
  
  #declare ScaleBrazier=.10;
  
  #declare petale_tripod =
intersection
 {
  box{ <-0.125,-1,0> <+0.125,1,1.2> }
  difference
   {
    difference
     {
      sphere { <0,0,0> 1.1 }     
      sphere { <0,0,0> 1 }
     }
    box { <-1.1,-0.5,-1.1> <1.1,1.1,1.1> }
   }
   scale ScaleBrazier
 }

#declare egypta_tripod_leg =
 union
  {
   difference
    {
     difference
      {
       cylinder { <-0.10,0,0> <+0.10,0,0> 0.2 }
       cylinder { <-0.10,0,0> <+0.10,0,0> 0.1 }       
      }
     box { <-0.3,0,-0.25> <+0.3,+0.25,+0.25> }
    }
   box { <-0.10,0,-0.2> <+0.10,1.8,-0.1> } 
  }

#declare egypta_tripod_burner =
union
 {
  union // petales
   {
    object { petale_tripod rotate <0, 00 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 01 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 02 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 03 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 04 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 05 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 06 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 07 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 08 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 09 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 10 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 11 * 30,0> translate <0,1,0> }
    translate <0,2,0>   
   }
  object // cup
   {
    difference
     {
      difference 
       {
        sphere { <0,0,0> 1 }
        sphere { <0,0,0> 0.95 }
       }
      box { <-1,-0.45,-1> <1,1,1> }
     }
    translate <0,3,0>   
    
   }
   
  union // pattes
   {
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 0*120, 0>  }
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 1*120, 0>  }
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 2*120, 0>  }
   } 
  cylinder { <0,1,0> <0,1.25,0> 0.5 open }
                                        
                                        
//////////////////AREA TO BRAZIER3 MOD/////////////                                        
  scale ScaleBrazier                              
  translate <-.75,0,.5>
                                                    
                                                    
                                                    
//////////////////END BRAZIER MOD/////////////////
 }
 



#include "metals.inc"
//camera{location <0,3.5,-3> look_at<0,1.5,0>}
//light_source{<10,10,-30> color rgb 2}
object{egypta_tripod_burner texture{T_Brass_1E}}
//object{tripod_smoke_and_flame pigment{rgb<1,0,0>}}          



 ///////BRAZIER4//////             
  
  #declare ScaleBrazier=.10;
  
  #declare petale_tripod =
intersection
 {
  box{ <-0.125,-1,0> <+0.125,1,1.2> }
  difference
   {
    difference
     {
      sphere { <0,0,0> 1.1 }     
      sphere { <0,0,0> 1 }
     }
    box { <-1.1,-0.5,-1.1> <1.1,1.1,1.1> }
   }
   scale ScaleBrazier
 }

#declare egypta_tripod_leg =
 union
  {
   difference
    {
     difference
      {
       cylinder { <-0.10,0,0> <+0.10,0,0> 0.2 }
       cylinder { <-0.10,0,0> <+0.10,0,0> 0.1 }       
      }
     box { <-0.3,0,-0.25> <+0.3,+0.25,+0.25> }
    }
   box { <-0.10,0,-0.2> <+0.10,1.8,-0.1> } 
  }

#declare egypta_tripod_burner =
union
 {
  union // petales
   {
    object { petale_tripod rotate <0, 00 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 01 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 02 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 03 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 04 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 05 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 06 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 07 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 08 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 09 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 10 * 30,0> translate <0,1,0> }
    object { petale_tripod rotate <0, 11 * 30,0> translate <0,1,0> }
    translate <0,2,0>   
   }
  object // cup
   {
    difference
     {
      difference 
       {
        sphere { <0,0,0> 1 }
        sphere { <0,0,0> 0.95 }
       }
      box { <-1,-0.45,-1> <1,1,1> }
     }
    translate <0,3,0>   
    
   }
   
  union // pattes
   {
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 0*120, 0>  }
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 1*120, 0>  }
    object { egypta_tripod_leg translate <0,0.2,0.6> rotate <0, 2*120, 0>  }
   } 
  cylinder { <0,1,0> <0,1.25,0> 0.5 open }
                                        
                                        
//////////////////AREA TO BRAZIER4 MOD/////////////                                        
  scale ScaleBrazier                              
  translate <.18,0,1.1>
                                                    
                                                    
                                                    
//////////////////END BRAZIER4 MOD/////////////////
 }
 



#include "metals.inc"
//camera{location <0,3.5,-3> look_at<0,1.5,0>}
//light_source{<10,10,-30> color rgb 2}
object{egypta_tripod_burner texture{T_Brass_1E}}
//object{tripod_smoke_and_flame pigment{rgb<1,0,0>}}          










//////////////////////////////////BEGIN BRAZIER2 FLAMES//////////////////////////////// 

#declare P = polygon {
    12,
    <0, 0>, <0, 6>, <4, 6>, <4, 3>, <1, 3>, <1,0>, <0, 0>, 
    <1, 4>, <1, 5>, <3, 5>, <3, 4>, <1, 4>
  }




/////////////////////////////////END BRAZIER2 FLAMES//////////////////////////////////




////////BEGIN RIVER///////////////////////////////////////

#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
                            

//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//--------------------------------------------------------------------------



//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------
 
// alternative declaration of textures
#declare river_texture =  texture{ Polished_Chrome
                normal{ bumps 0.25 scale <0.25,0.25,0.25>*0.5 turbulence 0.5 } 
                finish{ reflection 0.60 }}   
                
#declare Street_Texture = texture{ Polished_Chrome
                normal{ bumps 0.25 scale <0.25,0.25,0.25>*0.5 turbulence 0.5 } 
                finish{ reflection 0.60 }} 
                
#declare Stripes_Texture = texture{ Polished_Chrome
                normal{ bumps 0.25 scale <0.25,0.25,0.25>*0.5 turbulence 0.5 } 
                finish{ reflection 0.60 }} 
/*                
#declare Street_Texture = 
texture{pigment{rgb <.2,.2,1>}
              finish {ambient 0.25
                      diffuse 1.5
                      brilliance 10
                      phong 0.8
                      phong_size 120
                      }  
       
               
normal{ bumps 1
         scale <1,0.25,0.25>*1
         turbulence 0.6
       }
              }// end of texture
     // end of plane


#declare Stripes_Texture = 
texture{pigment{rgb <.2,.2,1>}
              finish {ambient 0.25
                      diffuse 1.5
                      brilliance 10
                      phong 0.8
                      phong_size 120
                      }     

normal{ bumps 1
         scale <1,0.25,0.25>*1
         turbulence 0.6
       }
              }// end of texture
     // end of plane 
*/       
//-------------------------------------------------------------------------------------// 
#include "Street_00.inc" 
#include "Street_10.inc"  // street with center stripes with continuous border lines
#include "Street_Curve_10.inc" // curved street with middle stripes 
//-------------------------------------------------------------------------------------//      


#declare StreetScale =.35;

union{ 
//-------------------------------------------------------------------------------------// 
object{ Street_10( 4,     // Street_Widthm, // 
                   10 , // Street_Length, //
                   0.10,  // Stripes_Width, // 
                   1.00,  // Stripes_Length                                  
                 ) //------------------------------------------------------------------//
        scale <1,1,1>*1
        rotate<0,0,0> 
        translate<0 ,0.00, -5.00>}
//-------------------------------------------------------------------------------------// 
object{ Street_Curve_10( 4.00,  // Street_Widthm, // 
                        30,    // Curve_Angle,   // degrees, right handed
                        30.00-4,  // Curve_Radius,  // 
                        0.10,  // Stripes_Width, // 
                        1.00,  // Stripes_Length                                  
                      ) //-------------------------------------------------------------//
        scale <1,1,1>*1 // curve to the right by "scale<-1,1,1>"
        rotate<0,0,0> 
        translate<0 ,0.00, 5.00>}
//-------------------------------------------------------------------------------------// 
object{ Street_10( 4,     // Street_Widthm, // 
                   100 , // Street_Length, //
                   0.10,  // Stripes_Width, // 
                   1.00,  // Stripes_Length // = 0 => continuous line!!!                                 
                 ) //------------------------------------------------------------------//
        scale <1,1,1>*1
        translate<30.00-4,0.00,0.00>  rotate<0,-30,0>  translate<-30.00+4,0.00,0.00> 
        translate<0 ,0.00, 5.00>}
//-------------------------------------------------------------------------------------// 
//---------------------------------------------------------------------------------------
 translate<0,0.00, -1.00>
 rotate<0, 60, 0>
 scale StreetScale
 }


//---------------------------------END RIVER----------------------------------------//




#declare Texture_W =
 texture{ pigment{ color White*0.9}
          finish{ specular 1} // shiny
        } // end of texture
#declare Texture_S =
 texture{ T_Stone10 scale 0.15
          normal { agate 0.25 scale 0.25 rotate<0,0,0> }
          finish { phong 1 }
          scale 0.5 translate<0,0,0>
        } // end of texture



       

#declare Scalebox=.15;  
// linear prism in x-direction: from ... to ..., number of points (first = last)
difference{
union{
prism { -1.00 , 1.00 , 4
        <-1.00, 0.00>, // first point
        < 1.00, 0.00>, 
        < 0.00, 5.0>,
        <-1.00, 0.00>  // last point = first point!!!
        rotate<-90,-90,0> //turns prism in x direction! Don't change this line!  

               // scale your object first!!!
 texture{  crackle  scale 1.5 turbulence 0.1
           texture_map {[0.00 Texture_W]
                        [0.05 Texture_W]
                        [0.05 Texture_S]
                        [1.00 Texture_S]
                       }// end of texture_map
                   scale 0.25
             }


       scale <1.00, 1.00, 1.00>
       rotate<90,270,0> 
       translate<0.00, 0.00, 0.00>
       scale Scalebox 
       scale <1.00, 2.00, 1.00>
     } // end of prism --------------------------------------------------------


box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>   

         texture{  crackle  scale 1.5 turbulence 0.1
           texture_map {[0.00 Texture_W]
                        [0.05 Texture_W]
                        [0.05 Texture_S]
                        [1.00 Texture_S]
                       }// end of texture_map
                   scale 0.25
             }

      scale <1,1,1> rotate<0,0,0> translate<5,0,0>
      translate<-4, 0.0 , 0.0>  
      scale Scalebox
      scale <2,1,0>
    } // end of box --------------------------------------           
    
    
    
prism { -1.00 , 1.00 , 4
        <-1.00, 0.00>, // first point
        < 1.00, 0.00>, 
        < 0.00, 5.0>,
        <-1.00, 0.00>  // last point = first point!!!
        rotate<-90,-90,0> //turns prism in x direction! Don't change this line!  

        //----------------------------------------------------------------------------



 //----------------------------------------------------------------------------
 texture{  crackle  scale 1.5 turbulence 0.1
           texture_map {[0.00 Texture_W]
                        [0.05 Texture_W]
                        [0.05 Texture_S]
                        [1.00 Texture_S]
                       }// end of texture_map
                   scale 0.25
             }

       scale <1.00, 1.00, 1.00>
       rotate<90,90,0> 
       translate<4.0, 0.00, 0.00>
       scale Scalebox 
       scale <1.00, 2.00, 1.00>
     } // end of prism --------------------------------------------------------
    rotate<0,60,0>
    translate<0,0,.5>
    scale<2,0,0>
}

cylinder { <0,0,0>,<0,0,2.00>,0.30 
           texture { pigment { color rgb<1,1,1>}
                   //normal  { bumps 0.5 scale 0.005}  
                     finish  { phong 0.5 reflection{ 0.00 metallic 0.00} } 
                   } // end of texture
           scale <2,.8,1> rotate<0,60,0> translate<0,0,0>
         } // end of cylinder  ------------------------------------

}


//////////////////////////END BRIDGE/////////////////////////

/////////////////////////BEGIN TREES////////////////////////


#include "Tree_00.inc" // include type of tree
//-------------------------------------------------------------------------------------// 
#include "Random_Planting_000.inc" 
//-------------------------------------------------------------------------------------// 
object{ Random_Planting_000( object{ Tree_00}, //  Object_to_Plant, //                                   
                             8, // Number_in_X, // number of objects in x direction
                             5, // Number_in_Z, // number of objects in z direction
                             2.5 // Base_Distance_X, //
                             2.75, // Base_Distance_Z, // 
                             10,   // Base_Tilt_Angel, // degrees
                             1.00, // Tilt_Angel_Ramdom_Factor, // 
                             1.00, // Base_Object_Scale, // ~ 1
                             0.350, // Object_Scale_Ramdom_Factor, // ~ 0.5
                             // integers 0 ~ 65536
                             6332, // Seed_0, // Ramdom seed for tilt on x-axis 
                             1153, // Seed_1, // Ramdom seed for rotating around y-axis
                             1642, // Seed_2, // Ramdom seed for scaling
                             2655  // Seed_3, // Ramdom seed for moving in x and z
                           ) //--------------------------------------------------------//
        scale <1,1,1>*1
        rotate<0,-30,0> 
        translate< 3.00,0.00, 25.00>}
//-------------------------------------------------------------------------------------//
//--------------------------------------------------------------------------------------- 

/////////////////////END TREES/////////////////////////////////////

/////////////////////BEGIN TOWER 1///////////////////////////////////
//---------------------------------------------------------------------------------------
//----------------------------------------------------------------------------- textures 
#declare Scaletower=.2;
#declare Brick_Scale     = <0.07, 0.075, 2>; 
#declare Brick_Translate = <0.0,-0.06+0.25,-0.90>;
#declare Brick_Intensity = 0.35; 
//------------------------------------------------------------- textures
#declare Tower_Texture_1 = // sandstone
         texture { pigment{ color rgb< 0.90, 0.78, 0.60>*1.2}
                   normal { pigment_pattern{ brick 
                                             
                                             color rgb 0.2, 
                                             color rgb 0.8    //mortar 0.10
                                             scale Brick_Scale 
                                             translate Brick_Translate
                                             rotate<0,0,0>} Brick_Intensity}
                   finish { phong 0.1}
                 } // end of texture 
#declare Tower_Texture_2 = // sandstone
         texture { pigment{ color rgb< 0.90, 0.78, 0.60>*0.95*1.2}
                            // color rgb< 0.4,1,0.0>} // test_color
                   normal { pigment_pattern{ brick 
                                             color rgb 0.2, 
                                             color rgb 0.8 
                                             scale Brick_Scale
                                             translate Brick_Translate
                                             rotate<0,0,0>} Brick_Intensity}
                   finish { phong 0.1}
                 } // end of texture 
//---------------------------------------------------------------------------------------
#include "Tower_Round_0.inc" 
//---------------------------------------------------------------------------------------
object{ Tower_Round_0(   2.50, // Tower_R, // tower radius in x and z                                
                         10.00, // Tower_H, // tower heigth in y 
                         1.50, // Tower_Balustrade_H, // tower balustrade high
                         0.35, // Tower_Wall_D,       // tower wall deepth 
                         1.0, // Battlements_H,           // battlements height in y
                         15.5 // Battlements_Angle,   // battlements angle in xz around y 
                         Tower_Texture_1, // outside texture
                         Tower_Texture_2  // battlements tween texture
                       ) //------------------------------------------------------------// 
        scale <1,1,1>
        scale Scaletower
        rotate<0, 0,0> 
        translate<-6.0,2.6, 5.500>}
//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------        


//////////////////////////////////BEGIN TOWER 2 ////////////////////////////////////////

#declare Tower_Texture_1 = // sandstone
         texture { pigment{ color rgb< 0.90, 0.78, 0.60>*1.2}
                   normal { pigment_pattern{ brick 
                                             
                                             color rgb 0.2, 
                                             color rgb 0.8    //mortar 0.10
                                             scale Brick_Scale 
                                             translate Brick_Translate
                                             rotate<0,0,0>} Brick_Intensity}
                   finish { phong 0.1}
                 } // end of texture 
#declare Tower_Texture_2 = // sandstone
         texture { pigment{ color rgb< 0.90, 0.78, 0.60>*0.95*1.2}
                            // color rgb< 0.4,1,0.0>} // test_color
                   normal { pigment_pattern{ brick 
                                             color rgb 0.2, 
                                             color rgb 0.8 
                                             scale Brick_Scale
                                             translate Brick_Translate
                                             rotate<0,0,0>} Brick_Intensity}
                   finish { phong 0.1}
                 } // end of texture 
//---------------------------------------------------------------------------------------
#include "Tower_Round_0.inc" 
//---------------------------------------------------------------------------------------
object{ Tower_Round_0(   3, // Tower_R, // tower radius in x and z                                
                         12.500, // Tower_H, // tower heigth in y 
                         1.50, // Tower_Balustrade_H, // tower balustrade high
                         0.35, // Tower_Wall_D,       // tower wall deepth 
                         1.0, // Battlements_H,           // battlements height in y
                         15.5 // Battlements_Angle,   // battlements angle in xz around y 
                         Tower_Texture_1, // outside texture
                         Tower_Texture_2  // battlements tween texture
                       ) //------------------------------------------------------------// 
        scale <1,1,1>
        scale Scaletower
        rotate<0, 0,0> 
        translate<-1,2.5, 9.75>}
//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------           



/*

////////////////////////Alternative not used Castle//////////////////////////////////////  

#declare ScaleCastle=.08;                                                        
//------------------------------------------------------
#declare Walltex =
  texture{pigment{color Red}
          finish {diffuse 0.9 phong 1}}
#declare Rooftex =
  texture{pigment{color Black}
          finish {diffuse 0.9 phong 1}}
#declare Doortex =
  texture{pigment{color Black}
          finish {diffuse 0.9 phong 1}}


//------------------ the walls ------------------------ 
#declare ScaleWall=.25; 

#declare Wall = union{
  box {<-4  , 0,-0.3>,<  4,3.5,0.3> }
//  box {<-4.5,-6,-0.3>,<4.5,  0,0.3> rotate<-5,0,0>}
  texture{Walltex} 
  }                           

difference{   object{Wall} // Wall with door hole  --------------
              box{<-1,0,-0.4>,<1,2,0.4>       texture{Walltex}}
              cylinder{<0,2,-0.5>,<0,2,0.5>,1 texture{Walltex}}
              scale ScaleWall 
              translate<-5.25, 3, 6.2>
           }
union{
              box{<-1,0,-0.4>,<1,2,0.4>       texture{Doortex}}
              cylinder{<0,2,-0.5>,<0,2,0.5>,1 texture{Doortex}}
              scale ScaleWall
              translate<-5.25, 3, 6.2>
              
     }
              


////////END  ALTERNATIVE CASTLE////////////////////////////////////////    
                                                              

*/

//---------------------------------------------------------------------------------------
//----------------------------------------------------------------------------- textures  
#declare wallScale = .15;

 //---------------------------------------------------------------------------------------
//----------------------------------------------------------------------------- textures
#declare Brick_Scale     = < 0.064,0.065,0.140>; 
#declare Brick_Translate = < 0.00,-0.20,  0.30>*3;
#declare Brick_Intensity = 0.35; 
//------------------------------------------------------------- textures
#declare Wall_Texture_1 = // sand stone
         texture { pigment{ color rgb< 0.90, 0.78, 0.60>}
                   normal { pigment_pattern{ brick 
                                             color rgb 0.2, 
                                             color rgb 0.8 
                                             scale Brick_Scale 
                                             translate Brick_Translate
                                             rotate<0,0,0>} Brick_Intensity}
                   finish { diffuse 0.9 phong 0.1}
                 } // end of texture 
#declare Wall_Texture_2 = // sand stone
         texture { pigment{ color rgb< 0.90, 0.78, 0.60>*0.95}
                            // color rgb< 0.4,1,0.0>} // test_color
                   normal { pigment_pattern{ brick 
                                             color rgb 0.2, 
                                             color rgb 0.8 
                                             scale Brick_Scale
                                             translate Brick_Translate
                                             rotate<0,90,0>} Brick_Intensity}
                   finish { diffuse 0.9 phong 0.1}
                 } // end of texture 
//---------------------------------------------------------------------------------------
#include "Battlements_0.inc" 
//-------------------------------------------------------------------------------------// 




object{
Battlements_0(   20.00, // Wall__W, // half wall width in x                                
                         17, // Wall__H, // wall heigth in y 
                         1.50, // Wall__D, // wall deepth in z 
                         1.55, // Balustrade_H, // balustrade high
                         0.40, // Battlement__Wall_D, // battlement wall deepth 
                         0.70, // Battlement__H,    // battlements height in y
                         0.20, // Battlement__R,  // half battlements width in x or z 
                         1.25, // Tween_Distance, // >2*Battlement__R;  tween distance  
                         Wall_Texture_1, // outside texture
                         Wall_Texture_2  // battlements tween texture
                       ) //------------------------------------------------------------// 
        scale <1,1,1>*1
        rotate<0,-30,0>             
        scale wallScale
        translate<-4.25,2.0, 9.0>}
//---------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------- 



          
          
          
cylinder { <0,0,0>,<0,0,2.00>,0.30 
       texture{ T_Wood12    
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
              } // end of texture 



           scale <1.5,3,1> rotate<0,150,0> translate<-3.5,2.5,11>
         } // end of cylinder  ------------------------------------
                                                                                              
                                                                                              
//////////////////Begin flame 1//////////////////////////////

#declare scaleFlame = .2;

object{ Candle_2( 0.3,  // Shining_On, 0= off, >0 = intensity of candle light 
                  0, // Flame_Shadow, // >0 = intensity ; 0 = off
                  0,  // Candle_Height, relative to diameter (d=1) 
                  10,  // Candle_Intensity,  
                  0.7   // Candle_Flame_Scale
                  4, // Fade_Distance, //  3 ~ 5    
                  3 // Fade_Power //   2,3,4
                 ) // -------------------------
        scale scaleFlame
        rotate<0,0,0>
        translate<-.75,.2,.5> 
      } // ------------------------------------------------------------------------------



/////////////////Begin flame 2///////////////////////////////


object{ Candle_2( 0.3,  // Shining_On, 0= off, >0 = intensity of candle light 
                  0, // Flame_Shadow, // >0 = intensity ; 0 = off
                  0,  // Candle_Height, relative to diameter (d=1) 
                  10,  // Candle_Intensity,  
                  0.7   // Candle_Flame_Scale
                  4, // Fade_Distance, //  3 ~ 5    
                  3 // Fade_Power //   2,3,4
                 ) // -------------------------
        scale scaleFlame
        rotate<0,0,0>
        translate <.6,.2,-.8> 
      } // ------------------------------------------------------------------------------



/////////////////Begin flame 3///////////////////////////////


object{ Candle_2( 0.3,  // Shining_On, 0= off, >0 = intensity of candle light 
                  0, // Flame_Shadow, // >0 = intensity ; 0 = off
                  0,  // Candle_Height, relative to diameter (d=1) 
                  10,  // Candle_Intensity,  
                  0.7   // Candle_Flame_Scale
                  4, // Fade_Distance, //  3 ~ 5    
                  3 // Fade_Power //   2,3,4
                 ) // -------------------------
        scale scaleFlame
        rotate<0,0,0>
        translate <.18,.2,1.1> 
      } // ------------------------------------------------------------------------------  
      
////////////////Begin flame 4/////////////////////////////////


object{ Candle_2( 0.3,  // Shining_On, 0= off, >0 = intensity of candle light 
                  0, // Flame_Shadow, // >0 = intensity ; 0 = off
                  0,  // Candle_Height, relative to diameter (d=1) 
                  10,  // Candle_Intensity,  
                  0.7   // Candle_Flame_Scale
                  4, // Fade_Distance, //  3 ~ 5    
                  3 // Fade_Power //   2,3,4
                 ) // -------------------------
        scale scaleFlame
        rotate<0,0,0>
        translate <1.5,.2,-.3> 
      } // ------------------------------------------------------------------------------  
                                                                                              
 /////////////////////////////Alternative not used flames//////////////////////////////////////
 /*
 
 #declare flameScale = .25;
 
 #declare FlameMedia=
 sphere {0,1.1
   pigment {rgbf 1}
        interior {
                media {
                method 2 intervals 2 samples 3,3  // megapov, or increase intervals and samples
                absorption <.33,.5,.67>*2 emission <.33,.5,.67>*1.67
                scattering {2,<.75,.67,.5>*2 extinction .133}
                density {spherical turbulence <.1,.2,.15>*1.5
                        density_map {
                        [0 rgb 0]
												[.15 rgb <1.5,1,.5>*3]
												[.5 rgb <1.25,.5,.75>*2]
												[.7 rgb<0,.05,.5>*6]
                        } scale <.8,.9,.85> translate -.25*y}
                }
                media {
                method 2 intervals 2 samples 3,3  // megapov, or increase intervals and samples
                absorption <.36,.33,.167>*3 emission <.25,.5,.75>*1.133
                scattering {1,<.25,.33,.75>*3 extinction .67}
                density {spherical turbulence <.1,.2,.15>*.5
                        density_map {
                        [0 rgb 0][.3 rgb <0,.05,1.15>*6]
                        } scale <.7,.3,.7> translate -.9*y}
                }
       }
  scale <.9,3,.9>*.25 rotate 45*y translate .225*y
 hollow
 }

#declare SmallFlame=
 light_source { .5*y, <.75,.5,.25>
       area_light <.5,0,0>,<0,1,0>,3,3 jitter adaptive 1
    orient circular  // megapov only
  looks_like {FlameMedia}
   media_interaction on media_attenuation on
   fade_distance 6 fade_power 2
  translate 1.075*y
 }
 
 object{SmallFlame
        
        scale flameScale
        translate <.18,0,1.1>            
        }
*/

////////////////////Begin flame 1////////////////////////////
/*
#declare flameScale = .1;


difference{
	sphere{0, 0.5}
	sphere{<0, -0.3, 0>, 0.35} 
	hollow
	pigment{ rgbt 1}
	interior{ media{ emission rgbf <247, 73, 4, 0.2>
			 density{ cylindrical color_map{
			 	  [0.3 rgb 1]
			 	  [1 rgb <0.2, 0.2, 4>]}
			 	  turbulence 0.15}
			 	  }
			 }
	scale<.7, 1.8, .7>
	scale flameScale
	translate <.18,.3,1.1>
	}
///////////////////Begin flame 2/////////////////////////////

difference{
	sphere{0, 0.5}
	sphere{<0, -0.3, 0>, 0.35} 
	hollow
	pigment{ rgbt 1}
	interior{ media{ emission rgbf <247, 73, 4, 0.2>
			 density{ cylindrical color_map{
			 	  [0.3 rgb 1]
			 	  [1 rgb <0.2, 0.2, 4>]}
			 	  turbulence 0.15}
			 	  }
			 }
	scale<.7, 1.8, .7>
	scale flameScale
	translate <-.75,.3,.5>
	} 
	
*/
