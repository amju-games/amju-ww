//Maya ASCII 2015 scene
//Name: rd_a21_notop.ma
//Last modified: Thu, Aug 25, 2016 11:03:06 PM
//Codeset: 1252
requires maya "2015";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2015";
fileInfo "version" "2015";
fileInfo "cutIdentifier" "201405190330-916664";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -8.0844498487693386 43.82715355700438 330.79460594221172 ;
	setAttr ".r" -type "double3" -16.538352729601964 -1.3999999999999959 0 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 345.17341018946735;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -3.814697265625e-006 -54.42890739440918 0 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -3.814697265625e-006 -54.42890739440918 113.94084412601647 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 290.17446092337616;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "rd_a21:pCube1";
	setAttr ".t" -type "double3" 0 -56 0 ;
	setAttr ".s" -type "double3" 400 100 100 ;
createNode transform -n "rd_a21:transform1" -p "rd_a21:pCube1";
	setAttr ".v" no;
createNode mesh -n "rd_a21:pCubeShape1" -p "rd_a21:transform1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.50000005960464478 0.29597140103578568 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".vnm" 0;
createNode transform -n "rd_a21:pCube2";
	setAttr ".t" -type "double3" 0 -56 0 ;
	setAttr ".s" -type "double3" 400 100 100 ;
createNode transform -n "rd_a21:transform2" -p "rd_a21:pCube2";
	setAttr ".v" no;
createNode mesh -n "rd_a21:pCubeShape2" -p "rd_a21:transform2";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:29]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.46836565910341754 0.50002425909042358 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 40 ".uvst[0].uvsp[0:39]" -type "float2" -0.071543828 0.0051858425
		 0.063433632 0.0051858425 0.19841115 0.0051858425 0.33338869 0.0051858425 0.46836597
		 0.0051858425 0.60334337 0.0051858425 0.73832065 0.0051858425 0.87329799 0.0051858425
		 1.0082752705 0.0051858425 -0.20652135 0.098053038 -0.071543828 0.098053038 0.063433632
		 0.098053038 0.19841115 0.098053038 0.33338869 0.098053038 0.46836597 0.098053038
		 0.60334337 0.098053038 0.73832065 0.098053038 0.87329799 0.098053038 1.0082752705
		 0.098053038 1.14325261 0.098053038 -0.20652135 0.90720499 -0.071543828 0.90720499
		 0.063433632 0.90720499 0.19841115 0.90720499 0.33338869 0.90720499 0.46836597 0.90720499
		 0.60334337 0.90720499 0.73832065 0.90720499 0.87329799 0.90720499 1.0082752705 0.90720499
		 1.14325261 0.90720499 -0.071543828 0.99486268 0.063433632 0.99486268 0.19841115 0.99486268
		 0.33338869 0.99486268 0.46836597 0.99486268 0.60334337 0.99486268 0.73832065 0.99486268
		 0.87329799 0.99486268 1.0082752705 0.99486268;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 40 ".vt[0:39]"  -0.48039302 0.5 0.5 -0.38039303 0.5 0.5 -0.26753014 0.5 0.5
		 -0.12894151 0.5 0.5 -1.4901161e-008 0.5 0.5 0.11929431 0.5 0.5 0.25466722 0.5 0.5
		 0.380393 0.5 0.5 0.48039299 0.5 0.5 -0.5 0.5 0.42392427 -0.48039302 0.56284368 0.42392427
		 -0.38039303 0.56284368 0.42392427 -0.26753014 0.56284368 0.42392427 -0.12894151 0.56284368 0.42392427
		 -1.4901161e-008 0.56284368 0.42392427 0.11929431 0.56284368 0.42392427 0.25466722 0.56284368 0.42392427
		 0.380393 0.56284368 0.42392427 0.48039299 0.56284368 0.42392427 0.49999997 0.5 0.42392427
		 -0.5 0.5 -0.41106141 -0.48039302 0.56284368 -0.41106141 -0.38039303 0.56284368 -0.41106141
		 -0.26753014 0.56284368 -0.41106141 -0.12894151 0.56284368 -0.41106141 -1.4901161e-008 0.56284368 -0.41106141
		 0.11929431 0.56284368 -0.41106141 0.25466722 0.56284368 -0.41106141 0.380393 0.56284368 -0.41106141
		 0.48039299 0.56284368 -0.41106141 0.49999997 0.5 -0.41106141 -0.48039302 0.5 -0.5
		 -0.38039303 0.5 -0.5 -0.26753014 0.5 -0.5 -0.12894151 0.5 -0.5 -1.4901161e-008 0.5 -0.5
		 0.11929431 0.5 -0.5 0.25466722 0.5 -0.5 0.380393 0.5 -0.5 0.48039299 0.5 -0.5;
	setAttr -s 69 ".ed[0:68]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 9 10 1 10 11 1 11 12 1 12 13 1 13 14 1 14 15 1 15 16 1 16 17 1 17 18 1 18 19 1
		 20 21 1 21 22 1 22 23 1 23 24 1 24 25 1 25 26 1 26 27 1 27 28 1 28 29 1 29 30 1 31 32 0
		 32 33 0 33 34 0 34 35 0 35 36 0 36 37 0 37 38 0 38 39 0 0 9 0 0 10 1 1 11 1 2 12 1
		 3 13 1 4 14 1 5 15 1 6 16 1 7 17 1 8 18 1 8 19 0 9 20 0 10 21 1 11 22 1 12 23 1 13 24 1
		 14 25 1 15 26 1 16 27 1 17 28 1 18 29 1 19 30 0 20 31 0 21 31 1 22 32 1 23 33 1 24 34 1
		 25 35 1 26 36 1 27 37 1 28 38 1 29 39 1 30 39 0;
	setAttr -s 30 -ch 116 ".fc[0:29]" -type "polyFaces" 
		f 3 37 -9 -37
		mu 0 3 0 10 9
		f 4 0 38 -10 -38
		mu 0 4 0 1 11 10
		f 4 1 39 -11 -39
		mu 0 4 1 2 12 11
		f 4 2 40 -12 -40
		mu 0 4 2 3 13 12
		f 4 3 41 -13 -41
		mu 0 4 3 4 14 13
		f 4 4 42 -14 -42
		mu 0 4 4 5 15 14
		f 4 5 43 -15 -43
		mu 0 4 5 6 16 15
		f 4 6 44 -16 -44
		mu 0 4 6 7 17 16
		f 4 7 45 -17 -45
		mu 0 4 7 8 18 17
		f 3 46 -18 -46
		mu 0 3 8 19 18
		f 4 8 48 -19 -48
		mu 0 4 9 10 21 20
		f 4 9 49 -20 -49
		mu 0 4 10 11 22 21
		f 4 10 50 -21 -50
		mu 0 4 11 12 23 22
		f 4 11 51 -22 -51
		mu 0 4 12 13 24 23
		f 4 12 52 -23 -52
		mu 0 4 13 14 25 24
		f 4 13 53 -24 -53
		mu 0 4 14 15 26 25
		f 4 14 54 -25 -54
		mu 0 4 15 16 27 26
		f 4 15 55 -26 -55
		mu 0 4 16 17 28 27
		f 4 16 56 -27 -56
		mu 0 4 17 18 29 28
		f 4 17 57 -28 -57
		mu 0 4 18 19 30 29
		f 3 18 59 -59
		mu 0 3 20 21 31
		f 4 19 60 -29 -60
		mu 0 4 21 22 32 31
		f 4 20 61 -30 -61
		mu 0 4 22 23 33 32
		f 4 21 62 -31 -62
		mu 0 4 23 24 34 33
		f 4 22 63 -32 -63
		mu 0 4 24 25 35 34
		f 4 23 64 -33 -64
		mu 0 4 25 26 36 35
		f 4 24 65 -34 -65
		mu 0 4 26 27 37 36
		f 4 25 66 -35 -66
		mu 0 4 27 28 38 37
		f 4 26 67 -36 -67
		mu 0 4 28 29 39 38
		f 3 27 68 -68
		mu 0 3 29 30 39;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "rd_a21:polySurface1";
