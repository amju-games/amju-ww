//Maya ASCII 2012 scene
//Name: transporter.ma
//Last modified: Sat, Nov 30, 2013 02:57:55 PM
//Codeset: UTF-8
requires maya "2012";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2012";
fileInfo "version" "2012 x64";
fileInfo "cutIdentifier" "201103110020-796618";
fileInfo "osv" "Mac OS X 10.8.5";
fileInfo "license" "student";
createNode transform -s -n "persp";
	setAttr ".t" -type "double3" -58.957672824196308 93.602035969913416 15.18885961245773 ;
	setAttr ".r" -type "double3" -38.399999999985006 644.41910427801008 -1.2772653823506394e-14 ;
	setAttr ".rp" -type "double3" -3.7990444123892075e-16 -1.4210854715202004e-14 -3.6082248300317588e-16 ;
	setAttr ".rpt" -type "double3" 3.707132317769274e-16 1.717279863431713e-15 1.8730439366276981e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v";
	setAttr ".fl" 7.8257910598436746;
	setAttr ".coi" 77.772548548007194;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.072256088256835938 45.293790072749097 0.011568069458007812 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".t" -type "double3" -2.7557772288632112 32.410033995102737 101.80133101154439 ;
	setAttr ".rp" -type "double3" 0 -3.5527136788005009e-15 -1.4210854715202004e-14 ;
	setAttr ".rpt" -type "double3" -1.9008048414952385e-13 -4.2254964229068692e-15 1.2303491613576829e-13 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 274.54839113309197;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".tp" -type "double3" -5.3156689876801124 11.891943209849455 1.7013310115445108 ;
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".t" -type "double3" 0.022465635445889198 87.363244619308688 -0.27727479717928283 ;
	setAttr ".r" -type "double3" -90 -89.999999999999972 0 ;
	setAttr ".rp" -type "double3" -3.5527136788005009e-15 0 0 ;
	setAttr ".rpt" -type "double3" 1.6772100385199466e-15 -9.5788088207965659e-16 -4.9154615292174777e-15 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 2.4675885796146169;
	setAttr ".ow" 60.889651415634155;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" 17.431466891817031 6.3865040663778849 -18.512710661785736 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".t" -type "double3" 102.62258420967792 6.7076251706006396 -1.0937652333459713 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 54.006222537748371;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "pCylinder1";
	setAttr ".t" -type "double3" 0.072260415234324249 19.27081182468315 0.01157505986202878 ;
	setAttr ".s" -type "double3" 1.197507750280667 1.197507750280667 1.197507750280667 ;
createNode transform -n "polySurface1" -p "pCylinder1";
createNode transform -n "transform2" -p "polySurface1";
createNode mesh -n "polySurfaceShape1" -p "transform2";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "polySurface2" -p "pCylinder1";
createNode transform -n "transform3" -p "polySurface2";
createNode mesh -n "polySurfaceShape2" -p "transform3";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "polySurface3" -p "pCylinder1";
createNode mesh -n "polySurfaceShape3" -p "polySurface3";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "transform1" -p "pCylinder1";
createNode mesh -n "pCylinderShape1" -p "transform1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pPipe1";
	setAttr ".t" -type "double3" 58.945023466256437 40.034721577953476 -0.27727861187655178 ;
	setAttr ".s" -type "double3" 1 1.614237969279309 1 ;
	setAttr ".rp" -type "double3" -59.870971615231213 0 -0.76757655916963019 ;
	setAttr ".sp" -type "double3" -59.870971615231213 0 -0.76757655916963019 ;
createNode mesh -n "pPipeShape1" -p "pPipe1";
	setAttr -k off ".v";
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.50509627163410187 0.49604222358957761 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 40 ".pt[0:39]" -type "float3"  1.3329729 0 -1.2963969e-07 
		1.2677325 0 -0.42514512 1.0783981 0 -0.80867362 0.78350168 0 -1.1130439 0.41191396 
		0 -1.3084613 1.5822224e-06 0 -1.3757976 -0.41191068 0 -1.3084613 -0.78349918 0 -1.1130439 
		-1.0783949 0 -0.8086738 -1.2677326 0 -0.42514512 -1.3329729 0 -9.0511399e-08 -1.2677326 
		0 0.42514494 -1.0783949 0 0.8086738 -0.78349918 0 1.1130443 -0.41191068 0 1.3084614 
		1.5822224e-06 0 1.3757976 0.41191417 0 1.3084614 0.78350222 0 1.1130443 1.0783983 
		0 0.8086738 1.2677327 0 0.42514491 1.1798404 0 -1.1474663e-07 1.1220948 0 -0.37630427 
		0.95451117 0 -0.71577299 0.69349259 0 -0.98517698 0.36459309 0 -1.1581448 1.4091833e-06 
		0 -1.2177454 -0.36459014 0 -1.1581448 -0.69349039 0 -0.98517698 -0.95450848 0 -0.71577305 
		-1.1220949 0 -0.37630427 -1.1798407 0 -8.0113409e-08 -1.1220949 0 0.37630415 -0.95450848 
		0 0.71577305 -0.69349039 0 0.9851771 -0.36459014 0 1.158145 1.4091833e-06 0 1.2177454 
		0.36459333 0 1.158145 0.69349307 0 0.9851771 0.9545114 0 0.71577305 1.1220952 0 0.37630409;
createNode transform -n "polySurface4";
createNode mesh -n "polySurfaceShape4" -p "polySurface4";
	setAttr -k off ".v";
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ndt" 2;
	setAttr ".dn" yes;
createNode transform -n "pCylinder2";
	setAttr ".t" -type "double3" -17.146517867165571 6.3865040663778849 18.159926089845623 ;
	setAttr ".s" -type "double3" 0.093928502067077743 0.093928502067077743 0.093928502067077743 ;
createNode mesh -n "pCylinderShape2" -p "pCylinder2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pCylinder3";
	setAttr ".t" -type "double3" 17.431466891817031 6.3865040663778849 18.159926089845623 ;
	setAttr ".s" -type "double3" 0.093928502067077743 0.093928502067077743 0.093928502067077743 ;
createNode mesh -n "pCylinderShape3" -p "pCylinder3";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.375 0.3125 0.41666666
		 0.3125 0.45833331 0.3125 0.49999997 0.3125 0.54166663 0.3125 0.58333331 0.3125 0.625
		 0.3125 0.375 0.68843985 0.41666666 0.68843985 0.45833331 0.68843985 0.49999997 0.68843985
		 0.54166663 0.68843985 0.58333331 0.68843985 0.625 0.68843985 0.57812506 0.70843351
		 0.42187503 0.70843351 0.34375 0.84375 0.421875 0.97906649 0.578125 0.97906649 0.65625
		 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 13 ".vt[0:12]"  7.58376646 -5.50322485 -13.13546085 -7.58376026 -5.50322485 -13.13546371
		 -15.16752529 -5.50322485 -2.2601373e-06 -7.58376455 -5.50322485 13.13546181 7.58376217 -5.50322485 13.13546276
		 15.16752529 -5.50322485 0 7.58376646 5.50322485 -13.13546085 -7.58376026 5.50322485 -13.13546371
		 -15.16752529 5.50322485 -2.2601373e-06 -7.58376455 5.50322485 13.13546181 7.58376217 5.50322485 13.13546276
		 15.16752529 5.50322485 0 0 5.50322485 0;
	setAttr -s 30 ".ed[0:29]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 0 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 6 0 0 6 0 1 7 0 2 8 0 3 9 0 4 10 0 5 11 0 6 12 1 7 12 1
		 8 12 1 9 12 1 10 12 1 11 12 1 1 6 1 2 7 1 3 8 1 4 9 1 5 10 1 0 11 1;
	setAttr -s 18 ".fc[0:17]" -type "polyFaces" 
		f 3 0 24 -13
		mu 0 3 0 1 7
		f 3 -25 13 -7
		mu 0 3 7 1 8
		f 3 1 25 -14
		mu 0 3 1 2 8
		f 3 -26 14 -8
		mu 0 3 8 2 9
		f 3 2 26 -15
		mu 0 3 2 3 9
		f 3 -27 15 -9
		mu 0 3 9 3 10
		f 3 3 27 -16
		mu 0 3 3 4 10
		f 3 -28 16 -10
		mu 0 3 10 4 11
		f 3 4 28 -17
		mu 0 3 4 5 11
		f 3 -29 17 -11
		mu 0 3 11 5 12
		f 3 5 29 -18
		mu 0 3 5 6 12
		f 3 -30 12 -12
		mu 0 3 12 6 13
		f 3 6 19 -19
		mu 0 3 18 17 20
		f 3 7 20 -20
		mu 0 3 17 16 20
		f 3 8 21 -21
		mu 0 3 16 15 20
		f 3 9 22 -22
		mu 0 3 15 14 20
		f 3 10 23 -23
		mu 0 3 14 19 20
		f 3 11 18 -24
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCylinder4";
	setAttr ".t" -type "double3" 17.431466891817031 6.3865040663778849 -18.512710616997136 ;
	setAttr ".s" -type "double3" 0.093928502067077743 0.093928502067077743 0.093928502067077743 ;
