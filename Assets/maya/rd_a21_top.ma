//Maya ASCII 2015 scene
//Name: rd_a21_top.ma
//Last modified: Wed, Aug 31, 2016 07:27:32 AM
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
	setAttr ".t" -type "double3" 8.5226857955022979 190.76057676111196 291.62894277655556 ;
	setAttr ".r" -type "double3" -39.338352729629996 0.60000000000001552 -5.4668781111609226e-016 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".coi" 364.61536926555885;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -5.9604644775390625e-006 13.221352693751641 0 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.10000000000002 0.041895784236714917 0.099502487562211472 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
	setAttr ".rp" -type "double3" -1.4210854715202004e-014 -1.3877787807814457e-017 
		-3.5457747848965937e-015 ;
	setAttr ".rpt" -type "double3" 0 -3.53189699708878e-015 3.5596525727044153e-015 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.10000000000002;
	setAttr ".ow" 2.2990311599895263;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".tp" -type "double3" 0 0.041895784236711364 0.099502487562189268 ;
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -50.68466263864871 -46.102608307282921 122.05064586642538 ;
	setAttr ".rp" -type "double3" 0 7.170031089737494e-016 0 ;
	setAttr ".rpt" -type "double3" 0 -7.170031089737494e-016 -6.2611766312428483e-016 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 109.24218139648437;
	setAttr ".ow" 187.71665391812593;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.10000000000002 0.041895784236711364 0.0995024875622115 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 2.2990311599895263;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "pCube1";
	setAttr ".t" -type "double3" 0 -56 0 ;
	setAttr ".s" -type "double3" 400 100 100 ;
createNode transform -n "transform1" -p "pCube1";
	setAttr ".v" no;
createNode mesh -n "pCubeShape1" -p "transform1";
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
createNode transform -n "pCube2";
	setAttr ".t" -type "double3" 0 -56 0 ;
	setAttr ".s" -type "double3" 400 100 100 ;
createNode transform -n "transform2" -p "pCube2";
	setAttr ".v" no;
createNode mesh -n "pCubeShape2" -p "transform2";
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
createNode transform -n "polySurface1";
createNode transform -n "polySurface2" -p "polySurface1";
createNode transform -n "transform5" -p "polySurface2";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape2" -p "transform5";
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
createNode transform -n "polySurface3" -p "polySurface1";
createNode transform -n "transform4" -p "polySurface3";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape3" -p "transform4";
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
createNode transform -n "transform3" -p "polySurface1";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape1" -p "transform3";
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
createNode transform -n "polySurface4";
	setAttr ".s" -type "double3" 0.5 1 1 ;
createNode transform -n "polySurface5" -p "polySurface4";
createNode transform -n "transform8" -p "polySurface5";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape5" -p "transform8";
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
createNode transform -n "polySurface6" -p "polySurface4";
createNode transform -n "transform7" -p "polySurface6";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape6" -p "transform7";
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
createNode transform -n "transform6" -p "polySurface4";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape4" -p "transform6";
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
createNode transform -n "polySurface7";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape7" -p "polySurface7";
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
	setAttr ".vnm" 0;
createNode transform -n "polySurface8";
	setAttr ".t" -type "double3" 1 0 0 ;
	setAttr ".s" -type "double3" 1.05 1.05 1.05 ;
