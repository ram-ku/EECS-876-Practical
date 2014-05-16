module Active_test where

import Graphics.Blank
import Animator
import Data.Active

newActive1=mkActive (toTime 0) (toTime 10) (\x -> renderTri1 ((fromTime x ::Float)*20+400) (400-(fromTime x ::Float)*20))
newActive2=mkActive (toTime 0) (toTime 5) (\x ->renderTri2	1.0 1.0)
newActive3=mkActive (toTime 0) (toTime 5) (\x ->renderTri3	1.0 1.0)
newActive4=mkActive (toTime 0) (toTime 5) (\x ->renderTri4	1.0 1.0)
newActive4a=mkActive (toTime 0) (toTime 8) (\x ->renderTri4a	1.0 1.0)
newActive5=mkActive (toTime 0) (toTime 10) (\x ->renderTri5 (600-(fromTime x ::Float)*10) (200+(fromTime x ::Float)*15))
newActive6=mkActive (toTime 0) (toTime 10) (\x ->renderTri6 (500+(fromTime x ::Float)*15) (350+(fromTime x ::Float)*10))
newActive6a=mkActive (toTime 0) (toTime 5) (\x ->renderTri6a	1.0 1.0)

main :: IO ()
main = blankCanvas 3000 $ \ context -> play context $ simulate (toRational 30) $ movie[newActive1,newActive2,newActive3,newActive4,newActive4a,newActive5,newActive6,newActive6a]

play context (n:ns) = do{
				send context $ do {
					render n};
				play context ns}

renderTri1 ::Float -> Float -> Canvas ()
renderTri1 x y= do {
				triangle x y "down" "Yellow" "Black"; 
				}
renderTri2 ::Float -> Float-> Canvas ()
renderTri2 x y = do { 
				triangle 600 200 "down" "Yellow" "Black";
				triangle 500 350 "right" "Yellow" "Black";
				}

renderTri3 ::Float -> Float-> Canvas ()
renderTri3 x y = do {
				renderTri2 x y;
				triangle 650 450 "up" "Yellow" "Black";
				return ()
				}
renderTri4 ::Float -> Float-> Canvas ()
renderTri4 x y = do {
				renderTri3 x y;
				triangle 750 300 "left" "Yellow" "Black";
				}
				
renderTri4a ::Float -> Float-> Canvas ()
renderTri4a x y = do { 
				font "20px Verdana";
				fillStyle "Black";
				fillText ("area = c2",400,200);
				renderTri4 x y;
				fillStyle "Black";
				fillText ("a",610,250);
				fillText ("b",655,290);
				fillText ("c", 680,250);
				fillText ("c", 690,410);
				rectangle 601 300 48 49 "Yellow" "Black";
				}

renderTri5 ::Float -> Float-> Canvas ()
renderTri5 x y = do { 
				font "20px Verdana";
				fillStyle "Black";
				fillText ("area = c2",400,200);
				triangle 600 200 "down" "rgba(255, 255, 0, 0.5)" "rgba(0, 0, 0, 0.5)";
				triangle 500 350 "right" "Yellow" "Black";
				triangle 650 450 "up" "Yellow" "Black";
				triangle 750 300 "left" "Yellow" "Black";
				rectangle 601 300 48 49 "Yellow" "Black";
				triangle x y "down" "Yellow" "Black";
				}
renderTri6 ::Float -> Float-> Canvas ()
renderTri6 x y = do { 
				font "20px Verdana";
				fillStyle "Black";
				fillText ("area = c2",400,200);
				triangle 600 200 "down" "rgba(255, 255, 0, 0.5)" "rgba(0, 0, 0, 0.5)";
				triangle 500 350 "right" "rgba(255, 255, 0, 0.5)" "rgba(0, 0, 0, 0.5)";
				triangle 650 450 "up" "Yellow" "Black";
				triangle 750 300 "left" "Yellow" "Black";
				rectangle 601 300 48 49 "Yellow" "Black";
				triangle 500 350 "down" "Yellow" "Black";
				triangle x y "right" "Yellow" "Black";
				}
renderTri6a ::Float -> Float-> Canvas ()
renderTri6a x y = do { 
				font "20px Verdana";
				fillStyle "Black";
				fillText ("area = c2",400,200);
				triangle 600 200 "down" "rgba(255, 255, 0, 0.5)" "rgba(0, 0, 0, 0.5)";
				triangle 500 350 "right" "rgba(255, 255, 0, 0.5)" "rgba(0, 0, 0, 0.5)";
				triangle 650 450 "up" "rgba(255, 255, 0, 0.5)" "rgba(0, 0, 0, 0.5)";
				triangle 750 300 "left" "rgba(255, 255, 0, 0.5)" "rgba(0, 0, 0, 0.5)";
				rectangle 601 300 48 49 "rgba(255, 255, 0, 0.5)" "rgba(0, 0, 0, 0.5)";
				triangle 500 350 "down" "rgba(255, 255, 0, 0.5)" "rgba(0, 0, 0, 0.5)";
				triangle 650 450 "right" "rgba(255, 255, 0, 0.5)" "rgba(0, 0, 0, 0.5)";
				rectangle 500 350 100 100 "rgba(255, 255, 0, 0.8)" "Black";
				rectangle 600 300 150 150 "rgba(255, 255, 0, 0.8)" "Black";
				font "20px Verdana";
				fillStyle "Black";
				fillText ("a",480,400);
				fillText ("a",550,470);
				fillText ("b",675,470);
				fillText ("b",755,375);
				fillText ("c2=a2+b2",675,200);
				}