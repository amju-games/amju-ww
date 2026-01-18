//Maya ASCII 2015 scene
//Name: rd_a11_top.ma
//Last modified: Wed, Aug 31, 2016 07:23:11 AM
//Codeset: 1252
requires maya "2015";
requires -nodeType "mentalrayFramebuffer" -nodeType "mentalrayOptions" -nodeType "mentalrayGlobals"
		 -nodeType "mentalrayItemsList" -dataType "byteArray" "Mayatomr" "2015.0 - 3.12.1.16 ";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2015";
fileInfo "version" "2015";
fileInfo "cutIdentifier" "201405190330-916664";
fileInfo "osv" "Microsoft Windows 7 Business Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -2.5841702552980337 178.46382067439188 133.34986691917868 ;
	setAttr ".r" -type "double3" -60.338352729597815 358.9999999999601 1.0934822143907495e-015 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 266.74427772495142;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -0.2803542137145989 -53.327079296112061 1.3643342971801786 ;
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
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
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
createNode transform -n "rd_a11_top:pCube1";
	setAttr ".t" -type "double3" 0 -56 0 ;
	setAttr ".s" -type "double3" 400 100 100 ;
createNode transform -n "rd_a11_top:transform1" -p "rd_a11_top:pCube1";
	setAttr ".v" no;
createNode mesh -n "rd_a11_top:pCubeShape1" -p "rd_a11_top:transform1";
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
createNode transform -n "rd_a11_top:pCube2";
	setAttr ".t" -type "double3" 0 -56 0 ;
	setAttr ".s" -type "double3" 400 100 100 ;
createNode transform -n "rd_a11_top:transform2" -p "rd_a11_top:pCube2";
	setAttr ".v" no;
createNode mesh -n "rd_a11_top:pCubeShape2" -p "rd_a11_top:transform2";
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
createNode transform -n "rd_a11_top:polySurface1";
createNode transform -n "rd_a11_top:polySurface2" -p "rd_a11_top:polySurface1";
createNode transform -n "rd_a11_top:transform5" -p "rd_a11_top:polySurface2";
	setAttr ".v" no;
createNode mesh -n "rd_a11_top:polySurfaceShape2" -p "rd_a11_top:transform5";
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
createNode transform -n "rd_a11_top:polySurface3" -p "rd_a11_top:polySurface1";
createNode transform -n "rd_a11_top:transform4" -p "rd_a11_top:polySurface3";
	setAttr ".v" no;
createNode mesh -n "rd_a11_top:polySurfaceShape3" -p "rd_a11_top:transform4";
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
createNode transform -n "rd_a11_top:transform3" -p "rd_a11_top:polySurface1";
	setAttr ".v" no;
createNode mesh -n "rd_a11_top:polySurfaceShape1" -p "rd_a11_top:transform3";
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
createNode transform -n "rd_a11_top:polySurface4";
	setAttr ".s" -type "double3" 0.5 1 1 ;
createNode transform -n "rd_a11_top:polySurface5" -p "rd_a11_top:polySurface4";
createNode transform -n "rd_a11_top:transform8" -p "rd_a11_top:polySurface5";
	setAttr ".v" no;
createNode mesh -n "rd_a11_top:polySurfaceShape5" -p "rd_a11_top:transform8";
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
createNode transform -n "rd_a11_top:polySurface6" -p "rd_a11_top:polySurface4";
createNode transform -n "rd_a11_top:transform7" -p "rd_a11_top:polySurface6";
	setAttr ".v" no;
createNode mesh -n "rd_a11_top:polySurfaceShape6" -p "rd_a11_top:transform7";
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
createNode transform -n "rd_a11_top:transform6" -p "rd_a11_top:polySurface4";
	setAttr ".v" no;
createNode mesh -n "rd_a11_top:polySurfaceShape4" -p "rd_a11_top:transform6";
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
	setAttr -s 24 ".pt";
	setAttr ".pt[24]" -type "float3" -1.1920929e-007 1.1920929e-007 0 ;
	setAttr ".pt[25]" -type "float3" 2.3841858e-007 27.923841 0 ;
	setAttr ".pt[26]" -type "float3" -4.7683716e-007 -3.8146973e-006 0 ;
	setAttr ".pt[27]" -type "float3" -9.5367432e-007 37.697166 0 ;
	setAttr ".pt[28]" -type "float3" -9.5367432e-007 -7.6293945e-006 0 ;
	setAttr ".pt[43]" -type "float3" -1.1920929e-007 1.1920929e-007 0 ;
	setAttr ".pt[44]" -type "float3" 2.3841858e-007 27.923841 0 ;
	setAttr ".pt[45]" -type "float3" -4.7683716e-007 -3.8146973e-006 0 ;
	setAttr ".pt[46]" -type "float3" -9.5367432e-007 37.697166 0 ;
	setAttr ".pt[47]" -type "float3" -9.5367432e-007 -7.6293945e-006 0 ;
	setAttr ".pt[48]" -type "float3" 0 1.4901161e-008 0 ;
	setAttr ".pt[49]" -type "float3" -1.7881393e-007 1.1920929e-007 0 ;
	setAttr ".pt[50]" -type "float3" 0 27.923841 0 ;
	setAttr ".pt[51]" -type "float3" -4.7683716e-007 0 0 ;
	setAttr ".pt[52]" -type "float3" 4.7683716e-007 37.697166 0 ;
	setAttr ".pt[53]" -type "float3" -9.5367432e-007 3.8146973e-006 0 ;
	setAttr ".pt[54]" -type "float3" -9.5367432e-007 -3.8146973e-006 0 ;
	setAttr ".pt[55]" -type "float3" 0 1.4901161e-008 0 ;
	setAttr ".pt[56]" -type "float3" -1.7881393e-007 1.1920929e-007 0 ;
	setAttr ".pt[57]" -type "float3" 0 27.923841 0 ;
	setAttr ".pt[58]" -type "float3" -4.7683716e-007 0 0 ;
	setAttr ".pt[59]" -type "float3" 4.7683716e-007 37.697166 0 ;
	setAttr ".pt[60]" -type "float3" -9.5367432e-007 3.8146973e-006 0 ;
	setAttr ".pt[61]" -type "float3" -9.5367432e-007 -3.8146973e-006 0 ;
	setAttr ".vnm" 0;
createNode transform -n "rd_a11_top:polySurface7";
	setAttr ".s" -type "double3" 0.5 1 1 ;
createNode transform -n "rd_a11_top:polySurface8" -p "rd_a11_top:polySurface7";
createNode transform -n "rd_a11_top:transform11" -p "rd_a11_top:polySurface8";
	setAttr ".v" no;
createNode mesh -n "rd_a11_top:polySurfaceShape8" -p "rd_a11_top:transform11";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.36582113339702027 0.50002425909042358 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".vnm" 0;
createNode transform -n "rd_a11_top:polySurface9" -p "rd_a11_top:polySurface7";
createNode transform -n "rd_a11_top:transform10" -p "rd_a11_top:polySurface9";
	setAttr ".v" no;
createNode mesh -n "rd_a11_top:polySurfaceShape9" -p "rd_a11_top:transform10";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.75466740131378174 0.077359155411596436 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr ".vnm" 0;
createNode transform -n "rd_a11_top:transform9" -p "rd_a11_top:polySurface7";
	setAttr ".v" no;
createNode mesh -n "rd_a11_top:polySurfaceShape7" -p "rd_a11_top:transform9";
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
	setAttr -s 40 ".pt";
	setAttr ".pt[0]" -type "float3" 9.7733431 0 0 ;
	setAttr ".pt[1]" -type "float3" 11.169535 0 0 ;
	setAttr ".pt[3]" -type "float3" -9.7733431 0 0 ;
	setAttr ".pt[4]" -type "float3" -8.3771515 0 0 ;
	setAttr ".pt[6]" -type "float3" 9.7733431 0 0 ;
	setAttr ".pt[7]" -type "float3" 11.169535 0 0 ;
	setAttr ".pt[9]" -type "float3" -9.7733431 0 0 ;
	setAttr ".pt[10]" -type "float3" -8.3771515 0 0 ;
	setAttr ".pt[13]" -type "float3" 9.7733431 0 0 ;
	setAttr ".pt[14]" -type "float3" 11.169535 0 0 ;
	setAttr ".pt[16]" -type "float3" -9.7733431 0 0 ;
	setAttr ".pt[17]" -type "float3" -8.3771515 0 0 ;
	setAttr ".pt[19]" -type "float3" 9.7733431 0 0 ;
	setAttr ".pt[20]" -type "float3" 11.169535 0 0 ;
	setAttr ".pt[22]" -type "float3" -9.7733431 0 0 ;
	setAttr ".pt[23]" -type "float3" -8.3771515 0 0 ;
	setAttr ".pt[24]" -type "float3" 9.7733431 0 0 ;
	setAttr ".pt[25]" -type "float3" 11.169535 -27.923836 0 ;
	setAttr ".pt[27]" -type "float3" -9.7733431 -37.697189 0 ;
	setAttr ".pt[28]" -type "float3" -8.3771515 0 0 ;
	setAttr ".pt[29]" -type "float3" 9.7733431 0 0 ;
	setAttr ".pt[30]" -type "float3" 11.169535 0 0 ;
	setAttr ".pt[32]" -type "float3" -9.7733431 0 0 ;
	setAttr ".pt[33]" -type "float3" -8.3771515 0 0 ;
	setAttr ".pt[38]" -type "float3" 9.7733431 0 0 ;
	setAttr ".pt[39]" -type "float3" 11.169535 0 0 ;
	setAttr ".pt[41]" -type "float3" -9.7733431 0 0 ;
	setAttr ".pt[42]" -type "float3" -8.3771515 0 0 ;
	setAttr ".pt[43]" -type "float3" 9.7733431 0 0 ;
	setAttr ".pt[44]" -type "float3" 11.169535 -27.923836 0 ;
	setAttr ".pt[46]" -type "float3" -9.7733431 -37.697189 0 ;
	setAttr ".pt[47]" -type "float3" -8.3771515 0 0 ;
	setAttr ".pt[49]" -type "float3" 9.7733431 0 0 ;
	setAttr ".pt[50]" -type "float3" 11.169535 -27.923836 0 ;
	setAttr ".pt[52]" -type "float3" -9.7733431 -37.697189 0 ;
	setAttr ".pt[53]" -type "float3" -8.3771515 0 0 ;
	setAttr ".pt[56]" -type "float3" 9.7733431 0 0 ;
	setAttr ".pt[57]" -type "float3" 11.169535 -27.923836 0 ;
	setAttr ".pt[59]" -type "float3" -9.7733431 -37.697189 0 ;
	setAttr ".pt[60]" -type "float3" -8.3771515 0 0 ;
	setAttr ".vnm" 0;
createNode transform -n "rd_a11_top:polySurface10";
	setAttr -av ".v" no;