createNode transform -n "rd_a21:polySurface2" -p "rd_a21:polySurface1";
createNode transform -n "rd_a21:transform5" -p "rd_a21:polySurface2";
	setAttr ".v" no;
createNode mesh -n "rd_a21:polySurfaceShape2" -p "rd_a21:transform5";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.4683656319975853 0.50002425909042358 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".vnm" 0;
createNode transform -n "rd_a21:polySurface3" -p "rd_a21:polySurface1";
createNode transform -n "rd_a21:transform4" -p "rd_a21:polySurface3";
	setAttr ".v" no;
createNode mesh -n "rd_a21:polySurfaceShape3" -p "rd_a21:transform4";
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
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".vnm" 0;
createNode transform -n "rd_a21:transform3" -p "rd_a21:polySurface1";
	setAttr ".v" no;
createNode mesh -n "rd_a21:polySurfaceShape1" -p "rd_a21:transform3";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".vnm" 0;
createNode transform -n "rd_a21:polySurface4";
	setAttr ".s" -type "double3" 0.5 1 1 ;
createNode transform -n "rd_a21:polySurface5" -p "rd_a21:polySurface4";
createNode transform -n "rd_a21:transform8" -p "rd_a21:polySurface5";
	setAttr ".v" no;
createNode mesh -n "rd_a21:polySurfaceShape5" -p "rd_a21:transform8";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.22482256719743199 0.50002425909042358 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".vnm" 0;
createNode transform -n "rd_a21:polySurface6" -p "rd_a21:polySurface4";
createNode transform -n "rd_a21:transform7" -p "rd_a21:polySurface6";
	setAttr ".v" no;
createNode mesh -n "rd_a21:polySurfaceShape6" -p "rd_a21:transform7";
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
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".vnm" 0;
createNode transform -n "rd_a21:transform6" -p "rd_a21:polySurface4";
	setAttr ".v" no;
createNode mesh -n "rd_a21:polySurfaceShape4" -p "rd_a21:transform6";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".vnm" 0;
createNode transform -n "rd_a21:polySurface7";
createNode mesh -n "rd_a21:polySurfaceShape7" -p "rd_a21:polySurface7";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.50000002980232239 -0.058097705245018005 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 24 ".pt";
	setAttr ".pt[0]" -type "float3" 8.3611374 0 0 ;
	setAttr ".pt[1]" -type "float3" 5.7653656 0 0 ;
	setAttr ".pt[2]" -type "float3" 2.1982911 0 0 ;
	setAttr ".pt[3]" -type "float3" -1.1972787 0 0 ;
	setAttr ".pt[4]" -type "float3" -3.927722 0 0 ;
	setAttr ".pt[19]" -type "float3" 8.3611374 0 0 ;
	setAttr ".pt[20]" -type "float3" 5.7653656 0 0 ;
	setAttr ".pt[21]" -type "float3" 2.1982911 0 0 ;
	setAttr ".pt[22]" -type "float3" -1.1972787 0 0 ;
	setAttr ".pt[23]" -type "float3" -3.927722 0 0 ;
	setAttr ".pt[24]" -type "float3" 8.8649693 0 0 ;
	setAttr ".pt[25]" -type "float3" 8.3611374 -1.5948962 0 ;
	setAttr ".pt[26]" -type "float3" 5.7653656 -1.5948962 0 ;
	setAttr ".pt[27]" -type "float3" 2.1982911 -1.5948962 0 ;
	setAttr ".pt[28]" -type "float3" -1.1972787 -1.5948962 0 ;
	setAttr ".pt[29]" -type "float3" -3.927722 -1.5948962 0 ;
	setAttr ".pt[30]" -type "float3" -4.4683871 0 0 ;
	setAttr ".pt[31]" -type "float3" 8.8649693 0 0 ;
	setAttr ".pt[32]" -type "float3" 8.3611374 -1.5948962 0 ;
	setAttr ".pt[33]" -type "float3" 5.7653656 -1.5948962 0 ;
	setAttr ".pt[34]" -type "float3" 2.1982911 -1.5948962 0 ;
	setAttr ".pt[35]" -type "float3" -1.1972787 -1.5948962 0 ;
	setAttr ".pt[36]" -type "float3" -3.927722 -1.5948962 0 ;
	setAttr ".pt[37]" -type "float3" -4.4683871 0 0 ;
	setAttr ".vnm" 0;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 3 ".lnk";
	setAttr -s 3 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode polyCube -n "rd_a21:polyCube1";
	setAttr ".sw" 10;
	setAttr ".sh" 3;
	setAttr ".sd" 3;
	setAttr ".cuv" 4;