createNode mesh -n "pCylinderShape4" -p "pCylinder4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.375 0.3125 0.41666666
		 0.3125 0.45833331 0.3125 0.49999997 0.3125 0.54166663 0.3125 0.58333331 0.3125 0.625
		 0.3125 0.375 0.68843985 0.41666666 0.68843985 0.45833331 0.68843985 0.49999997 0.68843985
		 0.54166663 0.68843985 0.58333331 0.68843985 0.625 0.68843985 0.57812506 0.70843351
		 0.42187503 0.70843351 0.34375 0.84375 0.421875 0.97906649 0.578125 0.97906649 0.65625
		 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 13 ".vt[0:12]"  7.58376646 -5.50322485 -13.13546085 -7.58376026 -5.50322485 -13.13546371
		 -15.16752529 -5.50322485 -2.2601373e-06 -7.58376455 -5.50322485 13.13546181 7.58376217 -5.50322485 13.13546276
		 15.16752529 -5.50322485 0 7.58376646 5.50322485 -13.13546085 -7.58376026 5.50322485 -13.13546371
		 -15.16752529 5.50322485 -2.2601373e-06 -7.58376455 5.50322485 13.13546181 7.58376217 5.50322485 13.13546276
		 15.16752529 5.50322485 0 0 5.50322485 0;
	setAttr -s 30 ".ed[0:29]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 0 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 6 0 0 6 0 1 7 0 2 8 0 3 9 0 4 10 0 5 11 0 6 12 1 7 12 1
		 8 12 1 9 12 1 10 12 1 11 12 1 1 6 1 2 7 1 3 8 1 4 9 1 5 10 1 0 11 1;
	setAttr -s 18 ".fc[0:17]" -type "polyFaces" 
		f 3 0 24 -13
		mu 0 3 0 1 7
		f 3 -25 13 -7
		mu 0 3 7 1 8
		f 3 1 25 -14
		mu 0 3 1 2 8
		f 3 -26 14 -8
		mu 0 3 8 2 9
		f 3 2 26 -15
		mu 0 3 2 3 9
		f 3 -27 15 -9
		mu 0 3 9 3 10
		f 3 3 27 -16
		mu 0 3 3 4 10
		f 3 -28 16 -10
		mu 0 3 10 4 11
		f 3 4 28 -17
		mu 0 3 4 5 11
		f 3 -29 17 -11
		mu 0 3 11 5 12
		f 3 5 29 -18
		mu 0 3 5 6 12
		f 3 -30 12 -12
		mu 0 3 12 6 13
		f 3 6 19 -19
		mu 0 3 18 17 20
		f 3 7 20 -20
		mu 0 3 17 16 20
		f 3 8 21 -21
		mu 0 3 16 15 20
		f 3 9 22 -22
		mu 0 3 15 14 20
		f 3 10 23 -23
		mu 0 3 14 19 20
		f 3 11 18 -24
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCylinder5";
	setAttr ".t" -type "double3" -17.845120600135097 6.3865040663778849 -17.885427490407871 ;
	setAttr ".s" -type "double3" 0.093928502067077743 0.093928502067077743 0.093928502067077743 ;
createNode mesh -n "pCylinderShape5" -p "pCylinder5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.375 0.3125 0.41666666
		 0.3125 0.45833331 0.3125 0.49999997 0.3125 0.54166663 0.3125 0.58333331 0.3125 0.625
		 0.3125 0.375 0.68843985 0.41666666 0.68843985 0.45833331 0.68843985 0.49999997 0.68843985
		 0.54166663 0.68843985 0.58333331 0.68843985 0.625 0.68843985 0.57812506 0.70843351
		 0.42187503 0.70843351 0.34375 0.84375 0.421875 0.97906649 0.578125 0.97906649 0.65625
		 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 13 ".vt[0:12]"  7.58376646 -5.50322485 -13.13546085 -7.58376026 -5.50322485 -13.13546371
		 -15.16752529 -5.50322485 -2.2601373e-06 -7.58376455 -5.50322485 13.13546181 7.58376217 -5.50322485 13.13546276
		 15.16752529 -5.50322485 0 7.58376646 5.50322485 -13.13546085 -7.58376026 5.50322485 -13.13546371
		 -15.16752529 5.50322485 -2.2601373e-06 -7.58376455 5.50322485 13.13546181 7.58376217 5.50322485 13.13546276
		 15.16752529 5.50322485 0 0 5.50322485 0;
	setAttr -s 30 ".ed[0:29]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 0 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 6 0 0 6 0 1 7 0 2 8 0 3 9 0 4 10 0 5 11 0 6 12 1 7 12 1
		 8 12 1 9 12 1 10 12 1 11 12 1 1 6 1 2 7 1 3 8 1 4 9 1 5 10 1 0 11 1;
	setAttr -s 18 ".fc[0:17]" -type "polyFaces" 
		f 3 0 24 -13
		mu 0 3 0 1 7
		f 3 -25 13 -7
		mu 0 3 7 1 8
		f 3 1 25 -14
		mu 0 3 1 2 8
		f 3 -26 14 -8
		mu 0 3 8 2 9
		f 3 2 26 -15
		mu 0 3 2 3 9
		f 3 -27 15 -9
		mu 0 3 9 3 10
		f 3 3 27 -16
		mu 0 3 3 4 10
		f 3 -28 16 -10
		mu 0 3 10 4 11
		f 3 4 28 -17
		mu 0 3 4 5 11
		f 3 -29 17 -11
		mu 0 3 11 5 12
		f 3 5 29 -18
		mu 0 3 5 6 12
		f 3 -30 12 -12
		mu 0 3 12 6 13
		f 3 6 19 -19
		mu 0 3 18 17 20
		f 3 7 20 -20
		mu 0 3 17 16 20
		f 3 8 21 -21
		mu 0 3 16 15 20
		f 3 9 22 -22
		mu 0 3 15 14 20
		f 3 10 23 -23
		mu 0 3 14 19 20
		f 3 11 18 -24
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 7 ".lnk";
	setAttr -s 7 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode lambert -n "lambert2";
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode file -n "file1";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/plat_wood2.png";
createNode place2dTexture -n "place2dTexture1";
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n"
		+ "                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n"
		+ "            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n"
		+ "            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n"
		+ "                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n"
		+ "                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n"
		+ "                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n"
		+ "            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n"
		+ "                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n"
		+ "            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n"
		+ "            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n"
		+ "                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n"
		+ "                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n"
		+ "                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n"
		+ "            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n"
		+ "            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n"
		+ "            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -showShapes 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n"
		+ "                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n"
		+ "                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n"
		+ "            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n"
		+ "                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n"
		+ "                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n"
		+ "                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n"
		+ "                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n"
		+ "                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n"
		+ "            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"quad\\\" -ps 1 52 71 -ps 2 48 71 -ps 3 50 29 -ps 4 50 29 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Top View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Top View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera top` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Top View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera top` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Side View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Side View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera side` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Side View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera side` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Front View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Front View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera front` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Front View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera front` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode polyCylinder -n "polyCylinder1";
	setAttr ".r" 23.276529734865537;
	setAttr ".h" 41.678145458396415;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode polyTweak -n "polyTweak1";
	setAttr ".uopa" yes;
	setAttr -s 22 ".tk";
	setAttr ".tk[20:39]" -type "float3" 0 -31.867029 -2.6645353e-15  0 -31.867029 
		0  0 -31.867029 1.0658141e-14  0 -31.867029 1.0658141e-14  0 -31.867029 1.0658141e-14  
		0 -31.867029 1.0658141e-14  0 -31.867029 1.0658141e-14  0 -31.867029 0  0 -31.867029 
		-2.6645353e-15  0 -31.867029 0  0 -31.867029 -2.6645353e-15  0 -31.867029 0  0 -31.867029 
		1.0658141e-14  0 -31.867029 1.0658141e-14  0 -31.867029 1.0658141e-14  0 -31.867029 
		1.0658141e-14  0 -31.867029 1.0658141e-14  0 -31.867029 0  0 -31.867029 -2.6645353e-15  
		0 -31.867029 0 ;
	setAttr ".tk[41]" -type "float3" 0 -31.867029 0 ;
createNode deleteComponent -n "deleteComponent1";
	setAttr ".dc" -type "componentList" 1 "f[20:39]";
createNode polyExtrudeFace -n "polyExtrudeFace1";
	setAttr ".ics" -type "componentList" 1 "f[20:39]";
	setAttr ".ix" -type "matrix" 1.197507750280667 0 0 0 0 1.197507750280667 0 0 0 0 1.197507750280667 0
		 0.072260415234324249 19.27081182468315 0.01157505986202878 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.07225699 6.0647492 0.01156935 ;
	setAttr ".rs" 1296747321;
	setAttr ".lt" -type "double3" 0 -6.7364790835259001e-16 4.9661595309643616 ;
	setAttr ".ls" -type "double3" 0.59343318716532034 0.61332077040726896 1 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -27.801570687875323 6.064749034257817 -27.86226289544193 ;
	setAttr ".cbx" -type "double3" 27.946084666149662 6.064749034257817 27.885401594842136 ;
createNode polyExtrudeFace -n "polyExtrudeFace2";
	setAttr ".ics" -type "componentList" 1 "f[20:39]";
	setAttr ".ix" -type "matrix" 1.197507750280667 0 0 0 0 1.197507750280667 0 0 0 0 1.197507750280667 0
		 0.072260415234324249 19.27081182468315 0.01157505986202878 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.07225699 11.030909 0.01156935 ;
	setAttr ".rs" 1622385493;
	setAttr ".lt" -type "double3" -6.1244113740247267e-16 2.570923930626909e-16 6.2730436062583026 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -22.744358926184358 11.030907695913946 -23.052431336825702 ;
	setAttr ".cbx" -type "double3" 22.888872904458697 11.030908837946331 23.075570036225908 ;
createNode lambert -n "chrome_sphere_map";
createNode shadingEngine -n "lambert3SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode file -n "file2";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/chrome.png";
createNode place2dTexture -n "place2dTexture2";
createNode file -n "file3";
createNode place2dTexture -n "place2dTexture3";
createNode file -n "file4";
createNode place2dTexture -n "place2dTexture4";
createNode lambert -n "lambert4";
createNode shadingEngine -n "lambert4SG";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 5 ".gn";
createNode materialInfo -n "materialInfo3";
createNode file -n "file5";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/chrome.png";
createNode place2dTexture -n "place2dTexture5";
createNode polyChipOff -n "polyChipOff1";
	setAttr ".ics" -type "componentList" 2 "f[14:17]" "f[20:39]";
	setAttr ".ix" -type "matrix" 1.197507750280667 0 0 0 0 1.197507750280667 0 0 0 0 1.197507750280667 0
		 0.072260415234324249 19.27081182468315 0.01157505986202878 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0.07225585 5.2135987 0.01156935 ;
	setAttr ".rs" 1733602317;
	setAttr ".dup" no;