createNode mesh -n "rd_a11_top:polySurfaceShape10" -p "rd_a11_top:polySurface10";
	setAttr -k off ".v";
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
	setAttr -s 24 ".pt";
	setAttr ".pt[24]" -type "float3" 2.2319219 17.72184 0 ;
	setAttr ".pt[25]" -type "float3" 0.65324306 7.3931117 0 ;
	setAttr ".pt[26]" -type "float3" -1.0038595 0.94346648 0 ;
	setAttr ".pt[27]" -type "float3" -2.6149178 7.5295053 0 ;
	setAttr ".pt[28]" -type "float3" -4.2726684 24.120176 0 ;
	setAttr ".pt[43]" -type "float3" 2.2319219 17.72184 0 ;
	setAttr ".pt[44]" -type "float3" 0.65324306 7.3931117 0 ;
	setAttr ".pt[45]" -type "float3" -1.0038595 0.94346648 0 ;
	setAttr ".pt[46]" -type "float3" -2.6149178 7.5295053 0 ;
	setAttr ".pt[47]" -type "float3" -4.2726684 24.120176 0 ;
	setAttr ".pt[48]" -type "float3" 2.9102736 30.417061 0 ;
	setAttr ".pt[49]" -type "float3" 3.450659 17.967817 0 ;
	setAttr ".pt[50]" -type "float3" 1.8719795 7.639091 0 ;
	setAttr ".pt[51]" -type "float3" 0.21487498 1.1894395 0 ;
	setAttr ".pt[52]" -type "float3" -1.3961797 7.7754807 0 ;
	setAttr ".pt[53]" -type "float3" -3.0539341 24.366156 0 ;
	setAttr ".pt[54]" -type "float3" -4.9179955 38.48708 0 ;
	setAttr ".pt[55]" -type "float3" 2.9102736 30.417061 0 ;
	setAttr ".pt[56]" -type "float3" 3.450659 17.967817 0 ;
	setAttr ".pt[57]" -type "float3" 1.8719795 7.639091 0 ;
	setAttr ".pt[58]" -type "float3" 0.21487498 1.1894395 0 ;
	setAttr ".pt[59]" -type "float3" -1.3961797 7.7754807 0 ;
	setAttr ".pt[60]" -type "float3" -3.0539341 24.366156 0 ;
	setAttr ".pt[61]" -type "float3" -4.9179955 38.48708 0 ;
	setAttr ".vnm" 0;
createNode transform -n "rd_a11_top:polySurface11";
	setAttr ".t" -type "double3" 0 1 0 ;
	setAttr ".s" -type "double3" 1.05 1.05 1.05 ;
createNode mesh -n "rd_a11_top:polySurfaceShape11" -p "rd_a11_top:polySurface11";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.36500002443790436 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".vnm" 0;
createNode mesh -n "rd_a11_top:polySurfaceShape12" -p "rd_a11_top:polySurface11";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.34867872297763824 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 62 ".uvst[0].uvsp[0:61]" -type "float2" 0.2432093 0.0051858425
		 0.2432093 0.098053038 0.23884004 0.098053038 0.30451527 0.098053038 0.30451527 0.0051858425
		 0.36582124 0.098053038 0.36582124 0.0051858425 0.42712712 0.098053038 0.42712712
		 0.0051858425 0.488433 0.098053038 0.488433 0.0051858425 0.49944282 0.098053038 0.23884004
		 0.90720499 0.2432093 0.90720499 0.30451527 0.90720499 0.36582124 0.90720499 0.42712712
		 0.90720499 0.488433 0.90720499 0.49944282 0.90720499 0.2432093 0.99486268 0.30451527
		 0.99486268 0.36582124 0.99486268 0.42712712 0.99486268 0.488433 0.99486268 0.49718454
		 0.030464649 0.49697661 0.030464649 0.49718454 1 0.49697661 1 0.20473196 0.030464649
		 0.23246998 0.057653233 0.20473196 1 0.23246998 1 0.50000012 0.030464649 0.50000012
		 1 0.49823472 0.092591494 0.49823472 1 0.20473196 1 0.23246998 1 0.20473196 0.030464649
		 0.23246998 0.057653233 0.50000012 1 0.50000012 0.030464649 0.49823472 1 0.49823472
		 0.092591494 0.49718454 1 0.49718454 0.030464649 0.49697661 0.030464649 0.49697661
		 1 0.20473196 0 0.19735733 0.030464649 0.23246998 0.027188584 0.50000012 0 0.49823472
		 0.062126845 0.49718454 0 0.19735733 0.030464649 0.20473196 0 0.23246998 0.027188584
		 0.50000012 0 0.49823472 0.062126845 0.49718454 0 0.19735733 1 0.19735733 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr -s 31 ".pt";
	setAttr ".pt[1]" -type "float3" 0 0 2.5987306 ;
	setAttr ".pt[2]" -type "float3" 0 0 2.5987306 ;
	setAttr ".pt[3]" -type "float3" 0 0 2.5987306 ;
	setAttr ".pt[24]" -type "float3" -6.5480742 82.975731 0 ;
	setAttr ".pt[25]" -type "float3" -7.3147807 75.35006 0 ;
	setAttr ".pt[26]" -type "float3" -1.1283342 77.563141 0 ;
	setAttr ".pt[27]" -type "float3" 18.797304 79.948433 0 ;
	setAttr ".pt[28]" -type "float3" 2.9408798 85.805779 0 ;
	setAttr ".pt[30]" -type "float3" 0 0 2.5987306 ;
	setAttr ".pt[31]" -type "float3" 0 0 2.5987306 ;
	setAttr ".pt[32]" -type "float3" 0 0 2.5987306 ;
	setAttr ".pt[43]" -type "float3" -6.5480742 82.975731 0 ;
	setAttr ".pt[44]" -type "float3" -7.3147807 75.35006 0 ;
	setAttr ".pt[45]" -type "float3" -1.1283342 77.563141 0 ;
	setAttr ".pt[46]" -type "float3" 18.797304 79.948433 0 ;
	setAttr ".pt[47]" -type "float3" 2.9408798 85.805779 0 ;
	setAttr ".pt[48]" -type "float3" -0.53400367 92.073456 0 ;
	setAttr ".pt[49]" -type "float3" -5.1405997 84.485336 0 ;
	setAttr ".pt[50]" -type "float3" -5.9073048 76.85965 0 ;
	setAttr ".pt[51]" -type "float3" 0.27913693 79.072777 0 ;
	setAttr ".pt[52]" -type "float3" 20.204779 81.458076 0 ;
	setAttr ".pt[53]" -type "float3" 4.3483505 87.315414 0 ;
	setAttr ".pt[54]" -type "float3" -0.7848627 93.90435 0 ;
	setAttr ".pt[55]" -type "float3" -0.53400367 92.073456 0 ;
	setAttr ".pt[56]" -type "float3" -5.1405997 84.485336 0 ;
	setAttr ".pt[57]" -type "float3" -5.9073048 76.85965 0 ;
	setAttr ".pt[58]" -type "float3" 0.27913693 79.072777 0 ;
	setAttr ".pt[59]" -type "float3" 20.204779 81.458076 0 ;
	setAttr ".pt[60]" -type "float3" 4.3483505 87.315414 0 ;
	setAttr ".pt[61]" -type "float3" -0.7848627 93.90435 0 ;
	setAttr -s 62 ".vt[0:61]"  -41.33459473 -6 50 -21.16824722 -6 50 -1.4901161e-006 -6 50
		 20.58005142 -6 50 41.75643539 -6 50 -50 -6 42.39242554 -41.33459473 0.28436661 42.39242554
		 -21.16824722 0.28436661 42.39242554 -1.4901161e-006 0.28436661 42.39242554 20.58005142 0.28436661 42.39242554
		 41.75643539 0.28436661 42.39242554 49.99999619 -6 42.39242554 -50 -6 -41.10614014
		 -41.33459473 0.28436661 -41.10614014 -21.16824722 0.28436661 -41.10614014 -1.4901161e-006 0.28436661 -41.10614014
		 20.58005142 0.28436661 -41.10614014 41.75643539 0.28436661 -41.10614014 49.99999619 -6 -41.10614014
		 -41.33459473 -6 -50 -21.16824722 -6 -50 -1.4901161e-006 -6 -50 20.58005142 -6 -50
		 41.75643539 -6 -50 -41.33459473 -105.99999237 50 -21.16824722 -105.99998474 50 -1.6093254e-006 -106 50
		 20.58005142 -106.000015258789 50 41.75643539 -106 50 -41.33459473 -6 50 -21.16824722 -6 50
		 -1.4901161e-006 -6 50 20.58005142 -6 50 41.75643539 -6 50 -50 -6 42.39242554 49.99999237 -6 42.39242554
		 -50 -6 -41.10614014 49.99999237 -6 -41.10614014 -41.33459473 -6 -50 -21.16824722 -6 -50
		 -1.4901161e-006 -6 -50 20.58005142 -6 -50 41.75643539 -6 -50 -41.33459473 -105.99999237 -50
		 -21.16824722 -105.99998474 -50 -1.6093254e-006 -106 -50 20.58005142 -106.000015258789 -50
		 41.75643539 -106 -50 -50 -105.99999237 -41.10613632 -41.33459473 -109.1421814 -41.10613632
		 -21.16824722 -109.14217377 -41.10613632 -1.6093254e-006 -109.1421814 -41.10613632
		 20.58005142 -109.14220428 -41.10613632 41.75643539 -109.1421814 -41.10613632 49.99999237 -106 -41.10613632
		 -50 -105.99999237 42.39242935 -41.33459473 -109.1421814 42.39242935 -21.16824722 -109.14217377 42.39242935
		 -1.6093254e-006 -109.1421814 42.39242935 20.58005142 -109.14220428 42.39242935 41.75643539 -109.1421814 42.39242935
		 49.99999237 -106 42.39242935;
	setAttr -s 152 ".ed[0:151]"  0 1 0 1 2 0 2 3 0 3 4 0 5 6 1 6 7 1 7 8 1
		 8 9 1 9 10 1 10 11 1 12 13 1 13 14 1 14 15 1 15 16 1 16 17 1 17 18 1 19 20 0 20 21 0
		 21 22 0 22 23 0 0 5 0 0 6 1 1 7 1 2 8 1 3 9 1 4 10 1 4 11 0 5 12 0 6 13 1 7 14 1
		 8 15 1 9 16 1 10 17 1 11 18 0 12 19 0 13 19 1 14 20 1 15 21 1 16 22 1 17 23 1 18 23 0
		 6 12 1 11 17 1 0 7 1 1 8 1 2 9 1 3 10 1 6 14 1 7 15 1 8 16 1 9 17 1 19 14 1 20 15 1
		 21 16 1 22 17 1 24 25 0 25 26 0 26 27 0 27 28 0 29 30 0 30 31 0 31 32 0 32 33 0 38 39 0
		 39 40 0 40 41 0 41 42 0 43 44 0 44 45 0 45 46 0 46 47 0 48 49 1 49 50 1 50 51 1 51 52 1
		 52 53 1 53 54 1 55 56 1 56 57 1 57 58 1 58 59 1 59 60 1 60 61 1 24 29 1 25 30 1 26 31 1
		 27 32 1 28 33 1 29 34 0 33 35 0 34 36 0 35 37 0 36 38 0 37 42 0 38 43 1 39 44 1 40 45 1
		 41 46 1 42 47 1 43 48 0 43 49 1 44 50 1 45 51 1 46 52 1 47 53 1 47 54 0 48 55 0 49 56 1
		 50 57 1 51 58 1 52 59 1 53 60 1 54 61 0 55 24 0 56 24 1 57 25 1 58 26 1 59 27 1 60 28 1
		 61 28 0 54 37 1 61 35 1 48 36 1 55 34 1 61 33 1 47 37 1 49 55 1 54 60 1 54 35 1 36 43 1
		 34 48 1 29 55 1 25 29 1 26 30 1 27 31 1 28 32 1 39 43 1 40 44 1 41 45 1 42 46 1 43 50 1
		 44 51 1 45 52 1 46 53 1 49 57 1 50 58 1 51 59 1 52 60 1 56 25 1 57 26 1 58 27 1 59 28 1;
	setAttr -s 76 ".n[0:75]" -type "float3"  -0.3485316 0.4128547 0.84147292
		 -0.30439401 0.92716467 0.21842621 -0.87336463 0.3802315 0.30439839 -0.011773262 0.95568401
		 0.29415923 -0.036639702 0.44475794 0.89490104 0 0.96216571 0.27246502 0.0013447633
		 0.43448853 0.90067631 0 0.96216571 0.27246502 0.051763538 0.44240832 0.89531851 0.25997278
		 0.89069521 0.37292933 0.48928657 0.34052914 0.80289388 0.88914365 0.376726 0.25980976
		 -0.81302303 0.50718665 -0.28592864 -0.29918182 0.90813673 -0.29287878 0 0.95307219
		 -0.30274317 0 0.95307219 -0.30274317 0 0.95307219 -0.30274317 0.27274734 0.92697245
		 -0.25754821 0.87914997 0.31852779 -0.35445091 -0.27676579 0.58378261 -0.76328158
		 4.2906514e-008 0.45985207 -0.88799554 -6.5593788e-008 0.45985207 -0.88799554 3.3416189e-008
		 0.45985207 -0.88799554 0.29261917 0.38008714 -0.87744397 0.66006821 -0.28718126 0.69414467
		 0.92724574 -0.13667309 0.34861961 0.48928657 0.34052914 0.80289388 0.88914365 0.376726
		 0.25980976 -0.72805166 -0.3495369 0.58971572 -0.16605847 -0.64999157 0.74157637 -0.3485316
		 0.4128547 0.84147292 -0.036639702 0.44475794 0.89490104 0.047013342 -0.6651932 0.74518979
		 0.0013447633 0.43448853 0.90067631 0.19424064 -0.62283188 0.75785941 0.051763538
		 0.44240832 0.89531851 -0.27676579 0.58378261 -0.76328158 4.2906514e-008 0.45985207
		 -0.88799554 -0.66262019 -0.36079991 -0.65632159 -0.045792654 -0.64282012 -0.76464719
		 -6.5593788e-008 0.45985207 -0.88799554 0.04204496 -0.63497281 -0.77138948 3.3416189e-008
		 0.45985207 -0.88799554 0.33898607 -0.51796442 -0.78536695 0.29261917 0.38008714 -0.87744397
		 0.77387744 -0.20266274 -0.60003471 0.97166938 -0.21621095 -0.09545406 0.87914997
		 0.31852779 -0.35445091 -0.66262019 -0.36079991 -0.65632159 -0.71179509 -0.70236671
		 -0.0053762868 -0.99309069 -0.10392263 -0.054507062 -0.1462277 -0.9866671 -0.071452655
		 -0.045792654 -0.64282012 -0.76464719 0.069360152 -0.99296302 -0.095987678 0.04204496
		 -0.63497281 -0.77138948 0.42934114 -0.89633679 -0.11066511 0.33898607 -0.51796442
		 -0.78536695 0.83603209 -0.53108948 -0.1378202 0.77387744 -0.20266274 -0.60003471
		 0.97166938 -0.21621095 -0.09545406 -0.96339965 -0.11292585 0.24312288 -0.64694852
		 -0.76167762 0.036125571 -0.14725441 -0.98411125 0.099203698 0.069329455 -0.99139142
		 0.11107046 0.42424387 -0.89497745 0.137959 0.86304331 -0.49760908 0.086842291 0.92724574
		 -0.13667309 0.34861961 -0.72805166 -0.3495369 0.58971572 -0.16605847 -0.64999157
		 0.74157637 0.047013342 -0.6651932 0.74518979 0.19424064 -0.62283188 0.75785941 0.66006821
		 -0.28718126 0.69414467 -0.99309069 -0.10392263 -0.054507062 -0.81302303 0.50718665
		 -0.28592864 -0.96339965 -0.11292585 0.24312288 -0.87336463 0.3802315 0.30439839;
	setAttr -s 92 -ch 276 ".fc[0:91]" -type "polyFaces" 
		f 3 21 -5 -21
		mu 0 3 0 1 2
		f 3 -22 43 -6
		mu 0 3 1 0 3
		f 3 -44 0 22
		mu 0 3 3 0 4
		f 3 -23 44 -7
		mu 0 3 3 4 5
		f 3 -45 1 23
		mu 0 3 5 4 6
		f 3 -24 45 -8
		mu 0 3 5 6 7
		f 3 -46 2 24
		mu 0 3 7 6 8
		f 3 -25 46 -9
		mu 0 3 7 8 9
		f 3 -47 3 25
		mu 0 3 9 8 10
		f 3 26 -10 -26
		mu 0 3 10 11 9
		f 3 4 41 -28
		mu 0 3 2 1 12
		f 3 -42 28 -11
		mu 0 3 12 1 13
		f 3 -29 47 -12
		mu 0 3 13 1 14
		f 3 -48 5 29
		mu 0 3 14 1 3
		f 3 -30 48 -13
		mu 0 3 14 3 15
		f 3 -49 6 30
		mu 0 3 15 3 5
		f 3 -31 49 -14
		mu 0 3 15 5 16
		f 3 -50 7 31
		mu 0 3 16 5 7
		f 3 -32 50 -15
		mu 0 3 16 7 17
		f 3 -51 8 32
		mu 0 3 17 7 9
		f 3 9 42 -33
		mu 0 3 9 11 17
		f 3 -43 33 -16
		mu 0 3 17 11 18
		f 3 10 35 -35
		mu 0 3 12 13 19
		f 3 -17 51 36
		mu 0 3 20 19 14
		f 3 -52 -36 11
		mu 0 3 14 19 13
		f 3 -18 52 37
		mu 0 3 21 20 15
		f 3 -53 -37 12
		mu 0 3 15 20 14
		f 3 -19 53 38
		mu 0 3 22 21 16
		f 3 -54 -38 13
		mu 0 3 16 21 15
		f 3 -20 54 39
		mu 0 3 23 22 17
		f 3 -55 -39 14
		mu 0 3 17 22 16
		f 3 15 40 -40
		mu 0 3 17 18 23
		f 3 -120 124 -88
		mu 0 3 24 25 26
		f 3 -125 121 -90
		mu 0 3 26 25 27
		f 3 55 132 -84
		mu 0 3 28 29 30
		f 3 -133 84 -60
		mu 0 3 30 29 31
		f 3 56 133 -85
		mu 0 3 29 32 31
		f 3 -134 85 -61
		mu 0 3 31 32 33
		f 3 57 134 -86
		mu 0 3 32 34 33
		f 3 -135 86 -62
		mu 0 3 33 34 35
		f 3 58 135 -87
		mu 0 3 34 24 35
		f 3 -136 87 -63
		mu 0 3 35 24 26
		f 3 63 136 -95
		mu 0 3 36 37 38
		f 3 -137 95 -68
		mu 0 3 38 37 39
		f 3 64 137 -96
		mu 0 3 37 40 39
		f 3 -138 96 -69
		mu 0 3 39 40 41
		f 3 65 138 -97
		mu 0 3 40 42 41
		f 3 -139 97 -70
		mu 0 3 41 42 43
		f 3 66 139 -98
		mu 0 3 42 44 43
		f 3 -140 98 -71
		mu 0 3 43 44 45
		f 3 -106 125 -121
		mu 0 3 46 45 47
		f 3 -126 -99 -94
		mu 0 3 47 45 44
		f 3 100 -72 -100
		mu 0 3 38 48 49
		f 3 -101 140 -73
		mu 0 3 48 38 50
		f 3 -141 67 101
		mu 0 3 50 38 39
		f 3 -102 141 -74
		mu 0 3 50 39 51
		f 3 -142 68 102
		mu 0 3 51 39 41
		f 3 -103 142 -75
		mu 0 3 51 41 52
		f 3 -143 69 103
		mu 0 3 52 41 43
		f 3 -104 143 -76
		mu 0 3 52 43 53
		f 3 -144 70 104
		mu 0 3 53 43 45
		f 3 105 -77 -105
		mu 0 3 45 46 53
		f 3 71 126 -107
		mu 0 3 49 48 54
		f 3 -127 107 -78
		mu 0 3 54 48 55
		f 3 -108 144 -79
		mu 0 3 55 48 56
		f 3 -145 72 108
		mu 0 3 56 48 50
		f 3 -109 145 -80
		mu 0 3 56 50 57
		f 3 -146 73 109
		mu 0 3 57 50 51
		f 3 -110 146 -81
		mu 0 3 57 51 58
		f 3 -147 74 110
		mu 0 3 58 51 52
		f 3 -111 147 -82
		mu 0 3 58 52 59
		f 3 -148 75 111
		mu 0 3 59 52 53
		f 3 76 127 -112
		mu 0 3 53 46 59
		f 3 -128 112 -83
		mu 0 3 59 46 25
		f 3 77 114 -114
		mu 0 3 54 55 28
		f 3 -115 148 -56
		mu 0 3 28 55 29
		f 3 -149 78 115
		mu 0 3 29 55 56
		f 3 -116 149 -57
		mu 0 3 29 56 32
		f 3 -150 79 116
		mu 0 3 32 56 57
		f 3 -117 150 -58
		mu 0 3 32 57 34
		f 3 -151 80 117
		mu 0 3 34 57 58
		f 3 -118 151 -59
		mu 0 3 34 58 24
		f 3 -152 81 118
		mu 0 3 24 58 59
		f 3 82 119 -119
		mu 0 3 59 25 24
		f 3 -113 128 -122
		mu 0 3 25 46 27
		f 3 -129 120 -92
		mu 0 3 27 46 47
		f 3 122 129 99
		mu 0 3 49 60 38
		f 3 -130 92 94
		mu 0 3 38 60 36
		f 3 123 130 106
		mu 0 3 54 61 49
		f 3 -131 90 -123
		mu 0 3 49 61 60
		f 3 83 131 113
		mu 0 3 28 30 54
		f 3 -132 88 -124
		mu 0 3 54 30 61;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 3 ".lnk";
	setAttr -s 3 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode polyCube -n "rd_a11_top:polyCube1";
	setAttr ".sw" 10;
	setAttr ".sh" 3;
	setAttr ".sd" 3;
	setAttr ".cuv" 4;