createNode polyTweak -n "rd_a21:polyTweak1";
	setAttr ".uopa" yes;
	setAttr -s 120 ".tk";
	setAttr ".tk[1]" -type "float3" -0.080393009 0 0 ;
	setAttr ".tk[2]" -type "float3" -0.080393016 0 0 ;
	setAttr ".tk[3]" -type "float3" -0.067530125 0 0 ;
	setAttr ".tk[4]" -type "float3" -0.028941484 0 0 ;
	setAttr ".tk[6]" -type "float3" 0.019294323 0 0 ;
	setAttr ".tk[7]" -type "float3" 0.054667246 0 0 ;
	setAttr ".tk[8]" -type "float3" 0.080393009 0 0 ;
	setAttr ".tk[9]" -type "float3" 0.080393016 0 0 ;
	setAttr ".tk[10]" -type "float3" -0.00887716 -2.9802322e-008 -0.03550864 ;
	setAttr ".tk[12]" -type "float3" -0.080393009 0 0 ;
	setAttr ".tk[13]" -type "float3" -0.080393016 0 0 ;
	setAttr ".tk[14]" -type "float3" -0.067530125 0 0 ;
	setAttr ".tk[15]" -type "float3" -0.028941484 0 0 ;
	setAttr ".tk[17]" -type "float3" 0.019294323 0 0 ;
	setAttr ".tk[18]" -type "float3" 0.054667246 0 0 ;
	setAttr ".tk[19]" -type "float3" 0.080393009 0 0 ;
	setAttr ".tk[20]" -type "float3" 0.080393016 0 0 ;
	setAttr ".tk[21]" -type "float3" -0.00887716 -2.9802322e-008 -0.03550864 ;
	setAttr ".tk[23]" -type "float3" -0.080393009 0 0 ;
	setAttr ".tk[24]" -type "float3" -0.080393016 0 0 ;
	setAttr ".tk[25]" -type "float3" -0.067530125 0 0 ;
	setAttr ".tk[26]" -type "float3" -0.028941484 0 0 ;
	setAttr ".tk[28]" -type "float3" 0.019294323 0 0 ;
	setAttr ".tk[29]" -type "float3" 0.054667246 0 0 ;
	setAttr ".tk[30]" -type "float3" 0.080393009 0 0 ;
	setAttr ".tk[31]" -type "float3" 0.080393016 0 0 ;
	setAttr ".tk[32]" -type "float3" -0.00887716 -2.9802322e-008 -0.03550864 ;
	setAttr ".tk[34]" -type "float3" -0.080393009 0 0 ;
	setAttr ".tk[35]" -type "float3" -0.080393016 0 0 ;
	setAttr ".tk[36]" -type "float3" -0.067530125 0 0 ;
	setAttr ".tk[37]" -type "float3" -0.028941484 0 0 ;
	setAttr ".tk[39]" -type "float3" 0.019294323 0 0 ;
	setAttr ".tk[40]" -type "float3" 0.054667246 0 0 ;
	setAttr ".tk[41]" -type "float3" 0.080393009 0 0 ;
	setAttr ".tk[42]" -type "float3" 0.080393016 0 0 ;
	setAttr ".tk[43]" -type "float3" -0.00887716 -2.9802322e-008 -0.03550864 ;
	setAttr ".tk[44]" -type "float3" 0 0 0.25725761 ;
	setAttr ".tk[45]" -type "float3" -0.080393009 0.062843673 0.25725761 ;
	setAttr ".tk[46]" -type "float3" -0.080393016 0.062843673 0.25725761 ;
	setAttr ".tk[47]" -type "float3" -0.067530125 0.062843673 0.25725761 ;
	setAttr ".tk[48]" -type "float3" -0.028941484 0.062843673 0.25725761 ;
	setAttr ".tk[49]" -type "float3" 0 0.062843673 0.25725761 ;
	setAttr ".tk[50]" -type "float3" 0.019294323 0.062843673 0.25725761 ;
	setAttr ".tk[51]" -type "float3" 0.054667246 0.062843673 0.25725761 ;
	setAttr ".tk[52]" -type "float3" 0.080393009 0.062843673 0.25725761 ;
	setAttr ".tk[53]" -type "float3" 0.080393016 0.062843673 0.25725761 ;
	setAttr ".tk[54]" -type "float3" 0 0 0.25725761 ;
	setAttr ".tk[55]" -type "float3" 0 0 -0.24439472 ;
	setAttr ".tk[56]" -type "float3" -0.080393009 0.062843673 -0.24439472 ;
	setAttr ".tk[57]" -type "float3" -0.080393016 0.062843673 -0.24439472 ;
	setAttr ".tk[58]" -type "float3" -0.067530125 0.062843673 -0.24439472 ;
	setAttr ".tk[59]" -type "float3" -0.028941484 0.062843673 -0.24439472 ;
	setAttr ".tk[60]" -type "float3" 0 0.062843673 -0.24439472 ;
	setAttr ".tk[61]" -type "float3" 0.019294323 0.062843673 -0.24439472 ;
	setAttr ".tk[62]" -type "float3" 0.054667246 0.062843673 -0.24439472 ;
	setAttr ".tk[63]" -type "float3" 0.080393009 0.062843673 -0.24439472 ;
	setAttr ".tk[64]" -type "float3" 0.080393016 0.062843673 -0.24439472 ;
	setAttr ".tk[65]" -type "float3" 0 0 -0.24439472 ;
	setAttr ".tk[67]" -type "float3" -0.080393009 0 0 ;
	setAttr ".tk[68]" -type "float3" -0.080393016 0 0 ;
	setAttr ".tk[69]" -type "float3" -0.067530125 0 0 ;
	setAttr ".tk[70]" -type "float3" -0.028941484 0 0 ;
	setAttr ".tk[72]" -type "float3" 0.019294323 0 0 ;
	setAttr ".tk[73]" -type "float3" 0.054667246 0 0 ;
	setAttr ".tk[74]" -type "float3" 0.080393009 0 0 ;
	setAttr ".tk[75]" -type "float3" 0.080393016 0 0 ;
	setAttr ".tk[78]" -type "float3" -0.080393009 0 0 ;
	setAttr ".tk[79]" -type "float3" -0.080393016 0 0 ;
	setAttr ".tk[80]" -type "float3" -0.067530125 0 0 ;
	setAttr ".tk[81]" -type "float3" -0.028941484 0 0 ;
	setAttr ".tk[83]" -type "float3" 0.019294323 0 0 ;
	setAttr ".tk[84]" -type "float3" 0.054667246 0 0 ;
	setAttr ".tk[85]" -type "float3" 0.080393009 0 0 ;
	setAttr ".tk[86]" -type "float3" 0.080393016 0 0 ;
	setAttr ".tk[89]" -type "float3" -0.080393009 0 0 ;
	setAttr ".tk[90]" -type "float3" -0.080393016 0 0 ;
	setAttr ".tk[91]" -type "float3" -0.067530125 0 0 ;
	setAttr ".tk[92]" -type "float3" -0.028941484 0 0 ;
	setAttr ".tk[94]" -type "float3" 0.019294323 0 0 ;
	setAttr ".tk[95]" -type "float3" 0.054667246 0 0 ;
	setAttr ".tk[96]" -type "float3" 0.080393009 0 0 ;
	setAttr ".tk[97]" -type "float3" 0.080393016 0 0 ;
	setAttr ".tk[100]" -type "float3" -0.080393009 0 0 ;
	setAttr ".tk[101]" -type "float3" -0.080393016 0 0 ;
	setAttr ".tk[102]" -type "float3" -0.067530125 0 0 ;
	setAttr ".tk[103]" -type "float3" -0.028941484 0 0 ;
	setAttr ".tk[105]" -type "float3" 0.019294323 0 0 ;
	setAttr ".tk[106]" -type "float3" 0.054667246 0 0 ;
	setAttr ".tk[107]" -type "float3" 0.080393009 0 0 ;
	setAttr ".tk[108]" -type "float3" 0.080393016 0 0 ;
	setAttr ".tk[110]" -type "float3" 0 0 -0.24439472 ;
	setAttr ".tk[111]" -type "float3" -0.080393009 -0.031421836 -0.24439472 ;
	setAttr ".tk[112]" -type "float3" -0.080393016 -0.031421836 -0.24439472 ;
	setAttr ".tk[113]" -type "float3" -0.067530125 -0.031421836 -0.24439472 ;
	setAttr ".tk[114]" -type "float3" -0.028941484 -0.031421836 -0.24439472 ;
	setAttr ".tk[115]" -type "float3" 0 -0.031421836 -0.24439472 ;
	setAttr ".tk[116]" -type "float3" 0.019294323 -0.031421836 -0.24439472 ;
	setAttr ".tk[117]" -type "float3" 0.054667246 -0.031421836 -0.24439472 ;
	setAttr ".tk[118]" -type "float3" 0.080393009 -0.031421836 -0.24439472 ;
	setAttr ".tk[119]" -type "float3" 0.080393016 -0.031421836 -0.24439472 ;
	setAttr ".tk[120]" -type "float3" 0 0 -0.24439472 ;
	setAttr ".tk[121]" -type "float3" 0 0 0.25725761 ;
	setAttr ".tk[122]" -type "float3" -0.080393009 -0.031421836 0.25725761 ;
	setAttr ".tk[123]" -type "float3" -0.080393016 -0.031421836 0.25725761 ;
	setAttr ".tk[124]" -type "float3" -0.067530125 -0.031421836 0.25725761 ;
	setAttr ".tk[125]" -type "float3" -0.028941484 -0.031421836 0.25725761 ;
	setAttr ".tk[126]" -type "float3" 0 -0.031421836 0.25725761 ;
	setAttr ".tk[127]" -type "float3" 0.019294323 -0.031421836 0.25725761 ;
	setAttr ".tk[128]" -type "float3" 0.054667246 -0.031421836 0.25725761 ;
	setAttr ".tk[129]" -type "float3" 0.080393009 -0.031421836 0.25725761 ;
	setAttr ".tk[130]" -type "float3" 0.080393016 -0.031421836 0.25725761 ;
	setAttr ".tk[131]" -type "float3" 0 0 0.25725761 ;
	setAttr ".tk[132]" -type "float3" 0 0 -0.24439472 ;
	setAttr ".tk[133]" -type "float3" 0 0 0.25725761 ;
	setAttr ".tk[134]" -type "float3" 0 0 -0.24439472 ;
	setAttr ".tk[135]" -type "float3" 0 0 0.25725761 ;
	setAttr ".tk[136]" -type "float3" 0 0 -0.24439472 ;
	setAttr ".tk[137]" -type "float3" 0 0 0.25725761 ;
	setAttr ".tk[138]" -type "float3" 0 0 -0.24439472 ;
	setAttr ".tk[139]" -type "float3" 0 0 0.25725761 ;
createNode deleteComponent -n "rd_a21:deleteComponent1";
	setAttr ".dc" -type "componentList" 0;
createNode deleteComponent -n "rd_a21:deleteComponent2";
	setAttr ".dc" -type "componentList" 0;
createNode deleteComponent -n "rd_a21:deleteComponent3";
	setAttr ".dc" -type "componentList" 1 "e[152]";
createNode deleteComponent -n "rd_a21:deleteComponent4";
	setAttr ".dc" -type "componentList" 1 "e[141]";
createNode deleteComponent -n "rd_a21:deleteComponent5";
	setAttr ".dc" -type "componentList" 1 "e[130]";
createNode deleteComponent -n "rd_a21:deleteComponent6";
	setAttr ".dc" -type "componentList" 4 "vtx[10]" "vtx[21]" "vtx[32]" "vtx[43]";