createNode mesh -n "polySurfaceShape8" -p "polySurface8";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.48750010877847672 0.5049999225884676 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".vnm" 0;
createNode mesh -n "polySurfaceShape9" -p "polySurface8";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:31]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 1 "f[32:91]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" -0.57690697908401489 -0.058097705245018005 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 62 ".uvst[0].uvsp[0:61]" -type "float2" -0.041917428 0.0051858425
		 -0.041917428 0.098053038 -0.10860254 0.098053038 0.091452703 0.098053038 0.091452703
		 0.0051858425 0.2248228 0.098053038 0.2248228 0.0051858425 0.3581928 0.098053038 0.3581928
		 0.0051858425 0.49156272 0.098053038 0.49156272 0.0051858425 0.55824769 0.098053038
		 -0.10860254 0.90720499 -0.041917428 0.90720499 0.091452703 0.90720499 0.2248228 0.90720499
		 0.3581928 0.90720499 0.49156272 0.90720499 0.55824769 0.90720499 -0.041917428 0.99486268
		 0.091452703 0.99486268 0.2248228 0.99486268 0.3581928 0.99486268 0.49156272 0.99486268
		 1.55536985 -0.046972185 1.59844422 -0.046972185 1.55536985 0.66116601 1.59844422
		 0.66116601 -0.55536979 -0.046972185 -0.087733686 -0.046972185 -0.55536979 0.66116601
		 -0.087733686 0.66116601 0.50000012 -0.046972185 0.50000012 0.66116601 1.05947566
		 -0.046972185 1.05947566 0.66116601 -0.55536979 0.66116601 -0.087733686 0.66116601
		 -0.55536979 -0.046972185 -0.087733686 -0.046972185 0.50000012 0.66116601 0.50000012
		 -0.046972185 1.05947566 0.66116601 1.05947566 -0.046972185 1.55536985 0.66116601
		 1.55536985 -0.046972185 1.59844422 -0.046972185 1.59844422 0.66116601 -0.55536979
		 -0.069223225 -0.59844416 -0.046972185 -0.087733686 -0.069223225 0.50000012 -0.069223225
		 1.05947566 -0.069223225 1.55536985 -0.069223225 -0.59844416 -0.046972185 -0.55536979
		 -0.069223225 -0.087733686 -0.069223225 0.50000012 -0.069223225 1.05947566 -0.069223225
		 1.55536985 -0.069223225 -0.59844416 0.66116601 -0.59844416 0.66116601;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr -s 24 ".pt";
	setAttr ".pt[24]" -type "float3" -5.8689666 82.593262 0 ;
	setAttr ".pt[25]" -type "float3" 0 71.758194 0 ;
	setAttr ".pt[26]" -type "float3" 0.45145905 69.049454 0 ;
	setAttr ".pt[27]" -type "float3" 0.45145899 72.66111 0 ;
	setAttr ".pt[28]" -type "float3" 5.4175081 83.044731 0 ;
	setAttr ".pt[43]" -type "float3" -5.8689666 82.593262 0 ;
	setAttr ".pt[44]" -type "float3" 0 71.758194 0 ;
	setAttr ".pt[45]" -type "float3" 0.45145905 69.049454 0 ;
	setAttr ".pt[46]" -type "float3" 0.45145899 72.66111 0 ;
	setAttr ".pt[47]" -type "float3" 5.4175081 83.044731 0 ;
	setAttr ".pt[48]" -type "float3" -3.6116717 85.753494 0 ;
	setAttr ".pt[49]" -type "float3" -5.8689666 82.593262 0 ;
	setAttr ".pt[50]" -type "float3" 0 71.758194 0 ;
	setAttr ".pt[51]" -type "float3" 0.45145905 69.049454 0 ;
	setAttr ".pt[52]" -type "float3" 0.45145899 72.66111 0 ;
	setAttr ".pt[53]" -type "float3" 5.4175081 83.044731 0 ;
	setAttr ".pt[54]" -type "float3" 1.8058362 83.947655 0 ;
	setAttr ".pt[55]" -type "float3" -3.6116717 85.753494 0 ;
	setAttr ".pt[56]" -type "float3" -5.8689666 82.593262 0 ;
	setAttr ".pt[57]" -type "float3" 0 71.758194 0 ;
	setAttr ".pt[58]" -type "float3" 0.45145905 69.049454 0 ;
	setAttr ".pt[59]" -type "float3" 0.45145899 72.66111 0 ;
	setAttr ".pt[60]" -type "float3" 5.4175081 83.044731 0 ;
	setAttr ".pt[61]" -type "float3" 1.8058362 83.947655 0 ;
	setAttr -s 62 ".vt[0:61]"  -92.4425354 -6 50 -53.50602722 -6 50 -2.9802322e-006 -6 50
		 50.93344498 -6 50 91.89002228 -6 50 -100 -6 42.39242554 -92.4425354 0.28436661 42.39242554
		 -53.50602722 0.28436661 42.39242554 -2.9802322e-006 0.28436661 42.39242554 50.93344498 0.28436661 42.39242554
		 91.89002228 0.28436661 42.39242554 99.99999237 -6 42.39242554 -100 -6 -41.10614014
		 -92.4425354 0.28436661 -41.10614014 -53.50602722 0.28436661 -41.10614014 -2.9802322e-006 0.28436661 -41.10614014
		 50.93344498 0.28436661 -41.10614014 91.89002228 0.28436661 -41.10614014 99.99999237 -6 -41.10614014
		 -92.4425354 -6 -50 -53.50602722 -6 -50 -2.9802322e-006 -6 -50 50.93344498 -6 -50
		 91.89002228 -6 -50 -92.4425354 -105.99999237 50 -53.50602722 -105.99999237 50 -2.9802322e-006 -105.99999237 50
		 50.93344498 -105.99999237 50 91.89002228 -105.99999237 50 -92.4425354 -6 50 -53.50602722 -6 50
		 -2.9802322e-006 -6 50 50.93344498 -6 50 91.89002228 -6 50 -100 -6 42.39242554 99.99998474 -6 42.39242554
		 -100 -6 -41.10614014 99.99998474 -6 -41.10614014 -92.4425354 -6 -50 -53.50602722 -6 -50
		 -2.9802322e-006 -6 -50 50.93344498 -6 -50 91.89002228 -6 -50 -92.4425354 -105.99999237 -50
		 -53.50602722 -105.99999237 -50 -2.9802322e-006 -105.99999237 -50 50.93344498 -105.99999237 -50
		 91.89002228 -105.99999237 -50 -100 -105.99999237 -41.10613632 -92.4425354 -109.1421814 -41.10613632
		 -53.50602722 -109.1421814 -41.10613632 -2.9802322e-006 -109.1421814 -41.10613632
		 50.93344498 -109.1421814 -41.10613632 91.89002228 -109.1421814 -41.10613632 99.99998474 -105.99999237 -41.10613632
		 -100 -105.99999237 42.39242935 -92.4425354 -109.1421814 42.39242935 -53.50602722 -109.1421814 42.39242935
		 -2.9802322e-006 -109.1421814 42.39242935 50.93344498 -109.1421814 42.39242935 91.89002228 -109.1421814 42.39242935
		 99.99998474 -105.99999237 42.39242935;
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
	setAttr -s 76 ".n[0:75]" -type "float3"  -0.32841557 0.42018393 0.84592479
		 -0.33615971 0.91650134 0.21684578 -0.84622163 0.45827913 0.27182552 0 0.94100201
		 0.33840117 0 0.42610312 0.90467459 0 0.94100201 0.33840117 2.8502054e-008 0.42610309
		 0.90467459 0 0.94100189 0.33840123 0 0.42610309 0.90467471 0.24834609 0.88143712
		 0.40173721 0.46685681 0.39689255 0.79026645 0.8438828 0.47804207 0.24359335 -0.79369181
		 0.52751112 -0.30296081 -0.33073696 0.89795125 -0.29033914 0 0.95307219 -0.30274317
		 0 0.95307219 -0.30274317 0 0.95307219 -0.30274317 0.2760005 0.92602539 -0.25748947
		 0.83261943 0.42432222 -0.3559429 -0.30321261 0.57898831 -0.75685841 0 0.45985201
		 -0.88799554 0 0.45985207 -0.88799554 2.0543098e-008 0.45985207 -0.88799554 0.29165852
		 0.39634475 -0.87054354 0.40366209 -0.46302027 0.78909397 0.90241456 -0.22540198 0.36720815
		 0.46685681 0.39689255 0.79026645 0.8438828 0.47804207 0.24359335 -0.54791373 -0.39550287
		 0.73713505 -0.097270936 -0.54969501 0.82968289 -0.32841557 0.42018393 0.84592479
		 0 0.42610312 0.90467459 -0.0054817642 -0.55596882 0.8311851 2.8502054e-008 0.42610309
		 0.90467459 0.067452453 -0.55296957 0.83046669 0 0.42610309 0.90467471 -0.30321261
		 0.57898831 -0.75685841 0 0.45985201 -0.88799554 -0.51676226 -0.35858551 -0.77741444
		 -0.064957067 -0.57459468 -0.81585628 0 0.45985207 -0.88799554 0.017610971 -0.57723373
		 -0.81638902 2.0543098e-008 0.45985207 -0.88799554 0.099137872 -0.57079005 -0.81508923
		 0.29165852 0.39634475 -0.87054354 0.6362626 -0.31393433 -0.70470923 0.92533755 -0.35404122
		 -0.13566506 0.83261943 0.42432222 -0.3559429 -0.51676226 -0.35858551 -0.77741444
		 -0.52535635 -0.84537059 -0.096692689 -0.97615308 -0.12398439 -0.17819394 -0.14040817
		 -0.97595382 -0.16673286 -0.064957067 -0.57459468 -0.81585628 0.010751854 -0.98555213
		 -0.16903143 0.017610971 -0.57723373 -0.81638902 0.14473398 -0.97511691 -0.16792578
		 0.099137872 -0.57079005 -0.81508923 0.40745115 -0.89346486 -0.18895562 0.6362626
		 -0.31393433 -0.70470923 0.92533755 -0.35404122 -0.13566506 -0.92101145 -0.22987798
		 0.31447405 -0.46319494 -0.8602128 0.21327077 -0.14175734 -0.9707768 0.19364265 0.0093446188
		 -0.98084277 0.19457719 0.14244948 -0.97097576 0.19213091 0.45744559 -0.88158554 0.11640682
		 0.90241456 -0.22540198 0.36720815 -0.54791373 -0.39550287 0.73713505 -0.097270936
		 -0.54969501 0.82968289 -0.0054817642 -0.55596882 0.8311851 0.067452453 -0.55296957
		 0.83046669 0.40366209 -0.46302027 0.78909397 -0.97615308 -0.12398439 -0.17819394
		 -0.79369181 0.52751112 -0.30296081 -0.92101145 -0.22987798 0.31447405 -0.84622163
		 0.45827913 0.27182552;
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
createNode polyCube -n "polyCube1";
	setAttr ".sw" 10;
	setAttr ".sh" 3;
	setAttr ".sd" 3;
	setAttr ".cuv" 4;