createNode polyTweak -n "rd_a11_top:polyTweak1";
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
createNode deleteComponent -n "rd_a11_top:deleteComponent1";
	setAttr ".dc" -type "componentList" 0;
createNode deleteComponent -n "rd_a11_top:deleteComponent2";
	setAttr ".dc" -type "componentList" 0;
createNode deleteComponent -n "rd_a11_top:deleteComponent3";
	setAttr ".dc" -type "componentList" 1 "e[152]";
createNode deleteComponent -n "rd_a11_top:deleteComponent4";
	setAttr ".dc" -type "componentList" 1 "e[141]";
createNode deleteComponent -n "rd_a11_top:deleteComponent5";
	setAttr ".dc" -type "componentList" 1 "e[130]";
createNode deleteComponent -n "rd_a11_top:deleteComponent6";
	setAttr ".dc" -type "componentList" 4 "vtx[10]" "vtx[21]" "vtx[32]" "vtx[43]";
createNode polyTweak -n "rd_a11_top:polyTweak2";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[72]" -type "float3" -0.0078718355 0 0.043295097 ;
	setAttr ".tk[83]" -type "float3" -0.0078718355 0 0.043295097 ;
	setAttr ".tk[94]" -type "float3" -0.0078718355 0 0.043295097 ;
	setAttr ".tk[105]" -type "float3" -0.0078718355 0 0.043295097 ;
createNode deleteComponent -n "rd_a11_top:deleteComponent7";
	setAttr ".dc" -type "componentList" 1 "e[189]";
createNode deleteComponent -n "rd_a11_top:deleteComponent8";
	setAttr ".dc" -type "componentList" 1 "e[199]";
createNode deleteComponent -n "rd_a11_top:deleteComponent9";
	setAttr ".dc" -type "componentList" 1 "e[209]";
createNode deleteComponent -n "rd_a11_top:deleteComponent10";
	setAttr ".dc" -type "componentList" 4 "vtx[72]" "vtx[83]" "vtx[94]" "vtx[105]";
createNode polyTweak -n "rd_a11_top:polyTweak3";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[62]" -type "float3" 0.0088557303 -8.9406967e-008 0.05116713 ;
	setAttr ".tk[72]" -type "float3" 0.0088557303 -8.9406967e-008 0.05116713 ;
	setAttr ".tk[82]" -type "float3" 0.0088557303 -8.9406967e-008 0.05116713 ;
	setAttr ".tk[92]" -type "float3" 0.0088557303 -8.9406967e-008 0.05116713 ;