createNode polyTweak -n "rd_a21:polyTweak2";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[72]" -type "float3" -0.0078718355 0 0.043295097 ;
	setAttr ".tk[83]" -type "float3" -0.0078718355 0 0.043295097 ;
	setAttr ".tk[94]" -type "float3" -0.0078718355 0 0.043295097 ;
	setAttr ".tk[105]" -type "float3" -0.0078718355 0 0.043295097 ;
createNode deleteComponent -n "rd_a21:deleteComponent7";
	setAttr ".dc" -type "componentList" 1 "e[189]";
createNode deleteComponent -n "rd_a21:deleteComponent8";
	setAttr ".dc" -type "componentList" 1 "e[199]";
createNode deleteComponent -n "rd_a21:deleteComponent9";
	setAttr ".dc" -type "componentList" 1 "e[209]";
createNode deleteComponent -n "rd_a21:deleteComponent10";
	setAttr ".dc" -type "componentList" 4 "vtx[72]" "vtx[83]" "vtx[94]" "vtx[105]";
createNode polyTweak -n "rd_a21:polyTweak3";
	setAttr ".uopa" yes;
	setAttr -s 5 ".tk";
	setAttr ".tk[62]" -type "float3" 0.0088557303 -8.9406967e-008 0.05116713 ;
	setAttr ".tk[72]" -type "float3" 0.0088557303 -8.9406967e-008 0.05116713 ;
	setAttr ".tk[82]" -type "float3" 0.0088557303 -8.9406967e-008 0.05116713 ;
	setAttr ".tk[92]" -type "float3" 0.0088557303 -8.9406967e-008 0.05116713 ;
createNode deleteComponent -n "rd_a21:deleteComponent11";
	setAttr ".dc" -type "componentList" 1 "e[175]";
createNode deleteComponent -n "rd_a21:deleteComponent12";
	setAttr ".dc" -type "componentList" 1 "e[184]";
createNode deleteComponent -n "rd_a21:deleteComponent13";
	setAttr ".dc" -type "componentList" 1 "e[193]";
createNode deleteComponent -n "rd_a21:deleteComponent14";
	setAttr ".dc" -type "componentList" 4 "vtx[62]" "vtx[72]" "vtx[82]" "vtx[92]";
createNode polyTweak -n "rd_a21:polyTweak4";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[0]" -type "float3" 0.0098397946 0 -0.031487342 ;
	setAttr ".tk[10]" -type "float3" 0.0098397946 0 -0.031487342 ;
	setAttr ".tk[20]" -type "float3" 0.0098397946 0 -0.031487342 ;
	setAttr ".tk[30]" -type "float3" 0.0098397946 0 -0.031487342 ;
createNode deleteComponent -n "rd_a21:deleteComponent15";
	setAttr ".dc" -type "componentList" 1 "e[108]";
createNode deleteComponent -n "rd_a21:deleteComponent16";
	setAttr ".dc" -type "componentList" 1 "e[117]";
createNode deleteComponent -n "rd_a21:deleteComponent17";
	setAttr ".dc" -type "componentList" 1 "e[126]";
createNode deleteComponent -n "rd_a21:deleteComponent18";
	setAttr ".dc" -type "componentList" 4 "vtx[0]" "vtx[10]" "vtx[20]" "vtx[30]";
createNode deleteComponent -n "rd_a21:deleteComponent19";
	setAttr ".dc" -type "componentList" 4 "e[16:23]" "e[60:67]" "e[227:229]" "e[239:241]";
createNode deleteComponent -n "rd_a21:deleteComponent20";
	setAttr ".dc" -type "componentList" 4 "e[8:15]" "e[52:59]" "e[208:210]" "e[217:219]";
createNode deleteComponent -n "rd_a21:deleteComponent21";
	setAttr ".dc" -type "componentList" 3 "vtx[9:26]" "vtx[67:84]" "vtx[116:123]";
createNode script -n "rd_a21:uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n"
		+ "                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n"
		+ "                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n"
		+ "            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n"
		+ "            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n"
		+ "                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n"
		+ "                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n"
		+ "                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n"
		+ "                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n"
		+ "                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n"
		+ "            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n"
		+ "            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n"
		+ "                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n"
		+ "                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n"
		+ "            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n"
		+ "                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                -ignoreHiddenAttribute 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n"
		+ "            -showShapes 0\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n"
		+ "            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 1\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n"
		+ "                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n"
		+ "                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n"
		+ "                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n"
		+ "                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n"
		+ "                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n"
		+ "                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n"
		+ "                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n"
		+ "                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n"
		+ "                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n"
		+ "                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n"
		+ "                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n"
		+ "                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n"
		+ "                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n"
		+ "                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n"
		+ "                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n"
		+ "\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"quad\\\" -ps 1 50 50 -ps 2 50 50 -ps 3 50 50 -ps 4 50 50 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Top View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Top View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera top` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Top View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera top` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Side View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Side View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera side` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Side View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera side` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Front View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Front View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera front` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Front View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera front` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "rd_a21:sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode file -n "rd_a21:file1";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/pz-ground22.png";
createNode place2dTexture -n "rd_a21:place2dTexture1";
createNode deleteComponent -n "rd_a21:deleteComponent22";
	setAttr ".dc" -type "componentList" 1 "f[9:38]";
createNode lambert -n "rd_a21:lambert2";
createNode shadingEngine -n "rd_a21:lambert2SG";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 7 ".gn";
createNode materialInfo -n "rd_a21:materialInfo1";
createNode file -n "rd_a21:file2";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/underground3.png";
createNode place2dTexture -n "rd_a21:place2dTexture2";
createNode polyPlanarProj -n "rd_a21:polyPlanarProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:51]";
	setAttr ".ix" -type "matrix" 400 0 0 0 0 100 0 0 0 0 100 0 0 -56 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -7.62939453125e-006 -57.571090698242188 0 ;
	setAttr ".ro" -type "double3" -90 0 0 ;
	setAttr ".ps" -type "double2" 399.99998474121094 100 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyPlanarProj -n "rd_a21:polyPlanarProj2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:51]";
	setAttr ".ix" -type "matrix" 400 0 0 0 0 100 0 0 0 0 100 0 0 -56 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -1.52587890625e-005 -57.571090698242188 0 ;
	setAttr ".ro" -type "double3" 0 90 0 ;
	setAttr ".ps" -type "double2" 100 103.14218139648437 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyPlanarProj -n "rd_a21:polyPlanarProj3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:51]";
	setAttr ".ix" -type "matrix" 400 0 0 0 0 100 0 0 0 0 100 0 0 -56 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -1.52587890625e-005 -57.571090698242188 0 ;
	setAttr ".ps" -type "double2" 399.99996948242187 103.14218139648437 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyTweakUV -n "rd_a21:polyTweakUV1";
	setAttr ".uopa" yes;
	setAttr -s 62 ".uvtk[0:61]" -type "float2" 0.57497668 -0.077436835 0.5984441
		 -0.077436835 0.5984441 -0.33883399 0.57497668 -0.33883399 -0.45528793 -0.077436835
		 -0.45528793 -0.33883399 -0.57497686 -0.33883399 -0.57497686 -0.077436835 -0.32020366
		 -0.077436835 -0.32020366 -0.33883399 -0.15432861 -0.077436835 -0.15432861 -0.33883399
		 0 -0.077436835 0 -0.33883399 0.14278191 -0.077436835 0.14278191 -0.33883399 0.30480826
		 -0.077436835 0.30480826 -0.33883399 0.45528781 -0.077436835 0.45528781 -0.33883399
		 -0.45528793 -0.33883399 -0.45528793 -0.077436835 -0.57497686 -0.077436835 -0.57497686
		 -0.33883399 -0.32020366 -0.33883399 -0.32020366 -0.077436835 -0.15432861 -0.33883399
		 -0.15432861 -0.077436835 0 -0.33883399 0 -0.077436835 0.14278191 -0.33883399 0.14278191
		 -0.077436835 0.30480826 -0.33883399 0.30480826 -0.077436835 0.45528781 -0.33883399
		 0.45528781 -0.077436835 0.57497668 -0.33883399 0.57497668 -0.077436835 0.5984441
		 -0.077436835 0.5984441 -0.33883399 -0.57497686 -0.069223225 -0.59844422 -0.077436835
		 -0.45528793 -0.069223225 -0.32020366 -0.069223225 -0.15432861 -0.069223225 0 -0.069223225
		 0.14278191 -0.069223225 0.30480826 -0.069223225 0.45528781 -0.069223225 0.57497668
		 -0.069223225 -0.57497686 -0.069223225 -0.59844422 -0.077436835 -0.45528793 -0.069223225
		 -0.32020366 -0.069223225 -0.15432861 -0.069223225 0 -0.069223225 0.14278191 -0.069223225
		 0.30480826 -0.069223225 0.45528781 -0.069223225 0.57497668 -0.069223225 -0.59844422
		 -0.33883399 -0.59844422 -0.33883399;
