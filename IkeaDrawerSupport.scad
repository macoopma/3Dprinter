
br = 9 ;      // breedte van de basis ;
le = 35 ;      // lengte van de basis ;
di =  2 ;      // dikte van de basis ; 
ho = 24 ;      // hoogte van de driehoek ;
vijspl = 8 ;   // plat stukje voor vijs ;
vijs_gat= 2 ;  // diameter voor vijs ; 
boven = 10 ;   // bovenkant van driehoek ; 
wand= 1.5 ;     // wand van de driehoek ;
blok_h=6 ;      // hoogte van blokje dat er bovenop staat ;
blok_le=9 ;     // lengte van blokje bovenop ;
blok_gat=4.5 ;  // diameter van gat in blokje bovenop;

blok_wand= 3;  // wanddikte rechtopstaande stuk waar ijzerke in moet komen;
blok_rond= 12 ; // diameter van opening waar ijzerke in moet passen, ijzerke zelf is 4.5 mm;

/*
// V1 instellingen

br = 10 ;      // breedte van de basis ;
le = 42 ;      // lengte van de basis ;
di =  3 ; 
ho = 23 ;      // hoogte van de driehoek ;
vijspl = 9 ;   // plat stukje voor vijs ;
vijs_gat= 2 ;  // diameter voor vijs ; 
boven = 10 ;   // bovenkant van driehoek ; 
wand= 1.5 ;     // wand van de driehoek ;
blok_h=6 ;      // hoogte van blokje dat er bovenop staat ;
blok_le=9 ;     // lengte van blokje bovenop ;
blok_gat=4.5 ;  // diameter van gat in blokje bovenop;

blok_wand= 3;  // wanddikte rechtopstaande stuk waar ijzerke in moet komen;
blok_rond= 12 ; // diameter van opening waar ijzerke in moet passen, ijzerke zelf is 4.5 mm;

*/ 



module blokje()
{
difference () {
cube ([blok_wand,br,blok_h ]) ;
translate ([blok_rond/2+blok_wand-1,br*3/2,blok_h/3]) rotate ([90,0,0]) cylinder (h= 2*br, r=blok_rond/2, $fn=50) ;
 translate ([blok_wand-1,-br*2/3,blok_h])  rotate ([0,45,0]) cube ([blok_wand,br*2,di]) ;
}

}

translate ([le/2- (boven)/2,0,ho+di]) {
translate ([boven,br,0]) rotate  ([ 0,0,180]) blokje();
blokje();
}

/*
// probeersel voor top ;
difference () {
cube ([blok_le,br,blok_h]) ;
translate ([blok_le/2,br*3/2,blok_h*2/3]) rotate ([90,0,0]) cylinder (h=2*br,r=blok_gat/2,$fn=50);
}
*/

// bodemplaatje met 2 gaten voor vijsjes ;
difference () { 
 cube ([le,br, di ]) ;
color ("navajowhite") {
     translate ([vijspl/2,br/2,-di/2]) cylinder (h=2*di,r=vijs_gat,$fn=40) ;
     translate ([le-vijspl/2,br/2,-di/2]) cylinder (h=2*di,r=vijs_gat,$fn=40) ;

  }
 }
 
translate ([0,0,di]){ 
/*difference () { */
polyhedron(
  points=[ [le-vijspl,br,0],        [vijspl,br,0],         [vijspl,0,0],          [le-vijspl,0,0],  // the four points at base
           [le/2+boven/2, br, ho], [le/2-boven/2, br, ho], [le/2-boven/2, 0, ho], [le/2+boven/2, 0, ho]  ],                                 // the apex point 
  faces=[ [0,4,5,1],[3,2,6,7], // links en rechts
          [2,1,5,6], [0,3,7,4] , // voor en achter
       [0,1,2,3],[4,7,6,5] ]  // bodem en bovenkant
  );
 
polyhedron(
  points=[ [le-vijspl-wand,br-wand,wand], [vijspl+wand,br-wand,wand], [vijspl+wand,wand,wand],          [le-vijspl-wand,wand,wand],  // the four points at base
           [le/2+boven/2-wand, br-wand, ho-wand], [le/2-boven/2+wand, br-wand, ho-wand], [le/2-boven/2+wand, wand, ho-wand], [le/2+boven/2-wand, wand, ho-wand]  ],                                 // the apex point 
  faces=[ [0,4,5,1],[3,2,6,7], // links en rechts
          [2,1,5,6], [0,3,7,4] , // voor en achter
       [0,1,2,3],[4,7,6,5] ]  // bodem en bovenkant
  );

/*
translate ([22,12,12]){
 rotate ([90,0,0]){   
 cylinder (h=15,r1=4,r2=4) ;
 } 
 }
     
 } */ 
}


 
    