createNode polyTweak -n "polyTweak2";
	setAttr ".uopa" yes;
	setAttr -s 61 ".tk";
	setAttr ".tk[0:19]" -type "float3" 5.9624233 0 -1.9373066  5.0719409 0 
		-3.6849771  3.6849813 0 -5.0719376  1.9373097 0 -5.9624214  1.5411658e-06 0 -6.2692614  
		-1.9373063 0 -5.9624214  -3.6849771 0 -5.0719371  -5.0719366 0 -3.6849759  -5.9624205 
		0 -1.9373063  -6.2692604 0 1.2843044e-06  -5.9624205 0 1.937309  -5.0719366 0 3.6849806  
		-3.6849761 0 5.0719376  -1.937306 0 5.9624214  1.3555436e-06 0 6.2692614  1.9373091 
		0 5.9624214  3.6849799 0 5.0719376  5.0719376 0 3.6849804  5.9624214 0 1.9373088  
		6.2692604 0 1.2843044e-06 ;
	setAttr ".tk[40:80]" -type "float3" 0 -4.1470795 0  0 -4.1470795 0  0 -4.1470795 
		0  0 -4.1470795 0  0 -4.1470795 0  0 -4.1470795 0  0 -4.1470795 0  0 -4.1470795 0  
		0 -4.1470795 0  0 -4.1470795 0  0 -4.1470795 0  0 -4.1470795 0  0 -4.1470795 0  0 
		-4.1470795 0  0 -4.1470795 0  0 -4.1470795 0  0 -4.1470795 0  0 -4.1470795 0  0 -4.1470795 
		0  0 -4.1470795 0  -1.0981824 -10.096263 0.36068997  -0.93417048 -10.096263 0.68607306  
		-2.3118274e-07 -10.096263 -2.8768002e-07  -0.67871451 -10.096263 0.94429785  -0.3568216 
		-10.096263 1.1100892  -2.3231186e-07 -10.096263 1.1672168  0.35682067 -10.096263 
		1.1100888  0.67871463 -10.096263 0.94429851  0.93416905 -10.096263 0.68607289  1.0981827 
		-10.096263 0.36068982  1.1546972 -10.096263 -2.866079e-07  1.0981827 -10.096263 -0.36069065  
		0.93416971 -10.096263 -0.68607408  0.67871362 -10.096263 -0.94429803  0.35682061 
		-10.096263 -1.1100895  -1.9776961e-07 -10.096263 -1.1672168  -0.35682136 -10.096263 
		-1.1100892  -0.67871517 -10.096263 -0.94429803  -0.93417001 -10.096263 -0.68607408  
		-1.0981827 -10.096263 -0.36068988  -1.1546972 -10.096263 -2.6702259e-07 ;
createNode polySeparate -n "polySeparate1";
	setAttr ".ic" 3;
	setAttr -s 3 ".out";
createNode groupId -n "groupId1";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:79]";
createNode groupId -n "groupId2";
	setAttr ".ihi" 0;
createNode groupId -n "groupId3";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 56 "f[0]" "f[1]" "f[2]" "f[3]" "f[4]" "f[5]" "f[6]" "f[7]" "f[8]" "f[9]" "f[10]" "f[11]" "f[12]" "f[13]" "f[14]" "f[15]" "f[16]" "f[17]" "f[18]" "f[19]" "f[20]" "f[21]" "f[22]" "f[23]" "f[24]" "f[25]" "f[26]" "f[27]" "f[28]" "f[29]" "f[30]" "f[31]" "f[32]" "f[33]" "f[34]" "f[35]" "f[36]" "f[37]" "f[38]" "f[39]" "f[40]" "f[41]" "f[42]" "f[43]" "f[44]" "f[45]" "f[46]" "f[47]" "f[48]" "f[49]" "f[50]" "f[51]" "f[52]" "f[53]" "f[54]" "f[55]";
createNode groupId -n "groupId4";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 4 "f[0]" "f[1]" "f[2]" "f[3]";
createNode lambert -n "lambert5";
createNode shadingEngine -n "lambert5SG";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
createNode file -n "file6";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/spiral256.png";
createNode place2dTexture -n "place2dTexture6";
createNode polyPipe -n "polyPipe1";
	setAttr ".ax" -type "double3" 0 1.0000000000000002 2.2204460492503131e-16 ;
	setAttr ".r" 16.983077922973958;
	setAttr ".h" 87.975072025374544;
	setAttr ".t" 8.6;
createNode deleteComponent -n "deleteComponent2";
	setAttr ".dc" -type "componentList" 2 "f[29]" "f[31:38]";
createNode deleteComponent -n "deleteComponent3";
	setAttr ".dc" -type "componentList" 3 "f[20:30]" "f[60]" "f[62:69]";
createNode deleteComponent -n "deleteComponent4";
	setAttr ".dc" -type "componentList" 1 "f[40:50]";
createNode lambert -n "lambert6";
createNode shadingEngine -n "lambert6SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo5";
createNode groupId -n "groupId5";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts4";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:39]";
createNode groupId -n "groupId6";
	setAttr ".ihi" 0;
createNode file -n "file7";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/transporter1.png";
createNode place2dTexture -n "place2dTexture7";
createNode polyTweakUV -n "polyTweakUV1";
	setAttr ".uopa" yes;
	setAttr -s 84 ".uvtk[0:83]" -type "float2" 1.0011026859 -0.0047554541
		 0.90142512 -0.054537855 0.80174732 -0.10432025 0.70206982 -0.15410267 0.60239214
		 -0.20388505 0.50271451 -0.25366744 0.40303683 -0.30344984 0.30335921 -0.35323223
		 0.20368151 -0.40301463 0.10400377 -0.45279709 0.0043263026 -0.50257939 -0.095351472
		 -0.55236173 -0.19502921 -0.60214418 -0.29470673 -0.65192646 -0.39438447 -0.70170891
		 -0.49406222 -0.75149149 -0.59373987 -0.8012737 -0.69341767 -0.85105622 -0.79309523
		 -0.90083855 -0.89277291 -0.95062095 -0.9924503 -1.00040340424 0.99729449 -0.75417113
		 0.89777571 -0.80408657 0.79825687 -0.85400206 0.69873816 -0.90391755 0.59921932 -0.95383298
		 0.49970055 -1.0037484169 0.40018177 -1.053663969 0.30066299 -1.10357952 0.20114428
		 -1.15349495 0.10162538 -1.20341039 0.0021067951 -1.25332582 -0.097412117 -1.30324149
		 -0.19693096 -1.35315704 -0.29644966 -1.40307248 -0.39596838 -1.45298791 -0.49548712
		 -1.50290334 -0.59500599 -1.55281878 -0.69452459 -1.60273445 -0.7940433 -1.65264988
		 -0.89356226 -1.70256543 -0.99308091 -1.75248086 1.0039037466 0.4924877 0.90422606
		 0.44270536 0.80454838 0.39292291 0.70487076 0.34314051 0.6051932 0.29335824 0.50551552
		 0.24357586 0.40583783 0.19379349 0.30616021 0.14401102 0.20648251 0.094228603 0.10680483
		 0.044446304 0.0071273036 -0.0053361375 -0.092550531 -0.055118568 -0.19222815 -0.10490101
		 -0.29190567 -0.15468331 -0.39158341 -0.20446573 -0.49126104 -0.25424826 -0.59093875
		 -0.30403057 -0.69061649 -0.35381305 -0.79029417 -0.40359536 -0.88997185 -0.45337781
		 -0.98964912 -0.50316006 1.001912117 -0.25452992 0.90239346 -0.30444542 0.80287451
		 -0.35436094 0.70335585 -0.40427631 0.60383701 -0.45419186 0.5043183 -0.50410736 0.4047994
		 -0.55402291 0.30528069 -0.60393834 0.20576192 -0.65385383 0.10624314 -0.70376933
		 0.0067242775 -0.75368476 -0.09279447 -0.80360031 -0.19231339 -0.85351586 -0.29183203
		 -0.9034313 -0.39135098 -0.95334679 -0.49086952 -1.0032622814 -0.59038836 -1.053177834
		 -0.68990725 -1.10309327 -0.78942597 -1.1530087 -0.88894469 -1.20292425 -0.98846346
		 -1.25283957;
createNode polyTriangulate -n "polyTriangulate1";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyTweak -n "polyTweak3";
	setAttr ".uopa" yes;
	setAttr -s 80 ".tk[0:79]" -type "float3"  -48.63431549 1.9073486e-06
		 -1.8159009e-06 -49.13786316 1.9073486e-06 -3.36461806 -50.59919357 1.9073486e-06
		 -6.39987898 -52.87528992 1.9073486e-06 -8.80867767 -55.74328995 1.9073486e-06 -10.35521889
		 -58.92255402 1.9073486e-06 -10.88811874 -62.10181808 1.9073486e-06 -10.35521889 -64.96982574
		 1.9073486e-06 -8.80867767 -67.24591827 1.9073486e-06 -6.39987946 -68.70729065 1.9073486e-06
		 -3.36461759 -69.21083832 1.9073486e-06 -1.506238e-06 -68.70729065 1.9073486e-06 3.36461496
		 -67.24591827 1.9073486e-06 6.39987898 -64.96982574 1.9073486e-06 8.80867863 -62.10181808
		 1.9073486e-06 10.35521889 -58.92255402 1.9073486e-06 10.88811874 -55.74328995 1.9073486e-06
		 10.35521889 -52.8752861 1.9073486e-06 8.80867767 -50.59919357 1.9073486e-06 6.39987898
		 -49.13785934 1.9073486e-06 3.36461473 -48.63431549 -1.9073486e-06 -1.8159009e-06
		 -49.13786316 -1.9073486e-06 -3.36461806 -50.59919357 -1.9073486e-06 -6.39987898 -52.87528992
		 -1.9073486e-06 -8.80867767 -55.74328995 -1.9073486e-06 -10.35521889 -58.92255402
		 -1.9073486e-06 -10.88811874 -62.10181808 -1.9073486e-06 -10.35521889 -64.96982574
		 -1.9073486e-06 -8.80867767 -67.24591827 -1.9073486e-06 -6.39987946 -68.70729065 -1.9073486e-06
		 -3.36461759 -69.21083832 -1.9073486e-06 -1.506238e-06 -68.70729065 -1.9073486e-06
		 3.36461496 -67.24591827 -1.9073486e-06 6.39987898 -64.96982574 -1.9073486e-06 8.80867863
		 -62.10181808 -1.9073486e-06 10.35521889 -58.92255402 -1.9073486e-06 10.88811874 -55.74328995
		 -1.9073486e-06 10.35521889 -52.8752861 -1.9073486e-06 8.80867767 -50.59919357 -1.9073486e-06
		 6.39987898 -49.13785934 -1.9073486e-06 3.36461473 -55.67017365 0 -7.6966501e-07 -55.82935333
		 0 -1.058865428 -56.29135132 0 -2.01408124 -57.010852814 0 -2.77214479 -57.91751862
		 0 -3.25885177 -58.92255402 0 -3.42655897 -59.92758942 0 -3.25885177 -60.83425522
		 0 -2.77214479 -61.55375671 0 -2.014081478 -62.0157547 0 -1.058866024 -62.17493439
		 0 -1.0582893e-06 -62.0157547 0 1.058864117 -61.55375671 0 2.014079571 -60.83425522
		 0 2.77214432 -59.92758942 0 3.25885129 -58.92255402 0 3.42655897 -57.91751862 0 3.25885177
		 -57.010852814 0 2.77214479 -56.29130936 0 2.01408124 -55.82935333 0 1.058864713 -55.67017365
		 0 -7.6966501e-07 -55.82935333 0 -1.058865428 -56.29135132 0 -2.01408124 -57.010852814
		 0 -2.77214479 -57.91751862 0 -3.25885177 -58.92255402 0 -3.42655897 -59.92758942
		 0 -3.25885177 -60.83425522 0 -2.77214479 -61.55375671 0 -2.014081478 -62.0157547
		 0 -1.058866024 -62.17493439 0 -1.0582893e-06 -62.0157547 0 1.058864117 -61.55375671
		 0 2.014079571 -60.83425522 0 2.77214432 -59.92758942 0 3.25885129 -58.92255402 0
		 3.42655897 -57.91751862 0 3.25885177 -57.010852814 0 2.77214479 -56.29130936 0 2.01408124
		 -55.82935333 0 1.058864713;