createNode polyUnite -n "rd_a21:polyUnite1";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "rd_a21:groupId1";
	setAttr ".ihi" 0;
createNode groupId -n "rd_a21:groupId2";
	setAttr ".ihi" 0;
createNode groupId -n "rd_a21:groupId3";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a21:groupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:51]";
createNode groupId -n "rd_a21:groupId4";
	setAttr ".ihi" 0;
createNode groupId -n "rd_a21:groupId5";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a21:groupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:29]";
createNode groupId -n "rd_a21:groupId6";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a21:groupParts3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[30:81]";
createNode polyTriangulate -n "rd_a21:polyTriangulate1";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polySeparate -n "rd_a21:polySeparate1";
	setAttr ".ic" 2;
	setAttr -s 2 ".out";
createNode groupId -n "rd_a21:groupId7";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a21:groupParts4";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:55]";
createNode groupId -n "rd_a21:groupId8";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a21:groupParts5";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:99]";
createNode polyTweakUV -n "rd_a21:polyTweakUV2";
	setAttr ".uopa" yes;
	setAttr -s 40 ".uvtk[0:39]" -type "float2" 0.089552358 0 0.089552358
		 0 0.11194049 0 0.067164257 0 0.067164257 0 0.044776142 0 0.044776142 0 0.022388041
		 0 0.022388041 0 -2.9802322e-008 0 -2.9802322e-008 0 -0.02238816 0 -0.02238816 0 -0.044776201
		 0 -0.044776201 0 -0.067164361 0 -0.067164361 0 -0.089552462 0 -0.089552462 0 -0.11194062
		 0 0.11194049 0 0.089552358 0 0.067164257 0 0.044776142 0 0.022388041 0 -2.9802322e-008
		 0 -0.02238816 0 -0.044776201 0 -0.067164361 0 -0.089552462 0 -0.11194062 0 0.089552358
		 0 0.067164257 0 0.044776142 0 0.022388041 0 -2.9802322e-008 0 -0.02238816 0 -0.044776201
		 0 -0.067164361 0 -0.089552462 0;
createNode polyUnite -n "rd_a21:polyUnite2";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "rd_a21:groupId9";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a21:groupParts6";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:55]";
createNode groupId -n "rd_a21:groupId10";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a21:groupParts7";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[56:155]";
createNode deleteComponent -n "rd_a21:deleteComponent23";
	setAttr ".dc" -type "componentList" 8 "e[44]" "e[55]" "e[66]" "e[154]" "e[169]" "e[179]" "e[190]" "e[201]";
createNode deleteComponent -n "rd_a21:deleteComponent24";
	setAttr ".dc" -type "componentList" 8 "e[42]" "e[52]" "e[62]" "e[149]" "e[163]" "e[172]" "e[182]" "e[192]";
createNode deleteComponent -n "rd_a21:deleteComponent25";
	setAttr ".dc" -type "componentList" 8 "e[40]" "e[49]" "e[58]" "e[144]" "e[157]" "e[165]" "e[174]" "e[183]";
createNode deleteComponent -n "rd_a21:deleteComponent26";
	setAttr ".dc" -type "componentList" 8 "e[38]" "e[46]" "e[54]" "e[139]" "e[151]" "e[158]" "e[166]" "e[174]";
createNode deleteComponent -n "rd_a21:deleteComponent27";
	setAttr ".dc" -type "componentList" 0;
createNode deleteComponent -n "rd_a21:deleteComponent28";
	setAttr ".dc" -type "componentList" 2 "e[183:184]" "e[191:192]";
createNode deleteComponent -n "rd_a21:deleteComponent29";
	setAttr ".dc" -type "componentList" 2 "e[72:73]" "e[205:206]";
createNode deleteComponent -n "rd_a21:deleteComponent30";
	setAttr ".dc" -type "componentList" 2 "e[63:64]" "e[210:211]";
createNode deleteComponent -n "rd_a21:deleteComponent31";
	setAttr ".dc" -type "componentList" 2 "e[77:78]" "e[192:193]";
createNode deleteComponent -n "rd_a21:deleteComponent32";
	setAttr ".dc" -type "componentList" 2 "e[68:69]" "e[195:196]";
createNode deleteComponent -n "rd_a21:deleteComponent33";
	setAttr ".dc" -type "componentList" 2 "e[61:62]" "e[198:199]";
createNode deleteComponent -n "rd_a21:deleteComponent34";
	setAttr ".dc" -type "componentList" 2 "e[71:72]" "e[184:185]";
createNode deleteComponent -n "rd_a21:deleteComponent35";
	setAttr ".dc" -type "componentList" 2 "e[69:70]" "e[180:181]";
createNode deleteComponent -n "rd_a21:deleteComponent36";
	setAttr ".dc" -type "componentList" 2 "e[64:65]" "e[181:182]";
createNode deleteComponent -n "rd_a21:deleteComponent37";
	setAttr ".dc" -type "componentList" 2 "e[59:60]" "e[182:183]";
createNode deleteComponent -n "rd_a21:deleteComponent38";
	setAttr ".dc" -type "componentList" 2 "e[63:64]" "e[172:173]";
createNode deleteComponent -n "rd_a21:deleteComponent39";
	setAttr ".dc" -type "componentList" 2 "e[60:61]" "e[171:172]";
createNode deleteComponent -n "rd_a21:deleteComponent40";
	setAttr ".dc" -type "componentList" 2 "e[57:58]" "e[170:171]";
createNode deleteComponent -n "rd_a21:deleteComponent41";
	setAttr ".dc" -type "componentList" 2 "e[157:158]" "e[163:164]";
createNode deleteComponent -n "rd_a21:deleteComponent42";
	setAttr ".dc" -type "componentList" 2 "e[155:156]" "e[159:160]";
createNode deleteComponent -n "rd_a21:deleteComponent43";
	setAttr ".dc" -type "componentList" 1 "e[153:156]";
createNode deleteComponent -n "rd_a21:deleteComponent44";
	setAttr ".dc" -type "componentList" 10 "vtx[7]" "vtx[17]" "vtx[28]" "vtx[38]" "vtx[47]" "vtx[56]" "vtx[69]" "vtx[78]" "vtx[88]" "vtx[99]";
createNode deleteComponent -n "rd_a21:deleteComponent45";
	setAttr ".dc" -type "componentList" 10 "vtx[5]" "vtx[14]" "vtx[24]" "vtx[33]" "vtx[41]" "vtx[49]" "vtx[61]" "vtx[69]" "vtx[78]" "vtx[88]";
createNode deleteComponent -n "rd_a21:deleteComponent46";
	setAttr ".dc" -type "componentList" 10 "vtx[3]" "vtx[11]" "vtx[20]" "vtx[28]" "vtx[35]" "vtx[42]" "vtx[53]" "vtx[60]" "vtx[68]" "vtx[77]";
createNode deleteComponent -n "rd_a21:deleteComponent47";
	setAttr ".dc" -type "componentList" 10 "vtx[1]" "vtx[8]" "vtx[16]" "vtx[23]" "vtx[29]" "vtx[35]" "vtx[45]" "vtx[51]" "vtx[58]" "vtx[66]";