createNode deleteComponent -n "rd_a11_top:deleteComponent11";
	setAttr ".dc" -type "componentList" 1 "e[175]";
createNode deleteComponent -n "rd_a11_top:deleteComponent12";
	setAttr ".dc" -type "componentList" 1 "e[184]";
createNode deleteComponent -n "rd_a11_top:deleteComponent13";
	setAttr ".dc" -type "componentList" 1 "e[193]";
createNode deleteComponent -n "rd_a11_top:deleteComponent14";
	setAttr ".dc" -type "componentList" 4 "vtx[62]" "vtx[72]" "vtx[82]" "vtx[92]";
createNode polyTweak -n "rd_a11_top:polyTweak4";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[0]" -type "float3" 0.0098397946 0 -0.031487342 ;
	setAttr ".tk[10]" -type "float3" 0.0098397946 0 -0.031487342 ;
	setAttr ".tk[20]" -type "float3" 0.0098397946 0 -0.031487342 ;
	setAttr ".tk[30]" -type "float3" 0.0098397946 0 -0.031487342 ;
createNode deleteComponent -n "rd_a11_top:deleteComponent15";
	setAttr ".dc" -type "componentList" 1 "e[108]";
createNode deleteComponent -n "rd_a11_top:deleteComponent16";
	setAttr ".dc" -type "componentList" 1 "e[117]";
createNode deleteComponent -n "rd_a11_top:deleteComponent17";
	setAttr ".dc" -type "componentList" 1 "e[126]";
createNode deleteComponent -n "rd_a11_top:deleteComponent18";
	setAttr ".dc" -type "componentList" 4 "vtx[0]" "vtx[10]" "vtx[20]" "vtx[30]";
createNode deleteComponent -n "rd_a11_top:deleteComponent19";
	setAttr ".dc" -type "componentList" 4 "e[16:23]" "e[60:67]" "e[227:229]" "e[239:241]";
createNode deleteComponent -n "rd_a11_top:deleteComponent20";
	setAttr ".dc" -type "componentList" 4 "e[8:15]" "e[52:59]" "e[208:210]" "e[217:219]";
createNode deleteComponent -n "rd_a11_top:deleteComponent21";
	setAttr ".dc" -type "componentList" 3 "vtx[9:26]" "vtx[67:84]" "vtx[116:123]";
createNode script -n "rd_a11_top:uiConfigurationScriptNode";
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
		+ "                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n"
		+ "                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
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
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n"
		+ "                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n"
		+ "                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n"
		+ "                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n"
		+ "                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n"
		+ "                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n"
		+ "                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n"
		+ "\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "rd_a11_top:sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode file -n "rd_a11_top:file1";
	setAttr ".ftn" -type "string" "C:/Users/Dad/projects/github/amju-ww/Assets/tex/common/pz-ground22.png";
createNode place2dTexture -n "rd_a11_top:place2dTexture1";
createNode deleteComponent -n "rd_a11_top:deleteComponent22";
	setAttr ".dc" -type "componentList" 1 "f[9:38]";
createNode lambert -n "rd_a11_top:lambert2";
createNode shadingEngine -n "rd_a11_top:lambert2SG";
	setAttr ".ihi" 0;
	setAttr -s 9 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 9 ".gn";
createNode materialInfo -n "rd_a11_top:materialInfo1";
createNode file -n "rd_a11_top:file2";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/underground3.png";
createNode place2dTexture -n "rd_a11_top:place2dTexture2";
createNode polyPlanarProj -n "rd_a11_top:polyPlanarProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:51]";
	setAttr ".ix" -type "matrix" 400 0 0 0 0 100 0 0 0 0 100 0 0 -56 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -7.62939453125e-006 -57.571090698242188 0 ;
	setAttr ".ro" -type "double3" -90 0 0 ;
	setAttr ".ps" -type "double2" 399.99998474121094 100 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyPlanarProj -n "rd_a11_top:polyPlanarProj2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:51]";
	setAttr ".ix" -type "matrix" 400 0 0 0 0 100 0 0 0 0 100 0 0 -56 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -1.52587890625e-005 -57.571090698242188 0 ;
	setAttr ".ro" -type "double3" 0 90 0 ;
	setAttr ".ps" -type "double2" 100 103.14218139648437 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyPlanarProj -n "rd_a11_top:polyPlanarProj3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:51]";
	setAttr ".ix" -type "matrix" 400 0 0 0 0 100 0 0 0 0 100 0 0 -56 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -1.52587890625e-005 -57.571090698242188 0 ;
	setAttr ".ps" -type "double2" 399.99996948242187 103.14218139648437 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyTweakUV -n "rd_a11_top:polyTweakUV1";
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
createNode polyUnite -n "rd_a11_top:polyUnite1";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "rd_a11_top:groupId1";
	setAttr ".ihi" 0;
createNode groupId -n "rd_a11_top:groupId2";
	setAttr ".ihi" 0;
createNode groupId -n "rd_a11_top:groupId3";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:51]";
createNode groupId -n "rd_a11_top:groupId4";
	setAttr ".ihi" 0;
createNode groupId -n "rd_a11_top:groupId5";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:29]";
createNode groupId -n "rd_a11_top:groupId6";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[30:81]";
createNode polyTriangulate -n "rd_a11_top:polyTriangulate1";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polySeparate -n "rd_a11_top:polySeparate1";
	setAttr ".ic" 2;
	setAttr -s 2 ".out";
createNode groupId -n "rd_a11_top:groupId7";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts4";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:55]";
createNode groupId -n "rd_a11_top:groupId8";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts5";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:99]";
createNode polyTweakUV -n "rd_a11_top:polyTweakUV2";
	setAttr ".uopa" yes;
	setAttr -s 40 ".uvtk[0:39]" -type "float2" 0.089552358 0 0.089552358
		 0 0.11194049 0 0.067164257 0 0.067164257 0 0.044776142 0 0.044776142 0 0.022388041
		 0 0.022388041 0 -2.9802322e-008 0 -2.9802322e-008 0 -0.02238816 0 -0.02238816 0 -0.044776201
		 0 -0.044776201 0 -0.067164361 0 -0.067164361 0 -0.089552462 0 -0.089552462 0 -0.11194062
		 0 0.11194049 0 0.089552358 0 0.067164257 0 0.044776142 0 0.022388041 0 -2.9802322e-008
		 0 -0.02238816 0 -0.044776201 0 -0.067164361 0 -0.089552462 0 -0.11194062 0 0.089552358
		 0 0.067164257 0 0.044776142 0 0.022388041 0 -2.9802322e-008 0 -0.02238816 0 -0.044776201
		 0 -0.067164361 0 -0.089552462 0;
createNode polyUnite -n "rd_a11_top:polyUnite2";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "rd_a11_top:groupId9";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts6";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:55]";
createNode groupId -n "rd_a11_top:groupId10";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts7";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[56:155]";
createNode deleteComponent -n "rd_a11_top:deleteComponent23";
	setAttr ".dc" -type "componentList" 8 "e[44]" "e[55]" "e[66]" "e[154]" "e[169]" "e[179]" "e[190]" "e[201]";
createNode deleteComponent -n "rd_a11_top:deleteComponent24";
	setAttr ".dc" -type "componentList" 8 "e[42]" "e[52]" "e[62]" "e[149]" "e[163]" "e[172]" "e[182]" "e[192]";
createNode deleteComponent -n "rd_a11_top:deleteComponent25";
	setAttr ".dc" -type "componentList" 8 "e[40]" "e[49]" "e[58]" "e[144]" "e[157]" "e[165]" "e[174]" "e[183]";
createNode deleteComponent -n "rd_a11_top:deleteComponent26";
	setAttr ".dc" -type "componentList" 8 "e[38]" "e[46]" "e[54]" "e[139]" "e[151]" "e[158]" "e[166]" "e[174]";
createNode deleteComponent -n "rd_a11_top:deleteComponent27";
	setAttr ".dc" -type "componentList" 0;
createNode deleteComponent -n "rd_a11_top:deleteComponent28";
	setAttr ".dc" -type "componentList" 2 "e[183:184]" "e[191:192]";
createNode deleteComponent -n "rd_a11_top:deleteComponent29";
	setAttr ".dc" -type "componentList" 2 "e[72:73]" "e[205:206]";
createNode deleteComponent -n "rd_a11_top:deleteComponent30";
	setAttr ".dc" -type "componentList" 2 "e[63:64]" "e[210:211]";
createNode deleteComponent -n "rd_a11_top:deleteComponent31";
	setAttr ".dc" -type "componentList" 2 "e[77:78]" "e[192:193]";
createNode deleteComponent -n "rd_a11_top:deleteComponent32";
	setAttr ".dc" -type "componentList" 2 "e[68:69]" "e[195:196]";
createNode deleteComponent -n "rd_a11_top:deleteComponent33";
	setAttr ".dc" -type "componentList" 2 "e[61:62]" "e[198:199]";
createNode deleteComponent -n "rd_a11_top:deleteComponent34";
	setAttr ".dc" -type "componentList" 2 "e[71:72]" "e[184:185]";
createNode deleteComponent -n "rd_a11_top:deleteComponent35";
	setAttr ".dc" -type "componentList" 2 "e[69:70]" "e[180:181]";
createNode deleteComponent -n "rd_a11_top:deleteComponent36";
	setAttr ".dc" -type "componentList" 2 "e[64:65]" "e[181:182]";
createNode deleteComponent -n "rd_a11_top:deleteComponent37";
	setAttr ".dc" -type "componentList" 2 "e[59:60]" "e[182:183]";
createNode deleteComponent -n "rd_a11_top:deleteComponent38";
	setAttr ".dc" -type "componentList" 2 "e[63:64]" "e[172:173]";
createNode deleteComponent -n "rd_a11_top:deleteComponent39";
	setAttr ".dc" -type "componentList" 2 "e[60:61]" "e[171:172]";
createNode deleteComponent -n "rd_a11_top:deleteComponent40";
	setAttr ".dc" -type "componentList" 2 "e[57:58]" "e[170:171]";
createNode deleteComponent -n "rd_a11_top:deleteComponent41";
	setAttr ".dc" -type "componentList" 2 "e[157:158]" "e[163:164]";
createNode deleteComponent -n "rd_a11_top:deleteComponent42";
	setAttr ".dc" -type "componentList" 2 "e[155:156]" "e[159:160]";
createNode deleteComponent -n "rd_a11_top:deleteComponent43";
	setAttr ".dc" -type "componentList" 1 "e[153:156]";
createNode deleteComponent -n "rd_a11_top:deleteComponent44";
	setAttr ".dc" -type "componentList" 10 "vtx[7]" "vtx[17]" "vtx[28]" "vtx[38]" "vtx[47]" "vtx[56]" "vtx[69]" "vtx[78]" "vtx[88]" "vtx[99]";
createNode deleteComponent -n "rd_a11_top:deleteComponent45";
	setAttr ".dc" -type "componentList" 10 "vtx[5]" "vtx[14]" "vtx[24]" "vtx[33]" "vtx[41]" "vtx[49]" "vtx[61]" "vtx[69]" "vtx[78]" "vtx[88]";
createNode deleteComponent -n "rd_a11_top:deleteComponent46";
	setAttr ".dc" -type "componentList" 10 "vtx[3]" "vtx[11]" "vtx[20]" "vtx[28]" "vtx[35]" "vtx[42]" "vtx[53]" "vtx[60]" "vtx[68]" "vtx[77]";
createNode deleteComponent -n "rd_a11_top:deleteComponent47";
	setAttr ".dc" -type "componentList" 10 "vtx[1]" "vtx[8]" "vtx[16]" "vtx[23]" "vtx[29]" "vtx[35]" "vtx[45]" "vtx[51]" "vtx[58]" "vtx[66]";