createNode polyTweak -n "polyTweak1";
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
createNode deleteComponent -n "deleteComponent1";
	setAttr ".dc" -type "componentList" 0;
createNode deleteComponent -n "deleteComponent2";
	setAttr ".dc" -type "componentList" 0;
createNode deleteComponent -n "deleteComponent3";
	setAttr ".dc" -type "componentList" 1 "e[152]";
createNode deleteComponent -n "deleteComponent4";
	setAttr ".dc" -type "componentList" 1 "e[141]";
createNode deleteComponent -n "deleteComponent5";
	setAttr ".dc" -type "componentList" 1 "e[130]";
createNode deleteComponent -n "deleteComponent6";
	setAttr ".dc" -type "componentList" 4 "vtx[10]" "vtx[21]" "vtx[32]" "vtx[43]";
createNode polyTweak -n "polyTweak2";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[72]" -type "float3" -0.0078718355 0 0.043295097 ;
	setAttr ".tk[83]" -type "float3" -0.0078718355 0 0.043295097 ;
	setAttr ".tk[94]" -type "float3" -0.0078718355 0 0.043295097 ;
	setAttr ".tk[105]" -type "float3" -0.0078718355 0 0.043295097 ;
createNode deleteComponent -n "deleteComponent7";
	setAttr ".dc" -type "componentList" 1 "e[189]";
createNode deleteComponent -n "deleteComponent8";
	setAttr ".dc" -type "componentList" 1 "e[199]";
createNode deleteComponent -n "deleteComponent9";
	setAttr ".dc" -type "componentList" 1 "e[209]";
createNode deleteComponent -n "deleteComponent10";
	setAttr ".dc" -type "componentList" 4 "vtx[72]" "vtx[83]" "vtx[94]" "vtx[105]";
createNode polyTweak -n "polyTweak3";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[62]" -type "float3" 0.0088557303 -8.9406967e-008 0.05116713 ;
	setAttr ".tk[72]" -type "float3" 0.0088557303 -8.9406967e-008 0.05116713 ;
	setAttr ".tk[82]" -type "float3" 0.0088557303 -8.9406967e-008 0.05116713 ;
	setAttr ".tk[92]" -type "float3" 0.0088557303 -8.9406967e-008 0.05116713 ;
createNode deleteComponent -n "deleteComponent11";
	setAttr ".dc" -type "componentList" 1 "e[175]";
createNode deleteComponent -n "deleteComponent12";
	setAttr ".dc" -type "componentList" 1 "e[184]";