createNode polyUnite -n "polyUnite1";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "groupId7";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts5";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:59]";
createNode polyTriangulate -n "polyTriangulate2";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyNormalPerVertex -n "polyNormalPerVertex1";
	setAttr ".uopa" yes;
	setAttr -s 84 ".vn";
	setAttr -s 3 ".vn[0].vfnl";
	setAttr ".vn[0].vfnl[0].fnxy" -type "float3" 0.21786913 0.53792083 0.81435513 ;
	setAttr ".vn[0].vfnl[1].fnxy" -type "float3" 0.21786913 0.53792083 0.81435513 ;
	setAttr ".vn[0].vfnl[2].fnxy" -type "float3" 0.21786913 0.53792083 0.81435513 ;
	setAttr -s 3 ".vn[1].vfnl";
	setAttr ".vn[1].vfnl[2].fnxy" -type "float3" 0.45885533 0.53792095 0.70717239 ;
	setAttr ".vn[1].vfnl[3].fnxy" -type "float3" 0.45885533 0.53792095 0.70717239 ;
	setAttr ".vn[1].vfnl[4].fnxy" -type "float3" 0.45885533 0.53792095 0.70717239 ;
	setAttr -s 3 ".vn[2].vfnl";
	setAttr ".vn[2].vfnl[4].fnxy" -type "float3" 0.65492558 0.53792089 0.53076714 ;
	setAttr ".vn[2].vfnl[5].fnxy" -type "float3" 0.65492558 0.53792089 0.53076714 ;
	setAttr ".vn[2].vfnl[6].fnxy" -type "float3" 0.65492558 0.53792089 0.53076714 ;
	setAttr -s 3 ".vn[3].vfnl";
	setAttr ".vn[3].vfnl[1].fnxy" -type "float3" 0.30240628 0.53792089 0.78688723 ;
	setAttr ".vn[3].vfnl[2].fnxy" -type "float3" 0.30240628 0.53792089 0.78688723 ;
	setAttr ".vn[3].vfnl[3].fnxy" -type "float3" 0.30240628 0.53792089 0.78688723 ;
	setAttr -s 2 ".vn[4].vfnl";
	setAttr ".vn[4].vfnl[0].fnxy" -type "float3" 0.044443883 0.53792077 0.84182298 ;
	setAttr ".vn[4].vfnl[1].fnxy" -type "float3" 0.044443883 0.53792077 0.84182298 ;
	setAttr ".vn[5].vfnl[0].fnxy" -type "float3" -0.04444389 0.53792071 0.84182298 ;
	setAttr -s 3 ".vn[6].vfnl";
	setAttr ".vn[6].vfnl[3].fnxy" -type "float3" 0.53076696 0.53792089 0.6549257 ;
	setAttr ".vn[6].vfnl[4].fnxy" -type "float3" 0.53076696 0.53792089 0.6549257 ;
	setAttr ".vn[6].vfnl[5].fnxy" -type "float3" 0.53076696 0.53792089 0.6549257 ;
	setAttr -s 3 ".vn[7].vfnl";
	setAttr ".vn[7].vfnl[5].fnxy" -type "float3" 0.70717251 0.53792101 0.45885527 ;
	setAttr ".vn[7].vfnl[6].fnxy" -type "float3" 0.70717251 0.53792101 0.45885527 ;
	setAttr ".vn[7].vfnl[7].fnxy" -type "float3" 0.70717251 0.53792101 0.45885527 ;
	setAttr -s 2 ".vn[8].vfnl";
	setAttr ".vn[8].vfnl[6].fnxy" -type "float3" 0.78688705 0.53792119 0.3024061 ;
	setAttr ".vn[8].vfnl[7].fnxy" -type "float3" 0.78688705 0.53792119 0.3024061 ;
	setAttr ".vn[9].vfnl[7].fnxy" -type "float3" 0.81435496 0.53792113 0.2178686 ;
	setAttr -s 3 ".vn[10].vfnl";
	setAttr ".vn[10].vfnl[8].fnxy" -type "float3" 0.81435513 0.53792125 -0.21786791 ;
	setAttr ".vn[10].vfnl[38].fnxy" -type "float3" 0.81435513 0.53792125 -0.21786791 ;
	setAttr ".vn[10].vfnl[39].fnxy" -type "float3" 0.81435513 0.53792125 -0.21786791 ;
	setAttr -s 3 ".vn[11].vfnl";
	setAttr ".vn[11].vfnl[8].fnxy" -type "float3" 0.70717245 0.53792101 -0.45885542 ;
	setAttr ".vn[11].vfnl[9].fnxy" -type "float3" 0.70717245 0.53792101 -0.45885542 ;
	setAttr ".vn[11].vfnl[10].fnxy" -type "float3" 0.70717245 0.53792101 -0.45885542 ;
	setAttr -s 3 ".vn[12].vfnl";
	setAttr ".vn[12].vfnl[10].fnxy" -type "float3" 0.53076714 0.53792095 -0.65492547 ;
	setAttr ".vn[12].vfnl[11].fnxy" -type "float3" 0.53076714 0.53792095 -0.65492547 ;
	setAttr ".vn[12].vfnl[12].fnxy" -type "float3" 0.53076714 0.53792095 -0.65492547 ;
	setAttr -s 3 ".vn[13].vfnl";
	setAttr ".vn[13].vfnl[12].fnxy" -type "float3" 0.30240619 0.53792113 -0.78688711 ;
	setAttr ".vn[13].vfnl[13].fnxy" -type "float3" 0.30240619 0.53792113 -0.78688711 ;
	setAttr ".vn[13].vfnl[14].fnxy" -type "float3" 0.30240619 0.53792113 -0.78688711 ;
	setAttr -s 3 ".vn[14].vfnl";
	setAttr ".vn[14].vfnl[14].fnxy" -type "float3" 0.044443768 0.53792107 -0.84182286 ;
	setAttr ".vn[14].vfnl[15].fnxy" -type "float3" 0.044443768 0.53792107 -0.84182286 ;
	setAttr ".vn[14].vfnl[16].fnxy" -type "float3" 0.044443768 0.53792107 -0.84182286 ;
	setAttr -s 3 ".vn[15].vfnl";
	setAttr ".vn[15].vfnl[16].fnxy" -type "float3" -0.21786897 0.53792113 -0.81435502 ;
	setAttr ".vn[15].vfnl[17].fnxy" -type "float3" -0.21786897 0.53792113 -0.81435502 ;
	setAttr ".vn[15].vfnl[18].fnxy" -type "float3" -0.21786897 0.53792113 -0.81435502 ;
	setAttr -s 3 ".vn[16].vfnl";
	setAttr ".vn[16].vfnl[18].fnxy" -type "float3" -0.45885557 0.53792095 -0.70717227 ;
	setAttr ".vn[16].vfnl[19].fnxy" -type "float3" -0.45885557 0.53792095 -0.70717227 ;
	setAttr ".vn[16].vfnl[20].fnxy" -type "float3" -0.45885557 0.53792095 -0.70717227 ;
	setAttr -s 3 ".vn[17].vfnl";
	setAttr ".vn[17].vfnl[20].fnxy" -type "float3" -0.654926 0.53792083 -0.53076661 ;
	setAttr ".vn[17].vfnl[21].fnxy" -type "float3" -0.654926 0.53792083 -0.53076661 ;
	setAttr ".vn[17].vfnl[22].fnxy" -type "float3" -0.654926 0.53792083 -0.53076661 ;
	setAttr -s 3 ".vn[18].vfnl";
	setAttr ".vn[18].vfnl[22].fnxy" -type "float3" -0.78688717 0.53792101 -0.3024064 ;
	setAttr ".vn[18].vfnl[23].fnxy" -type "float3" -0.78688717 0.53792101 -0.3024064 ;
	setAttr ".vn[18].vfnl[24].fnxy" -type "float3" -0.78688717 0.53792101 -0.3024064 ;
	setAttr -s 3 ".vn[19].vfnl";
	setAttr ".vn[19].vfnl[24].fnxy" -type "float3" -0.84182292 0.53792083 -0.044443946 ;
	setAttr ".vn[19].vfnl[25].fnxy" -type "float3" -0.84182292 0.53792083 -0.044443946 ;
	setAttr ".vn[19].vfnl[26].fnxy" -type "float3" -0.84182292 0.53792083 -0.044443946 ;
	setAttr -s 3 ".vn[20].vfnl";
	setAttr ".vn[20].vfnl[26].fnxy" -type "float3" -0.81435525 0.53792071 0.21786913 ;
	setAttr ".vn[20].vfnl[27].fnxy" -type "float3" -0.81435525 0.53792071 0.21786913 ;
	setAttr ".vn[20].vfnl[28].fnxy" -type "float3" -0.81435525 0.53792071 0.21786913 ;
	setAttr -s 3 ".vn[21].vfnl";
	setAttr ".vn[21].vfnl[28].fnxy" -type "float3" -0.70717257 0.53792083 0.45885533 ;
	setAttr ".vn[21].vfnl[29].fnxy" -type "float3" -0.70717257 0.53792083 0.45885533 ;
	setAttr ".vn[21].vfnl[30].fnxy" -type "float3" -0.70717257 0.53792083 0.45885533 ;
	setAttr -s 3 ".vn[22].vfnl";
	setAttr ".vn[22].vfnl[30].fnxy" -type "float3" -0.53076684 0.53792083 0.65492576 ;
	setAttr ".vn[22].vfnl[31].fnxy" -type "float3" -0.53076684 0.53792083 0.65492576 ;
	setAttr ".vn[22].vfnl[32].fnxy" -type "float3" -0.53076684 0.53792083 0.65492576 ;
	setAttr -s 3 ".vn[23].vfnl";
	setAttr ".vn[23].vfnl[32].fnxy" -type "float3" -0.30240622 0.53792065 0.78688741 ;
	setAttr ".vn[23].vfnl[33].fnxy" -type "float3" -0.30240622 0.53792065 0.78688741 ;
	setAttr ".vn[23].vfnl[34].fnxy" -type "float3" -0.30240622 0.53792065 0.78688741 ;
	setAttr -s 2 ".vn[24].vfnl";
	setAttr ".vn[24].vfnl[34].fnxy" -type "float3" -0.04444389 0.53792071 0.84182298 ;
	setAttr ".vn[24].vfnl[35].fnxy" -type "float3" -0.04444389 0.53792071 0.84182298 ;
	setAttr ".vn[25].vfnl[36].fnxy" -type "float3" 0.78688705 0.53792119 0.3024061 ;
	setAttr -s 3 ".vn[26].vfnl";
	setAttr ".vn[26].vfnl[36].fnxy" -type "float3" 0.8418228 0.53792119 0.044444166 ;
	setAttr ".vn[26].vfnl[37].fnxy" -type "float3" 0.8418228 0.53792119 0.044444166 ;
	setAttr ".vn[26].vfnl[38].fnxy" -type "float3" 0.8418228 0.53792119 0.044444166 ;
	setAttr -s 3 ".vn[27].vfnl";
	setAttr ".vn[27].vfnl[8].fnxy" -type "float3" 0.78688735 0.53792113 -0.30240577 ;
	setAttr ".vn[27].vfnl[9].fnxy" -type "float3" 0.78688735 0.53792113 -0.30240577 ;
	setAttr ".vn[27].vfnl[39].fnxy" -type "float3" 0.78688735 0.53792113 -0.30240577 ;
	setAttr -s 3 ".vn[28].vfnl";
	setAttr ".vn[28].vfnl[9].fnxy" -type "float3" 0.6549257 0.53792083 -0.53076696 ;
	setAttr ".vn[28].vfnl[10].fnxy" -type "float3" 0.6549257 0.53792083 -0.53076696 ;
	setAttr ".vn[28].vfnl[11].fnxy" -type "float3" 0.6549257 0.53792083 -0.53076696 ;
	setAttr -s 3 ".vn[29].vfnl";
	setAttr ".vn[29].vfnl[11].fnxy" -type "float3" 0.45885539 0.53792107 -0.70717233 ;
	setAttr ".vn[29].vfnl[12].fnxy" -type "float3" 0.45885539 0.53792107 -0.70717233 ;
	setAttr ".vn[29].vfnl[13].fnxy" -type "float3" 0.45885539 0.53792107 -0.70717233 ;
	setAttr -s 3 ".vn[30].vfnl";
	setAttr ".vn[30].vfnl[13].fnxy" -type "float3" 0.2178687 0.53792113 -0.81435496 ;
	setAttr ".vn[30].vfnl[14].fnxy" -type "float3" 0.2178687 0.53792113 -0.81435496 ;
	setAttr ".vn[30].vfnl[15].fnxy" -type "float3" 0.2178687 0.53792113 -0.81435496 ;
	setAttr -s 3 ".vn[31].vfnl";
	setAttr ".vn[31].vfnl[15].fnxy" -type "float3" -0.044443786 0.53792113 -0.84182286 ;
	setAttr ".vn[31].vfnl[16].fnxy" -type "float3" -0.044443786 0.53792113 -0.84182286 ;
	setAttr ".vn[31].vfnl[17].fnxy" -type "float3" -0.044443786 0.53792113 -0.84182286 ;
	setAttr -s 3 ".vn[32].vfnl";
	setAttr ".vn[32].vfnl[17].fnxy" -type "float3" -0.30240628 0.53792113 -0.78688717 ;
	setAttr ".vn[32].vfnl[18].fnxy" -type "float3" -0.30240628 0.53792113 -0.78688717 ;
	setAttr ".vn[32].vfnl[19].fnxy" -type "float3" -0.30240628 0.53792113 -0.78688717 ;
	setAttr -s 3 ".vn[33].vfnl";
	setAttr ".vn[33].vfnl[19].fnxy" -type "float3" -0.53076738 0.53792089 -0.65492529 ;
	setAttr ".vn[33].vfnl[20].fnxy" -type "float3" -0.53076738 0.53792089 -0.65492529 ;
	setAttr ".vn[33].vfnl[21].fnxy" -type "float3" -0.53076738 0.53792089 -0.65492529 ;
	setAttr -s 3 ".vn[34].vfnl";
	setAttr ".vn[34].vfnl[21].fnxy" -type "float3" -0.70717275 0.53792083 -0.45885509 ;
	setAttr ".vn[34].vfnl[22].fnxy" -type "float3" -0.70717275 0.53792083 -0.45885509 ;
	setAttr ".vn[34].vfnl[23].fnxy" -type "float3" -0.70717275 0.53792083 -0.45885509 ;
	setAttr -s 3 ".vn[35].vfnl";
	setAttr ".vn[35].vfnl[23].fnxy" -type "float3" -0.81435508 0.53792095 -0.21786921 ;
	setAttr ".vn[35].vfnl[24].fnxy" -type "float3" -0.81435508 0.53792095 -0.21786921 ;
	setAttr ".vn[35].vfnl[25].fnxy" -type "float3" -0.81435508 0.53792095 -0.21786921 ;
	setAttr -s 3 ".vn[36].vfnl";
	setAttr ".vn[36].vfnl[25].fnxy" -type "float3" -0.8418231 0.53792071 0.044444006 ;
	setAttr ".vn[36].vfnl[26].fnxy" -type "float3" -0.8418231 0.53792071 0.044444006 ;
	setAttr ".vn[36].vfnl[27].fnxy" -type "float3" -0.8418231 0.53792071 0.044444006 ;
	setAttr -s 3 ".vn[37].vfnl";
	setAttr ".vn[37].vfnl[27].fnxy" -type "float3" -0.78688735 0.53792083 0.30240628 ;
	setAttr ".vn[37].vfnl[28].fnxy" -type "float3" -0.78688735 0.53792083 0.30240628 ;
	setAttr ".vn[37].vfnl[29].fnxy" -type "float3" -0.78688735 0.53792083 0.30240628 ;
	setAttr -s 3 ".vn[38].vfnl";
	setAttr ".vn[38].vfnl[29].fnxy" -type "float3" -0.65492547 0.53792095 0.53076708 ;
	setAttr ".vn[38].vfnl[30].fnxy" -type "float3" -0.65492547 0.53792095 0.53076708 ;
	setAttr ".vn[38].vfnl[31].fnxy" -type "float3" -0.65492547 0.53792095 0.53076708 ;
	setAttr -s 3 ".vn[39].vfnl";
	setAttr ".vn[39].vfnl[31].fnxy" -type "float3" -0.45885509 0.53792095 0.70717263 ;
	setAttr ".vn[39].vfnl[32].fnxy" -type "float3" -0.45885509 0.53792095 0.70717263 ;
	setAttr ".vn[39].vfnl[33].fnxy" -type "float3" -0.45885509 0.53792095 0.70717263 ;
	setAttr -s 3 ".vn[40].vfnl";
	setAttr ".vn[40].vfnl[33].fnxy" -type "float3" -0.21786904 0.53792077 0.81435513 ;
	setAttr ".vn[40].vfnl[34].fnxy" -type "float3" -0.21786904 0.53792077 0.81435513 ;
	setAttr ".vn[40].vfnl[35].fnxy" -type "float3" -0.21786904 0.53792077 0.81435513 ;
	setAttr ".vn[41].vfnl[35].fnxy" -type "float3" 0.044443883 0.53792077 0.84182298 ;
	setAttr -s 2 ".vn[45].vfnl";
	setAttr ".vn[45].vfnl[36].fnxy" -type "float3" 0.81435496 0.53792113 0.2178686 ;
	setAttr ".vn[45].vfnl[37].fnxy" -type "float3" 0.81435496 0.53792113 0.2178686 ;
	setAttr -s 3 ".vn[46].vfnl";
	setAttr ".vn[46].vfnl[37].fnxy" -type "float3" 0.84182286 0.53792113 -0.044442795 ;
	setAttr ".vn[46].vfnl[38].fnxy" -type "float3" 0.84182286 0.53792113 -0.044442795 ;
	setAttr ".vn[46].vfnl[39].fnxy" -type "float3" 0.84182286 0.53792113 -0.044442795 ;
	setAttr -s 3 ".vn[47].vfnl";
	setAttr ".vn[47].vfnl[80].fnxy" -type "float3" -0.48997942 0.85159326 0.18630372 ;
	setAttr ".vn[47].vfnl[81].fnxy" -type "float3" -0.48997942 0.85159326 0.18630372 ;
	setAttr ".vn[47].vfnl[118].fnxy" -type "float3" -0.48997942 0.85159326 0.18630372 ;
	setAttr -s 3 ".vn[48].vfnl";
	setAttr ".vn[48].vfnl[80].fnxy" -type "float3" -0.40811715 0.85226387 0.32724124 ;
	setAttr ".vn[48].vfnl[82].fnxy" -type "float3" -0.40811715 0.85226387 0.32724124 ;
	setAttr ".vn[48].vfnl[83].fnxy" -type "float3" -0.40811715 0.85226387 0.32724124 ;
	setAttr -s 3 ".vn[49].vfnl";
	setAttr ".vn[49].vfnl[82].fnxy" -type "float3" -0.28618184 0.85303599 0.43638232 ;
	setAttr ".vn[49].vfnl[84].fnxy" -type "float3" -0.28618184 0.85303599 0.43638232 ;
	setAttr ".vn[49].vfnl[85].fnxy" -type "float3" -0.28618184 0.85303599 0.43638232 ;
	setAttr -s 3 ".vn[50].vfnl";
	setAttr ".vn[50].vfnl[84].fnxy" -type "float3" -0.13596742 0.85361433 0.50284731 ;
	setAttr ".vn[50].vfnl[86].fnxy" -type "float3" -0.13596742 0.85361433 0.50284731 ;
	setAttr ".vn[50].vfnl[87].fnxy" -type "float3" -0.13596742 0.85361433 0.50284731 ;
	setAttr -s 2 ".vn[51].vfnl";
	setAttr ".vn[51].vfnl[86].fnxy" -type "float3" 1.7569459e-07 0.85410511 0.52010041 ;
	setAttr ".vn[51].vfnl[88].fnxy" -type "float3" 1.7569459e-07 0.85410511 0.52010041 ;
	setAttr -s 3 ".vn[52].vfnl";
	setAttr ".vn[52].vfnl[88].fnxy" -type "float3" 0.13596764 0.85361409 0.50284755 ;
	setAttr ".vn[52].vfnl[89].fnxy" -type "float3" 0.13596764 0.85361409 0.50284755 ;
	setAttr ".vn[52].vfnl[90].fnxy" -type "float3" 0.13596764 0.85361409 0.50284755 ;
	setAttr -s 3 ".vn[53].vfnl";
	setAttr ".vn[53].vfnl[90].fnxy" -type "float3" 0.2861819 0.85303599 0.43638232 ;
	setAttr ".vn[53].vfnl[91].fnxy" -type "float3" 0.2861819 0.85303599 0.43638232 ;
	setAttr ".vn[53].vfnl[92].fnxy" -type "float3" 0.2861819 0.85303599 0.43638232 ;
	setAttr -s 3 ".vn[54].vfnl";
	setAttr ".vn[54].vfnl[92].fnxy" -type "float3" 0.40811715 0.85226387 0.32724124 ;
	setAttr ".vn[54].vfnl[93].fnxy" -type "float3" 0.40811715 0.85226387 0.32724124 ;
	setAttr ".vn[54].vfnl[94].fnxy" -type "float3" 0.40811715 0.85226387 0.32724124 ;
	setAttr -s 3 ".vn[55].vfnl";
	setAttr ".vn[55].vfnl[94].fnxy" -type "float3" 0.48997986 0.85159296 0.18630408 ;
	setAttr ".vn[55].vfnl[95].fnxy" -type "float3" 0.48997986 0.85159296 0.18630408 ;
	setAttr ".vn[55].vfnl[96].fnxy" -type "float3" 0.48997986 0.85159296 0.18630408 ;
	setAttr -s 4 ".vn[56].vfnl";
	setAttr ".vn[56].vfnl[96].fnxy" -type "float3" 0.52419549 0.85159802 -5.6067524e-09 ;
	setAttr ".vn[56].vfnl[97].fnxy" -type "float3" 0.52419549 0.85159802 -5.6067524e-09 ;
	setAttr ".vn[56].vfnl[98].fnxy" -type "float3" 0.52419549 0.85159802 -5.6067524e-09 ;
	setAttr ".vn[56].vfnl[99].fnxy" -type "float3" 0.52419549 0.85159802 -5.6067524e-09 ;
	setAttr -s 3 ".vn[57].vfnl";
	setAttr ".vn[57].vfnl[98].fnxy" -type "float3" 0.48997876 0.85159367 -0.18630384 ;
	setAttr ".vn[57].vfnl[100].fnxy" -type "float3" 0.48997876 0.85159367 -0.18630384 ;
	setAttr ".vn[57].vfnl[101].fnxy" -type "float3" 0.48997876 0.85159367 -0.18630384 ;
	setAttr -s 3 ".vn[58].vfnl";
	setAttr ".vn[58].vfnl[100].fnxy" -type "float3" 0.40811709 0.85226375 -0.32724136 ;
	setAttr ".vn[58].vfnl[102].fnxy" -type "float3" 0.40811709 0.85226375 -0.32724136 ;
	setAttr ".vn[58].vfnl[103].fnxy" -type "float3" 0.40811709 0.85226375 -0.32724136 ;
	setAttr -s 3 ".vn[59].vfnl";
	setAttr ".vn[59].vfnl[102].fnxy" -type "float3" 0.28618151 0.85303599 -0.43638247 ;
	setAttr ".vn[59].vfnl[104].fnxy" -type "float3" 0.28618151 0.85303599 -0.43638247 ;
	setAttr ".vn[59].vfnl[105].fnxy" -type "float3" 0.28618151 0.85303599 -0.43638247 ;
	setAttr -s 3 ".vn[60].vfnl";
	setAttr ".vn[60].vfnl[104].fnxy" -type "float3" 0.13596718 0.85361445 -0.50284731 ;
	setAttr ".vn[60].vfnl[106].fnxy" -type "float3" 0.13596718 0.85361445 -0.50284731 ;
	setAttr ".vn[60].vfnl[107].fnxy" -type "float3" 0.13596718 0.85361445 -0.50284731 ;
	setAttr -s 2 ".vn[61].vfnl";
	setAttr ".vn[61].vfnl[106].fnxy" -type "float3" -1.9064734e-07 0.85410494 -0.52010077 ;
	setAttr ".vn[61].vfnl[108].fnxy" -type "float3" -1.9064734e-07 0.85410494 -0.52010077 ;
	setAttr -s 3 ".vn[62].vfnl";
	setAttr ".vn[62].vfnl[108].fnxy" -type "float3" -0.13596722 0.85361409 -0.50284773 ;
	setAttr ".vn[62].vfnl[109].fnxy" -type "float3" -0.13596722 0.85361409 -0.50284773 ;
	setAttr ".vn[62].vfnl[110].fnxy" -type "float3" -0.13596722 0.85361409 -0.50284773 ;
	setAttr -s 3 ".vn[63].vfnl";
	setAttr ".vn[63].vfnl[110].fnxy" -type "float3" -0.28618163 0.85303599 -0.43638247 ;
	setAttr ".vn[63].vfnl[111].fnxy" -type "float3" -0.28618163 0.85303599 -0.43638247 ;
	setAttr ".vn[63].vfnl[112].fnxy" -type "float3" -0.28618163 0.85303599 -0.43638247 ;
	setAttr -s 3 ".vn[64].vfnl";
	setAttr ".vn[64].vfnl[112].fnxy" -type "float3" -0.40811738 0.85226369 -0.32724112 ;
	setAttr ".vn[64].vfnl[113].fnxy" -type "float3" -0.40811738 0.85226369 -0.32724112 ;
	setAttr ".vn[64].vfnl[114].fnxy" -type "float3" -0.40811738 0.85226369 -0.32724112 ;
	setAttr -s 3 ".vn[65].vfnl";
	setAttr ".vn[65].vfnl[114].fnxy" -type "float3" -0.48998034 0.85159272 -0.18630412 ;
	setAttr ".vn[65].vfnl[115].fnxy" -type "float3" -0.48998034 0.85159272 -0.18630412 ;
	setAttr ".vn[65].vfnl[116].fnxy" -type "float3" -0.48998034 0.85159272 -0.18630412 ;
	setAttr -s 4 ".vn[66].vfnl";
	setAttr ".vn[66].vfnl[116].fnxy" -type "float3" -0.52419716 0.85159701 -6.1300483e-07 ;
	setAttr ".vn[66].vfnl[117].fnxy" -type "float3" -0.52419716 0.85159701 -6.1300483e-07 ;
	setAttr ".vn[66].vfnl[118].fnxy" -type "float3" -0.52419716 0.85159701 -6.1300483e-07 ;
	setAttr ".vn[66].vfnl[119].fnxy" -type "float3" -0.52419716 0.85159701 -6.1300483e-07 ;
	setAttr -s 3 ".vn[67].vfnl";
	setAttr ".vn[67].vfnl[81].fnxy" -type "float3" -0.5069918 0.85143936 0.13420311 ;
	setAttr ".vn[67].vfnl[118].fnxy" -type "float3" -0.5069918 0.85143936 0.13420311 ;
	setAttr ".vn[67].vfnl[119].fnxy" -type "float3" -0.5069918 0.85143936 0.13420311 ;
	setAttr -s 3 ".vn[68].vfnl";
	setAttr ".vn[68].vfnl[80].fnxy" -type "float3" -0.44054678 0.85201436 0.28282502 ;
	setAttr ".vn[68].vfnl[81].fnxy" -type "float3" -0.44054678 0.85201436 0.28282502 ;
	setAttr ".vn[68].vfnl[83].fnxy" -type "float3" -0.44054678 0.85201436 0.28282502 ;
	setAttr -s 3 ".vn[69].vfnl";
	setAttr ".vn[69].vfnl[82].fnxy" -type "float3" -0.33093911 0.85278577 0.40402466 ;
	setAttr ".vn[69].vfnl[83].fnxy" -type "float3" -0.33093911 0.85278577 0.40402466 ;
	setAttr ".vn[69].vfnl[85].fnxy" -type "float3" -0.33093911 0.85278577 0.40402466 ;
	setAttr -s 3 ".vn[70].vfnl";
	setAttr ".vn[70].vfnl[84].fnxy" -type "float3" -0.18869847 0.85345912 0.48579884 ;
	setAttr ".vn[70].vfnl[85].fnxy" -type "float3" -0.18869847 0.85345912 0.48579884 ;
	setAttr ".vn[70].vfnl[87].fnxy" -type "float3" -0.18869847 0.85345912 0.48579884 ;
	setAttr -s 4 ".vn[71].vfnl";
	setAttr ".vn[71].vfnl[86].fnxy" -type "float3" 9.1585484e-08 0.85410494 0.52010065 ;
	setAttr ".vn[71].vfnl[87].fnxy" -type "float3" 9.1585484e-08 0.85410494 0.52010065 ;
	setAttr ".vn[71].vfnl[88].fnxy" -type "float3" 9.1585484e-08 0.85410494 0.52010065 ;
	setAttr ".vn[71].vfnl[89].fnxy" -type "float3" 9.1585484e-08 0.85410494 0.52010065 ;
	setAttr -s 3 ".vn[72].vfnl";
	setAttr ".vn[72].vfnl[89].fnxy" -type "float3" 0.18869857 0.85345906 0.48579893 ;
	setAttr ".vn[72].vfnl[90].fnxy" -type "float3" 0.18869857 0.85345906 0.48579893 ;
	setAttr ".vn[72].vfnl[91].fnxy" -type "float3" 0.18869857 0.85345906 0.48579893 ;
	setAttr -s 3 ".vn[73].vfnl";
	setAttr ".vn[73].vfnl[91].fnxy" -type "float3" 0.33093911 0.85278565 0.40402463 ;
	setAttr ".vn[73].vfnl[92].fnxy" -type "float3" 0.33093911 0.85278565 0.40402463 ;
	setAttr ".vn[73].vfnl[93].fnxy" -type "float3" 0.33093911 0.85278565 0.40402463 ;
	setAttr -s 3 ".vn[74].vfnl";
	setAttr ".vn[74].vfnl[93].fnxy" -type "float3" 0.44054759 0.85201395 0.28282529 ;
	setAttr ".vn[74].vfnl[94].fnxy" -type "float3" 0.44054759 0.85201395 0.28282529 ;
	setAttr ".vn[74].vfnl[95].fnxy" -type "float3" 0.44054759 0.85201395 0.28282529 ;
	setAttr -s 3 ".vn[75].vfnl";
	setAttr ".vn[75].vfnl[95].fnxy" -type "float3" 0.50699157 0.85143924 0.13420419 ;
	setAttr ".vn[75].vfnl[96].fnxy" -type "float3" 0.50699157 0.85143924 0.13420419 ;
	setAttr ".vn[75].vfnl[97].fnxy" -type "float3" 0.50699157 0.85143924 0.13420419 ;
	setAttr -s 2 ".vn[76].vfnl";
	setAttr ".vn[76].vfnl[97].fnxy" -type "float3" 0.52419609 0.85159761 -1.4577554e-07 ;
	setAttr ".vn[76].vfnl[99].fnxy" -type "float3" 0.52419609 0.85159761 -1.4577554e-07 ;
	setAttr -s 3 ".vn[77].vfnl";
	setAttr ".vn[77].vfnl[98].fnxy" -type "float3" 0.50699133 0.85143948 -0.13420403 ;
	setAttr ".vn[77].vfnl[99].fnxy" -type "float3" 0.50699133 0.85143948 -0.13420403 ;
	setAttr ".vn[77].vfnl[101].fnxy" -type "float3" 0.50699133 0.85143948 -0.13420403 ;
	setAttr -s 3 ".vn[78].vfnl";
	setAttr ".vn[78].vfnl[100].fnxy" -type "float3" 0.44054705 0.85201424 -0.28282499 ;
	setAttr ".vn[78].vfnl[101].fnxy" -type "float3" 0.44054705 0.85201424 -0.28282499 ;
	setAttr ".vn[78].vfnl[103].fnxy" -type "float3" 0.44054705 0.85201424 -0.28282499 ;
	setAttr -s 3 ".vn[79].vfnl";
	setAttr ".vn[79].vfnl[102].fnxy" -type "float3" 0.33093911 0.85278559 -0.40402502 ;
	setAttr ".vn[79].vfnl[103].fnxy" -type "float3" 0.33093911 0.85278559 -0.40402502 ;
	setAttr ".vn[79].vfnl[105].fnxy" -type "float3" 0.33093911 0.85278559 -0.40402502 ;
	setAttr -s 3 ".vn[80].vfnl";
	setAttr ".vn[80].vfnl[104].fnxy" -type "float3" 0.1886982 0.8534593 -0.48579854 ;
	setAttr ".vn[80].vfnl[105].fnxy" -type "float3" 0.1886982 0.8534593 -0.48579854 ;
	setAttr ".vn[80].vfnl[107].fnxy" -type "float3" 0.1886982 0.8534593 -0.48579854 ;
	setAttr -s 4 ".vn[81].vfnl";
	setAttr ".vn[81].vfnl[106].fnxy" -type "float3" -2.2429099e-08 0.85410494 -0.52010077 ;
	setAttr ".vn[81].vfnl[107].fnxy" -type "float3" -2.2429099e-08 0.85410494 -0.52010077 ;
	setAttr ".vn[81].vfnl[108].fnxy" -type "float3" -2.2429099e-08 0.85410494 -0.52010077 ;
	setAttr ".vn[81].vfnl[109].fnxy" -type "float3" -2.2429099e-08 0.85410494 -0.52010077 ;
	setAttr -s 3 ".vn[82].vfnl";
	setAttr ".vn[82].vfnl[109].fnxy" -type "float3" -0.18869814 0.853459 -0.48579916 ;
	setAttr ".vn[82].vfnl[110].fnxy" -type "float3" -0.18869814 0.853459 -0.48579916 ;
	setAttr ".vn[82].vfnl[111].fnxy" -type "float3" -0.18869814 0.853459 -0.48579916 ;
	setAttr -s 3 ".vn[83].vfnl";
	setAttr ".vn[83].vfnl[111].fnxy" -type "float3" -0.3309392 0.85278559 -0.40402463 ;
	setAttr ".vn[83].vfnl[112].fnxy" -type "float3" -0.3309392 0.85278559 -0.40402463 ;
	setAttr ".vn[83].vfnl[113].fnxy" -type "float3" -0.3309392 0.85278559 -0.40402463 ;
	setAttr -s 3 ".vn[84].vfnl";
	setAttr ".vn[84].vfnl[113].fnxy" -type "float3" -0.44054747 0.85201406 -0.28282514 ;
	setAttr ".vn[84].vfnl[114].fnxy" -type "float3" -0.44054747 0.85201406 -0.28282514 ;
	setAttr ".vn[84].vfnl[115].fnxy" -type "float3" -0.44054747 0.85201406 -0.28282514 ;
	setAttr -s 3 ".vn[85].vfnl";
	setAttr ".vn[85].vfnl[115].fnxy" -type "float3" -0.50699276 0.85143864 -0.13420402 ;
	setAttr ".vn[85].vfnl[116].fnxy" -type "float3" -0.50699276 0.85143864 -0.13420402 ;
	setAttr ".vn[85].vfnl[117].fnxy" -type "float3" -0.50699276 0.85143864 -0.13420402 ;
	setAttr -s 2 ".vn[86].vfnl";
	setAttr ".vn[86].vfnl[117].fnxy" -type "float3" -0.5241974 0.85159689 -6.2048053e-07 ;
	setAttr ".vn[86].vfnl[119].fnxy" -type "float3" -0.5241974 0.85159689 -6.2048053e-07 ;