createNode polyTriangulate -n "rd_a11_top:polyTriangulate2";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyTweak -n "rd_a11_top:polyTweak5";
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
createNode polySeparate -n "rd_a11_top:polySeparate2";
	setAttr ".ic" 2;
	setAttr -s 2 ".out";
createNode groupId -n "rd_a11_top:groupId11";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts8";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:31]";
createNode groupId -n "rd_a11_top:groupId12";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts9";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:59]";
createNode polyPlanarProj -n "rd_a11_top:polyPlanarProj4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:59]";
	setAttr ".ix" -type "matrix" 0.5 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -7.62939453125e-006 -57.571090698242188 0 ;
	setAttr ".ps" -type "double2" 199.99998474121094 103.14218139648437 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyUnite -n "rd_a11_top:polyUnite3";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "rd_a11_top:groupId13";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts10";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:31]";
createNode groupId -n "rd_a11_top:groupId14";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts11";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[32:91]";
createNode polySeparate -n "rd_a11_top:polySeparate3";
	setAttr ".ic" 2;
	setAttr -s 2 ".out";
createNode groupId -n "rd_a11_top:groupId15";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts12";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:31]";
createNode groupId -n "rd_a11_top:groupId16";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts13";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:59]";
createNode polyTweakUV -n "rd_a11_top:polyTweakUV3";
	setAttr ".uopa" yes;
	setAttr -s 24 ".uvtk[0:23]" -type "float2" 0.22520077 0 0.22520077 0
		 0.30713716 0 0.061327986 0 0.061327986 0 -0.10254468 0 -0.10254468 0 -0.26641732
		 0 -0.26641732 0 -0.4302898 0 -0.4302898 0 -0.51222605 0 0.30713716 0 0.22520077 0
		 0.061327986 0 -0.10254468 0 -0.26641732 0 -0.4302898 0 -0.51222605 0 0.22520077 0
		 0.061327986 0 -0.10254468 0 -0.26641732 0 -0.4302898 0;
createNode polyTweakUV -n "rd_a11_top:polyTweakUV4";
	setAttr ".uopa" yes;
	setAttr -s 9 ".uvtk";
	setAttr ".uvtk[5]" -type "float2" 0 -0.24354298 ;
	setAttr ".uvtk[10]" -type "float2" 0 -0.30336055 ;
	setAttr ".uvtk[15]" -type "float2" 0 -0.24354298 ;
	setAttr ".uvtk[19]" -type "float2" 0 -0.30336055 ;
	setAttr ".uvtk[26]" -type "float2" 0 -0.24354298 ;
	setAttr ".uvtk[28]" -type "float2" 0 -0.30336055 ;
	setAttr ".uvtk[32]" -type "float2" 0 -0.24354298 ;
	setAttr ".uvtk[34]" -type "float2" 0 -0.30336055 ;
createNode polyUnite -n "rd_a11_top:polyUnite4";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "rd_a11_top:groupId17";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts14";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:31]";
createNode groupId -n "rd_a11_top:groupId18";
	setAttr ".ihi" 0;
createNode groupParts -n "rd_a11_top:groupParts15";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[32:91]";
createNode animCurveTU -n "rd_a11_top:polySurface10_visibility";
	setAttr ".tan" 9;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "rd_a11_top:polySurface10_translateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "rd_a11_top:polySurface10_translateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "rd_a11_top:polySurface10_translateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "rd_a11_top:polySurface10_rotateX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "rd_a11_top:polySurface10_rotateY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTA -n "rd_a11_top:polySurface10_rotateZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTU -n "rd_a11_top:polySurface10_scaleX";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "rd_a11_top:polySurface10_scaleY";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode animCurveTU -n "rd_a11_top:polySurface10_scaleZ";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 1;
createNode mentalrayItemsList -s -n "mentalrayItemsList";
createNode mentalrayGlobals -s -n "mentalrayGlobals";
createNode mentalrayOptions -s -n "miDefaultOptions";
	addAttr -ci true -m -sn "stringOptions" -ln "stringOptions" -at "compound" -nc 
		3;
	addAttr -ci true -sn "name" -ln "name" -dt "string" -p "stringOptions";
	addAttr -ci true -sn "value" -ln "value" -dt "string" -p "stringOptions";
	addAttr -ci true -sn "type" -ln "type" -dt "string" -p "stringOptions";
	setAttr -s 48 ".stringOptions";
	setAttr ".stringOptions[0].name" -type "string" "rast motion factor";
	setAttr ".stringOptions[0].value" -type "string" "1.0";
	setAttr ".stringOptions[0].type" -type "string" "scalar";
	setAttr ".stringOptions[1].name" -type "string" "rast transparency depth";
	setAttr ".stringOptions[1].value" -type "string" "8";
	setAttr ".stringOptions[1].type" -type "string" "integer";
	setAttr ".stringOptions[2].name" -type "string" "rast useopacity";
	setAttr ".stringOptions[2].value" -type "string" "true";
	setAttr ".stringOptions[2].type" -type "string" "boolean";
	setAttr ".stringOptions[3].name" -type "string" "importon";
	setAttr ".stringOptions[3].value" -type "string" "false";
	setAttr ".stringOptions[3].type" -type "string" "boolean";
	setAttr ".stringOptions[4].name" -type "string" "importon density";
	setAttr ".stringOptions[4].value" -type "string" "1.0";
	setAttr ".stringOptions[4].type" -type "string" "scalar";
	setAttr ".stringOptions[5].name" -type "string" "importon merge";
	setAttr ".stringOptions[5].value" -type "string" "0.0";
	setAttr ".stringOptions[5].type" -type "string" "scalar";
	setAttr ".stringOptions[6].name" -type "string" "importon trace depth";
	setAttr ".stringOptions[6].value" -type "string" "0";
	setAttr ".stringOptions[6].type" -type "string" "integer";
	setAttr ".stringOptions[7].name" -type "string" "importon traverse";
	setAttr ".stringOptions[7].value" -type "string" "true";
	setAttr ".stringOptions[7].type" -type "string" "boolean";
	setAttr ".stringOptions[8].name" -type "string" "shadowmap pixel samples";
	setAttr ".stringOptions[8].value" -type "string" "3";
	setAttr ".stringOptions[8].type" -type "string" "integer";
	setAttr ".stringOptions[9].name" -type "string" "ambient occlusion";
	setAttr ".stringOptions[9].value" -type "string" "false";
	setAttr ".stringOptions[9].type" -type "string" "boolean";
	setAttr ".stringOptions[10].name" -type "string" "ambient occlusion rays";
	setAttr ".stringOptions[10].value" -type "string" "64";
	setAttr ".stringOptions[10].type" -type "string" "integer";
	setAttr ".stringOptions[11].name" -type "string" "ambient occlusion cache";
	setAttr ".stringOptions[11].value" -type "string" "false";
	setAttr ".stringOptions[11].type" -type "string" "boolean";
	setAttr ".stringOptions[12].name" -type "string" "ambient occlusion cache density";
	setAttr ".stringOptions[12].value" -type "string" "1.0";
	setAttr ".stringOptions[12].type" -type "string" "scalar";
	setAttr ".stringOptions[13].name" -type "string" "ambient occlusion cache points";
	setAttr ".stringOptions[13].value" -type "string" "64";
	setAttr ".stringOptions[13].type" -type "string" "integer";
	setAttr ".stringOptions[14].name" -type "string" "irradiance particles";
	setAttr ".stringOptions[14].value" -type "string" "false";
	setAttr ".stringOptions[14].type" -type "string" "boolean";
	setAttr ".stringOptions[15].name" -type "string" "irradiance particles rays";
	setAttr ".stringOptions[15].value" -type "string" "256";
	setAttr ".stringOptions[15].type" -type "string" "integer";
	setAttr ".stringOptions[16].name" -type "string" "irradiance particles interpolate";
	setAttr ".stringOptions[16].value" -type "string" "1";
	setAttr ".stringOptions[16].type" -type "string" "integer";
	setAttr ".stringOptions[17].name" -type "string" "irradiance particles interppoints";
	setAttr ".stringOptions[17].value" -type "string" "64";
	setAttr ".stringOptions[17].type" -type "string" "integer";
	setAttr ".stringOptions[18].name" -type "string" "irradiance particles indirect passes";
	setAttr ".stringOptions[18].value" -type "string" "0";
	setAttr ".stringOptions[18].type" -type "string" "integer";
	setAttr ".stringOptions[19].name" -type "string" "irradiance particles scale";
	setAttr ".stringOptions[19].value" -type "string" "1.0";
	setAttr ".stringOptions[19].type" -type "string" "scalar";
	setAttr ".stringOptions[20].name" -type "string" "irradiance particles env";
	setAttr ".stringOptions[20].value" -type "string" "true";
	setAttr ".stringOptions[20].type" -type "string" "boolean";
	setAttr ".stringOptions[21].name" -type "string" "irradiance particles env rays";
	setAttr ".stringOptions[21].value" -type "string" "256";
	setAttr ".stringOptions[21].type" -type "string" "integer";
	setAttr ".stringOptions[22].name" -type "string" "irradiance particles env scale";
	setAttr ".stringOptions[22].value" -type "string" "1";
	setAttr ".stringOptions[22].type" -type "string" "integer";
	setAttr ".stringOptions[23].name" -type "string" "irradiance particles rebuild";
	setAttr ".stringOptions[23].value" -type "string" "true";
	setAttr ".stringOptions[23].type" -type "string" "boolean";
	setAttr ".stringOptions[24].name" -type "string" "irradiance particles file";
	setAttr ".stringOptions[24].value" -type "string" "";
	setAttr ".stringOptions[24].type" -type "string" "string";
	setAttr ".stringOptions[25].name" -type "string" "geom displace motion factor";
	setAttr ".stringOptions[25].value" -type "string" "1.0";
	setAttr ".stringOptions[25].type" -type "string" "scalar";
	setAttr ".stringOptions[26].name" -type "string" "contrast all buffers";
	setAttr ".stringOptions[26].value" -type "string" "true";
	setAttr ".stringOptions[26].type" -type "string" "boolean";
	setAttr ".stringOptions[27].name" -type "string" "finalgather normal tolerance";
	setAttr ".stringOptions[27].value" -type "string" "25.842";
	setAttr ".stringOptions[27].type" -type "string" "scalar";
	setAttr ".stringOptions[28].name" -type "string" "trace camera clip";
	setAttr ".stringOptions[28].value" -type "string" "false";
	setAttr ".stringOptions[28].type" -type "string" "boolean";
	setAttr ".stringOptions[29].name" -type "string" "unified sampling";
	setAttr ".stringOptions[29].value" -type "string" "true";
	setAttr ".stringOptions[29].type" -type "string" "boolean";
	setAttr ".stringOptions[30].name" -type "string" "samples quality";
	setAttr ".stringOptions[30].value" -type "string" "0.25 0.25 0.25 0.25";
	setAttr ".stringOptions[30].type" -type "string" "color";
	setAttr ".stringOptions[31].name" -type "string" "samples min";
	setAttr ".stringOptions[31].value" -type "string" "1.0";
	setAttr ".stringOptions[31].type" -type "string" "scalar";
	setAttr ".stringOptions[32].name" -type "string" "samples max";
	setAttr ".stringOptions[32].value" -type "string" "100.0";
	setAttr ".stringOptions[32].type" -type "string" "scalar";
	setAttr ".stringOptions[33].name" -type "string" "samples error cutoff";
	setAttr ".stringOptions[33].value" -type "string" "0.0 0.0 0.0 0.0";
	setAttr ".stringOptions[33].type" -type "string" "color";
	setAttr ".stringOptions[34].name" -type "string" "samples per object";
	setAttr ".stringOptions[34].value" -type "string" "false";
	setAttr ".stringOptions[34].type" -type "string" "boolean";
	setAttr ".stringOptions[35].name" -type "string" "progressive";
	setAttr ".stringOptions[35].value" -type "string" "false";
	setAttr ".stringOptions[35].type" -type "string" "boolean";
	setAttr ".stringOptions[36].name" -type "string" "progressive max time";
	setAttr ".stringOptions[36].value" -type "string" "0";
	setAttr ".stringOptions[36].type" -type "string" "integer";
	setAttr ".stringOptions[37].name" -type "string" "progressive subsampling size";
	setAttr ".stringOptions[37].value" -type "string" "4";
	setAttr ".stringOptions[37].type" -type "string" "integer";
	setAttr ".stringOptions[38].name" -type "string" "iray";
	setAttr ".stringOptions[38].value" -type "string" "false";
	setAttr ".stringOptions[38].type" -type "string" "boolean";
	setAttr ".stringOptions[39].name" -type "string" "light relative scale";
	setAttr ".stringOptions[39].value" -type "string" "0.31831";
	setAttr ".stringOptions[39].type" -type "string" "scalar";
	setAttr ".stringOptions[40].name" -type "string" "trace camera motion vectors";
	setAttr ".stringOptions[40].value" -type "string" "false";
	setAttr ".stringOptions[40].type" -type "string" "boolean";
	setAttr ".stringOptions[41].name" -type "string" "ray differentials";
	setAttr ".stringOptions[41].value" -type "string" "true";
	setAttr ".stringOptions[41].type" -type "string" "boolean";
	setAttr ".stringOptions[42].name" -type "string" "environment lighting mode";
	setAttr ".stringOptions[42].value" -type "string" "off";
	setAttr ".stringOptions[42].type" -type "string" "string";
	setAttr ".stringOptions[43].name" -type "string" "environment lighting quality";
	setAttr ".stringOptions[43].value" -type "string" "0.2";
	setAttr ".stringOptions[43].type" -type "string" "scalar";
	setAttr ".stringOptions[44].name" -type "string" "environment lighting shadow";
	setAttr ".stringOptions[44].value" -type "string" "transparent";
	setAttr ".stringOptions[44].type" -type "string" "string";
	setAttr ".stringOptions[45].name" -type "string" "environment lighting resolution";
	setAttr ".stringOptions[45].value" -type "string" "512";
	setAttr ".stringOptions[45].type" -type "string" "integer";
	setAttr ".stringOptions[46].name" -type "string" "environment lighting shader samples";
	setAttr ".stringOptions[46].value" -type "string" "2";
	setAttr ".stringOptions[46].type" -type "string" "integer";
	setAttr ".stringOptions[47].name" -type "string" "environment lighting scale";
	setAttr ".stringOptions[47].value" -type "string" "1.0 1.0 1.0";
	setAttr ".stringOptions[47].type" -type "string" "color";