createNode deleteComponent -n "deleteComponent13";
	setAttr ".dc" -type "componentList" 1 "e[193]";
createNode deleteComponent -n "deleteComponent14";
	setAttr ".dc" -type "componentList" 4 "vtx[62]" "vtx[72]" "vtx[82]" "vtx[92]";
createNode polyTweak -n "polyTweak4";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk";
	setAttr ".tk[0]" -type "float3" 0.0098397946 0 -0.031487342 ;
	setAttr ".tk[10]" -type "float3" 0.0098397946 0 -0.031487342 ;
	setAttr ".tk[20]" -type "float3" 0.0098397946 0 -0.031487342 ;
	setAttr ".tk[30]" -type "float3" 0.0098397946 0 -0.031487342 ;
createNode deleteComponent -n "deleteComponent15";
	setAttr ".dc" -type "componentList" 1 "e[108]";
createNode deleteComponent -n "deleteComponent16";
	setAttr ".dc" -type "componentList" 1 "e[117]";
createNode deleteComponent -n "deleteComponent17";
	setAttr ".dc" -type "componentList" 1 "e[126]";
createNode deleteComponent -n "deleteComponent18";
	setAttr ".dc" -type "componentList" 4 "vtx[0]" "vtx[10]" "vtx[20]" "vtx[30]";
createNode deleteComponent -n "deleteComponent19";
	setAttr ".dc" -type "componentList" 4 "e[16:23]" "e[60:67]" "e[227:229]" "e[239:241]";
createNode deleteComponent -n "deleteComponent20";
	setAttr ".dc" -type "componentList" 4 "e[8:15]" "e[52:59]" "e[208:210]" "e[217:219]";
createNode deleteComponent -n "deleteComponent21";
	setAttr ".dc" -type "componentList" 3 "vtx[9:26]" "vtx[67:84]" "vtx[116:123]";
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n"
		+ "                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n"
		+ "            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n"
		+ "            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n"
		+ "                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n"
		+ "                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n"
		+ "            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n"
		+ "            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n"
		+ "                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n"
		+ "                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n"
		+ "                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n"
		+ "            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n"
		+ "                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n"
		+ "                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n"
		+ "                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -objectFilterShowInHUD 1\n"
		+ "            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n"
		+ "            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n"
		+ "                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n"
		+ "                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                -ignoreHiddenAttribute 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n"
		+ "            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 1\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n"
		+ "                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n"
		+ "                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n"
		+ "                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n"
		+ "                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n"
		+ "                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n"
		+ "            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n"
		+ "                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n"
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
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n"
		+ "                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n"
		+ "                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n"
		+ "                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n"
		+ "                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n"
		+ "                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n"
		+ "\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode file -n "file1";
	setAttr ".ftn" -type "string" "C:/Users/Dad/projects/github/amju-ww/Assets/tex/common/pz-ground22.png";
createNode place2dTexture -n "place2dTexture1";
createNode deleteComponent -n "deleteComponent22";
	setAttr ".dc" -type "componentList" 1 "f[9:38]";
createNode lambert -n "lambert2";
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr -s 8 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 8 ".gn";
createNode materialInfo -n "materialInfo1";
createNode file -n "file2";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/underground3.png";
createNode place2dTexture -n "place2dTexture2";
createNode polyPlanarProj -n "polyPlanarProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:51]";
	setAttr ".ix" -type "matrix" 400 0 0 0 0 100 0 0 0 0 100 0 0 -56 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -7.62939453125e-006 -57.571090698242188 0 ;
	setAttr ".ro" -type "double3" -90 0 0 ;
	setAttr ".ps" -type "double2" 399.99998474121094 100 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyPlanarProj -n "polyPlanarProj2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:51]";
	setAttr ".ix" -type "matrix" 400 0 0 0 0 100 0 0 0 0 100 0 0 -56 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -1.52587890625e-005 -57.571090698242188 0 ;
	setAttr ".ro" -type "double3" 0 90 0 ;
	setAttr ".ps" -type "double2" 100 103.14218139648437 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyPlanarProj -n "polyPlanarProj3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:51]";
	setAttr ".ix" -type "matrix" 400 0 0 0 0 100 0 0 0 0 100 0 0 -56 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -1.52587890625e-005 -57.571090698242188 0 ;
	setAttr ".ps" -type "double2" 399.99996948242187 103.14218139648437 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyTweakUV -n "polyTweakUV1";
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
createNode polyUnite -n "polyUnite1";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "groupId1";
	setAttr ".ihi" 0;
createNode groupId -n "groupId2";
	setAttr ".ihi" 0;
createNode groupId -n "groupId3";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:51]";
createNode groupId -n "groupId4";
	setAttr ".ihi" 0;
createNode groupId -n "groupId5";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:29]";
createNode groupId -n "groupId6";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[30:81]";
createNode polyTriangulate -n "polyTriangulate1";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polySeparate -n "polySeparate1";
	setAttr ".ic" 2;
	setAttr -s 2 ".out";
createNode groupId -n "groupId7";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts4";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:55]";
createNode groupId -n "groupId8";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts5";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:99]";
createNode polyTweakUV -n "polyTweakUV2";
	setAttr ".uopa" yes;
	setAttr -s 40 ".uvtk[0:39]" -type "float2" 0.089552358 0 0.089552358
		 0 0.11194049 0 0.067164257 0 0.067164257 0 0.044776142 0 0.044776142 0 0.022388041
		 0 0.022388041 0 -2.9802322e-008 0 -2.9802322e-008 0 -0.02238816 0 -0.02238816 0 -0.044776201
		 0 -0.044776201 0 -0.067164361 0 -0.067164361 0 -0.089552462 0 -0.089552462 0 -0.11194062
		 0 0.11194049 0 0.089552358 0 0.067164257 0 0.044776142 0 0.022388041 0 -2.9802322e-008
		 0 -0.02238816 0 -0.044776201 0 -0.067164361 0 -0.089552462 0 -0.11194062 0 0.089552358
		 0 0.067164257 0 0.044776142 0 0.022388041 0 -2.9802322e-008 0 -0.02238816 0 -0.044776201
		 0 -0.067164361 0 -0.089552462 0;