createNode polyTriangulate -n "rd_a21:polyTriangulate2";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyTweak -n "rd_a21:polyTweak5";
	setAttr ".uopa" yes;
	setAttr -s 20 ".tk";
	setAttr ".tk[0]" -type "float3" 7.2721381 0 0 ;
	setAttr ".tk[4]" -type "float3" -8.3771515 0 0 ;
	setAttr ".tk[6]" -type "float3" 7.2721381 0 0 ;
	setAttr ".tk[10]" -type "float3" -8.3771515 0 0 ;
	setAttr ".tk[13]" -type "float3" 7.2721381 0 0 ;
	setAttr ".tk[17]" -type "float3" -8.3771515 0 0 ;
	setAttr ".tk[19]" -type "float3" 7.2721381 0 0 ;
	setAttr ".tk[23]" -type "float3" -8.3771515 0 0 ;
	setAttr ".tk[24]" -type "float3" 7.2721381 0 0 ;
	setAttr ".tk[28]" -type "float3" -8.3771515 0 0 ;
	setAttr ".tk[29]" -type "float3" 7.2721381 0 0 ;
	setAttr ".tk[33]" -type "float3" -8.3771515 0 0 ;
	setAttr ".tk[38]" -type "float3" 7.2721381 0 0 ;
	setAttr ".tk[42]" -type "float3" -8.3771515 0 0 ;
	setAttr ".tk[43]" -type "float3" 7.2721381 0 0 ;
	setAttr ".tk[47]" -type "float3" -8.3771515 0 0 ;
	setAttr ".tk[49]" -type "float3" 7.2721381 0 0 ;
	setAttr ".tk[53]" -type "float3" -8.3771515 0 0 ;
	setAttr ".tk[56]" -type "float3" 7.2721381 0 0 ;
	setAttr ".tk[60]" -type "float3" -8.3771515 0 0 ;
createNode polySeparate -n "rd_a21:polySeparate2";
	setAttr ".ic" 2;
	setAttr -s 2 ".out";
createNode groupId -n "rd_a21:groupId11";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a21:groupParts8";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:31]";
createNode groupId -n "rd_a21:groupId12";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a21:groupParts9";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:59]";
createNode polyTweakUV -n "rd_a21:polyTweakUV3";
	setAttr ".uopa" yes;
	setAttr -s 24 ".uvtk[0:23]" -type "float2" -0.059925959 0 -0.059925959
		 0 -0.014021677 0 -0.15173459 0 -0.15173459 0 -0.24354313 0 -0.24354313 0 -0.33535165
		 0 -0.33535165 0 -0.42716008 0 -0.42716008 0 -0.47306433 0 -0.014021677 0 -0.059925959
		 0 -0.15173459 0 -0.24354313 0 -0.33535165 0 -0.42716008 0 -0.47306433 0 -0.059925959
		 0 -0.15173459 0 -0.24354313 0 -0.33535165 0 -0.42716008 0;
createNode polyUnite -n "rd_a21:polyUnite3";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "rd_a21:groupId13";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a21:groupParts10";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:31]";
createNode groupId -n "rd_a21:groupId14";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a21:groupParts11";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[32:91]";
createNode deleteComponent -n "deleteComponent1";
	setAttr ".dc" -type "componentList" 1 "f[0:31]";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 3 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 3 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 2 ".u";
select -ne :defaultRenderingList1;
select -ne :defaultTextureList1;
	setAttr -s 2 ".tx";
select -ne :initialShadingGroup;
	setAttr -s 7 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 7 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :initialMaterialInfo;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
connectAttr "rd_a21:groupId3.id" "rd_a21:pCubeShape1.iog.og[0].gid";
connectAttr "rd_a21:lambert2SG.mwc" "rd_a21:pCubeShape1.iog.og[0].gco";
connectAttr "rd_a21:groupParts1.og" "rd_a21:pCubeShape1.i";
connectAttr "rd_a21:polyTweakUV1.uvtk[0]" "rd_a21:pCubeShape1.uvst[0].uvtw";
connectAttr "rd_a21:groupId4.id" "rd_a21:pCubeShape1.ciog.cog[0].cgid";
connectAttr "rd_a21:groupId1.id" "rd_a21:pCubeShape2.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "rd_a21:pCubeShape2.iog.og[0].gco";
connectAttr "rd_a21:groupId2.id" "rd_a21:pCubeShape2.ciog.cog[0].cgid";
connectAttr "rd_a21:polyTweakUV2.out" "rd_a21:polySurfaceShape2.i";
connectAttr "rd_a21:groupId7.id" "rd_a21:polySurfaceShape2.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "rd_a21:polySurfaceShape2.iog.og[0].gco";
connectAttr "rd_a21:polyTweakUV2.uvtk[0]" "rd_a21:polySurfaceShape2.uvst[0].uvtw"
		;
connectAttr "rd_a21:groupParts5.og" "rd_a21:polySurfaceShape3.i";
connectAttr "rd_a21:groupId8.id" "rd_a21:polySurfaceShape3.iog.og[0].gid";
connectAttr "rd_a21:lambert2SG.mwc" "rd_a21:polySurfaceShape3.iog.og[0].gco";
connectAttr "rd_a21:polyTriangulate1.out" "rd_a21:polySurfaceShape1.i";
connectAttr "rd_a21:groupId5.id" "rd_a21:polySurfaceShape1.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "rd_a21:polySurfaceShape1.iog.og[0].gco";
connectAttr "rd_a21:groupId6.id" "rd_a21:polySurfaceShape1.iog.og[1].gid";
connectAttr "rd_a21:lambert2SG.mwc" "rd_a21:polySurfaceShape1.iog.og[1].gco";
connectAttr "rd_a21:polyTweakUV3.out" "rd_a21:polySurfaceShape5.i";
connectAttr "rd_a21:groupId11.id" "rd_a21:polySurfaceShape5.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "rd_a21:polySurfaceShape5.iog.og[0].gco";
connectAttr "rd_a21:polyTweakUV3.uvtk[0]" "rd_a21:polySurfaceShape5.uvst[0].uvtw"
		;