createNode mentalrayFramebuffer -s -n "miDefaultFramebuffer";
createNode polyPlanarProj -n "polyPlanarProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:91]";
	setAttr ".ix" -type "matrix" 1.05 0 0 0 0 1.05 0 0 0 0 1.05 0 0 1 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -0.28035545349121094 -15.799031734466553 1.3643341064453125 ;
	setAttr ".ro" -type "double3" 0 90 0 ;
	setAttr ".ps" -type "double2" 107.72866058349609 34.195233345031738 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyPlanarProj -n "rd_a11_top:polyPlanarProj5";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:91]";
	setAttr ".ix" -type "matrix" 1.05 0 0 0 0 1.05 0 0 0 0 1.05 0 0 1 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -0.28035736083984375 -15.799031734466553 1.3643341064453125 ;
	setAttr ".ro" -type "double3" -90 0 0 ;
	setAttr ".ps" -type "double2" 105.56069946289062 107.72866058349609 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyTweakUV -n "rd_a11_top:polyTweakUV5";
	setAttr ".uopa" yes;
	setAttr -s 62 ".uvtk[0:61]" -type "float2" 0.18341622 0 0.18341622 0
		 0.25060317 0 0.027057104 0 0.027057104 0 -0.13707018 0 -0.13707018 0 -0.296637 0
		 -0.296637 0 -0.46082735 0 -0.46082735 0 -0.52474356 0 0.25060317 0 0.18341622 0 0.027057104
		 0 -0.13707018 0 -0.296637 0 -0.46082735 0 -0.52474356 0 0.18341622 0 0.027057104
		 0 -0.13707018 0 -0.296637 0 -0.46082735 0 -0.48362947 0 -0.5186581 0 -0.46082735
		 0 -0.52474356 0 0.23418653 0 0.083772033 0 0.18341622 0 0.027057104 0 -0.12832168
		 0 -0.13707018 0 -0.4423812 0 -0.296637 0 0.18341622 0 0.027057104 0 0.23418653 0
		 0.083772033 0 -0.13707018 0 -0.12832168 0 -0.296637 0 -0.4423812 0 -0.46082735 0
		 -0.48362947 0 -0.5186581 0 -0.52474356 0 0.22327369 0 0.25474361 0 0.07285925 0 -0.13923442
		 0 -0.4532941 0 -0.49454224 0 0.25474361 0 0.22327369 0 0.07285925 0 -0.13923442 0
		 -0.4532941 0 -0.49454224 0 0.25060317 0 0.25060317 0;
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
select -ne :lambert1;
select -ne :initialShadingGroup;
	setAttr -s 10 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 9 ".gn";
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
connectAttr "rd_a11_top:groupId3.id" "rd_a11_top:pCubeShape1.iog.og[0].gid";
connectAttr "rd_a11_top:lambert2SG.mwc" "rd_a11_top:pCubeShape1.iog.og[0].gco";
connectAttr "rd_a11_top:groupParts1.og" "rd_a11_top:pCubeShape1.i";
connectAttr "rd_a11_top:polyTweakUV1.uvtk[0]" "rd_a11_top:pCubeShape1.uvst[0].uvtw"
		;
connectAttr "rd_a11_top:groupId4.id" "rd_a11_top:pCubeShape1.ciog.cog[0].cgid";
connectAttr "rd_a11_top:groupId1.id" "rd_a11_top:pCubeShape2.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "rd_a11_top:pCubeShape2.iog.og[0].gco";
connectAttr "rd_a11_top:groupId2.id" "rd_a11_top:pCubeShape2.ciog.cog[0].cgid";
connectAttr "rd_a11_top:polyTweakUV2.out" "rd_a11_top:polySurfaceShape2.i";
connectAttr "rd_a11_top:groupId7.id" "rd_a11_top:polySurfaceShape2.iog.og[0].gid"
		;
connectAttr ":initialShadingGroup.mwc" "rd_a11_top:polySurfaceShape2.iog.og[0].gco"
		;
connectAttr "rd_a11_top:polyTweakUV2.uvtk[0]" "rd_a11_top:polySurfaceShape2.uvst[0].uvtw"
		;
connectAttr "rd_a11_top:groupParts5.og" "rd_a11_top:polySurfaceShape3.i";
connectAttr "rd_a11_top:groupId8.id" "rd_a11_top:polySurfaceShape3.iog.og[0].gid"
		;
connectAttr "rd_a11_top:lambert2SG.mwc" "rd_a11_top:polySurfaceShape3.iog.og[0].gco"
		;
connectAttr "rd_a11_top:polyTriangulate1.out" "rd_a11_top:polySurfaceShape1.i";
connectAttr "rd_a11_top:groupId5.id" "rd_a11_top:polySurfaceShape1.iog.og[0].gid"
		;
connectAttr ":initialShadingGroup.mwc" "rd_a11_top:polySurfaceShape1.iog.og[0].gco"
		;
connectAttr "rd_a11_top:groupId6.id" "rd_a11_top:polySurfaceShape1.iog.og[1].gid"
		;
connectAttr "rd_a11_top:lambert2SG.mwc" "rd_a11_top:polySurfaceShape1.iog.og[1].gco"
		;
connectAttr "rd_a11_top:groupParts8.og" "rd_a11_top:polySurfaceShape5.i";
connectAttr "rd_a11_top:groupId11.id" "rd_a11_top:polySurfaceShape5.iog.og[0].gid"
		;
connectAttr ":initialShadingGroup.mwc" "rd_a11_top:polySurfaceShape5.iog.og[0].gco"
		;
connectAttr "rd_a11_top:polyPlanarProj4.out" "rd_a11_top:polySurfaceShape6.i";
connectAttr "rd_a11_top:groupId12.id" "rd_a11_top:polySurfaceShape6.iog.og[0].gid"
		;
connectAttr "rd_a11_top:lambert2SG.mwc" "rd_a11_top:polySurfaceShape6.iog.og[0].gco"
		;
connectAttr "rd_a11_top:polyTriangulate2.out" "rd_a11_top:polySurfaceShape4.i";
connectAttr "rd_a11_top:groupId9.id" "rd_a11_top:polySurfaceShape4.iog.og[0].gid"
		;
connectAttr ":initialShadingGroup.mwc" "rd_a11_top:polySurfaceShape4.iog.og[0].gco"
		;
connectAttr "rd_a11_top:groupId10.id" "rd_a11_top:polySurfaceShape4.iog.og[1].gid"
		;
connectAttr "rd_a11_top:lambert2SG.mwc" "rd_a11_top:polySurfaceShape4.iog.og[1].gco"
		;
connectAttr "rd_a11_top:polyTweakUV3.out" "rd_a11_top:polySurfaceShape8.i";
connectAttr "rd_a11_top:groupId15.id" "rd_a11_top:polySurfaceShape8.iog.og[0].gid"
		;
connectAttr ":initialShadingGroup.mwc" "rd_a11_top:polySurfaceShape8.iog.og[0].gco"
		;
connectAttr "rd_a11_top:polyTweakUV3.uvtk[0]" "rd_a11_top:polySurfaceShape8.uvst[0].uvtw"
		;
connectAttr "rd_a11_top:polyTweakUV4.out" "rd_a11_top:polySurfaceShape9.i";
connectAttr "rd_a11_top:groupId16.id" "rd_a11_top:polySurfaceShape9.iog.og[0].gid"
		;
connectAttr "rd_a11_top:lambert2SG.mwc" "rd_a11_top:polySurfaceShape9.iog.og[0].gco"
		;
connectAttr "rd_a11_top:polyTweakUV4.uvtk[0]" "rd_a11_top:polySurfaceShape9.uvst[0].uvtw"
		;
connectAttr "rd_a11_top:groupParts11.og" "rd_a11_top:polySurfaceShape7.i";
connectAttr "rd_a11_top:groupId13.id" "rd_a11_top:polySurfaceShape7.iog.og[0].gid"
		;
connectAttr ":initialShadingGroup.mwc" "rd_a11_top:polySurfaceShape7.iog.og[0].gco"
		;
connectAttr "rd_a11_top:groupId14.id" "rd_a11_top:polySurfaceShape7.iog.og[1].gid"
		;
connectAttr "rd_a11_top:lambert2SG.mwc" "rd_a11_top:polySurfaceShape7.iog.og[1].gco"
		;
connectAttr "rd_a11_top:polySurface10_visibility.o" "rd_a11_top:polySurface10.v"
		;
connectAttr "rd_a11_top:polySurface10_translateX.o" "rd_a11_top:polySurface10.tx"
		;
connectAttr "rd_a11_top:polySurface10_translateY.o" "rd_a11_top:polySurface10.ty"
		;
connectAttr "rd_a11_top:polySurface10_translateZ.o" "rd_a11_top:polySurface10.tz"
		;
connectAttr "rd_a11_top:polySurface10_rotateX.o" "rd_a11_top:polySurface10.rx";
connectAttr "rd_a11_top:polySurface10_rotateY.o" "rd_a11_top:polySurface10.ry";
connectAttr "rd_a11_top:polySurface10_rotateZ.o" "rd_a11_top:polySurface10.rz";
connectAttr "rd_a11_top:polySurface10_scaleX.o" "rd_a11_top:polySurface10.sx";
connectAttr "rd_a11_top:polySurface10_scaleY.o" "rd_a11_top:polySurface10.sy";
connectAttr "rd_a11_top:polySurface10_scaleZ.o" "rd_a11_top:polySurface10.sz";
connectAttr "rd_a11_top:groupParts15.og" "rd_a11_top:polySurfaceShape10.i";
connectAttr "rd_a11_top:groupId17.id" "rd_a11_top:polySurfaceShape10.iog.og[0].gid"
		;