createNode polyUnite -n "polyUnite2";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "groupId9";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts6";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:55]";
createNode groupId -n "groupId10";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts7";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[56:155]";
createNode deleteComponent -n "deleteComponent23";
	setAttr ".dc" -type "componentList" 8 "e[44]" "e[55]" "e[66]" "e[154]" "e[169]" "e[179]" "e[190]" "e[201]";
createNode deleteComponent -n "deleteComponent24";
	setAttr ".dc" -type "componentList" 8 "e[42]" "e[52]" "e[62]" "e[149]" "e[163]" "e[172]" "e[182]" "e[192]";
createNode deleteComponent -n "deleteComponent25";
	setAttr ".dc" -type "componentList" 8 "e[40]" "e[49]" "e[58]" "e[144]" "e[157]" "e[165]" "e[174]" "e[183]";
createNode deleteComponent -n "deleteComponent26";
	setAttr ".dc" -type "componentList" 8 "e[38]" "e[46]" "e[54]" "e[139]" "e[151]" "e[158]" "e[166]" "e[174]";
createNode deleteComponent -n "deleteComponent27";
	setAttr ".dc" -type "componentList" 0;
createNode deleteComponent -n "deleteComponent28";
	setAttr ".dc" -type "componentList" 2 "e[183:184]" "e[191:192]";
createNode deleteComponent -n "deleteComponent29";
	setAttr ".dc" -type "componentList" 2 "e[72:73]" "e[205:206]";
createNode deleteComponent -n "deleteComponent30";
	setAttr ".dc" -type "componentList" 2 "e[63:64]" "e[210:211]";
createNode deleteComponent -n "deleteComponent31";
	setAttr ".dc" -type "componentList" 2 "e[77:78]" "e[192:193]";
createNode deleteComponent -n "deleteComponent32";
	setAttr ".dc" -type "componentList" 2 "e[68:69]" "e[195:196]";
createNode deleteComponent -n "deleteComponent33";
	setAttr ".dc" -type "componentList" 2 "e[61:62]" "e[198:199]";
createNode deleteComponent -n "deleteComponent34";
	setAttr ".dc" -type "componentList" 2 "e[71:72]" "e[184:185]";
createNode deleteComponent -n "deleteComponent35";
	setAttr ".dc" -type "componentList" 2 "e[69:70]" "e[180:181]";
createNode deleteComponent -n "deleteComponent36";
	setAttr ".dc" -type "componentList" 2 "e[64:65]" "e[181:182]";
createNode deleteComponent -n "deleteComponent37";
	setAttr ".dc" -type "componentList" 2 "e[59:60]" "e[182:183]";
createNode deleteComponent -n "deleteComponent38";
	setAttr ".dc" -type "componentList" 2 "e[63:64]" "e[172:173]";
createNode deleteComponent -n "deleteComponent39";
	setAttr ".dc" -type "componentList" 2 "e[60:61]" "e[171:172]";
createNode deleteComponent -n "deleteComponent40";
	setAttr ".dc" -type "componentList" 2 "e[57:58]" "e[170:171]";
createNode deleteComponent -n "deleteComponent41";
	setAttr ".dc" -type "componentList" 2 "e[157:158]" "e[163:164]";
createNode deleteComponent -n "deleteComponent42";
	setAttr ".dc" -type "componentList" 2 "e[155:156]" "e[159:160]";
createNode deleteComponent -n "deleteComponent43";
	setAttr ".dc" -type "componentList" 1 "e[153:156]";
createNode deleteComponent -n "deleteComponent44";
	setAttr ".dc" -type "componentList" 10 "vtx[7]" "vtx[17]" "vtx[28]" "vtx[38]" "vtx[47]" "vtx[56]" "vtx[69]" "vtx[78]" "vtx[88]" "vtx[99]";
createNode deleteComponent -n "deleteComponent45";
	setAttr ".dc" -type "componentList" 10 "vtx[5]" "vtx[14]" "vtx[24]" "vtx[33]" "vtx[41]" "vtx[49]" "vtx[61]" "vtx[69]" "vtx[78]" "vtx[88]";
createNode deleteComponent -n "deleteComponent46";
	setAttr ".dc" -type "componentList" 10 "vtx[3]" "vtx[11]" "vtx[20]" "vtx[28]" "vtx[35]" "vtx[42]" "vtx[53]" "vtx[60]" "vtx[68]" "vtx[77]";
createNode deleteComponent -n "deleteComponent47";
	setAttr ".dc" -type "componentList" 10 "vtx[1]" "vtx[8]" "vtx[16]" "vtx[23]" "vtx[29]" "vtx[35]" "vtx[45]" "vtx[51]" "vtx[58]" "vtx[66]";
createNode polyTriangulate -n "polyTriangulate2";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyTweak -n "polyTweak5";
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
createNode polySeparate -n "polySeparate2";
	setAttr ".ic" 2;
	setAttr -s 2 ".out";