connectAttr "rd_a21:groupParts9.og" "rd_a21:polySurfaceShape6.i";
connectAttr "rd_a21:groupId12.id" "rd_a21:polySurfaceShape6.iog.og[0].gid";
connectAttr "rd_a21:lambert2SG.mwc" "rd_a21:polySurfaceShape6.iog.og[0].gco";
connectAttr "rd_a21:polyTriangulate2.out" "rd_a21:polySurfaceShape4.i";
connectAttr "rd_a21:groupId9.id" "rd_a21:polySurfaceShape4.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "rd_a21:polySurfaceShape4.iog.og[0].gco";
connectAttr "rd_a21:groupId10.id" "rd_a21:polySurfaceShape4.iog.og[1].gid";
connectAttr "rd_a21:lambert2SG.mwc" "rd_a21:polySurfaceShape4.iog.og[1].gco";
connectAttr "deleteComponent1.og" "rd_a21:polySurfaceShape7.i";
connectAttr "rd_a21:groupId13.id" "rd_a21:polySurfaceShape7.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "rd_a21:polySurfaceShape7.iog.og[0].gco";
connectAttr "rd_a21:groupId14.id" "rd_a21:polySurfaceShape7.iog.og[1].gid";
connectAttr "rd_a21:lambert2SG.mwc" "rd_a21:polySurfaceShape7.iog.og[1].gco";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "rd_a21:lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "rd_a21:lambert2SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "rd_a21:polyCube1.out" "rd_a21:polyTweak1.ip";
connectAttr "rd_a21:polyTweak1.out" "rd_a21:deleteComponent1.ig";
connectAttr "rd_a21:deleteComponent1.og" "rd_a21:deleteComponent2.ig";
connectAttr "rd_a21:deleteComponent2.og" "rd_a21:deleteComponent3.ig";
connectAttr "rd_a21:deleteComponent3.og" "rd_a21:deleteComponent4.ig";
connectAttr "rd_a21:deleteComponent4.og" "rd_a21:deleteComponent5.ig";
connectAttr "rd_a21:deleteComponent5.og" "rd_a21:deleteComponent6.ig";
connectAttr "rd_a21:deleteComponent6.og" "rd_a21:polyTweak2.ip";
connectAttr "rd_a21:polyTweak2.out" "rd_a21:deleteComponent7.ig";
connectAttr "rd_a21:deleteComponent7.og" "rd_a21:deleteComponent8.ig";
connectAttr "rd_a21:deleteComponent8.og" "rd_a21:deleteComponent9.ig";
connectAttr "rd_a21:deleteComponent9.og" "rd_a21:deleteComponent10.ig";
connectAttr "rd_a21:deleteComponent10.og" "rd_a21:polyTweak3.ip";
connectAttr "rd_a21:polyTweak3.out" "rd_a21:deleteComponent11.ig";
connectAttr "rd_a21:deleteComponent11.og" "rd_a21:deleteComponent12.ig";
connectAttr "rd_a21:deleteComponent12.og" "rd_a21:deleteComponent13.ig";
connectAttr "rd_a21:deleteComponent13.og" "rd_a21:deleteComponent14.ig";
connectAttr "rd_a21:deleteComponent14.og" "rd_a21:polyTweak4.ip";
connectAttr "rd_a21:polyTweak4.out" "rd_a21:deleteComponent15.ig";
connectAttr "rd_a21:deleteComponent15.og" "rd_a21:deleteComponent16.ig";
connectAttr "rd_a21:deleteComponent16.og" "rd_a21:deleteComponent17.ig";
connectAttr "rd_a21:deleteComponent17.og" "rd_a21:deleteComponent18.ig";
connectAttr "rd_a21:deleteComponent18.og" "rd_a21:deleteComponent19.ig";
connectAttr "rd_a21:deleteComponent19.og" "rd_a21:deleteComponent20.ig";
connectAttr "rd_a21:deleteComponent20.og" "rd_a21:deleteComponent21.ig";
connectAttr "rd_a21:place2dTexture1.c" "rd_a21:file1.c";
connectAttr "rd_a21:place2dTexture1.tf" "rd_a21:file1.tf";
connectAttr "rd_a21:place2dTexture1.rf" "rd_a21:file1.rf";
connectAttr "rd_a21:place2dTexture1.mu" "rd_a21:file1.mu";
connectAttr "rd_a21:place2dTexture1.mv" "rd_a21:file1.mv";
connectAttr "rd_a21:place2dTexture1.s" "rd_a21:file1.s";
connectAttr "rd_a21:place2dTexture1.wu" "rd_a21:file1.wu";
connectAttr "rd_a21:place2dTexture1.wv" "rd_a21:file1.wv";
connectAttr "rd_a21:place2dTexture1.re" "rd_a21:file1.re";
connectAttr "rd_a21:place2dTexture1.of" "rd_a21:file1.of";
connectAttr "rd_a21:place2dTexture1.r" "rd_a21:file1.ro";
connectAttr "rd_a21:place2dTexture1.n" "rd_a21:file1.n";
connectAttr "rd_a21:place2dTexture1.vt1" "rd_a21:file1.vt1";
connectAttr "rd_a21:place2dTexture1.vt2" "rd_a21:file1.vt2";
connectAttr "rd_a21:place2dTexture1.vt3" "rd_a21:file1.vt3";
connectAttr "rd_a21:place2dTexture1.vc1" "rd_a21:file1.vc1";
connectAttr "rd_a21:place2dTexture1.o" "rd_a21:file1.uv";
connectAttr "rd_a21:place2dTexture1.ofs" "rd_a21:file1.fs";
connectAttr "rd_a21:deleteComponent21.og" "rd_a21:deleteComponent22.ig";
connectAttr "rd_a21:file2.oc" "rd_a21:lambert2.c";
connectAttr "rd_a21:lambert2.oc" "rd_a21:lambert2SG.ss";
connectAttr "rd_a21:pCubeShape1.iog.og[0]" "rd_a21:lambert2SG.dsm" -na;
connectAttr "rd_a21:pCubeShape1.ciog.cog[0]" "rd_a21:lambert2SG.dsm" -na;
connectAttr "rd_a21:polySurfaceShape1.iog.og[1]" "rd_a21:lambert2SG.dsm" -na;
connectAttr "rd_a21:polySurfaceShape3.iog.og[0]" "rd_a21:lambert2SG.dsm" -na;
connectAttr "rd_a21:polySurfaceShape4.iog.og[1]" "rd_a21:lambert2SG.dsm" -na;
connectAttr "rd_a21:polySurfaceShape6.iog.og[0]" "rd_a21:lambert2SG.dsm" -na;
connectAttr "rd_a21:polySurfaceShape7.iog.og[1]" "rd_a21:lambert2SG.dsm" -na;
connectAttr "rd_a21:groupId3.msg" "rd_a21:lambert2SG.gn" -na;
connectAttr "rd_a21:groupId4.msg" "rd_a21:lambert2SG.gn" -na;
connectAttr "rd_a21:groupId6.msg" "rd_a21:lambert2SG.gn" -na;
connectAttr "rd_a21:groupId8.msg" "rd_a21:lambert2SG.gn" -na;
connectAttr "rd_a21:groupId10.msg" "rd_a21:lambert2SG.gn" -na;
connectAttr "rd_a21:groupId12.msg" "rd_a21:lambert2SG.gn" -na;
connectAttr "rd_a21:groupId14.msg" "rd_a21:lambert2SG.gn" -na;
connectAttr "rd_a21:lambert2SG.msg" "rd_a21:materialInfo1.sg";
connectAttr "rd_a21:lambert2.msg" "rd_a21:materialInfo1.m";
connectAttr "rd_a21:file2.msg" "rd_a21:materialInfo1.t" -na;
connectAttr "rd_a21:place2dTexture2.c" "rd_a21:file2.c";
connectAttr "rd_a21:place2dTexture2.tf" "rd_a21:file2.tf";
connectAttr "rd_a21:place2dTexture2.rf" "rd_a21:file2.rf";
connectAttr "rd_a21:place2dTexture2.mu" "rd_a21:file2.mu";
connectAttr "rd_a21:place2dTexture2.mv" "rd_a21:file2.mv";
connectAttr "rd_a21:place2dTexture2.s" "rd_a21:file2.s";
connectAttr "rd_a21:place2dTexture2.wu" "rd_a21:file2.wu";
connectAttr "rd_a21:place2dTexture2.wv" "rd_a21:file2.wv";
connectAttr "rd_a21:place2dTexture2.re" "rd_a21:file2.re";
connectAttr "rd_a21:place2dTexture2.of" "rd_a21:file2.of";
connectAttr "rd_a21:place2dTexture2.r" "rd_a21:file2.ro";
connectAttr "rd_a21:place2dTexture2.n" "rd_a21:file2.n";
connectAttr "rd_a21:place2dTexture2.vt1" "rd_a21:file2.vt1";
connectAttr "rd_a21:place2dTexture2.vt2" "rd_a21:file2.vt2";
connectAttr "rd_a21:place2dTexture2.vt3" "rd_a21:file2.vt3";
connectAttr "rd_a21:place2dTexture2.vc1" "rd_a21:file2.vc1";
connectAttr "rd_a21:place2dTexture2.o" "rd_a21:file2.uv";
connectAttr "rd_a21:place2dTexture2.ofs" "rd_a21:file2.fs";
connectAttr "rd_a21:deleteComponent22.og" "rd_a21:polyPlanarProj1.ip";
connectAttr "rd_a21:pCubeShape1.wm" "rd_a21:polyPlanarProj1.mp";
connectAttr "rd_a21:polyPlanarProj1.out" "rd_a21:polyPlanarProj2.ip";
connectAttr "rd_a21:pCubeShape1.wm" "rd_a21:polyPlanarProj2.mp";
connectAttr "rd_a21:polyPlanarProj2.out" "rd_a21:polyPlanarProj3.ip";
connectAttr "rd_a21:pCubeShape1.wm" "rd_a21:polyPlanarProj3.mp";
connectAttr "rd_a21:polyPlanarProj3.out" "rd_a21:polyTweakUV1.ip";
connectAttr "rd_a21:pCubeShape2.o" "rd_a21:polyUnite1.ip[0]";
connectAttr "rd_a21:pCubeShape1.o" "rd_a21:polyUnite1.ip[1]";
connectAttr "rd_a21:pCubeShape2.wm" "rd_a21:polyUnite1.im[0]";
connectAttr "rd_a21:pCubeShape1.wm" "rd_a21:polyUnite1.im[1]";
connectAttr "rd_a21:polyTweakUV1.out" "rd_a21:groupParts1.ig";
connectAttr "rd_a21:groupId3.id" "rd_a21:groupParts1.gi";
connectAttr "rd_a21:polyUnite1.out" "rd_a21:groupParts2.ig";
connectAttr "rd_a21:groupId5.id" "rd_a21:groupParts2.gi";
connectAttr "rd_a21:groupParts2.og" "rd_a21:groupParts3.ig";
connectAttr "rd_a21:groupId6.id" "rd_a21:groupParts3.gi";
connectAttr "rd_a21:groupParts3.og" "rd_a21:polyTriangulate1.ip";
connectAttr "rd_a21:polySurfaceShape1.o" "rd_a21:polySeparate1.ip";
connectAttr "rd_a21:polySeparate1.out[0]" "rd_a21:groupParts4.ig";
connectAttr "rd_a21:groupId7.id" "rd_a21:groupParts4.gi";
connectAttr "rd_a21:polySeparate1.out[1]" "rd_a21:groupParts5.ig";
connectAttr "rd_a21:groupId8.id" "rd_a21:groupParts5.gi";
connectAttr "rd_a21:groupParts4.og" "rd_a21:polyTweakUV2.ip";
connectAttr "rd_a21:polySurfaceShape2.o" "rd_a21:polyUnite2.ip[0]";
connectAttr "rd_a21:polySurfaceShape3.o" "rd_a21:polyUnite2.ip[1]";
connectAttr "rd_a21:polySurfaceShape2.wm" "rd_a21:polyUnite2.im[0]";
connectAttr "rd_a21:polySurfaceShape3.wm" "rd_a21:polyUnite2.im[1]";
connectAttr "rd_a21:polyUnite2.out" "rd_a21:groupParts6.ig";
connectAttr "rd_a21:groupId9.id" "rd_a21:groupParts6.gi";
connectAttr "rd_a21:groupParts6.og" "rd_a21:groupParts7.ig";
connectAttr "rd_a21:groupId10.id" "rd_a21:groupParts7.gi";
connectAttr "rd_a21:groupParts7.og" "rd_a21:deleteComponent23.ig";
connectAttr "rd_a21:deleteComponent23.og" "rd_a21:deleteComponent24.ig";
connectAttr "rd_a21:deleteComponent24.og" "rd_a21:deleteComponent25.ig";
connectAttr "rd_a21:deleteComponent25.og" "rd_a21:deleteComponent26.ig";
connectAttr "rd_a21:deleteComponent26.og" "rd_a21:deleteComponent27.ig";
connectAttr "rd_a21:deleteComponent27.og" "rd_a21:deleteComponent28.ig";
connectAttr "rd_a21:deleteComponent28.og" "rd_a21:deleteComponent29.ig";
connectAttr "rd_a21:deleteComponent29.og" "rd_a21:deleteComponent30.ig";
connectAttr "rd_a21:deleteComponent30.og" "rd_a21:deleteComponent31.ig";
connectAttr "rd_a21:deleteComponent31.og" "rd_a21:deleteComponent32.ig";
connectAttr "rd_a21:deleteComponent32.og" "rd_a21:deleteComponent33.ig";
connectAttr "rd_a21:deleteComponent33.og" "rd_a21:deleteComponent34.ig";
connectAttr "rd_a21:deleteComponent34.og" "rd_a21:deleteComponent35.ig";
connectAttr "rd_a21:deleteComponent35.og" "rd_a21:deleteComponent36.ig";
connectAttr "rd_a21:deleteComponent36.og" "rd_a21:deleteComponent37.ig";
connectAttr "rd_a21:deleteComponent37.og" "rd_a21:deleteComponent38.ig";
connectAttr "rd_a21:deleteComponent38.og" "rd_a21:deleteComponent39.ig";
connectAttr "rd_a21:deleteComponent39.og" "rd_a21:deleteComponent40.ig";
connectAttr "rd_a21:deleteComponent40.og" "rd_a21:deleteComponent41.ig";
connectAttr "rd_a21:deleteComponent41.og" "rd_a21:deleteComponent42.ig";
connectAttr "rd_a21:deleteComponent42.og" "rd_a21:deleteComponent43.ig";
connectAttr "rd_a21:deleteComponent43.og" "rd_a21:deleteComponent44.ig";
connectAttr "rd_a21:deleteComponent44.og" "rd_a21:deleteComponent45.ig";
connectAttr "rd_a21:deleteComponent45.og" "rd_a21:deleteComponent46.ig";
connectAttr "rd_a21:deleteComponent46.og" "rd_a21:deleteComponent47.ig";
connectAttr "rd_a21:polyTweak5.out" "rd_a21:polyTriangulate2.ip";
connectAttr "rd_a21:deleteComponent47.og" "rd_a21:polyTweak5.ip";
connectAttr "rd_a21:polySurfaceShape4.o" "rd_a21:polySeparate2.ip";
connectAttr "rd_a21:polySeparate2.out[0]" "rd_a21:groupParts8.ig";
connectAttr "rd_a21:groupId11.id" "rd_a21:groupParts8.gi";
connectAttr "rd_a21:polySeparate2.out[1]" "rd_a21:groupParts9.ig";
connectAttr "rd_a21:groupId12.id" "rd_a21:groupParts9.gi";
connectAttr "rd_a21:groupParts8.og" "rd_a21:polyTweakUV3.ip";
connectAttr "rd_a21:polySurfaceShape5.o" "rd_a21:polyUnite3.ip[0]";
connectAttr "rd_a21:polySurfaceShape6.o" "rd_a21:polyUnite3.ip[1]";
connectAttr "rd_a21:polySurfaceShape5.wm" "rd_a21:polyUnite3.im[0]";
connectAttr "rd_a21:polySurfaceShape6.wm" "rd_a21:polyUnite3.im[1]";
connectAttr "rd_a21:polyUnite3.out" "rd_a21:groupParts10.ig";
connectAttr "rd_a21:groupId13.id" "rd_a21:groupParts10.gi";
connectAttr "rd_a21:groupParts10.og" "rd_a21:groupParts11.ig";
connectAttr "rd_a21:groupId14.id" "rd_a21:groupParts11.gi";
connectAttr "rd_a21:groupParts11.og" "deleteComponent1.ig";
connectAttr "rd_a21:lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "rd_a21:lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "rd_a21:place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "rd_a21:place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "rd_a21:file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "rd_a21:file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "rd_a21:file1.oc" ":lambert1.c";
connectAttr "rd_a21:pCubeShape2.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "rd_a21:pCubeShape2.ciog.cog[0]" ":initialShadingGroup.dsm" -na;
connectAttr "rd_a21:polySurfaceShape1.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "rd_a21:polySurfaceShape2.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "rd_a21:polySurfaceShape4.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "rd_a21:polySurfaceShape5.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "rd_a21:polySurfaceShape7.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "rd_a21:groupId1.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a21:groupId2.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a21:groupId5.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a21:groupId7.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a21:groupId9.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a21:groupId11.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a21:groupId13.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a21:file1.msg" ":initialMaterialInfo.t" -na;
dataStructure -fmt "raw" -as "name=externalContentTable:string=node:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
applyMetadata -fmt "raw" -v "channel\nname externalContentTable\nstream\nname v1.0\nindexType numeric\nstructure externalContentTable\n0\n\"rd_a21:file1\" \"fileTextureName\" \"/Users/jay/projects/amju-ww/Assets/tex/common/pz-ground22.png\" 1213114619 \"\" \"sourceImages\"\n1\n\"rd_a21:file2\" \"fileTextureName\" \"/Users/jay/projects/amju-ww/Assets/tex/common/underground3.png\" 2768784888 \"\" \"sourceImages\"\nendStream\nendChannel\nendAssociations\n" 
		-scn;
// End of rd_a21_notop.ma