createNode polyCylinder -n "polyCylinder2";
	setAttr ".r" 15.167525532165515;
	setAttr ".h" 11.006449451614465;
	setAttr ".sa" 6;
	setAttr ".sc" 1;
	setAttr ".cuv" 3;
createNode deleteComponent -n "deleteComponent5";
	setAttr ".dc" -type "componentList" 1 "f[6:11]";
createNode polyTriangulate -n "polyTriangulate3";
	setAttr ".ics" -type "componentList" 1 "f[*]";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 7 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
	setAttr -s 2 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 7 ".s";
select -ne :defaultTextureList1;
	setAttr -s 7 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 7 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "groupParts2.og" "polySurfaceShape1.i";
connectAttr "groupId3.id" "polySurfaceShape1.iog.og[0].gid";
connectAttr "lambert4SG.mwc" "polySurfaceShape1.iog.og[0].gco";
connectAttr "groupParts3.og" "polySurfaceShape2.i";
connectAttr "groupId4.id" "polySurfaceShape2.iog.og[0].gid";
connectAttr "lambert4SG.mwc" "polySurfaceShape2.iog.og[0].gco";
connectAttr "polySeparate1.out[2]" "polySurfaceShape3.i";
connectAttr "groupId1.id" "pCylinderShape1.iog.og[0].gid";
connectAttr "lambert4SG.mwc" "pCylinderShape1.iog.og[0].gco";
connectAttr "groupParts1.og" "pCylinderShape1.i";
connectAttr "groupId2.id" "pCylinderShape1.ciog.cog[0].cgid";
connectAttr "groupId5.id" "pPipeShape1.iog.og[0].gid";
connectAttr "lambert6SG.mwc" "pPipeShape1.iog.og[0].gco";
connectAttr "polyTriangulate1.out" "pPipeShape1.i";
connectAttr "groupId6.id" "pPipeShape1.ciog.cog[0].cgid";
connectAttr "polyTweakUV1.uvtk[0]" "pPipeShape1.uvst[0].uvtw";
connectAttr "polyNormalPerVertex1.out" "polySurfaceShape4.i";
connectAttr "groupId7.id" "polySurfaceShape4.iog.og[0].gid";
connectAttr "lambert4SG.mwc" "polySurfaceShape4.iog.og[0].gco";
connectAttr "polyTriangulate3.out" "pCylinderShape2.i";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert5SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert6SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert5SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert6SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "file1.oc" "lambert2.c";
connectAttr "lambert2.oc" "lambert2SG.ss";
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "lambert2.msg" "materialInfo1.m";
connectAttr "file1.msg" "materialInfo1.t" -na;
connectAttr "place2dTexture1.c" "file1.c";
connectAttr "place2dTexture1.tf" "file1.tf";
connectAttr "place2dTexture1.rf" "file1.rf";
connectAttr "place2dTexture1.mu" "file1.mu";
connectAttr "place2dTexture1.mv" "file1.mv";
connectAttr "place2dTexture1.s" "file1.s";
connectAttr "place2dTexture1.wu" "file1.wu";
connectAttr "place2dTexture1.wv" "file1.wv";
connectAttr "place2dTexture1.re" "file1.re";
connectAttr "place2dTexture1.of" "file1.of";
connectAttr "place2dTexture1.r" "file1.ro";
connectAttr "place2dTexture1.n" "file1.n";
connectAttr "place2dTexture1.vt1" "file1.vt1";
connectAttr "place2dTexture1.vt2" "file1.vt2";
connectAttr "place2dTexture1.vt3" "file1.vt3";
connectAttr "place2dTexture1.vc1" "file1.vc1";
connectAttr "place2dTexture1.o" "file1.uv";
connectAttr "place2dTexture1.ofs" "file1.fs";
connectAttr "polyCylinder1.out" "polyTweak1.ip";
connectAttr "polyTweak1.out" "deleteComponent1.ig";
connectAttr "deleteComponent1.og" "polyExtrudeFace1.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace1.mp";
connectAttr "polyExtrudeFace1.out" "polyExtrudeFace2.ip";
connectAttr "pCylinderShape1.wm" "polyExtrudeFace2.mp";
connectAttr "chrome_sphere_map.oc" "lambert3SG.ss";
connectAttr "lambert3SG.msg" "materialInfo2.sg";
connectAttr "chrome_sphere_map.msg" "materialInfo2.m";
connectAttr "place2dTexture2.c" "file2.c";
connectAttr "place2dTexture2.tf" "file2.tf";
connectAttr "place2dTexture2.rf" "file2.rf";
connectAttr "place2dTexture2.mu" "file2.mu";
connectAttr "place2dTexture2.mv" "file2.mv";
connectAttr "place2dTexture2.s" "file2.s";
connectAttr "place2dTexture2.wu" "file2.wu";
connectAttr "place2dTexture2.wv" "file2.wv";
connectAttr "place2dTexture2.re" "file2.re";
connectAttr "place2dTexture2.of" "file2.of";
connectAttr "place2dTexture2.r" "file2.ro";
connectAttr "place2dTexture2.n" "file2.n";
connectAttr "place2dTexture2.vt1" "file2.vt1";
connectAttr "place2dTexture2.vt2" "file2.vt2";
connectAttr "place2dTexture2.vt3" "file2.vt3";
connectAttr "place2dTexture2.vc1" "file2.vc1";
connectAttr "place2dTexture2.o" "file2.uv";
connectAttr "place2dTexture2.ofs" "file2.fs";
connectAttr "place2dTexture3.c" "file3.c";
connectAttr "place2dTexture3.tf" "file3.tf";
connectAttr "place2dTexture3.rf" "file3.rf";
connectAttr "place2dTexture3.mu" "file3.mu";
connectAttr "place2dTexture3.mv" "file3.mv";
connectAttr "place2dTexture3.s" "file3.s";
connectAttr "place2dTexture3.wu" "file3.wu";
connectAttr "place2dTexture3.wv" "file3.wv";
connectAttr "place2dTexture3.re" "file3.re";
connectAttr "place2dTexture3.of" "file3.of";
connectAttr "place2dTexture3.r" "file3.ro";
connectAttr "place2dTexture3.n" "file3.n";
connectAttr "place2dTexture3.vt1" "file3.vt1";
connectAttr "place2dTexture3.vt2" "file3.vt2";
connectAttr "place2dTexture3.vt3" "file3.vt3";
connectAttr "place2dTexture3.vc1" "file3.vc1";
connectAttr "place2dTexture3.o" "file3.uv";
connectAttr "place2dTexture3.ofs" "file3.fs";
connectAttr "place2dTexture4.c" "file4.c";
connectAttr "place2dTexture4.tf" "file4.tf";
connectAttr "place2dTexture4.rf" "file4.rf";
connectAttr "place2dTexture4.mu" "file4.mu";
connectAttr "place2dTexture4.mv" "file4.mv";
connectAttr "place2dTexture4.s" "file4.s";
connectAttr "place2dTexture4.wu" "file4.wu";
connectAttr "place2dTexture4.wv" "file4.wv";
connectAttr "place2dTexture4.re" "file4.re";
connectAttr "place2dTexture4.of" "file4.of";
connectAttr "place2dTexture4.r" "file4.ro";
connectAttr "place2dTexture4.n" "file4.n";
connectAttr "place2dTexture4.vt1" "file4.vt1";
connectAttr "place2dTexture4.vt2" "file4.vt2";
connectAttr "place2dTexture4.vt3" "file4.vt3";
connectAttr "place2dTexture4.vc1" "file4.vc1";
connectAttr "place2dTexture4.o" "file4.uv";
connectAttr "place2dTexture4.ofs" "file4.fs";
connectAttr "file5.oc" "lambert4.c";
connectAttr "lambert4.oc" "lambert4SG.ss";
connectAttr "pCylinderShape1.iog.og[0]" "lambert4SG.dsm" -na;
connectAttr "pCylinderShape1.ciog.cog[0]" "lambert4SG.dsm" -na;
connectAttr "polySurfaceShape1.iog.og[0]" "lambert4SG.dsm" -na;
connectAttr "polySurfaceShape2.iog.og[0]" "lambert4SG.dsm" -na;
connectAttr "polySurfaceShape4.iog.og[0]" "lambert4SG.dsm" -na;
connectAttr "groupId1.msg" "lambert4SG.gn" -na;
connectAttr "groupId2.msg" "lambert4SG.gn" -na;
connectAttr "groupId3.msg" "lambert4SG.gn" -na;
connectAttr "groupId4.msg" "lambert4SG.gn" -na;
connectAttr "groupId7.msg" "lambert4SG.gn" -na;
connectAttr "lambert4SG.msg" "materialInfo3.sg";
connectAttr "lambert4.msg" "materialInfo3.m";
connectAttr "file5.msg" "materialInfo3.t" -na;
connectAttr "place2dTexture5.c" "file5.c";
connectAttr "place2dTexture5.tf" "file5.tf";
connectAttr "place2dTexture5.rf" "file5.rf";
connectAttr "place2dTexture5.mu" "file5.mu";
connectAttr "place2dTexture5.mv" "file5.mv";
connectAttr "place2dTexture5.s" "file5.s";
connectAttr "place2dTexture5.wu" "file5.wu";
connectAttr "place2dTexture5.wv" "file5.wv";
connectAttr "place2dTexture5.re" "file5.re";
connectAttr "place2dTexture5.of" "file5.of";
connectAttr "place2dTexture5.r" "file5.ro";
connectAttr "place2dTexture5.n" "file5.n";
connectAttr "place2dTexture5.vt1" "file5.vt1";
connectAttr "place2dTexture5.vt2" "file5.vt2";
connectAttr "place2dTexture5.vt3" "file5.vt3";
connectAttr "place2dTexture5.vc1" "file5.vc1";
connectAttr "place2dTexture5.o" "file5.uv";
connectAttr "place2dTexture5.ofs" "file5.fs";
connectAttr "polyTweak2.out" "polyChipOff1.ip";
connectAttr "pCylinderShape1.wm" "polyChipOff1.mp";
connectAttr "polyExtrudeFace2.out" "polyTweak2.ip";
connectAttr "pCylinderShape1.o" "polySeparate1.ip";
connectAttr "polyChipOff1.out" "groupParts1.ig";
connectAttr "groupId1.id" "groupParts1.gi";
connectAttr "polySeparate1.out[0]" "groupParts2.ig";
connectAttr "groupId3.id" "groupParts2.gi";
connectAttr "polySeparate1.out[1]" "groupParts3.ig";
connectAttr "groupId4.id" "groupParts3.gi";
connectAttr "file6.oc" "lambert5.c";
connectAttr "lambert5.oc" "lambert5SG.ss";
connectAttr "polySurfaceShape3.iog" "lambert5SG.dsm" -na;
connectAttr "pCylinderShape2.iog" "lambert5SG.dsm" -na;
connectAttr "pCylinderShape3.iog" "lambert5SG.dsm" -na;
connectAttr "pCylinderShape4.iog" "lambert5SG.dsm" -na;
connectAttr "pCylinderShape5.iog" "lambert5SG.dsm" -na;
connectAttr "lambert5SG.msg" "materialInfo4.sg";
connectAttr "lambert5.msg" "materialInfo4.m";
connectAttr "file6.msg" "materialInfo4.t" -na;
connectAttr "place2dTexture6.c" "file6.c";
connectAttr "place2dTexture6.tf" "file6.tf";
connectAttr "place2dTexture6.rf" "file6.rf";
connectAttr "place2dTexture6.mu" "file6.mu";
connectAttr "place2dTexture6.mv" "file6.mv";
connectAttr "place2dTexture6.s" "file6.s";
connectAttr "place2dTexture6.wu" "file6.wu";
connectAttr "place2dTexture6.wv" "file6.wv";
connectAttr "place2dTexture6.re" "file6.re";
connectAttr "place2dTexture6.of" "file6.of";
connectAttr "place2dTexture6.r" "file6.ro";
connectAttr "place2dTexture6.n" "file6.n";
connectAttr "place2dTexture6.vt1" "file6.vt1";
connectAttr "place2dTexture6.vt2" "file6.vt2";
connectAttr "place2dTexture6.vt3" "file6.vt3";
connectAttr "place2dTexture6.vc1" "file6.vc1";
connectAttr "place2dTexture6.o" "file6.uv";
connectAttr "place2dTexture6.ofs" "file6.fs";
connectAttr "polyPipe1.out" "deleteComponent2.ig";
connectAttr "deleteComponent2.og" "deleteComponent3.ig";
connectAttr "deleteComponent3.og" "deleteComponent4.ig";
connectAttr "file7.oc" "lambert6.c";
connectAttr "lambert6.oc" "lambert6SG.ss";
connectAttr "pPipeShape1.iog.og[0]" "lambert6SG.dsm" -na;
connectAttr "lambert6SG.msg" "materialInfo5.sg";
connectAttr "lambert6.msg" "materialInfo5.m";
connectAttr "file7.msg" "materialInfo5.t" -na;
connectAttr "deleteComponent4.og" "groupParts4.ig";
connectAttr "groupId5.id" "groupParts4.gi";
connectAttr "place2dTexture7.c" "file7.c";
connectAttr "place2dTexture7.tf" "file7.tf";
connectAttr "place2dTexture7.rf" "file7.rf";
connectAttr "place2dTexture7.mu" "file7.mu";
connectAttr "place2dTexture7.mv" "file7.mv";
connectAttr "place2dTexture7.s" "file7.s";
connectAttr "place2dTexture7.wu" "file7.wu";
connectAttr "place2dTexture7.wv" "file7.wv";
connectAttr "place2dTexture7.re" "file7.re";
connectAttr "place2dTexture7.of" "file7.of";
connectAttr "place2dTexture7.r" "file7.ro";
connectAttr "place2dTexture7.n" "file7.n";
connectAttr "place2dTexture7.vt1" "file7.vt1";
connectAttr "place2dTexture7.vt2" "file7.vt2";
connectAttr "place2dTexture7.vt3" "file7.vt3";
connectAttr "place2dTexture7.vc1" "file7.vc1";
connectAttr "place2dTexture7.o" "file7.uv";
connectAttr "place2dTexture7.ofs" "file7.fs";
connectAttr "groupParts4.og" "polyTweakUV1.ip";
connectAttr "polyTweak3.out" "polyTriangulate1.ip";
connectAttr "polyTweakUV1.out" "polyTweak3.ip";
connectAttr "polySurfaceShape2.o" "polyUnite1.ip[0]";
connectAttr "polySurfaceShape1.o" "polyUnite1.ip[1]";
connectAttr "polySurfaceShape2.wm" "polyUnite1.im[0]";
connectAttr "polySurfaceShape1.wm" "polyUnite1.im[1]";
connectAttr "polyUnite1.out" "groupParts5.ig";
connectAttr "groupId7.id" "groupParts5.gi";
connectAttr "groupParts5.og" "polyTriangulate2.ip";
connectAttr "polyTriangulate2.out" "polyNormalPerVertex1.ip";
connectAttr "polyCylinder2.out" "deleteComponent5.ig";
connectAttr "deleteComponent5.og" "polyTriangulate3.ip";
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "lambert4SG.pa" ":renderPartition.st" -na;
connectAttr "lambert5SG.pa" ":renderPartition.st" -na;
connectAttr "lambert6SG.pa" ":renderPartition.st" -na;
connectAttr "pPipeShape1.ciog.cog[0]" ":initialShadingGroup.dsm" -na;
connectAttr "groupId5.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId6.msg" ":initialShadingGroup.gn" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "chrome_sphere_map.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert4.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert5.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert6.msg" ":defaultShaderList1.s" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "file3.msg" ":defaultTextureList1.tx" -na;
connectAttr "file4.msg" ":defaultTextureList1.tx" -na;
connectAttr "file5.msg" ":defaultTextureList1.tx" -na;
connectAttr "file6.msg" ":defaultTextureList1.tx" -na;
connectAttr "file7.msg" ":defaultTextureList1.tx" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of transporter.ma