createNode groupId -n "groupId11";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts8";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:31]";
createNode groupId -n "groupId12";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts9";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:59]";
createNode polyTweakUV -n "polyTweakUV3";
	setAttr ".uopa" yes;
	setAttr -s 24 ".uvtk[0:23]" -type "float2" -0.059925959 0 -0.059925959
		 0 -0.014021677 0 -0.15173459 0 -0.15173459 0 -0.24354313 0 -0.24354313 0 -0.33535165
		 0 -0.33535165 0 -0.42716008 0 -0.42716008 0 -0.47306433 0 -0.014021677 0 -0.059925959
		 0 -0.15173459 0 -0.24354313 0 -0.33535165 0 -0.42716008 0 -0.47306433 0 -0.059925959
		 0 -0.15173459 0 -0.24354313 0 -0.33535165 0 -0.42716008 0;
createNode polyUnite -n "polyUnite3";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "groupId13";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts10";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:31]";
createNode groupId -n "groupId14";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts11";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[32:91]";
createNode polyPlanarProj -n "polyPlanarProj4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:91]";
	setAttr ".ix" -type "matrix" 1.05 0 0 0 0 1.05 0 0 0 0 1.05 0 1 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" 0.051929473876953125 -20.899388790130615 0 ;
	setAttr ".ro" -type "double3" -90 0 0 ;
	setAttr ".ps" -type "double2" 215.68836212158203 104.99999237060547 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode groupId -n "groupId15";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts12";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:31]";
createNode groupId -n "groupId16";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts13";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[32:91]";
createNode polyTweakUV -n "polyTweakUV4";
	setAttr ".uopa" yes;
	setAttr -s 62 ".uvtk[0:61]" -type "float2" 0.20231514 -0.044783026 0.20231514
		 -0.037208468 0.22005017 -0.037208468 0.11094318 -0.037208468 0.11094318 -0.044783026
		 -0.01461888 -0.037208468 -0.01461888 -0.044783026 -0.13414392 -0.037208468 -0.13414392
		 -0.044783026 -0.2302563 -0.037208468 -0.2302563 -0.044783026 -0.24928795 -0.037208468
		 0.22005017 0.045927785 0.20231514 0.045927785 0.11094318 0.045927785 -0.01461888
		 0.045927785 -0.13414392 0.045927785 -0.2302563 0.045927785 -0.24928795 0.045927785
		 0.20231514 0.054782957 0.11094318 0.054782957 -0.01461888 0.054782957 -0.13414392
		 0.054782957 -0.2302563 0.054782957 -0.24296962 -0.044783026 -0.2535257 -0.037208468
		 -0.2302563 -0.044783026 -0.24928795 -0.037208468 0.2160878 -0.044783026 0.11094318
		 -0.044783026 0.20231514 -0.044783026 0.11094318 -0.044783026 -0.015678354 -0.044783026
		 -0.01461888 -0.044783026 -0.13520339 -0.044783026 -0.13414392 -0.044783026 0.20231514
		 0.054782957 0.11094318 0.054782957 0.2160878 0.054782957 0.11094318 0.054782957 -0.01461888
		 0.054782957 -0.015678354 0.054782957 -0.13414392 0.054782957 -0.13520339 0.054782957
		 -0.2302563 0.054782957 -0.24296962 0.054782957 -0.2535257 0.045927785 -0.24928795
		 0.045927785 0.2160878 0.045927785 0.22852567 0.045927785 0.11094318 0.045927785 -0.015678354
		 0.045927785 -0.13520339 0.045927785 -0.24296962 0.045927785 0.22852567 -0.037208468
		 0.2160878 -0.037208468 0.11094318 -0.037208468 -0.015678354 -0.037208468 -0.13520339
		 -0.037208468 -0.24296962 -0.037208468 0.22005017 0.045927785 0.22005017 -0.037208468;
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
	setAttr -s 8 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 8 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :initialMaterialInfo;
select -ne :defaultRenderGlobals;
	setAttr ".ep" 1;
select -ne :defaultResolution;
	setAttr ".w" 640;
	setAttr ".h" 480;
	setAttr ".dar" 1.3333332538604736;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :hardwareRenderingGlobals;
	setAttr ".vac" 2;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