connectAttr ":initialShadingGroup.mwc" "rd_a11_top:polySurfaceShape10.iog.og[0].gco"
		;
connectAttr "rd_a11_top:groupId18.id" "rd_a11_top:polySurfaceShape10.iog.og[1].gid"
		;
connectAttr "rd_a11_top:lambert2SG.mwc" "rd_a11_top:polySurfaceShape10.iog.og[1].gco"
		;
connectAttr "rd_a11_top:polyTweakUV5.out" "rd_a11_top:polySurfaceShape11.i";
connectAttr "rd_a11_top:polyTweakUV5.uvtk[0]" "rd_a11_top:polySurfaceShape11.uvst[0].uvtw"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "rd_a11_top:lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "rd_a11_top:lambert2SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "rd_a11_top:polyCube1.out" "rd_a11_top:polyTweak1.ip";
connectAttr "rd_a11_top:polyTweak1.out" "rd_a11_top:deleteComponent1.ig";
connectAttr "rd_a11_top:deleteComponent1.og" "rd_a11_top:deleteComponent2.ig";
connectAttr "rd_a11_top:deleteComponent2.og" "rd_a11_top:deleteComponent3.ig";
connectAttr "rd_a11_top:deleteComponent3.og" "rd_a11_top:deleteComponent4.ig";
connectAttr "rd_a11_top:deleteComponent4.og" "rd_a11_top:deleteComponent5.ig";
connectAttr "rd_a11_top:deleteComponent5.og" "rd_a11_top:deleteComponent6.ig";
connectAttr "rd_a11_top:deleteComponent6.og" "rd_a11_top:polyTweak2.ip";
connectAttr "rd_a11_top:polyTweak2.out" "rd_a11_top:deleteComponent7.ig";
connectAttr "rd_a11_top:deleteComponent7.og" "rd_a11_top:deleteComponent8.ig";
connectAttr "rd_a11_top:deleteComponent8.og" "rd_a11_top:deleteComponent9.ig";
connectAttr "rd_a11_top:deleteComponent9.og" "rd_a11_top:deleteComponent10.ig";
connectAttr "rd_a11_top:deleteComponent10.og" "rd_a11_top:polyTweak3.ip";
connectAttr "rd_a11_top:polyTweak3.out" "rd_a11_top:deleteComponent11.ig";
connectAttr "rd_a11_top:deleteComponent11.og" "rd_a11_top:deleteComponent12.ig";
connectAttr "rd_a11_top:deleteComponent12.og" "rd_a11_top:deleteComponent13.ig";
connectAttr "rd_a11_top:deleteComponent13.og" "rd_a11_top:deleteComponent14.ig";
connectAttr "rd_a11_top:deleteComponent14.og" "rd_a11_top:polyTweak4.ip";
connectAttr "rd_a11_top:polyTweak4.out" "rd_a11_top:deleteComponent15.ig";
connectAttr "rd_a11_top:deleteComponent15.og" "rd_a11_top:deleteComponent16.ig";
connectAttr "rd_a11_top:deleteComponent16.og" "rd_a11_top:deleteComponent17.ig";
connectAttr "rd_a11_top:deleteComponent17.og" "rd_a11_top:deleteComponent18.ig";
connectAttr "rd_a11_top:deleteComponent18.og" "rd_a11_top:deleteComponent19.ig";
connectAttr "rd_a11_top:deleteComponent19.og" "rd_a11_top:deleteComponent20.ig";
connectAttr "rd_a11_top:deleteComponent20.og" "rd_a11_top:deleteComponent21.ig";
connectAttr "rd_a11_top:place2dTexture1.c" "rd_a11_top:file1.c";
connectAttr "rd_a11_top:place2dTexture1.tf" "rd_a11_top:file1.tf";
connectAttr "rd_a11_top:place2dTexture1.rf" "rd_a11_top:file1.rf";
connectAttr "rd_a11_top:place2dTexture1.mu" "rd_a11_top:file1.mu";
connectAttr "rd_a11_top:place2dTexture1.mv" "rd_a11_top:file1.mv";
connectAttr "rd_a11_top:place2dTexture1.s" "rd_a11_top:file1.s";
connectAttr "rd_a11_top:place2dTexture1.wu" "rd_a11_top:file1.wu";
connectAttr "rd_a11_top:place2dTexture1.wv" "rd_a11_top:file1.wv";
connectAttr "rd_a11_top:place2dTexture1.re" "rd_a11_top:file1.re";
connectAttr "rd_a11_top:place2dTexture1.of" "rd_a11_top:file1.of";
connectAttr "rd_a11_top:place2dTexture1.r" "rd_a11_top:file1.ro";
connectAttr "rd_a11_top:place2dTexture1.n" "rd_a11_top:file1.n";
connectAttr "rd_a11_top:place2dTexture1.vt1" "rd_a11_top:file1.vt1";
connectAttr "rd_a11_top:place2dTexture1.vt2" "rd_a11_top:file1.vt2";
connectAttr "rd_a11_top:place2dTexture1.vt3" "rd_a11_top:file1.vt3";
connectAttr "rd_a11_top:place2dTexture1.vc1" "rd_a11_top:file1.vc1";
connectAttr "rd_a11_top:place2dTexture1.o" "rd_a11_top:file1.uv";
connectAttr "rd_a11_top:place2dTexture1.ofs" "rd_a11_top:file1.fs";
connectAttr "rd_a11_top:deleteComponent21.og" "rd_a11_top:deleteComponent22.ig";
connectAttr "rd_a11_top:file2.oc" "rd_a11_top:lambert2.c";
connectAttr "rd_a11_top:lambert2.oc" "rd_a11_top:lambert2SG.ss";
connectAttr "rd_a11_top:pCubeShape1.iog.og[0]" "rd_a11_top:lambert2SG.dsm" -na;
connectAttr "rd_a11_top:pCubeShape1.ciog.cog[0]" "rd_a11_top:lambert2SG.dsm" -na
		;
connectAttr "rd_a11_top:polySurfaceShape1.iog.og[1]" "rd_a11_top:lambert2SG.dsm"
		 -na;
connectAttr "rd_a11_top:polySurfaceShape3.iog.og[0]" "rd_a11_top:lambert2SG.dsm"
		 -na;
connectAttr "rd_a11_top:polySurfaceShape4.iog.og[1]" "rd_a11_top:lambert2SG.dsm"
		 -na;
connectAttr "rd_a11_top:polySurfaceShape6.iog.og[0]" "rd_a11_top:lambert2SG.dsm"
		 -na;
connectAttr "rd_a11_top:polySurfaceShape7.iog.og[1]" "rd_a11_top:lambert2SG.dsm"
		 -na;
connectAttr "rd_a11_top:polySurfaceShape9.iog.og[0]" "rd_a11_top:lambert2SG.dsm"
		 -na;
connectAttr "rd_a11_top:polySurfaceShape10.iog.og[1]" "rd_a11_top:lambert2SG.dsm"
		 -na;
connectAttr "rd_a11_top:groupId3.msg" "rd_a11_top:lambert2SG.gn" -na;
connectAttr "rd_a11_top:groupId4.msg" "rd_a11_top:lambert2SG.gn" -na;
connectAttr "rd_a11_top:groupId6.msg" "rd_a11_top:lambert2SG.gn" -na;
connectAttr "rd_a11_top:groupId8.msg" "rd_a11_top:lambert2SG.gn" -na;
connectAttr "rd_a11_top:groupId10.msg" "rd_a11_top:lambert2SG.gn" -na;
connectAttr "rd_a11_top:groupId12.msg" "rd_a11_top:lambert2SG.gn" -na;
connectAttr "rd_a11_top:groupId14.msg" "rd_a11_top:lambert2SG.gn" -na;
connectAttr "rd_a11_top:groupId16.msg" "rd_a11_top:lambert2SG.gn" -na;
connectAttr "rd_a11_top:groupId18.msg" "rd_a11_top:lambert2SG.gn" -na;
connectAttr "rd_a11_top:lambert2SG.msg" "rd_a11_top:materialInfo1.sg";
connectAttr "rd_a11_top:lambert2.msg" "rd_a11_top:materialInfo1.m";
connectAttr "rd_a11_top:file2.msg" "rd_a11_top:materialInfo1.t" -na;
connectAttr "rd_a11_top:place2dTexture2.c" "rd_a11_top:file2.c";
connectAttr "rd_a11_top:place2dTexture2.tf" "rd_a11_top:file2.tf";
connectAttr "rd_a11_top:place2dTexture2.rf" "rd_a11_top:file2.rf";
connectAttr "rd_a11_top:place2dTexture2.mu" "rd_a11_top:file2.mu";
connectAttr "rd_a11_top:place2dTexture2.mv" "rd_a11_top:file2.mv";
connectAttr "rd_a11_top:place2dTexture2.s" "rd_a11_top:file2.s";
connectAttr "rd_a11_top:place2dTexture2.wu" "rd_a11_top:file2.wu";
connectAttr "rd_a11_top:place2dTexture2.wv" "rd_a11_top:file2.wv";
connectAttr "rd_a11_top:place2dTexture2.re" "rd_a11_top:file2.re";
connectAttr "rd_a11_top:place2dTexture2.of" "rd_a11_top:file2.of";
connectAttr "rd_a11_top:place2dTexture2.r" "rd_a11_top:file2.ro";
connectAttr "rd_a11_top:place2dTexture2.n" "rd_a11_top:file2.n";
connectAttr "rd_a11_top:place2dTexture2.vt1" "rd_a11_top:file2.vt1";
connectAttr "rd_a11_top:place2dTexture2.vt2" "rd_a11_top:file2.vt2";
connectAttr "rd_a11_top:place2dTexture2.vt3" "rd_a11_top:file2.vt3";
connectAttr "rd_a11_top:place2dTexture2.vc1" "rd_a11_top:file2.vc1";
connectAttr "rd_a11_top:place2dTexture2.o" "rd_a11_top:file2.uv";
connectAttr "rd_a11_top:place2dTexture2.ofs" "rd_a11_top:file2.fs";
connectAttr "rd_a11_top:deleteComponent22.og" "rd_a11_top:polyPlanarProj1.ip";
connectAttr "rd_a11_top:pCubeShape1.wm" "rd_a11_top:polyPlanarProj1.mp";
connectAttr "rd_a11_top:polyPlanarProj1.out" "rd_a11_top:polyPlanarProj2.ip";
connectAttr "rd_a11_top:pCubeShape1.wm" "rd_a11_top:polyPlanarProj2.mp";
connectAttr "rd_a11_top:polyPlanarProj2.out" "rd_a11_top:polyPlanarProj3.ip";
connectAttr "rd_a11_top:pCubeShape1.wm" "rd_a11_top:polyPlanarProj3.mp";
connectAttr "rd_a11_top:polyPlanarProj3.out" "rd_a11_top:polyTweakUV1.ip";
connectAttr "rd_a11_top:pCubeShape2.o" "rd_a11_top:polyUnite1.ip[0]";
connectAttr "rd_a11_top:pCubeShape1.o" "rd_a11_top:polyUnite1.ip[1]";
connectAttr "rd_a11_top:pCubeShape2.wm" "rd_a11_top:polyUnite1.im[0]";
connectAttr "rd_a11_top:pCubeShape1.wm" "rd_a11_top:polyUnite1.im[1]";
connectAttr "rd_a11_top:polyTweakUV1.out" "rd_a11_top:groupParts1.ig";
connectAttr "rd_a11_top:groupId3.id" "rd_a11_top:groupParts1.gi";
connectAttr "rd_a11_top:polyUnite1.out" "rd_a11_top:groupParts2.ig";
connectAttr "rd_a11_top:groupId5.id" "rd_a11_top:groupParts2.gi";
connectAttr "rd_a11_top:groupParts2.og" "rd_a11_top:groupParts3.ig";
connectAttr "rd_a11_top:groupId6.id" "rd_a11_top:groupParts3.gi";
connectAttr "rd_a11_top:groupParts3.og" "rd_a11_top:polyTriangulate1.ip";
connectAttr "rd_a11_top:polySurfaceShape1.o" "rd_a11_top:polySeparate1.ip";
connectAttr "rd_a11_top:polySeparate1.out[0]" "rd_a11_top:groupParts4.ig";
connectAttr "rd_a11_top:groupId7.id" "rd_a11_top:groupParts4.gi";
connectAttr "rd_a11_top:polySeparate1.out[1]" "rd_a11_top:groupParts5.ig";
connectAttr "rd_a11_top:groupId8.id" "rd_a11_top:groupParts5.gi";
connectAttr "rd_a11_top:groupParts4.og" "rd_a11_top:polyTweakUV2.ip";
connectAttr "rd_a11_top:polySurfaceShape2.o" "rd_a11_top:polyUnite2.ip[0]";
connectAttr "rd_a11_top:polySurfaceShape3.o" "rd_a11_top:polyUnite2.ip[1]";
connectAttr "rd_a11_top:polySurfaceShape2.wm" "rd_a11_top:polyUnite2.im[0]";
connectAttr "rd_a11_top:polySurfaceShape3.wm" "rd_a11_top:polyUnite2.im[1]";
connectAttr "rd_a11_top:polyUnite2.out" "rd_a11_top:groupParts6.ig";
connectAttr "rd_a11_top:groupId9.id" "rd_a11_top:groupParts6.gi";
connectAttr "rd_a11_top:groupParts6.og" "rd_a11_top:groupParts7.ig";
connectAttr "rd_a11_top:groupId10.id" "rd_a11_top:groupParts7.gi";
connectAttr "rd_a11_top:groupParts7.og" "rd_a11_top:deleteComponent23.ig";
connectAttr "rd_a11_top:deleteComponent23.og" "rd_a11_top:deleteComponent24.ig";
connectAttr "rd_a11_top:deleteComponent24.og" "rd_a11_top:deleteComponent25.ig";
connectAttr "rd_a11_top:deleteComponent25.og" "rd_a11_top:deleteComponent26.ig";
connectAttr "rd_a11_top:deleteComponent26.og" "rd_a11_top:deleteComponent27.ig";
connectAttr "rd_a11_top:deleteComponent27.og" "rd_a11_top:deleteComponent28.ig";
connectAttr "rd_a11_top:deleteComponent28.og" "rd_a11_top:deleteComponent29.ig";
connectAttr "rd_a11_top:deleteComponent29.og" "rd_a11_top:deleteComponent30.ig";
connectAttr "rd_a11_top:deleteComponent30.og" "rd_a11_top:deleteComponent31.ig";
connectAttr "rd_a11_top:deleteComponent31.og" "rd_a11_top:deleteComponent32.ig";
connectAttr "rd_a11_top:deleteComponent32.og" "rd_a11_top:deleteComponent33.ig";
connectAttr "rd_a11_top:deleteComponent33.og" "rd_a11_top:deleteComponent34.ig";
connectAttr "rd_a11_top:deleteComponent34.og" "rd_a11_top:deleteComponent35.ig";
connectAttr "rd_a11_top:deleteComponent35.og" "rd_a11_top:deleteComponent36.ig";
connectAttr "rd_a11_top:deleteComponent36.og" "rd_a11_top:deleteComponent37.ig";
connectAttr "rd_a11_top:deleteComponent37.og" "rd_a11_top:deleteComponent38.ig";
connectAttr "rd_a11_top:deleteComponent38.og" "rd_a11_top:deleteComponent39.ig";
connectAttr "rd_a11_top:deleteComponent39.og" "rd_a11_top:deleteComponent40.ig";
connectAttr "rd_a11_top:deleteComponent40.og" "rd_a11_top:deleteComponent41.ig";
connectAttr "rd_a11_top:deleteComponent41.og" "rd_a11_top:deleteComponent42.ig";
connectAttr "rd_a11_top:deleteComponent42.og" "rd_a11_top:deleteComponent43.ig";
connectAttr "rd_a11_top:deleteComponent43.og" "rd_a11_top:deleteComponent44.ig";
connectAttr "rd_a11_top:deleteComponent44.og" "rd_a11_top:deleteComponent45.ig";
connectAttr "rd_a11_top:deleteComponent45.og" "rd_a11_top:deleteComponent46.ig";
connectAttr "rd_a11_top:deleteComponent46.og" "rd_a11_top:deleteComponent47.ig";
connectAttr "rd_a11_top:polyTweak5.out" "rd_a11_top:polyTriangulate2.ip";
connectAttr "rd_a11_top:deleteComponent47.og" "rd_a11_top:polyTweak5.ip";
connectAttr "rd_a11_top:polySurfaceShape4.o" "rd_a11_top:polySeparate2.ip";
connectAttr "rd_a11_top:polySeparate2.out[0]" "rd_a11_top:groupParts8.ig";
connectAttr "rd_a11_top:groupId11.id" "rd_a11_top:groupParts8.gi";
connectAttr "rd_a11_top:polySeparate2.out[1]" "rd_a11_top:groupParts9.ig";
connectAttr "rd_a11_top:groupId12.id" "rd_a11_top:groupParts9.gi";
connectAttr "rd_a11_top:groupParts9.og" "rd_a11_top:polyPlanarProj4.ip";
connectAttr "rd_a11_top:polySurfaceShape6.wm" "rd_a11_top:polyPlanarProj4.mp";
connectAttr "rd_a11_top:polySurfaceShape5.o" "rd_a11_top:polyUnite3.ip[0]";
connectAttr "rd_a11_top:polySurfaceShape6.o" "rd_a11_top:polyUnite3.ip[1]";
connectAttr "rd_a11_top:polySurfaceShape5.wm" "rd_a11_top:polyUnite3.im[0]";
connectAttr "rd_a11_top:polySurfaceShape6.wm" "rd_a11_top:polyUnite3.im[1]";
connectAttr "rd_a11_top:polyUnite3.out" "rd_a11_top:groupParts10.ig";
connectAttr "rd_a11_top:groupId13.id" "rd_a11_top:groupParts10.gi";
connectAttr "rd_a11_top:groupParts10.og" "rd_a11_top:groupParts11.ig";
connectAttr "rd_a11_top:groupId14.id" "rd_a11_top:groupParts11.gi";
connectAttr "rd_a11_top:polySurfaceShape7.o" "rd_a11_top:polySeparate3.ip";
connectAttr "rd_a11_top:polySeparate3.out[0]" "rd_a11_top:groupParts12.ig";
connectAttr "rd_a11_top:groupId15.id" "rd_a11_top:groupParts12.gi";
connectAttr "rd_a11_top:polySeparate3.out[1]" "rd_a11_top:groupParts13.ig";
connectAttr "rd_a11_top:groupId16.id" "rd_a11_top:groupParts13.gi";
connectAttr "rd_a11_top:groupParts12.og" "rd_a11_top:polyTweakUV3.ip";
connectAttr "rd_a11_top:groupParts13.og" "rd_a11_top:polyTweakUV4.ip";
connectAttr "rd_a11_top:polySurfaceShape8.o" "rd_a11_top:polyUnite4.ip[0]";
connectAttr "rd_a11_top:polySurfaceShape9.o" "rd_a11_top:polyUnite4.ip[1]";
connectAttr "rd_a11_top:polySurfaceShape8.wm" "rd_a11_top:polyUnite4.im[0]";
connectAttr "rd_a11_top:polySurfaceShape9.wm" "rd_a11_top:polyUnite4.im[1]";
connectAttr "rd_a11_top:polyUnite4.out" "rd_a11_top:groupParts14.ig";
connectAttr "rd_a11_top:groupId17.id" "rd_a11_top:groupParts14.gi";
connectAttr "rd_a11_top:groupParts14.og" "rd_a11_top:groupParts15.ig";
connectAttr "rd_a11_top:groupId18.id" "rd_a11_top:groupParts15.gi";
connectAttr ":mentalrayGlobals.msg" ":mentalrayItemsList.glb";
connectAttr ":miDefaultOptions.msg" ":mentalrayItemsList.opt" -na;
connectAttr ":miDefaultFramebuffer.msg" ":mentalrayItemsList.fb" -na;
connectAttr ":miDefaultOptions.msg" ":mentalrayGlobals.opt";
connectAttr ":miDefaultFramebuffer.msg" ":mentalrayGlobals.fb";
connectAttr "rd_a11_top:polySurfaceShape12.o" "polyPlanarProj1.ip";
connectAttr "rd_a11_top:polySurfaceShape11.wm" "polyPlanarProj1.mp";
connectAttr "polyPlanarProj1.out" "rd_a11_top:polyPlanarProj5.ip";
connectAttr "rd_a11_top:polySurfaceShape11.wm" "rd_a11_top:polyPlanarProj5.mp";
connectAttr "rd_a11_top:polyPlanarProj5.out" "rd_a11_top:polyTweakUV5.ip";
connectAttr "rd_a11_top:lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "rd_a11_top:lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "rd_a11_top:place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "rd_a11_top:place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "rd_a11_top:file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "rd_a11_top:file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "rd_a11_top:file1.oc" ":lambert1.c";
connectAttr "rd_a11_top:pCubeShape2.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "rd_a11_top:pCubeShape2.ciog.cog[0]" ":initialShadingGroup.dsm" -na;
connectAttr "rd_a11_top:polySurfaceShape1.iog.og[0]" ":initialShadingGroup.dsm" 
		-na;
connectAttr "rd_a11_top:polySurfaceShape2.iog.og[0]" ":initialShadingGroup.dsm" 
		-na;
connectAttr "rd_a11_top:polySurfaceShape4.iog.og[0]" ":initialShadingGroup.dsm" 
		-na;
connectAttr "rd_a11_top:polySurfaceShape5.iog.og[0]" ":initialShadingGroup.dsm" 
		-na;
connectAttr "rd_a11_top:polySurfaceShape7.iog.og[0]" ":initialShadingGroup.dsm" 
		-na;
connectAttr "rd_a11_top:polySurfaceShape8.iog.og[0]" ":initialShadingGroup.dsm" 
		-na;
connectAttr "rd_a11_top:polySurfaceShape10.iog.og[0]" ":initialShadingGroup.dsm"
		 -na;
connectAttr "rd_a11_top:polySurfaceShape11.iog" ":initialShadingGroup.dsm" -na;
connectAttr "rd_a11_top:groupId1.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a11_top:groupId2.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a11_top:groupId5.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a11_top:groupId7.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a11_top:groupId9.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a11_top:groupId11.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a11_top:groupId13.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a11_top:groupId15.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a11_top:groupId17.msg" ":initialShadingGroup.gn" -na;
connectAttr "rd_a11_top:file1.msg" ":initialMaterialInfo.t" -na;
dataStructure -fmt "raw" -as "name=externalContentTable:string=node:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
applyMetadata -fmt "raw" -v "channel\nname externalContentTable\nstream\nname v1.0\nindexType numeric\nstructure externalContentTable\n0\n\"rd_a11_top:file1\" \"fileTextureName\" \"C:/Users/Dad/projects/github/amju-ww/Assets/tex/common/pz-ground22.png\" 3055824911 \"C:/Users/Dad/projects/github/amju-ww/Assets/tex/common/pz-ground22.png\" \"sourceImages\"\n1\n\"rd_a11_top:file2\" \"fileTextureName\" \"/Users/jay/projects/amju-ww/Assets/tex/common/underground3.png\" 2768784888 \"\" \"sourceImages\"\nendStream\nendChannel\nendAssociations\n" 
		-scn;
// End of rd_a11_top.ma