connectAttr "groupId3.id" "pCubeShape1.iog.og[0].gid";
connectAttr "lambert2SG.mwc" "pCubeShape1.iog.og[0].gco";
connectAttr "groupParts1.og" "pCubeShape1.i";
connectAttr "polyTweakUV1.uvtk[0]" "pCubeShape1.uvst[0].uvtw";
connectAttr "groupId4.id" "pCubeShape1.ciog.cog[0].cgid";
connectAttr "groupId1.id" "pCubeShape2.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "pCubeShape2.iog.og[0].gco";
connectAttr "groupId2.id" "pCubeShape2.ciog.cog[0].cgid";
connectAttr "polyTweakUV2.out" "polySurfaceShape2.i";
connectAttr "groupId7.id" "polySurfaceShape2.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape2.iog.og[0].gco";
connectAttr "polyTweakUV2.uvtk[0]" "polySurfaceShape2.uvst[0].uvtw";
connectAttr "groupParts5.og" "polySurfaceShape3.i";
connectAttr "groupId8.id" "polySurfaceShape3.iog.og[0].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape3.iog.og[0].gco";
connectAttr "polyTriangulate1.out" "polySurfaceShape1.i";
connectAttr "groupId5.id" "polySurfaceShape1.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape1.iog.og[0].gco";
connectAttr "groupId6.id" "polySurfaceShape1.iog.og[1].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape1.iog.og[1].gco";
connectAttr "polyTweakUV3.out" "polySurfaceShape5.i";
connectAttr "groupId11.id" "polySurfaceShape5.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape5.iog.og[0].gco";
connectAttr "polyTweakUV3.uvtk[0]" "polySurfaceShape5.uvst[0].uvtw";
connectAttr "groupParts9.og" "polySurfaceShape6.i";
connectAttr "groupId12.id" "polySurfaceShape6.iog.og[0].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape6.iog.og[0].gco";
connectAttr "polyTriangulate2.out" "polySurfaceShape4.i";
connectAttr "groupId9.id" "polySurfaceShape4.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape4.iog.og[0].gco";
connectAttr "groupId10.id" "polySurfaceShape4.iog.og[1].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape4.iog.og[1].gco";
connectAttr "groupParts11.og" "polySurfaceShape7.i";
connectAttr "groupId13.id" "polySurfaceShape7.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape7.iog.og[0].gco";
connectAttr "groupId14.id" "polySurfaceShape7.iog.og[1].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape7.iog.og[1].gco";
connectAttr "groupId15.id" "polySurfaceShape8.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape8.iog.og[0].gco";
connectAttr "groupId16.id" "polySurfaceShape8.iog.og[1].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape8.iog.og[1].gco";
connectAttr "polyTweakUV4.out" "polySurfaceShape8.i";
connectAttr "polyTweakUV4.uvtk[0]" "polySurfaceShape8.uvst[0].uvtw";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "polyCube1.out" "polyTweak1.ip";
connectAttr "polyTweak1.out" "deleteComponent1.ig";
connectAttr "deleteComponent1.og" "deleteComponent2.ig";
connectAttr "deleteComponent2.og" "deleteComponent3.ig";
connectAttr "deleteComponent3.og" "deleteComponent4.ig";
connectAttr "deleteComponent4.og" "deleteComponent5.ig";
connectAttr "deleteComponent5.og" "deleteComponent6.ig";
connectAttr "deleteComponent6.og" "polyTweak2.ip";
connectAttr "polyTweak2.out" "deleteComponent7.ig";
connectAttr "deleteComponent7.og" "deleteComponent8.ig";
connectAttr "deleteComponent8.og" "deleteComponent9.ig";
connectAttr "deleteComponent9.og" "deleteComponent10.ig";
connectAttr "deleteComponent10.og" "polyTweak3.ip";
connectAttr "polyTweak3.out" "deleteComponent11.ig";
connectAttr "deleteComponent11.og" "deleteComponent12.ig";
connectAttr "deleteComponent12.og" "deleteComponent13.ig";
connectAttr "deleteComponent13.og" "deleteComponent14.ig";
connectAttr "deleteComponent14.og" "polyTweak4.ip";
connectAttr "polyTweak4.out" "deleteComponent15.ig";
connectAttr "deleteComponent15.og" "deleteComponent16.ig";
connectAttr "deleteComponent16.og" "deleteComponent17.ig";
connectAttr "deleteComponent17.og" "deleteComponent18.ig";
connectAttr "deleteComponent18.og" "deleteComponent19.ig";
connectAttr "deleteComponent19.og" "deleteComponent20.ig";
connectAttr "deleteComponent20.og" "deleteComponent21.ig";
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
connectAttr "deleteComponent21.og" "deleteComponent22.ig";
connectAttr "file2.oc" "lambert2.c";
connectAttr "lambert2.oc" "lambert2SG.ss";
connectAttr "pCubeShape1.iog.og[0]" "lambert2SG.dsm" -na;
connectAttr "pCubeShape1.ciog.cog[0]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape1.iog.og[1]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape3.iog.og[0]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape4.iog.og[1]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape6.iog.og[0]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape7.iog.og[1]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape8.iog.og[1]" "lambert2SG.dsm" -na;
connectAttr "groupId3.msg" "lambert2SG.gn" -na;
connectAttr "groupId4.msg" "lambert2SG.gn" -na;
connectAttr "groupId6.msg" "lambert2SG.gn" -na;
connectAttr "groupId8.msg" "lambert2SG.gn" -na;
connectAttr "groupId10.msg" "lambert2SG.gn" -na;
connectAttr "groupId12.msg" "lambert2SG.gn" -na;
connectAttr "groupId14.msg" "lambert2SG.gn" -na;
connectAttr "groupId16.msg" "lambert2SG.gn" -na;
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "lambert2.msg" "materialInfo1.m";
connectAttr "file2.msg" "materialInfo1.t" -na;
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
connectAttr "deleteComponent22.og" "polyPlanarProj1.ip";
connectAttr "pCubeShape1.wm" "polyPlanarProj1.mp";
connectAttr "polyPlanarProj1.out" "polyPlanarProj2.ip";
connectAttr "pCubeShape1.wm" "polyPlanarProj2.mp";
connectAttr "polyPlanarProj2.out" "polyPlanarProj3.ip";
connectAttr "pCubeShape1.wm" "polyPlanarProj3.mp";
connectAttr "polyPlanarProj3.out" "polyTweakUV1.ip";
connectAttr "pCubeShape2.o" "polyUnite1.ip[0]";
connectAttr "pCubeShape1.o" "polyUnite1.ip[1]";
connectAttr "pCubeShape2.wm" "polyUnite1.im[0]";
connectAttr "pCubeShape1.wm" "polyUnite1.im[1]";
connectAttr "polyTweakUV1.out" "groupParts1.ig";
connectAttr "groupId3.id" "groupParts1.gi";
connectAttr "polyUnite1.out" "groupParts2.ig";
connectAttr "groupId5.id" "groupParts2.gi";
connectAttr "groupParts2.og" "groupParts3.ig";
connectAttr "groupId6.id" "groupParts3.gi";
connectAttr "groupParts3.og" "polyTriangulate1.ip";
connectAttr "polySurfaceShape1.o" "polySeparate1.ip";
connectAttr "polySeparate1.out[0]" "groupParts4.ig";
connectAttr "groupId7.id" "groupParts4.gi";
connectAttr "polySeparate1.out[1]" "groupParts5.ig";
connectAttr "groupId8.id" "groupParts5.gi";
connectAttr "groupParts4.og" "polyTweakUV2.ip";
connectAttr "polySurfaceShape2.o" "polyUnite2.ip[0]";
connectAttr "polySurfaceShape3.o" "polyUnite2.ip[1]";
connectAttr "polySurfaceShape2.wm" "polyUnite2.im[0]";
connectAttr "polySurfaceShape3.wm" "polyUnite2.im[1]";
connectAttr "polyUnite2.out" "groupParts6.ig";
connectAttr "groupId9.id" "groupParts6.gi";
connectAttr "groupParts6.og" "groupParts7.ig";
connectAttr "groupId10.id" "groupParts7.gi";
connectAttr "groupParts7.og" "deleteComponent23.ig";
connectAttr "deleteComponent23.og" "deleteComponent24.ig";
connectAttr "deleteComponent24.og" "deleteComponent25.ig";
connectAttr "deleteComponent25.og" "deleteComponent26.ig";
connectAttr "deleteComponent26.og" "deleteComponent27.ig";
connectAttr "deleteComponent27.og" "deleteComponent28.ig";
connectAttr "deleteComponent28.og" "deleteComponent29.ig";
connectAttr "deleteComponent29.og" "deleteComponent30.ig";
connectAttr "deleteComponent30.og" "deleteComponent31.ig";
connectAttr "deleteComponent31.og" "deleteComponent32.ig";
connectAttr "deleteComponent32.og" "deleteComponent33.ig";
connectAttr "deleteComponent33.og" "deleteComponent34.ig";
connectAttr "deleteComponent34.og" "deleteComponent35.ig";
connectAttr "deleteComponent35.og" "deleteComponent36.ig";
connectAttr "deleteComponent36.og" "deleteComponent37.ig";
connectAttr "deleteComponent37.og" "deleteComponent38.ig";
connectAttr "deleteComponent38.og" "deleteComponent39.ig";
connectAttr "deleteComponent39.og" "deleteComponent40.ig";
connectAttr "deleteComponent40.og" "deleteComponent41.ig";
connectAttr "deleteComponent41.og" "deleteComponent42.ig";
connectAttr "deleteComponent42.og" "deleteComponent43.ig";
connectAttr "deleteComponent43.og" "deleteComponent44.ig";
connectAttr "deleteComponent44.og" "deleteComponent45.ig";
connectAttr "deleteComponent45.og" "deleteComponent46.ig";
connectAttr "deleteComponent46.og" "deleteComponent47.ig";
connectAttr "polyTweak5.out" "polyTriangulate2.ip";
connectAttr "deleteComponent47.og" "polyTweak5.ip";
connectAttr "polySurfaceShape4.o" "polySeparate2.ip";
connectAttr "polySeparate2.out[0]" "groupParts8.ig";
connectAttr "groupId11.id" "groupParts8.gi";
connectAttr "polySeparate2.out[1]" "groupParts9.ig";
connectAttr "groupId12.id" "groupParts9.gi";
connectAttr "groupParts8.og" "polyTweakUV3.ip";
connectAttr "polySurfaceShape5.o" "polyUnite3.ip[0]";
connectAttr "polySurfaceShape6.o" "polyUnite3.ip[1]";
connectAttr "polySurfaceShape5.wm" "polyUnite3.im[0]";
connectAttr "polySurfaceShape6.wm" "polyUnite3.im[1]";
connectAttr "polyUnite3.out" "groupParts10.ig";
connectAttr "groupId13.id" "groupParts10.gi";
connectAttr "groupParts10.og" "groupParts11.ig";
connectAttr "groupId14.id" "groupParts11.gi";
connectAttr "groupParts13.og" "polyPlanarProj4.ip";
connectAttr "polySurfaceShape8.wm" "polyPlanarProj4.mp";
connectAttr "polySurfaceShape9.o" "groupParts12.ig";
connectAttr "groupId15.id" "groupParts12.gi";
connectAttr "groupParts12.og" "groupParts13.ig";
connectAttr "groupId16.id" "groupParts13.gi";
connectAttr "polyPlanarProj4.out" "polyTweakUV4.ip";
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "file1.oc" ":lambert1.c";
connectAttr "pCubeShape2.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape2.ciog.cog[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape1.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape2.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape4.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape5.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape7.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "polySurfaceShape8.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "groupId1.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId2.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId5.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId7.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId9.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId11.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId13.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId15.msg" ":initialShadingGroup.gn" -na;
connectAttr "file1.msg" ":initialMaterialInfo.t" -na;
dataStructure -fmt "raw" -as "name=externalContentTable:string=node:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
applyMetadata -fmt "raw" -v "channel\nname externalContentTable\nstream\nname v1.0\nindexType numeric\nstructure externalContentTable\n0\n\"file1\" \"fileTextureName\" \"C:/Users/Dad/projects/github/amju-ww/Assets/tex/common/pz-ground22.png\" 3055824911 \"C:/Users/Dad/projects/github/amju-ww/Assets/tex/common/pz-ground22.png\" \"sourceImages\"\n1\n\"file2\" \"fileTextureName\" \"/Users/jay/projects/amju-ww/Assets/tex/common/underground3.png\" 2768784888 \"C:/Users/Dad/projects/github/amju-ww/Assets/tex/common/underground3.png\" \"sourceImages\"\nendStream\nendChannel\nendAssociations\n" 
		-scn;
// End of rd_a21_top.ma
