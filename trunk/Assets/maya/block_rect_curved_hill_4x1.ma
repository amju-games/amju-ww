//Maya ASCII 2012 scene
//Name: block_rect_curved_hill_4x1.ma
//Last modified: Sun, Jan 19, 2014 01:32:39 PM
//Codeset: UTF-8
requires maya "2012";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2012";
fileInfo "version" "2012 x64";
fileInfo "cutIdentifier" "201103110020-796618";
fileInfo "osv" "Mac OS X 10.8.5";
fileInfo "license" "student";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -388.72486388996981 426.05239898302534 2298.2794009885788 ;
	setAttr ".r" -type "double3" -19.200000000000149 -9.6000000000000671 0 ;
	setAttr ".rp" -type "double3" 0 0 2.8421709430404007e-14 ;
	setAttr ".rpt" -type "double3" 8.7540665497876001e-13 2.1345106274574592e-13 -8.0112483586994315e-13 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".coi" 2468.2124768089179;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0 -385.66036170340954 0 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.10000000000001 1.863564490620372e-14 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 306.01134921637669;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -223.50109774303613 -186.42137145480302 124.95224362137211 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 3251.1107061978364;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" 5.2996329651820133 39.490901591412914 1.2980290310701719 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 101.39802903107019 16.172516544612037 2.251488529638083e-14 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 241.45811612977678;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "block_rect_1x1:Mesh";
createNode mesh -n "polySurfaceShape1" -p "block_rect_1x1:Mesh";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 18 ".uvst[0].uvsp[0:17]" -type "float2" 0.329117 0.0075619998
		 0.66369098 0.0075619998 0.329117 0.5 0.66369098 0.5 0.329117 0.99212301 0.66369098
		 0.99212301 0.67957598 0.51162499 0.99257201 0.51162499 0.67957598 0.99671203 0.99257201
		 0.99671203 0.0074280002 0.51313299 0.31467 0.51313299 0.0074280002 0.99102801 0.31467
		 0.99102801 0.993949 0.0075619998 0.993949 0.5 0.0060510002 0.0075619998 0.0060510002
		 0.5;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 8 ".vt[0:7]"  -50 -37.69013214 50 50 -37.69013214 50 -50 12.30986691 50
		 50 12.30986691 50 -50 12.30986691 -50 50 12.30986691 -50 -50 -37.69013214 -50 50 -37.69013214 -50;
	setAttr -s 18 ".ed[0:17]"  0 1 0 1 2 0 2 0 0 1 3 0 3 2 0 3 4 0 4 2 0
		 3 5 0 5 4 0 5 6 0 6 4 0 5 7 0 7 6 0 7 0 0 0 6 0 7 1 0 7 3 0 0 4 0;
	setAttr -s 36 ".n[0:35]" -type "float3"  0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0
		 0 -1 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0
		 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0;
	setAttr -s 12 ".fc[0:11]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 0 1 2
		f 3 -2 3 4
		mu 0 3 2 1 3
		f 3 -5 5 6
		mu 0 3 2 3 4
		f 3 -6 7 8
		mu 0 3 4 3 5
		f 3 -9 9 10
		mu 0 3 6 7 8
		f 3 -10 11 12
		mu 0 3 8 7 9
		f 3 -13 13 14
		mu 0 3 10 11 12
		f 3 -14 15 -1
		mu 0 3 12 11 13
		f 3 -16 16 -4
		mu 0 3 1 14 3
		f 3 -17 -12 -8
		mu 0 3 3 14 15
		f 3 -15 17 -11
		mu 0 3 16 0 17
		f 3 -18 -3 -7
		mu 0 3 17 0 2;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode mesh -n "MeshShapeOrig" -p "block_rect_1x1:Mesh";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "polySurface1" -p "block_rect_1x1:Mesh";
createNode transform -n "polySurface3" -p "polySurface1";
createNode transform -n "transform5" -p "polySurface3";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape4" -p "transform5";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 1.7016078233718872 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".bw" 3;
createNode transform -n "polySurface4" -p "polySurface1";
createNode transform -n "transform4" -p "polySurface4";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape5" -p "transform4";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" -1 0.63142875094912032 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "transform2" -p "polySurface1";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape2" -p "transform2";
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
createNode transform -n "polySurface2" -p "block_rect_1x1:Mesh";
createNode transform -n "transform3" -p "polySurface2";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape3" -p "transform3";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.50701622664928436 0.51465457677841187 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "transform1" -p "block_rect_1x1:Mesh";
	setAttr ".v" no;
createNode mesh -n "block_rect_1x1:MeshShape" -p "transform1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 10 ".iog[0].og";
	setAttr ".pv" -type "double2" 0.49640399217605591 0.74281781911849976 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
createNode transform -n "ffd1Lattice";
	setAttr ".t" -type "double3" 0 17.082453674271704 0 ;
	setAttr ".s" -type "double3" 100 9.9999999999999998e-13 100 ;
createNode lattice -n "ffd1LatticeShape" -p "ffd1Lattice";
	setAttr -k off ".v";
	setAttr ".sd" 5;
	setAttr ".ud" 5;
	setAttr ".cc" -type "lattice" 5 5 5 125 -0.5 50025671249376.977
		 -0.5 -0.25 52655528211416.234 -0.5 0 23659672334358.766 -0.5 0.25 4750793285388.21
		 -0.5 0.5 -0.5 -0.5 -0.5 50025671249377.227 -0.5 -0.25 52655528211416.484 -0.5 0 23659672334359.016
		 -0.5 0.25 4750793285388.46 -0.5 0.5 -0.25 -0.5 -0.5 50025671249377.477 -0.5 -0.25
		 52655528211416.734 -0.5 0 23659672334359.266 -0.5 0.25 4750793285388.71 -0.5 0.5
		 0 -0.5 -0.5 50025671249377.727 -0.5 -0.25 52655528211416.984 -0.5 0 23659672334359.516
		 -0.5 0.25 4750793285388.96 -0.5 0.5 0.25 -0.5 -0.5 50025671249377.977 -0.5 -0.25
		 52655528211417.234 -0.5 0 23659672334359.766 -0.5 0.25 4750793285389.21 -0.5 0.5
		 0.5 -0.5 -0.5 50025671249376.977 -0.25 -0.25 57725298325123.953 -0.25 0 37372255295902.789
		 -0.25 0.25 18463376246932.227 -0.25 0.5 -0.5 -0.25 -0.5 50025671249377.227 -0.25 -0.25
		 57725298325124.203 -0.25 0 37372255295903.039 -0.25 0.25 18463376246932.477 -0.25 0.5
		 -0.25 -0.25 -0.5 50025671249377.477 -0.25 -0.25 57725298325124.453 -0.25 0 37372255295903.289
		 -0.25 0.25 18463376246932.727 -0.25 0.5 0 -0.25 -0.5 50025671249377.727 -0.25 -0.25
		 57725298325124.703 -0.25 0 37372255295903.539 -0.25 0.25 18463376246932.977 -0.25 0.5
		 0.25 -0.25 -0.5 50025671249377.977 -0.25 -0.25 57725298325124.953 -0.25 0 37372255295903.789
		 -0.25 0.25 18463376246933.227 -0.25 0.5 0.5 -0.25 -0.5 50025671249376.977 0 -0.25
		 57725298325123.953 0 0 37372255295902.789 0 0.25 18463376246932.227 0 0.5 -0.5 0 -0.5
		 50025671249377.227 0 -0.25 57725298325124.203 0 0 37372255295903.039 0 0.25 18463376246932.477
		 0 0.5 -0.25 0 -0.5 50025671249377.477 0 -0.25 57725298325124.453 0 0 37372255295903.289
		 0 0.25 18463376246932.727 0 0.5 0 0 -0.5 50025671249377.727 0 -0.25 57725298325124.703
		 0 0 37372255295903.539 0 0.25 18463376246932.977 0 0.5 0.25 0 -0.5 50025671249377.977
		 0 -0.25 57725298325124.953 0 0 37372255295903.789 0 0.25 18463376246933.227 0 0.5
		 0.5 0 -0.5 50025671249376.977 0.25 -0.25 57725298325123.953 0.25 0 37372255295902.789
		 0.25 0.25 18463376246932.227 0.25 0.5 -0.5 0.25 -0.5 50025671249377.227 0.25 -0.25
		 57725298325124.203 0.25 0 37372255295903.039 0.25 0.25 18463376246932.477 0.25 0.5
		 -0.25 0.25 -0.5 50025671249377.477 0.25 -0.25 57725298325124.453 0.25 0 37372255295903.289
		 0.25 0.25 18463376246932.727 0.25 0.5 0 0.25 -0.5 50025671249377.727 0.25 -0.25 57725298325124.703
		 0.25 0 37372255295903.539 0.25 0.25 18463376246932.977 0.25 0.5 0.25 0.25 -0.5 50025671249377.977
		 0.25 -0.25 57725298325124.953 0.25 0 37372255295903.789 0.25 0.25 18463376246933.227
		 0.25 0.5 0.5 0.25 -0.5 50025671249376.977 0.5 -0.25 52655528211416.234 0.5 0 23659672334358.766
		 0.5 0.25 4750793285388.21 0.5 0.5 -0.5 0.5 -0.5 50025671249377.227 0.5 -0.25 52655528211416.484
		 0.5 0 23659672334359.016 0.5 0.25 4750793285388.46 0.5 0.5 -0.25 0.5 -0.5 50025671249377.477
		 0.5 -0.25 52655528211416.734 0.5 0 23659672334359.266 0.5 0.25 4750793285388.71 0.5 0.5
		 0 0.5 -0.5 50025671249377.727 0.5 -0.25 52655528211416.984 0.5 0 23659672334359.516
		 0.5 0.25 4750793285388.96 0.5 0.5 0.25 0.5 -0.5 50025671249377.977 0.5 -0.25 52655528211417.234
		 0.5 0 23659672334359.766 0.5 0.25 4750793285389.21 0.5 0.5 0.5 0.5 ;
createNode transform -n "ffd1Base";
	setAttr ".t" -type "double3" 0 12.309866905212402 0 ;
	setAttr ".s" -type "double3" 100 9.9999999999999998e-13 100 ;
createNode baseLattice -n "ffd1BaseShape" -p "ffd1Base";
	setAttr ".ihi" 0;
	setAttr -k off ".v";
createNode transform -n "polySurface5";
	setAttr ".s" -type "double3" 4 4 2 ;
createNode transform -n "polySurface6" -p "polySurface5";
	setAttr ".t" -type "double3" 0 -2.6689291243767528 0 ;
	setAttr ".s" -type "double3" 2 2 2 ;
createNode transform -n "transform9" -p "polySurface6";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape7" -p "transform9";
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
	setAttr -s 6 ".pt";
	setAttr ".pt[6:7]" -type "float3" 0 4.5776367e-05 0  0 4.5776367e-05 0 ;
	setAttr ".pt[68:71]" -type "float3" 0 4.5776367e-05 0  0 4.5776367e-05 0  
		0 0 0  0 0 0 ;
createNode transform -n "polySurface7" -p "polySurface5";
	setAttr ".t" -type "double3" 0 -2.6689291243767528 0 ;
	setAttr ".s" -type "double3" 2 2 2 ;
createNode transform -n "transform8" -p "polySurface7";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape8" -p "transform8";
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
createNode transform -n "polySurface8" -p "polySurface5";
	setAttr ".t" -type "double3" 0 -2.6689291243767528 0 ;
	setAttr ".s" -type "double3" 2 2 2 ;
createNode transform -n "transform7" -p "polySurface8";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape9" -p "transform7";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.40729313974927184 0.48141354284468729 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "transform6" -p "polySurface5";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape6" -p "transform6";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".bw" 3;
createNode transform -n "polySurface9";
	setAttr ".t" -type "double3" 0 -533.93169806246567 0 ;
	setAttr ".s" -type "double3" 1 1 0.5 ;
createNode transform -n "polySurface10" -p "polySurface9";
createNode transform -n "transform13" -p "polySurface10";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape11" -p "transform13";
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
createNode transform -n "polySurface11" -p "polySurface9";
createNode transform -n "transform12" -p "polySurface11";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape12" -p "transform12";
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
createNode transform -n "polySurface12" -p "polySurface9";
createNode transform -n "transform11" -p "polySurface12";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape13" -p "transform11";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.44812476634979248 0.75556871294975281 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "transform10" -p "polySurface9";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape10" -p "transform10";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "polySurface13";
createNode mesh -n "polySurfaceShape14" -p "polySurface13";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 5 ".lnk";
	setAttr -s 5 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode polyQuad -n "polyQuad1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[*]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
createNode polyQuad -n "polyQuad2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:11]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".a" 0;
createNode deleteComponent -n "deleteComponent1";
	setAttr ".dc" -type "componentList" 1 "e[5]";
createNode polySubdFace -n "polySubdFace1";
	setAttr ".ics" -type "componentList" 1 "f[2]";
	setAttr ".duv" 8;
	setAttr ".dvv" 8;
	setAttr ".sbm" 1;
createNode ffd -n "ffd1";
	setAttr ".lis" 5;
	setAttr ".lit" 5;
	setAttr ".liu" 5;
	setAttr ".lo" yes;
createNode tweak -n "tweak1";
createNode objectSet -n "ffd1Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "ffd1GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "ffd1GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "vtx[2:5]" "vtx[8:84]";
createNode objectSet -n "tweakSet1";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId2";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n"
		+ "                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n"
		+ "                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n"
		+ "            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n"
		+ "            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n"
		+ "                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n"
		+ "                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n"
		+ "                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n"
		+ "            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n"
		+ "                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n"
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
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n"
		+ "                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n"
		+ "                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                $editorName;\nstereoCameraView -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n"
		+ "                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n"
		+ "                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -shadows 0\n                -displayMode \"centerEye\" \n"
		+ "                -viewColor 0 0 0 1 \n                $editorName;\nstereoCameraView -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode polyExtrudeFace -n "polyExtrudeFace1";
	setAttr ".ics" -type "componentList" 3 "f[2]" "f[5:6]" "f[11:73]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 12.87063 0 ;
	setAttr ".rs" 1114435098;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -50 -37.690132141113281 -50 ;
	setAttr ".cbx" -type "double3" 50 63.431392669677734 50 ;
createNode polyExtrudeFace -n "polyExtrudeFace2";
	setAttr ".ics" -type "componentList" 2 "f[2]" "f[11:73]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 37.870628 0 ;
	setAttr ".rs" 538143801;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -50 12.309867858886719 -50 ;
	setAttr ".cbx" -type "double3" 50 63.431392669677734 50 ;
createNode polyTriangulate -n "polyTriangulate1";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyTweak -n "polyTweak1";
	setAttr ".uopa" yes;
	setAttr -s 117 ".tk[36:152]" -type "float3"  0 9.5367432e-07 0 0 9.5367432e-07
		 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07
		 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07
		 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07
		 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07
		 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07
		 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07
		 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 9.5367432e-07 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651 0 0 10.5992651
		 0 0 10.5992651 0 0 10.5992651 0;
createNode lambert -n "ground_surface";
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 7 ".gn";
createNode materialInfo -n "materialInfo1";
createNode groupId -n "groupId3";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 5 "f[0:8]" "f[11:39]" "f[166:241]" "f[244:247]" "f[262:301]";
	setAttr ".irc" -type "componentList" 4 "f[9:10]" "f[40:165]" "f[242:243]" "f[248:261]";
createNode groupId -n "groupId4";
	setAttr ".ihi" 0;
createNode groupId -n "groupId5";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts4";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "f[9:10]" "f[40:165]";
createNode file -n "file1";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/pz-ground21.png";
createNode place2dTexture -n "place2dTexture1";
createNode polyTweakUV -n "polyTweakUV1";
	setAttr ".uopa" yes;
	setAttr -s 19 ".uvtk";
	setAttr ".uvtk[6:13]" -type "float2" -1.1936767 0  -1.1936767 0  -1.1936767 
		0  -1.1936767 0  -0.99256814 0  -0.99256814 0  -0.99256814 0  -0.99256814 0 ;
	setAttr ".uvtk[19]" -type "float2" -1.1936767 0 ;
	setAttr ".uvtk[21]" -type "float2" -1.1936767 0 ;
	setAttr ".uvtk[23]" -type "float2" -1.1936767 0 ;
	setAttr ".uvtk[25]" -type "float2" -1.1936767 0 ;
	setAttr ".uvtk[27]" -type "float2" -1.1936767 0 ;
	setAttr ".uvtk[29]" -type "float2" -1.1936767 0 ;
	setAttr ".uvtk[31]" -type "float2" -1.1936767 0 ;
	setAttr ".uvtk[119:122]" -type "float2" -0.99256814 0  -0.99256814 0  -0.99256814 
		0  -0.99256814 0 ;
createNode polyMapCut -n "polyMapCut1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 7 "e[0:7]" "e[9:50]" "e[52:55]" "e[57:111]" "e[113:300]" "e[308:386]" "e[391:452]";
createNode polyTweak -n "polyTweak2";
	setAttr ".uopa" yes;
	setAttr -s 146 ".tk";
	setAttr ".tk[2:5]" -type "float3" 0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0 ;
	setAttr ".tk[8:68]" -type "float3" 0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 0 0 ;
	setAttr ".tk[72:152]" -type "float3" 0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 0  0 -9.53934 
		0 ;
createNode polyTweakUV -n "polyTweakUV2";
	setAttr ".uopa" yes;
	setAttr -s 718 ".uvtk";
	setAttr ".uvtk[2:5]" -type "float2" 0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09 ;
	setAttr ".uvtk[18]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[20]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[22]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[24]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[26]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[28]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[30]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[32]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[34]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[36]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[38]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[40]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[42]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[44]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[46]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[48]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[50]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[52]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[54]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[56]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[58]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[60:118]" -type "float2" 0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09 ;
	setAttr ".uvtk[123:443]" -type "float2" 0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09 ;
	setAttr ".uvtk[453:455]" -type "float2" 0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09 ;
	setAttr ".uvtk[464:466]" -type "float2" 0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09 ;
	setAttr ".uvtk[476:490]" -type "float2" 0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09 ;
	setAttr ".uvtk[492:493]" -type "float2" 0 -5.5879354e-09  0 -5.5879354e-09 ;
	setAttr ".uvtk[495]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[497:499]" -type "float2" 0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09 ;
	setAttr ".uvtk[501]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[503:505]" -type "float2" 0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09 ;
	setAttr ".uvtk[507]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[509:511]" -type "float2" 0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09 ;
	setAttr ".uvtk[513]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[515]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[517]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[519]" -type "float2" 0 -5.5879354e-09 ;
	setAttr ".uvtk[521:538]" -type "float2" 0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09 ;
	setAttr ".uvtk[540:789]" -type "float2" 0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09 ;
	setAttr ".uvtk[792:797]" -type "float2" 0 -5.5879354e-09  0 -5.5879354e-09  
		0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09  0 -5.5879354e-09 ;
createNode polyMapCut -n "polyMapCut2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 9 "e[0:7]" "e[11:14]" "e[16:50]" "e[52:55]" "e[57:111]" "e[113:300]" "e[308]" "e[321:386]" "e[391:452]";
createNode polyTweakUV -n "polyTweakUV3";
	setAttr ".uopa" yes;
	setAttr -s 732 ".uvtk";
	setAttr ".uvtk[1:5]" -type "float2" 0 -0.0032436866  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032437127  0 -0.0032437127 ;
	setAttr ".uvtk[14]" -type "float2" 0 -0.0032436866 ;
	setAttr ".uvtk[18]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[20]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[22]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[24]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[26]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[28]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[30]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[32]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[34]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[36]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[38]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[40]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[42]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[44]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[46]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[48]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[50]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[52]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[54]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[56]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[58]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[60:118]" -type "float2" 0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127 ;
	setAttr ".uvtk[123:456]" -type "float2" 0 -0.0032436829  0 -0.0032436829  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032437127  0 -0.0032437127  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032436829  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032436829  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032436829  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032437127  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032436829  0 -0.0032437127  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032436866  
		0 -0.0032436866  0 -0.0032436866  0 -0.0032436866  0 -0.0032436866  0 -0.0032436866  
		0 -0.0032436866  0 -0.0032436866  0 -0.0032436866  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032436866 ;
	setAttr ".uvtk[464:466]" -type "float2" 0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127 ;
	setAttr ".uvtk[474:490]" -type "float2" 0 -0.0032436866  0 -0.0032436866  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127 ;
	setAttr ".uvtk[492:493]" -type "float2" 0 -0.0032437127  0 -0.0032437127 ;
	setAttr ".uvtk[495]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[497:499]" -type "float2" 0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127 ;
	setAttr ".uvtk[501]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[503:505]" -type "float2" 0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127 ;
	setAttr ".uvtk[507]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[509:511]" -type "float2" 0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127 ;
	setAttr ".uvtk[513]" -type "float2" 0 -0.0032437127 ;
	setAttr ".uvtk[515]" -type "float2" 0 -0.0032436829 ;
	setAttr ".uvtk[517]" -type "float2" 0 -0.0032436829 ;
	setAttr ".uvtk[519]" -type "float2" 0 -0.0032436829 ;
	setAttr ".uvtk[521:538]" -type "float2" 0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032437127  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  
		0 -0.0032437127 ;
	setAttr ".uvtk[540:789]" -type "float2" 0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  0 -0.0032437127  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829 ;
	setAttr ".uvtk[792:797]" -type "float2" 0 -0.0032436829  0 -0.0032436829  
		0 -0.0032436829  0 -0.0032436829  0 -0.0032436829  0 -0.0032436829 ;
createNode polyMapCut -n "polyMapCut3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 9 "e[0:7]" "e[11:14]" "e[16:50]" "e[52:55]" "e[57:111]" "e[113:300]" "e[308]" "e[321:386]" "e[391:452]";
createNode lambert -n "ground_edge";
createNode shadingEngine -n "lambert3SG";
	setAttr ".ihi" 0;
	setAttr -s 9 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 9 ".gn";
createNode materialInfo -n "materialInfo2";
createNode groupId -n "groupId6";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts5";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "f[242:243]" "f[248:261]";
createNode file -n "file2";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/ground21_edge.png";
createNode place2dTexture -n "place2dTexture2";
createNode polyTweakUV -n "polyTweakUV4";
	setAttr ".uopa" yes;
	setAttr -s 64 ".uvtk";
	setAttr ".uvtk[60:65]" -type "float2" 0.0014120487 -0.0084724668  0.0014120487 
		-0.0084724668  0.0014120785 -0.0084724668  0.0014120487 -0.0084724668  0.0014120934 
		-0.0084724668  0.0070603862 -0.00706039 ;
	setAttr ".uvtk[123:124]" -type "float2" 0.0014120487 -0.0084724668  0.0070603266 
		-0.16275735 ;
	setAttr ".uvtk[127:133]" -type "float2" 0.0070603862 -0.16275735  0.0070604011 
		-0.16275735  0.0070603862 -0.16275735  0.0014120934 -0.0084724668  0.0014120487 -0.0084724668  
		0.0014120785 -0.0084724668  0.0014120487 -0.0084724668 ;
	setAttr ".uvtk[155]" -type "float2" 0.0070603266 -0.16275735 ;
	setAttr ".uvtk[160:165]" -type "float2" 0.0070604011 -0.16275735  0.0070603862 
		-0.16275735  0.0070604011 -0.16275735  0.0070603266 -0.16275735  0.0070603862 -0.16275735  
		0.0070603266 -0.16275735 ;
	setAttr ".uvtk[355:356]" -type "float2" 0.0070603266 -0.16275735  0.0070603266 
		-0.16275735 ;
	setAttr ".uvtk[358:360]" -type "float2" 0.0070603862 -0.00706039  0.0070603266 
		-0.16275735  0.0070603266 -0.16275735 ;
	setAttr ".uvtk[364:365]" -type "float2" 0.0070603266 -0.16275735  0.0070603266 
		-0.16275735 ;
	setAttr ".uvtk[367:369]" -type "float2" 0.0070604011 -0.00706039  0.0070603862 
		-0.16275735  0.0070603862 -0.16275735 ;
	setAttr ".uvtk[373:374]" -type "float2" 0.0070603862 -0.16275735  0.0070603862 
		-0.16275735 ;
	setAttr ".uvtk[377:378]" -type "float2" 0.0070603266 -0.16275735  0.0070603266 
		-0.16275735 ;
	setAttr ".uvtk[382:383]" -type "float2" 0.0070603266 -0.16275735  0.0070603266 
		-0.16275735 ;
	setAttr ".uvtk[385:386]" -type "float2" 0.0070604011 -0.16275735  0.0070604011 
		-0.16275735 ;
	setAttr ".uvtk[390:391]" -type "float2" 0.0070604011 -0.16275735  0.0070604011 
		-0.16275735 ;
	setAttr ".uvtk[393:395]" -type "float2" 0.0070603266 -0.00706039  0.0070603862 
		-0.16275735  0.0070603862 -0.16275735 ;
	setAttr ".uvtk[399:402]" -type "float2" 0.0070603862 -0.16275735  0.0070603862 
		-0.16275735  0.0070604011 -0.16275735  0.0070604011 -0.16275735 ;
	setAttr ".uvtk[406:407]" -type "float2" 0.0070604011 -0.16275735  0.0070604011 
		-0.16275735 ;
	setAttr ".uvtk[410]" -type "float2" 0.0070603862 -0.16275735 ;
	setAttr ".uvtk[419:420]" -type "float2" 0.0070603266 -0.16275735  0.0070603266 
		-0.16275735 ;
	setAttr ".uvtk[423:425]" -type "float2" 0.0070604011 -0.00706039  0.0070603266 
		-0.16275735  0.0070603266 -0.16275735 ;
	setAttr ".uvtk[524]" -type "float2" 0.0070603862 -0.00706039 ;
	setAttr ".uvtk[527]" -type "float2" 0.0070604011 -0.00706039 ;
	setAttr ".uvtk[530]" -type "float2" 0.0070603862 -0.00706039 ;
	setAttr ".uvtk[535]" -type "float2" 0.0070603266 -0.00706039 ;
	setAttr ".uvtk[537]" -type "float2" 0.0070603266 -0.00706039 ;
	setAttr ".uvtk[787]" -type "float2" 0.0070603862 -0.16275735 ;
createNode polyChipOff -n "polyChipOff1";
	setAttr ".ics" -type "componentList" 2 "f[9:10]" "f[40:165]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".rs" 1010926617;
	setAttr ".dup" no;
createNode polySeparate -n "polySeparate1";
	setAttr ".ic" 2;
	setAttr -s 2 ".out";
createNode groupId -n "groupId7";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts6";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 3 "f[0:113]" "f[116:119]" "f[134:173]";
createNode groupId -n "groupId8";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts7";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "f[114:115]" "f[120:133]";
createNode groupId -n "groupId9";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts8";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:127]";
createNode polyTweakUV -n "polyTweakUV5";
	setAttr ".uopa" yes;
	setAttr -s 384 ".uvtk";
	setAttr ".uvtk[0:249]" -type "float2" -0.34440374 -0.039348677 -0.25564975
		 -0.039348677 -0.34440374 0.023589522 -0.34440374 0.023589522 -0.25564975 -0.039348677
		 -0.25564975 0.023589522 0.27687418 -0.41697779 0.27687418 -0.47991598 0.3656283 -0.41697779
		 0.3656283 -0.41697779 0.27687418 -0.47991598 0.3656283 -0.47991598 -0.25564975 -0.47991598
		 -0.25564975 -0.41697779 -0.34440374 -0.47991598 -0.34440374 -0.47991598 -0.25564975
		 -0.41697779 -0.34440374 -0.41697779 -0.16689578 -0.47991598 -0.16689578 -0.41697779
		 -0.25564975 -0.47991598 -0.25564975 -0.47991598 -0.16689578 -0.41697779 -0.25564975
		 -0.41697779 -0.078141734 -0.47991598 -0.078141734 -0.41697779 -0.16689578 -0.47991598
		 -0.16689578 -0.47991598 -0.078141734 -0.41697779 -0.16689578 -0.41697779 0.010612251
		 -0.47991598 0.010612251 -0.41697779 -0.078141734 -0.47991598 -0.078141734 -0.47991598
		 0.010612251 -0.41697779 -0.078141734 -0.41697779 0.099366292 -0.47991598 0.099366292
		 -0.41697779 0.010612251 -0.47991598 0.010612251 -0.47991598 0.099366292 -0.41697779
		 0.010612251 -0.41697779 0.18812025 -0.47991598 0.18812025 -0.41697779 0.099366292
		 -0.47991598 0.099366292 -0.47991598 0.18812025 -0.41697779 0.099366292 -0.41697779
		 0.27687418 -0.47991598 0.27687418 -0.41697779 0.18812025 -0.47991598 0.18812025 -0.47991598
		 0.27687418 -0.41697779 0.18812025 -0.41697779 0.27687418 -0.35403958 0.27687418 -0.41697779
		 0.3656283 -0.35403958 0.3656283 -0.35403958 0.27687418 -0.41697779 0.3656283 -0.41697779
		 -0.25564975 -0.41697779 -0.25564975 -0.35403958 -0.34440374 -0.41697779 -0.34440374
		 -0.41697779 -0.25564975 -0.35403958 -0.34440374 -0.35403958 -0.16689578 -0.41697779
		 -0.16689578 -0.35403958 -0.25564975 -0.41697779 -0.25564975 -0.41697779 -0.16689578
		 -0.35403958 -0.25564975 -0.35403958 -0.078141734 -0.41697779 -0.078141734 -0.35403958
		 -0.16689578 -0.41697779 -0.16689578 -0.41697779 -0.078141734 -0.35403958 -0.16689578
		 -0.35403958 0.010612251 -0.41697779 0.010612251 -0.35403958 -0.078141734 -0.41697779
		 -0.078141734 -0.41697779 0.010612251 -0.35403958 -0.078141734 -0.35403958 0.099366292
		 -0.41697779 0.099366292 -0.35403958 0.010612251 -0.41697779 0.010612251 -0.41697779
		 0.099366292 -0.35403958 0.010612251 -0.35403958 0.18812025 -0.41697779 0.18812025
		 -0.35403958 0.099366292 -0.41697779 0.099366292 -0.41697779 0.18812025 -0.35403958
		 0.099366292 -0.35403958 0.27687418 -0.41697779 0.27687418 -0.35403958 0.18812025
		 -0.41697779 0.18812025 -0.41697779 0.27687418 -0.35403958 0.18812025 -0.35403958
		 0.27687418 -0.29110149 0.27687418 -0.35403958 0.3656283 -0.29110149 0.3656283 -0.29110149
		 0.27687418 -0.35403958 0.3656283 -0.35403958 -0.25564975 -0.29110149 -0.34440374
		 -0.29110149 -0.25564975 -0.35403958 -0.25564975 -0.35403958 -0.34440374 -0.29110149
		 -0.34440374 -0.35403958 -0.16689578 -0.35403958 -0.16689578 -0.29110149 -0.25564975
		 -0.35403958 -0.25564975 -0.35403958 -0.16689578 -0.29110149 -0.25564975 -0.29110149
		 -0.078141734 -0.35403958 -0.078141734 -0.29110149 -0.16689578 -0.35403958 -0.16689578
		 -0.35403958 -0.078141734 -0.29110149 -0.16689578 -0.29110149 0.010612251 -0.35403958
		 0.010612251 -0.29110149 -0.078141734 -0.35403958 -0.078141734 -0.35403958 0.010612251
		 -0.29110149 -0.078141734 -0.29110149 0.099366292 -0.35403958 0.099366292 -0.29110149
		 0.010612251 -0.35403958 0.010612251 -0.35403958 0.099366292 -0.29110149 0.010612251
		 -0.29110149 0.18812025 -0.35403958 0.18812025 -0.29110149 0.099366292 -0.35403958
		 0.099366292 -0.35403958 0.18812025 -0.29110149 0.099366292 -0.29110149 0.27687418
		 -0.35403958 0.27687418 -0.29110149 0.18812025 -0.35403958 0.18812025 -0.35403958
		 0.27687418 -0.29110149 0.18812025 -0.29110149 0.27687418 -0.22816324 0.27687418 -0.29110149
		 0.3656283 -0.22816324 0.3656283 -0.22816324 0.27687418 -0.29110149 0.3656283 -0.29110149
		 -0.25564975 -0.29110149 -0.25564975 -0.22816324 -0.34440374 -0.29110149 -0.34440374
		 -0.29110149 -0.25564975 -0.22816324 -0.34440374 -0.22816324 -0.16689578 -0.29110149
		 -0.16689578 -0.22816324 -0.25564975 -0.29110149 -0.25564975 -0.29110149 -0.16689578
		 -0.22816324 -0.25564975 -0.22816324 -0.078141734 -0.29110149 -0.078141734 -0.22816324
		 -0.16689578 -0.29110149 -0.16689578 -0.29110149 -0.078141734 -0.22816324 -0.16689578
		 -0.22816324 0.010612251 -0.29110149 0.010612251 -0.22816324 -0.078141734 -0.29110149
		 -0.078141734 -0.29110149 0.010612251 -0.22816324 -0.078141734 -0.22816324 0.099366292
		 -0.29110149 0.099366292 -0.22816324 0.010612251 -0.29110149 0.010612251 -0.29110149
		 0.099366292 -0.22816324 0.010612251 -0.22816324 0.18812025 -0.29110149 0.18812025
		 -0.22816324 0.099366292 -0.29110149 0.099366292 -0.29110149 0.18812025 -0.22816324
		 0.099366292 -0.22816324 0.27687418 -0.29110149 0.27687418 -0.22816324 0.18812025
		 -0.29110149 0.18812025 -0.29110149 0.27687418 -0.22816324 0.18812025 -0.22816324
		 0.3656283 -0.16522509 0.27687418 -0.16522509 0.3656283 -0.22816324 0.3656283 -0.22816324
		 0.27687418 -0.16522509 0.27687418 -0.22816324 -0.25564975 -0.22816324 -0.25564975
		 -0.16522509 -0.34440374 -0.22816324 -0.34440374 -0.22816324 -0.25564975 -0.16522509
		 -0.34440374 -0.16522509 -0.16689578 -0.16522509 -0.25564975 -0.16522509 -0.16689578
		 -0.22816324 -0.16689578 -0.22816324 -0.25564975 -0.16522509 -0.25564975 -0.22816324
		 -0.078141734 -0.16522509 -0.16689578 -0.16522509 -0.078141734 -0.22816324 -0.078141734
		 -0.22816324 -0.16689578 -0.16522509 -0.16689578 -0.22816324 0.010612251 -0.16522509
		 -0.078141734 -0.16522509 0.010612251 -0.22816324 0.010612251 -0.22816324 -0.078141734
		 -0.16522509 -0.078141734 -0.22816324 0.099366292 -0.16522509 0.010612251 -0.16522509
		 0.099366292 -0.22816324 0.099366292 -0.22816324 0.010612251 -0.16522509 0.010612251
		 -0.22816324 0.18812025 -0.16522509 0.099366292 -0.16522509 0.18812025 -0.22816324
		 0.18812025 -0.22816324 0.099366292 -0.16522509 0.099366292 -0.22816324 0.27687418
		 -0.16522509 0.18812025 -0.16522509 0.27687418 -0.22816324 0.27687418 -0.22816324
		 0.18812025 -0.16522509 0.18812025 -0.22816324 0.3656283 -0.10228699 0.27687418 -0.10228699
		 0.3656283 -0.16522509 0.3656283 -0.16522509;
	setAttr ".uvtk[250:383]" 0.27687418 -0.10228699 0.27687418 -0.16522509 -0.25564975
		 -0.16522509 -0.25564975 -0.10228699 -0.34440374 -0.16522509 -0.34440374 -0.16522509
		 -0.25564975 -0.10228699 -0.34440374 -0.10228699 -0.16689578 -0.10228699 -0.25564975
		 -0.10228699 -0.16689578 -0.16522509 -0.16689578 -0.16522509 -0.25564975 -0.10228699
		 -0.25564975 -0.16522509 -0.078141734 -0.10228699 -0.16689578 -0.10228699 -0.078141734
		 -0.16522509 -0.078141734 -0.16522509 -0.16689578 -0.10228699 -0.16689578 -0.16522509
		 0.010612251 -0.10228699 -0.078141734 -0.10228699 0.010612251 -0.16522509 0.010612251
		 -0.16522509 -0.078141734 -0.10228699 -0.078141734 -0.16522509 0.099366292 -0.10228699
		 0.010612251 -0.10228699 0.099366292 -0.16522509 0.099366292 -0.16522509 0.010612251
		 -0.10228699 0.010612251 -0.16522509 0.18812025 -0.10228699 0.099366292 -0.10228699
		 0.18812025 -0.16522509 0.18812025 -0.16522509 0.099366292 -0.10228699 0.099366292
		 -0.16522509 0.27687418 -0.10228699 0.18812025 -0.10228699 0.27687418 -0.16522509
		 0.27687418 -0.16522509 0.18812025 -0.10228699 0.18812025 -0.16522509 0.3656283 -0.039348677
		 0.27687418 -0.039348677 0.3656283 -0.10228699 0.3656283 -0.10228699 0.27687418 -0.039348677
		 0.27687418 -0.10228699 -0.25564975 -0.10228699 -0.25564975 -0.039348677 -0.34440374
		 -0.10228699 -0.34440374 -0.10228699 -0.25564975 -0.039348677 -0.34440374 -0.039348677
		 -0.16689578 -0.039348677 -0.25564975 -0.039348677 -0.16689578 -0.10228699 -0.16689578
		 -0.10228699 -0.25564975 -0.039348677 -0.25564975 -0.10228699 -0.078141734 -0.039348677
		 -0.16689578 -0.039348677 -0.078141734 -0.10228699 -0.078141734 -0.10228699 -0.16689578
		 -0.039348677 -0.16689578 -0.10228699 0.010612251 -0.039348677 -0.078141734 -0.039348677
		 0.010612251 -0.10228699 0.010612251 -0.10228699 -0.078141734 -0.039348677 -0.078141734
		 -0.10228699 0.099366292 -0.039348677 0.010612251 -0.039348677 0.099366292 -0.10228699
		 0.099366292 -0.10228699 0.010612251 -0.039348677 0.010612251 -0.10228699 0.18812025
		 -0.039348677 0.099366292 -0.039348677 0.18812025 -0.10228699 0.18812025 -0.10228699
		 0.099366292 -0.039348677 0.099366292 -0.10228699 0.27687418 -0.039348677 0.18812025
		 -0.039348677 0.27687418 -0.10228699 0.27687418 -0.10228699 0.18812025 -0.039348677
		 0.18812025 -0.10228699 0.27687418 -0.039348677 0.3656283 -0.039348677 0.27687418
		 0.023589522 0.27687418 0.023589522 0.3656283 -0.039348677 0.3656283 0.023589522 0.18812025
		 -0.039348677 0.27687418 -0.039348677 0.18812025 0.023589522 0.18812025 0.023589522
		 0.27687418 -0.039348677 0.27687418 0.023589522 0.099366292 -0.039348677 0.18812025
		 -0.039348677 0.099366292 0.023589522 0.099366292 0.023589522 0.18812025 -0.039348677
		 0.18812025 0.023589522 0.010612251 -0.039348677 0.099366292 -0.039348677 0.010612251
		 0.023589522 0.010612251 0.023589522 0.099366292 -0.039348677 0.099366292 0.023589522
		 -0.078141734 -0.039348677 0.010612251 -0.039348677 -0.078141734 0.023589522 -0.078141734
		 0.023589522 0.010612251 -0.039348677 0.010612251 0.023589522 -0.16689578 -0.039348677
		 -0.078141734 -0.039348677 -0.16689578 0.023589522 -0.16689578 0.023589522 -0.078141734
		 -0.039348677 -0.078141734 0.023589522 -0.25564975 -0.039348677 -0.16689578 -0.039348677
		 -0.25564975 0.023589522 -0.25564975 0.023589522 -0.16689578 -0.039348677 -0.16689578
		 0.023589522;
createNode polyChipOff -n "polyChipOff2";
	setAttr ".ics" -type "componentList" 1 "f[110:173]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".rs" 278627331;
	setAttr ".dup" no;
createNode polySeparate -n "polySeparate2";
	setAttr ".ic" 2;
	setAttr -s 2 ".out";
createNode polyAutoProj -n "polyAutoProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:63]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".s" -type "double3" 100 100 100 ;
	setAttr ".ps" 0.20000000298023224;
	setAttr ".dl" yes;
createNode lambert -n "under_ground";
createNode shadingEngine -n "lambert4SG";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 7 ".gn";
createNode materialInfo -n "materialInfo3";
createNode file -n "file3";
createNode place2dTexture -n "place2dTexture3";
createNode file -n "file4";
createNode place2dTexture -n "place2dTexture4";
createNode file -n "file5";
createNode place2dTexture -n "place2dTexture5";
createNode file -n "file6";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/underground1.png";
createNode place2dTexture -n "place2dTexture6";
createNode file -n "file7";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/underground1.png";
createNode place2dTexture -n "place2dTexture7";
createNode polyPlanarProj -n "polyPlanarProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:109]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" 0 7.5530319213867188 0 ;
	setAttr ".ro" -type "double3" 0 90 0 ;
	setAttr ".ps" -type "double2" 100 90.486328125 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyPlanarProj -n "polyPlanarProj2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "f[20:28]" "f[106:107]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" 50 -17.459802627563477 0 ;
	setAttr ".ro" -type "double3" 0 90 0 ;
	setAttr ".ps" -type "double2" 100 40.460659027099609 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyTweakUV -n "polyTweakUV6";
	setAttr ".uopa" yes;
	setAttr -s 85 ".uvtk[0:84]" -type "float2" 1.45813084 0.010884345 1.45813084
		 0.010884345 1.45813084 -0.010884345 1.45813084 -0.010563612 1.45813084 -0.0092557073
		 1.45813084 -0.0073515177 1.45813084 -0.0051887035 1.45813084 -0.0030519962 1.45813084
		 -0.001173079 1.45813084 0.00026962161 1.45813084 0.0011505485 1.45813084 0.0011505485
		 1.45813084 0.010884345 1.45813084 0.00026962161 1.45813084 -0.001173079 1.45813084
		 -0.0030519962 1.45813084 -0.0051887035 1.45813084 -0.010884345 1.45813084 -0.010563612
		 1.45813084 -0.0092557073 1.45813084 -0.0073515177 1.45813084 0.010884345 1.45813084
		 0.010884345 1.45813084 0.010884345 1.45813084 0.010884345 1.45813084 0.010884345
		 1.45813084 0.0011505485 1.45813084 0.0011505485 1.45813084 0.0011505485 1.45813084
		 0.0011505485 1.45813084 0.0011505485 1.45813072 0.0011505485 1.45813084 0.0011505485
		 1.45813084 -0.010884345 1.45813072 -0.010884345 1.45813084 -0.010884345 1.45813084
		 -0.010884345 1.45813084 -0.010884345 1.45813084 -0.010884345 1.45813084 -0.010884345
		 1.45813084 -0.010884345 1.45813084 -0.010884345 1.45813084 -0.010563612 1.45813084
		 0.00026962161 1.45813084 0.0011505485 1.45813084 0.0011505485 1.45813084 -0.010884345
		 1.45813084 -0.010884345 1.45813084 -0.010563612 1.45813084 -0.0092557073 1.45813084
		 -0.0073515177 1.45813084 -0.0051887035 1.45813084 -0.0030519962 1.45813084 -0.001173079
		 1.45813084 0.0011505485 1.45813084 -0.010884345 1.45813084 0.0011505485 1.45813084
		 -0.010884345 1.45813084 0.0011505485 1.45813084 -0.010884345 1.45813084 0.0011505485
		 1.45813084 -0.010884345 1.45813072 0.0011505485 1.45813072 -0.010884345 1.45813084
		 0.0011505485 1.45813084 0.0011505485 1.45813084 0.00026962161 1.45813084 -0.001173079
		 1.45813084 -0.0030519962 1.45813084 -0.0051887035 1.45813084 -0.0073515177 1.45813084
		 -0.0092557073 1.45813084 0.010884345 1.45813084 0.010884345 1.45813084 -0.010884345
		 1.45813084 -0.010884345 1.45813084 -0.010884345 1.45813084 -0.010884345 1.45813084
		 -0.010884345 1.45813084 -0.010884345 1.45813072 -0.010884345 1.45813084 -0.010884345
		 1.45813084 -0.010884345 1.45813084 0.010884345 1.45813084 0.010884345;
createNode polyMapCut -n "polyMapCut4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 4 "e[2:3]" "e[9:10]" "e[13]" "e[131]";
createNode polyTweakUV -n "polyTweakUV7";
	setAttr ".uopa" yes;
	setAttr -s 89 ".uvtk[0:88]" -type "float2" -0.25652307 0 -0.25652307
		 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307
		 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652295 0 -0.25652295 0 -0.25652295
		 0 -0.25652295 0 -0.25652295 0 -0.25652295 0 -0.25652295 0 -0.25652295 0 -0.25652295
		 0 -0.25652295 0 -0.25652295 0 -0.25652295 0 -0.25652295 0 -0.25652307 0 -0.25652307
		 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307
		 0 -0.25652295 0 -0.25652295 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307
		 0 -0.25652307 0 -0.25652307 0 -0.25652295 0 -0.25652295 0 -0.25652295 0 -0.25652307
		 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307
		 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307
		 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307
		 0 -0.25652307 0 -0.25652307 0 -0.25652295 0 -0.25652295 0 -0.25652295 0 -0.25652295
		 0 -0.25652295 0 -0.25652295 0 -0.25652295 0 -0.25652295 0 -0.25652307 0 -0.25652295
		 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307 0 -0.25652307
		 0 -0.25652307 0 -0.25652295 0 -0.25652295 0 -0.25652295 0 -0.25652307 0 -0.25652295
		 0 -0.25652295 0 -0.25652307 0 -0.25652307 0;
createNode polyPlanarProj -n "polyPlanarProj3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "f[0:8]" "f[108:109]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" 0 7.5530319213867188 50 ;
	setAttr ".ro" -type "double3" 0 90 0 ;
	setAttr ".ps" -type "double2" 0 90.486328125 ;
	setAttr ".cam" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
createNode polyTweakUV -n "polyTweakUV8";
	setAttr ".uopa" yes;
	setAttr -s 72 ".uvtk[0:71]" -type "float2" -3.0019919872 -2.38433027
		 -2.50199199 -2.29895973 -3.074381113 -1.78433037 -2.57438111 -1.69895983 -2.0019919872
		 -2.21358919 -2.074381351 -1.61358929 -1.50199199 -2.12821865 -1.57438123 -1.52821875
		 -1.0019919872 -2.04284811 -1.074381232 -1.44284809 -0.50199205 -1.95747769 -0.57438117
		 -1.35747755 -0.0019920387 -1.87210703 -0.074381188 -1.27210701 0.49800795 -1.78673649
		 0.42561883 -1.18673646 0.99800801 -1.70136595 0.92561883 -1.10136592 0.33573952 -1.34895992
		 0.84484541 -1.43433046 0.40812868 -0.7489599 0.91723454 -0.83433044 -0.12900063 -0.66358936
		 -0.20138977 -1.26358938 -0.68305886 -0.57821882 -0.75544804 -1.17821884 -1.24445808
		 -0.49284822 -1.31684721 -1.092848182 -1.8051163 -0.40747768 -1.87750542 -1.0074776411
		 -2.35845828 -0.32210711 -2.43084741 -0.9221071 -2.89941478 -0.23673655 -2.9718039
		 -0.83673656 -3.42442298 -0.151366 -3.49681211 -0.75136602 -3.50425696 0.030453384
		 -3.57664609 0.97824317 -3.029265165 -0.054917142 -3.10165429 0.89287263 -2.57022166
		 -0.1402877 -2.64261079 0.80750209 -2.12356353 -0.22565827 -2.19595289 0.72213137
		 -1.68422186 -0.31102884 -1.75661099 0.63676083 -1.24562097 -0.39639938 -1.31801021
		 0.55139029 -0.79967928 -0.48176992 -0.87206841 0.46601975 -0.33674368 -0.56714052
		 -0.40913287 0.38064915 0.15415046 -0.65251106 0.081761271 0.29527855 0.074381351
		 -0.40793002 -0.42561865 -0.3225593 0.0019920468 0.30212688 -0.49800795 0.38749725
		 -0.92561865 -0.23718894 -0.99800795 0.47286797 -1.42561865 -0.15181839 -1.49800801
		 0.55823851 -1.92561865 -0.066447854 -1.99800801 0.64360905 -2.42561865 0.018922716
		 -2.49800801 0.72897959 -2.92561865 0.10429353 -2.99800801 0.81435031 -3.42561865
		 0.18966408 -3.49800801 0.89972085 -3.92561865 0.27503464 -3.99800801 0.98509127;
createNode polyCylProj -n "polyCylProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "f[0:37]" "f[102:109]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" 0 7.5530319213867188 0 ;
	setAttr ".ps" -type "double2" 180 90.486328125 ;
	setAttr ".r" 100;
createNode polyUnite -n "polyUnite1";
	setAttr -s 3 ".ip";
	setAttr -s 3 ".im";
createNode groupId -n "groupId10";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts9";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:109]";
createNode groupId -n "groupId11";
	setAttr ".ihi" 0;
createNode groupId -n "groupId12";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts10";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:63]";
createNode groupId -n "groupId13";
	setAttr ".ihi" 0;
createNode groupId -n "groupId14";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts11";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:109]";
createNode groupId -n "groupId15";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts12";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[110:173]";
createNode groupId -n "groupId16";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts13";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[174:301]";
createNode polySeparate -n "polySeparate3";
	setAttr ".ic" 3;
	setAttr -s 3 ".out";
createNode groupId -n "groupId17";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts14";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:109]";
createNode groupId -n "groupId18";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts15";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:63]";
createNode groupId -n "groupId19";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts16";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:127]";
createNode polyTweakUV -n "polyTweakUV9";
	setAttr ".uopa" yes;
	setAttr -s 384 ".uvtk";
	setAttr ".uvtk[0:249]" -type "float2" -0.63410658 -0.033241026 -0.50051069
		 -0.033241026 -0.63410658 -0.033241026 -0.63410658 -0.033241026 -0.50051069 -0.033241026
		 -0.50051069 -0.033241026 0.30106425 -0.033241034 0.30106425 -0.033241034 0.43466032
		 -0.033241034 0.43466032 -0.033241034 0.30106425 -0.033241034 0.43466032 -0.033241034
		 -0.50051069 -0.033241034 -0.50051069 -0.033241034 -0.63410658 -0.033241034 -0.63410658
		 -0.033241034 -0.50051069 -0.033241034 -0.63410658 -0.033241034 -0.3669149 -0.033241034
		 -0.3669149 -0.033241034 -0.50051069 -0.033241034 -0.50051069 -0.033241034 -0.3669149
		 -0.033241034 -0.50051069 -0.033241034 -0.23331898 -0.033241034 -0.23331898 -0.033241034
		 -0.3669149 -0.033241034 -0.3669149 -0.033241034 -0.23331898 -0.033241034 -0.3669149
		 -0.033241034 -0.099723168 -0.033241034 -0.099723168 -0.033241034 -0.23331898 -0.033241034
		 -0.23331898 -0.033241034 -0.099723168 -0.033241034 -0.23331898 -0.033241034 0.033872791
		 -0.033241034 0.033872791 -0.033241034 -0.099723168 -0.033241034 -0.099723168 -0.033241034
		 0.033872791 -0.033241034 -0.099723168 -0.033241034 0.16746858 -0.033241034 0.16746858
		 -0.033241034 0.033872791 -0.033241034 0.033872791 -0.033241034 0.16746858 -0.033241034
		 0.033872791 -0.033241034 0.30106425 -0.033241034 0.30106425 -0.033241034 0.16746858
		 -0.033241034 0.16746858 -0.033241034 0.30106425 -0.033241034 0.16746858 -0.033241034
		 0.30106425 -0.033241041 0.30106425 -0.033241034 0.43466032 -0.033241041 0.43466032
		 -0.033241041 0.30106425 -0.033241034 0.43466032 -0.033241034 -0.50051069 -0.033241034
		 -0.50051069 -0.033241041 -0.63410658 -0.033241034 -0.63410658 -0.033241034 -0.50051069
		 -0.033241041 -0.63410658 -0.033241041 -0.3669149 -0.033241034 -0.3669149 -0.033241041
		 -0.50051069 -0.033241034 -0.50051069 -0.033241034 -0.3669149 -0.033241041 -0.50051069
		 -0.033241041 -0.23331898 -0.033241034 -0.23331898 -0.033241041 -0.3669149 -0.033241034
		 -0.3669149 -0.033241034 -0.23331898 -0.033241041 -0.3669149 -0.033241041 -0.099723168
		 -0.033241034 -0.099723168 -0.033241041 -0.23331898 -0.033241034 -0.23331898 -0.033241034
		 -0.099723168 -0.033241041 -0.23331898 -0.033241041 0.033872791 -0.033241034 0.033872791
		 -0.033241041 -0.099723168 -0.033241034 -0.099723168 -0.033241034 0.033872791 -0.033241041
		 -0.099723168 -0.033241041 0.16746858 -0.033241034 0.16746858 -0.033241041 0.033872791
		 -0.033241034 0.033872791 -0.033241034 0.16746858 -0.033241041 0.033872791 -0.033241041
		 0.30106425 -0.033241034 0.30106425 -0.033241041 0.16746858 -0.033241034 0.16746858
		 -0.033241034 0.30106425 -0.033241041 0.16746858 -0.033241041 0.30106425 -0.033241026
		 0.30106425 -0.033241041 0.43466032 -0.033241026 0.43466032 -0.033241026 0.30106425
		 -0.033241041 0.43466032 -0.033241041 -0.50051069 -0.033241026 -0.63410658 -0.033241026
		 -0.50051069 -0.033241041 -0.50051069 -0.033241041 -0.63410658 -0.033241026 -0.63410658
		 -0.033241041 -0.3669149 -0.033241041 -0.3669149 -0.033241026 -0.50051069 -0.033241041
		 -0.50051069 -0.033241041 -0.3669149 -0.033241026 -0.50051069 -0.033241026 -0.23331898
		 -0.033241041 -0.23331898 -0.033241026 -0.3669149 -0.033241041 -0.3669149 -0.033241041
		 -0.23331898 -0.033241026 -0.3669149 -0.033241026 -0.099723168 -0.033241041 -0.099723168
		 -0.033241026 -0.23331898 -0.033241041 -0.23331898 -0.033241041 -0.099723168 -0.033241026
		 -0.23331898 -0.033241026 0.033872791 -0.033241041 0.033872791 -0.033241026 -0.099723168
		 -0.033241041 -0.099723168 -0.033241041 0.033872791 -0.033241026 -0.099723168 -0.033241026
		 0.16746858 -0.033241041 0.16746858 -0.033241026 0.033872791 -0.033241041 0.033872791
		 -0.033241041 0.16746858 -0.033241026 0.033872791 -0.033241026 0.30106425 -0.033241041
		 0.30106425 -0.033241026 0.16746858 -0.033241041 0.16746858 -0.033241041 0.30106425
		 -0.033241026 0.16746858 -0.033241026 0.30106425 -0.033241026 0.30106425 -0.033241026
		 0.43466032 -0.033241026 0.43466032 -0.033241026 0.30106425 -0.033241026 0.43466032
		 -0.033241026 -0.50051069 -0.033241026 -0.50051069 -0.033241026 -0.63410658 -0.033241026
		 -0.63410658 -0.033241026 -0.50051069 -0.033241026 -0.63410658 -0.033241026 -0.3669149
		 -0.033241026 -0.3669149 -0.033241026 -0.50051069 -0.033241026 -0.50051069 -0.033241026
		 -0.3669149 -0.033241026 -0.50051069 -0.033241026 -0.23331898 -0.033241026 -0.23331898
		 -0.033241026 -0.3669149 -0.033241026 -0.3669149 -0.033241026 -0.23331898 -0.033241026
		 -0.3669149 -0.033241026 -0.099723168 -0.033241026 -0.099723168 -0.033241026 -0.23331898
		 -0.033241026 -0.23331898 -0.033241026 -0.099723168 -0.033241026 -0.23331898 -0.033241026
		 0.033872791 -0.033241026 0.033872791 -0.033241026 -0.099723168 -0.033241026 -0.099723168
		 -0.033241026 0.033872791 -0.033241026 -0.099723168 -0.033241026 0.16746858 -0.033241026
		 0.16746858 -0.033241026 0.033872791 -0.033241026 0.033872791 -0.033241026 0.16746858
		 -0.033241026 0.033872791 -0.033241026 0.30106425 -0.033241026 0.30106425 -0.033241026
		 0.16746858 -0.033241026 0.16746858 -0.033241026 0.30106425 -0.033241026 0.16746858
		 -0.033241026 0.43466032 -0.033241026 0.30106425 -0.033241026 0.43466032 -0.033241026
		 0.43466032 -0.033241026 0.30106425 -0.033241026 0.30106425 -0.033241026 -0.50051069
		 -0.033241026 -0.50051069 -0.033241026 -0.63410658 -0.033241026 -0.63410658 -0.033241026
		 -0.50051069 -0.033241026 -0.63410658 -0.033241026 -0.3669149 -0.033241026 -0.50051069
		 -0.033241026 -0.3669149 -0.033241026 -0.3669149 -0.033241026 -0.50051069 -0.033241026
		 -0.50051069 -0.033241026 -0.23331898 -0.033241026 -0.3669149 -0.033241026 -0.23331898
		 -0.033241026 -0.23331898 -0.033241026 -0.3669149 -0.033241026 -0.3669149 -0.033241026
		 -0.099723168 -0.033241026 -0.23331898 -0.033241026 -0.099723168 -0.033241026 -0.099723168
		 -0.033241026 -0.23331898 -0.033241026 -0.23331898 -0.033241026 0.033872791 -0.033241026
		 -0.099723168 -0.033241026 0.033872791 -0.033241026 0.033872791 -0.033241026 -0.099723168
		 -0.033241026 -0.099723168 -0.033241026 0.16746858 -0.033241026 0.033872791 -0.033241026
		 0.16746858 -0.033241026 0.16746858 -0.033241026 0.033872791 -0.033241026 0.033872791
		 -0.033241026 0.30106425 -0.033241026 0.16746858 -0.033241026 0.30106425 -0.033241026
		 0.30106425 -0.033241026 0.16746858 -0.033241026 0.16746858 -0.033241026 0.43466032
		 -0.033241026 0.30106425 -0.033241026 0.43466032 -0.033241026 0.43466032 -0.033241026;
	setAttr ".uvtk[250:383]" 0.30106425 -0.033241026 0.30106425 -0.033241026 -0.50051069
		 -0.033241026 -0.50051069 -0.033241026 -0.63410658 -0.033241026 -0.63410658 -0.033241026
		 -0.50051069 -0.033241026 -0.63410658 -0.033241026 -0.3669149 -0.033241026 -0.50051069
		 -0.033241026 -0.3669149 -0.033241026 -0.3669149 -0.033241026 -0.50051069 -0.033241026
		 -0.50051069 -0.033241026 -0.23331898 -0.033241026 -0.3669149 -0.033241026 -0.23331898
		 -0.033241026 -0.23331898 -0.033241026 -0.3669149 -0.033241026 -0.3669149 -0.033241026
		 -0.099723168 -0.033241026 -0.23331898 -0.033241026 -0.099723168 -0.033241026 -0.099723168
		 -0.033241026 -0.23331898 -0.033241026 -0.23331898 -0.033241026 0.033872791 -0.033241026
		 -0.099723168 -0.033241026 0.033872791 -0.033241026 0.033872791 -0.033241026 -0.099723168
		 -0.033241026 -0.099723168 -0.033241026 0.16746858 -0.033241026 0.033872791 -0.033241026
		 0.16746858 -0.033241026 0.16746858 -0.033241026 0.033872791 -0.033241026 0.033872791
		 -0.033241026 0.30106425 -0.033241026 0.16746858 -0.033241026 0.30106425 -0.033241026
		 0.30106425 -0.033241026 0.16746858 -0.033241026 0.16746858 -0.033241026 0.43466032
		 -0.033241026 0.30106425 -0.033241026 0.43466032 -0.033241026 0.43466032 -0.033241026
		 0.30106425 -0.033241026 0.30106425 -0.033241026 -0.50051069 -0.033241026 -0.50051069
		 -0.033241026 -0.63410658 -0.033241026 -0.63410658 -0.033241026 -0.50051069 -0.033241026
		 -0.63410658 -0.033241026 -0.3669149 -0.033241026 -0.50051069 -0.033241026 -0.3669149
		 -0.033241026 -0.3669149 -0.033241026 -0.50051069 -0.033241026 -0.50051069 -0.033241026
		 -0.23331898 -0.033241026 -0.3669149 -0.033241026 -0.23331898 -0.033241026 -0.23331898
		 -0.033241026 -0.3669149 -0.033241026 -0.3669149 -0.033241026 -0.099723168 -0.033241026
		 -0.23331898 -0.033241026 -0.099723168 -0.033241026 -0.099723168 -0.033241026 -0.23331898
		 -0.033241026 -0.23331898 -0.033241026 0.033872791 -0.033241026 -0.099723168 -0.033241026
		 0.033872791 -0.033241026 0.033872791 -0.033241026 -0.099723168 -0.033241026 -0.099723168
		 -0.033241026 0.16746858 -0.033241026 0.033872791 -0.033241026 0.16746858 -0.033241026
		 0.16746858 -0.033241026 0.033872791 -0.033241026 0.033872791 -0.033241026 0.30106425
		 -0.033241026 0.16746858 -0.033241026 0.30106425 -0.033241026 0.30106425 -0.033241026
		 0.16746858 -0.033241026 0.16746858 -0.033241026 0.30106425 -0.033241026 0.43466032
		 -0.033241026 0.30106425 -0.033241026 0.30106425 -0.033241026 0.43466032 -0.033241026
		 0.43466032 -0.033241026 0.16746858 -0.033241026 0.30106425 -0.033241026 0.16746858
		 -0.033241026 0.16746858 -0.033241026 0.30106425 -0.033241026 0.30106425 -0.033241026
		 0.033872791 -0.033241026 0.16746858 -0.033241026 0.033872791 -0.033241026 0.033872791
		 -0.033241026 0.16746858 -0.033241026 0.16746858 -0.033241026 -0.099723168 -0.033241026
		 0.033872791 -0.033241026 -0.099723168 -0.033241026 -0.099723168 -0.033241026 0.033872791
		 -0.033241026 0.033872791 -0.033241026 -0.23331898 -0.033241026 -0.099723168 -0.033241026
		 -0.23331898 -0.033241026 -0.23331898 -0.033241026 -0.099723168 -0.033241026 -0.099723168
		 -0.033241026 -0.3669149 -0.033241026 -0.23331898 -0.033241026 -0.3669149 -0.033241026
		 -0.3669149 -0.033241026 -0.23331898 -0.033241026 -0.23331898 -0.033241026 -0.50051069
		 -0.033241026 -0.3669149 -0.033241026 -0.50051069 -0.033241026 -0.50051069 -0.033241026
		 -0.3669149 -0.033241026 -0.3669149 -0.033241026;
createNode polyUnite -n "polyUnite2";
	setAttr -s 3 ".ip";
	setAttr -s 3 ".im";
createNode groupId -n "groupId20";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts17";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:109]";
createNode groupId -n "groupId21";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts18";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[110:173]";
createNode groupId -n "groupId22";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts19";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[174:301]";
createNode polySeparate -n "polySeparate4";
	setAttr ".ic" 3;
	setAttr -s 3 ".out";
createNode groupId -n "groupId23";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts20";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 110 "f[0]" "f[1]" "f[2]" "f[3]" "f[4]" "f[5]" "f[6]" "f[7]" "f[8]" "f[9]" "f[10]" "f[11]" "f[12]" "f[13]" "f[14]" "f[15]" "f[16]" "f[17]" "f[18]" "f[19]" "f[20]" "f[21]" "f[22]" "f[23]" "f[24]" "f[25]" "f[26]" "f[27]" "f[28]" "f[29]" "f[30]" "f[31]" "f[32]" "f[33]" "f[34]" "f[35]" "f[36]" "f[37]" "f[38]" "f[39]" "f[40]" "f[41]" "f[42]" "f[43]" "f[44]" "f[45]" "f[46]" "f[47]" "f[48]" "f[49]" "f[50]" "f[51]" "f[52]" "f[53]" "f[54]" "f[55]" "f[56]" "f[57]" "f[58]" "f[59]" "f[60]" "f[61]" "f[62]" "f[63]" "f[64]" "f[65]" "f[66]" "f[67]" "f[68]" "f[69]" "f[70]" "f[71]" "f[72]" "f[73]" "f[74]" "f[75]" "f[76]" "f[77]" "f[78]" "f[79]" "f[80]" "f[81]" "f[82]" "f[83]" "f[84]" "f[85]" "f[86]" "f[87]" "f[88]" "f[89]" "f[90]" "f[91]" "f[92]" "f[93]" "f[94]" "f[95]" "f[96]" "f[97]" "f[98]" "f[99]" "f[100]" "f[101]" "f[102]" "f[103]" "f[104]" "f[105]" "f[106]" "f[107]" "f[108]" "f[109]";
createNode groupId -n "groupId24";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts21";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 64 "f[0]" "f[1]" "f[2]" "f[3]" "f[4]" "f[5]" "f[6]" "f[7]" "f[8]" "f[9]" "f[10]" "f[11]" "f[12]" "f[13]" "f[14]" "f[15]" "f[16]" "f[17]" "f[18]" "f[19]" "f[20]" "f[21]" "f[22]" "f[23]" "f[24]" "f[25]" "f[26]" "f[27]" "f[28]" "f[29]" "f[30]" "f[31]" "f[32]" "f[33]" "f[34]" "f[35]" "f[36]" "f[37]" "f[38]" "f[39]" "f[40]" "f[41]" "f[42]" "f[43]" "f[44]" "f[45]" "f[46]" "f[47]" "f[48]" "f[49]" "f[50]" "f[51]" "f[52]" "f[53]" "f[54]" "f[55]" "f[56]" "f[57]" "f[58]" "f[59]" "f[60]" "f[61]" "f[62]" "f[63]";
createNode groupId -n "groupId25";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts22";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 128 "f[0]" "f[1]" "f[2]" "f[3]" "f[4]" "f[5]" "f[6]" "f[7]" "f[8]" "f[9]" "f[10]" "f[11]" "f[12]" "f[13]" "f[14]" "f[15]" "f[16]" "f[17]" "f[18]" "f[19]" "f[20]" "f[21]" "f[22]" "f[23]" "f[24]" "f[25]" "f[26]" "f[27]" "f[28]" "f[29]" "f[30]" "f[31]" "f[32]" "f[33]" "f[34]" "f[35]" "f[36]" "f[37]" "f[38]" "f[39]" "f[40]" "f[41]" "f[42]" "f[43]" "f[44]" "f[45]" "f[46]" "f[47]" "f[48]" "f[49]" "f[50]" "f[51]" "f[52]" "f[53]" "f[54]" "f[55]" "f[56]" "f[57]" "f[58]" "f[59]" "f[60]" "f[61]" "f[62]" "f[63]" "f[64]" "f[65]" "f[66]" "f[67]" "f[68]" "f[69]" "f[70]" "f[71]" "f[72]" "f[73]" "f[74]" "f[75]" "f[76]" "f[77]" "f[78]" "f[79]" "f[80]" "f[81]" "f[82]" "f[83]" "f[84]" "f[85]" "f[86]" "f[87]" "f[88]" "f[89]" "f[90]" "f[91]" "f[92]" "f[93]" "f[94]" "f[95]" "f[96]" "f[97]" "f[98]" "f[99]" "f[100]" "f[101]" "f[102]" "f[103]" "f[104]" "f[105]" "f[106]" "f[107]" "f[108]" "f[109]" "f[110]" "f[111]" "f[112]" "f[113]" "f[114]" "f[115]" "f[116]" "f[117]" "f[118]" "f[119]" "f[120]" "f[121]" "f[122]" "f[123]" "f[124]" "f[125]" "f[126]" "f[127]";
createNode polyTweakUV -n "polyTweakUV10";
	setAttr ".uopa" yes;
	setAttr -s 384 ".uvtk";
	setAttr ".uvtk[0:249]" -type "float2" 0.0408317 0.087840088 0.04083164 0.087840088
		 0.0408317 0.025735036 0.0408317 0.025735036 0.04083164 0.087840088 0.04083164 0.025735036
		 0.04083164 0.46047032 0.04083164 0.52257526 0.040831521 0.46047032 0.040831521 0.46047032
		 0.04083164 0.52257526 0.040831521 0.52257526 0.04083164 0.52257526 0.04083164 0.46047032
		 0.0408317 0.52257526 0.0408317 0.52257526 0.04083164 0.46047032 0.0408317 0.46047032
		 0.040831625 0.52257526 0.040831625 0.46047032 0.04083164 0.52257526 0.04083164 0.52257526
		 0.040831625 0.46047032 0.04083164 0.46047032 0.040831625 0.52257526 0.040831625 0.46047032
		 0.040831625 0.52257526 0.040831625 0.52257526 0.040831625 0.46047032 0.040831625
		 0.46047032 0.040831611 0.52257526 0.040831611 0.46047032 0.040831625 0.52257526 0.040831625
		 0.52257526 0.040831611 0.46047032 0.040831625 0.46047032 0.04083164 0.52257526 0.04083164
		 0.46047032 0.040831611 0.52257526 0.040831611 0.52257526 0.04083164 0.46047032 0.040831611
		 0.46047032 0.04083164 0.52257526 0.04083164 0.46047032 0.04083164 0.52257526 0.04083164
		 0.52257526 0.04083164 0.46047032 0.04083164 0.46047032 0.04083164 0.52257526 0.04083164
		 0.46047032 0.04083164 0.52257526 0.04083164 0.52257526 0.04083164 0.46047032 0.04083164
		 0.46047032 0.04083164 0.39836517 0.04083164 0.46047032 0.040831521 0.39836517 0.040831521
		 0.39836517 0.04083164 0.46047032 0.040831521 0.46047032 0.04083164 0.46047032 0.04083164
		 0.39836517 0.0408317 0.46047032 0.0408317 0.46047032 0.04083164 0.39836517 0.0408317
		 0.39836517 0.040831625 0.46047032 0.040831625 0.39836517 0.04083164 0.46047032 0.04083164
		 0.46047032 0.040831625 0.39836517 0.04083164 0.39836517 0.040831625 0.46047032 0.040831625
		 0.39836517 0.040831625 0.46047032 0.040831625 0.46047032 0.040831625 0.39836517 0.040831625
		 0.39836517 0.040831611 0.46047032 0.040831611 0.39836517 0.040831625 0.46047032 0.040831625
		 0.46047032 0.040831611 0.39836517 0.040831625 0.39836517 0.04083164 0.46047032 0.04083164
		 0.39836517 0.040831611 0.46047032 0.040831611 0.46047032 0.04083164 0.39836517 0.040831611
		 0.39836517 0.04083164 0.46047032 0.04083164 0.39836517 0.04083164 0.46047032 0.04083164
		 0.46047032 0.04083164 0.39836517 0.04083164 0.39836517 0.04083164 0.46047032 0.04083164
		 0.39836517 0.04083164 0.46047032 0.04083164 0.46047032 0.04083164 0.39836517 0.04083164
		 0.39836517 0.04083164 0.33626026 0.04083164 0.39836517 0.040831521 0.33626026 0.040831521
		 0.33626026 0.04083164 0.39836517 0.040831521 0.39836517 0.04083164 0.33626026 0.0408317
		 0.33626026 0.04083164 0.39836517 0.04083164 0.39836517 0.0408317 0.33626026 0.0408317
		 0.39836517 0.040831625 0.39836517 0.040831625 0.33626026 0.04083164 0.39836517 0.04083164
		 0.39836517 0.040831625 0.33626026 0.04083164 0.33626026 0.040831625 0.39836517 0.040831625
		 0.33626026 0.040831625 0.39836517 0.040831625 0.39836517 0.040831625 0.33626026 0.040831625
		 0.33626026 0.040831611 0.39836517 0.040831611 0.33626026 0.040831625 0.39836517 0.040831625
		 0.39836517 0.040831611 0.33626026 0.040831625 0.33626026 0.04083164 0.39836517 0.04083164
		 0.33626026 0.040831611 0.39836517 0.040831611 0.39836517 0.04083164 0.33626026 0.040831611
		 0.33626026 0.04083164 0.39836517 0.04083164 0.33626026 0.04083164 0.39836517 0.04083164
		 0.39836517 0.04083164 0.33626026 0.04083164 0.33626026 0.04083164 0.39836517 0.04083164
		 0.33626026 0.04083164 0.39836517 0.04083164 0.39836517 0.04083164 0.33626026 0.04083164
		 0.33626026 0.04083164 0.27415517 0.04083164 0.33626026 0.040831521 0.27415517 0.040831521
		 0.27415517 0.04083164 0.33626026 0.040831521 0.33626026 0.04083164 0.33626026 0.04083164
		 0.27415517 0.0408317 0.33626026 0.0408317 0.33626026 0.04083164 0.27415517 0.0408317
		 0.27415517 0.040831625 0.33626026 0.040831625 0.27415517 0.04083164 0.33626026 0.04083164
		 0.33626026 0.040831625 0.27415517 0.04083164 0.27415517 0.040831625 0.33626026 0.040831625
		 0.27415517 0.040831625 0.33626026 0.040831625 0.33626026 0.040831625 0.27415517 0.040831625
		 0.27415517 0.040831611 0.33626026 0.040831611 0.27415517 0.040831625 0.33626026 0.040831625
		 0.33626026 0.040831611 0.27415517 0.040831625 0.27415517 0.04083164 0.33626026 0.04083164
		 0.27415517 0.040831611 0.33626026 0.040831611 0.33626026 0.04083164 0.27415517 0.040831611
		 0.27415517 0.04083164 0.33626026 0.04083164 0.27415517 0.04083164 0.33626026 0.04083164
		 0.33626026 0.04083164 0.27415517 0.04083164 0.27415517 0.04083164 0.33626026 0.04083164
		 0.27415517 0.04083164 0.33626026 0.04083164 0.33626026 0.04083164 0.27415517 0.04083164
		 0.27415517 0.040831521 0.21205017 0.04083164 0.21205017 0.040831521 0.27415517 0.040831521
		 0.27415517 0.04083164 0.21205017 0.04083164 0.27415517 0.04083164 0.27415517 0.04083164
		 0.21205017 0.0408317 0.27415517 0.0408317 0.27415517 0.04083164 0.21205017 0.0408317
		 0.21205017 0.040831625 0.21205017 0.04083164 0.21205017 0.040831625 0.27415517 0.040831625
		 0.27415517 0.04083164 0.21205017 0.04083164 0.27415517 0.040831625 0.21205017 0.040831625
		 0.21205017 0.040831625 0.27415517 0.040831625 0.27415517 0.040831625 0.21205017 0.040831625
		 0.27415517 0.040831611 0.21205017 0.040831625 0.21205017 0.040831611 0.27415517 0.040831611
		 0.27415517 0.040831625 0.21205017 0.040831625 0.27415517 0.04083164 0.21205017 0.040831611
		 0.21205017 0.04083164 0.27415517 0.04083164 0.27415517 0.040831611 0.21205017 0.040831611
		 0.27415517 0.04083164 0.21205017 0.04083164 0.21205017 0.04083164 0.27415517 0.04083164
		 0.27415517 0.04083164 0.21205017 0.04083164 0.27415517 0.04083164 0.21205017 0.04083164
		 0.21205017 0.04083164 0.27415517 0.04083164 0.27415517 0.04083164 0.21205017 0.04083164
		 0.27415517 0.040831521 0.14994511 0.04083164 0.14994511 0.040831521 0.21205017 0.040831521
		 0.21205017;
	setAttr ".uvtk[250:383]" 0.04083164 0.14994511 0.04083164 0.21205017 0.04083164
		 0.21205017 0.04083164 0.14994511 0.0408317 0.21205017 0.0408317 0.21205017 0.04083164
		 0.14994511 0.0408317 0.14994511 0.040831625 0.14994511 0.04083164 0.14994511 0.040831625
		 0.21205017 0.040831625 0.21205017 0.04083164 0.14994511 0.04083164 0.21205017 0.040831625
		 0.14994511 0.040831625 0.14994511 0.040831625 0.21205017 0.040831625 0.21205017 0.040831625
		 0.14994511 0.040831625 0.21205017 0.040831611 0.14994511 0.040831625 0.14994511 0.040831611
		 0.21205017 0.040831611 0.21205017 0.040831625 0.14994511 0.040831625 0.21205017 0.04083164
		 0.14994511 0.040831611 0.14994511 0.04083164 0.21205017 0.04083164 0.21205017 0.040831611
		 0.14994511 0.040831611 0.21205017 0.04083164 0.14994511 0.04083164 0.14994511 0.04083164
		 0.21205017 0.04083164 0.21205017 0.04083164 0.14994511 0.04083164 0.21205017 0.04083164
		 0.14994511 0.04083164 0.14994511 0.04083164 0.21205017 0.04083164 0.21205017 0.04083164
		 0.14994511 0.04083164 0.21205017 0.040831521 0.087840088 0.04083164 0.087840088 0.040831521
		 0.14994511 0.040831521 0.14994511 0.04083164 0.087840088 0.04083164 0.14994511 0.04083164
		 0.14994511 0.04083164 0.087840088 0.0408317 0.14994511 0.0408317 0.14994511 0.04083164
		 0.087840088 0.0408317 0.087840088 0.040831625 0.087840088 0.04083164 0.087840088
		 0.040831625 0.14994511 0.040831625 0.14994511 0.04083164 0.087840088 0.04083164 0.14994511
		 0.040831625 0.087840088 0.040831625 0.087840088 0.040831625 0.14994511 0.040831625
		 0.14994511 0.040831625 0.087840088 0.040831625 0.14994511 0.040831611 0.087840088
		 0.040831625 0.087840088 0.040831611 0.14994511 0.040831611 0.14994511 0.040831625
		 0.087840088 0.040831625 0.14994511 0.04083164 0.087840088 0.040831611 0.087840088
		 0.04083164 0.14994511 0.04083164 0.14994511 0.040831611 0.087840088 0.040831611 0.14994511
		 0.04083164 0.087840088 0.04083164 0.087840088 0.04083164 0.14994511 0.04083164 0.14994511
		 0.04083164 0.087840088 0.04083164 0.14994511 0.04083164 0.087840088 0.04083164 0.087840088
		 0.04083164 0.14994511 0.04083164 0.14994511 0.04083164 0.087840088 0.04083164 0.14994511
		 0.04083164 0.087840088 0.040831521 0.087840088 0.04083164 0.025735036 0.04083164
		 0.025735036 0.040831521 0.087840088 0.040831521 0.025735036 0.04083164 0.087840088
		 0.04083164 0.087840088 0.04083164 0.025735036 0.04083164 0.025735036 0.04083164 0.087840088
		 0.04083164 0.025735036 0.04083164 0.087840088 0.04083164 0.087840088 0.04083164 0.025735036
		 0.04083164 0.025735036 0.04083164 0.087840088 0.04083164 0.025735036 0.040831611
		 0.087840088 0.04083164 0.087840088 0.040831611 0.025735036 0.040831611 0.025735036
		 0.04083164 0.087840088 0.04083164 0.025735036 0.040831625 0.087840088 0.040831611
		 0.087840088 0.040831625 0.025735036 0.040831625 0.025735036 0.040831611 0.087840088
		 0.040831611 0.025735036 0.040831625 0.087840088 0.040831625 0.087840088 0.040831625
		 0.025735036 0.040831625 0.025735036 0.040831625 0.087840088 0.040831625 0.025735036
		 0.04083164 0.087840088 0.040831625 0.087840088 0.04083164 0.025735036 0.04083164
		 0.025735036 0.040831625 0.087840088 0.040831625 0.025735036;
createNode polyUnite -n "polyUnite3";
	setAttr -s 3 ".ip";
	setAttr -s 3 ".im";
createNode groupId -n "groupId26";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts23";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:109]";
createNode groupId -n "groupId27";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts24";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[110:173]";
createNode groupId -n "groupId28";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts25";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[174:301]";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 5 ".st";
select -ne :initialShadingGroup;
	setAttr -s 3 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 3 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
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
connectAttr "polySubdFace1.out" "MeshShapeOrig.i";
connectAttr "groupParts9.og" "polySurfaceShape4.i";
connectAttr "polyTweakUV7.uvtk[0]" "polySurfaceShape4.uvst[0].uvtw";
connectAttr "groupId10.id" "polySurfaceShape4.iog.og[0].gid";
connectAttr "lambert4SG.mwc" "polySurfaceShape4.iog.og[0].gco";
connectAttr "groupId11.id" "polySurfaceShape4.ciog.cog[0].cgid";
connectAttr "groupParts10.og" "polySurfaceShape5.i";
connectAttr "polyTweakUV8.uvtk[0]" "polySurfaceShape5.uvst[0].uvtw";
connectAttr "groupId12.id" "polySurfaceShape5.iog.og[0].gid";
connectAttr "lambert3SG.mwc" "polySurfaceShape5.iog.og[0].gco";
connectAttr "groupId13.id" "polySurfaceShape5.ciog.cog[0].cgid";
connectAttr "polyChipOff2.out" "polySurfaceShape2.i";
connectAttr "groupId7.id" "polySurfaceShape2.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape2.iog.og[0].gco";
connectAttr "groupId8.id" "polySurfaceShape2.iog.og[1].gid";
connectAttr "lambert3SG.mwc" "polySurfaceShape2.iog.og[1].gco";
connectAttr "polyTweakUV5.out" "polySurfaceShape3.i";
connectAttr "groupId9.id" "polySurfaceShape3.iog.og[0].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape3.iog.og[0].gco";
connectAttr "polyTweakUV5.uvtk[0]" "polySurfaceShape3.uvst[0].uvtw";
connectAttr "ffd1GroupId.id" "block_rect_1x1:MeshShape.iog.og[0].gid";
connectAttr "ffd1Set.mwc" "block_rect_1x1:MeshShape.iog.og[0].gco";
connectAttr "groupId2.id" "block_rect_1x1:MeshShape.iog.og[1].gid";
connectAttr "tweakSet1.mwc" "block_rect_1x1:MeshShape.iog.og[1].gco";
connectAttr "groupId3.id" "block_rect_1x1:MeshShape.iog.og[2].gid";
connectAttr ":initialShadingGroup.mwc" "block_rect_1x1:MeshShape.iog.og[2].gco";
connectAttr "groupId5.id" "block_rect_1x1:MeshShape.iog.og[3].gid";
connectAttr "lambert2SG.mwc" "block_rect_1x1:MeshShape.iog.og[3].gco";
connectAttr "groupId6.id" "block_rect_1x1:MeshShape.iog.og[4].gid";
connectAttr "lambert3SG.mwc" "block_rect_1x1:MeshShape.iog.og[4].gco";
connectAttr "polyChipOff1.out" "block_rect_1x1:MeshShape.i";
connectAttr "groupId4.id" "block_rect_1x1:MeshShape.ciog.cog[0].cgid";
connectAttr "polyTweakUV4.uvtk[0]" "block_rect_1x1:MeshShape.uvst[0].uvtw";
connectAttr "groupParts14.og" "polySurfaceShape7.i";
connectAttr "groupId17.id" "polySurfaceShape7.iog.og[0].gid";
connectAttr "lambert4SG.mwc" "polySurfaceShape7.iog.og[0].gco";
connectAttr "groupParts15.og" "polySurfaceShape8.i";
connectAttr "groupId18.id" "polySurfaceShape8.iog.og[0].gid";
connectAttr "lambert3SG.mwc" "polySurfaceShape8.iog.og[0].gco";
connectAttr "polyTweakUV9.out" "polySurfaceShape9.i";
connectAttr "groupId19.id" "polySurfaceShape9.iog.og[0].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape9.iog.og[0].gco";
connectAttr "polyTweakUV9.uvtk[0]" "polySurfaceShape9.uvst[0].uvtw";
connectAttr "groupParts13.og" "polySurfaceShape6.i";
connectAttr "groupId14.id" "polySurfaceShape6.iog.og[0].gid";
connectAttr "lambert4SG.mwc" "polySurfaceShape6.iog.og[0].gco";
connectAttr "groupId15.id" "polySurfaceShape6.iog.og[1].gid";
connectAttr "lambert3SG.mwc" "polySurfaceShape6.iog.og[1].gco";
connectAttr "groupId16.id" "polySurfaceShape6.iog.og[2].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape6.iog.og[2].gco";
connectAttr "groupParts20.og" "polySurfaceShape11.i";
connectAttr "groupId23.id" "polySurfaceShape11.iog.og[0].gid";
connectAttr "lambert4SG.mwc" "polySurfaceShape11.iog.og[0].gco";
connectAttr "groupParts21.og" "polySurfaceShape12.i";
connectAttr "groupId24.id" "polySurfaceShape12.iog.og[0].gid";
connectAttr "lambert3SG.mwc" "polySurfaceShape12.iog.og[0].gco";
connectAttr "polyTweakUV10.out" "polySurfaceShape13.i";
connectAttr "groupId25.id" "polySurfaceShape13.iog.og[0].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape13.iog.og[0].gco";
connectAttr "polyTweakUV10.uvtk[0]" "polySurfaceShape13.uvst[0].uvtw";
connectAttr "groupParts19.og" "polySurfaceShape10.i";
connectAttr "groupId20.id" "polySurfaceShape10.iog.og[0].gid";
connectAttr "lambert4SG.mwc" "polySurfaceShape10.iog.og[0].gco";
connectAttr "groupId21.id" "polySurfaceShape10.iog.og[1].gid";
connectAttr "lambert3SG.mwc" "polySurfaceShape10.iog.og[1].gco";
connectAttr "groupId22.id" "polySurfaceShape10.iog.og[2].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape10.iog.og[2].gco";
connectAttr "groupParts25.og" "polySurfaceShape14.i";
connectAttr "groupId26.id" "polySurfaceShape14.iog.og[0].gid";
connectAttr "lambert4SG.mwc" "polySurfaceShape14.iog.og[0].gco";
connectAttr "groupId27.id" "polySurfaceShape14.iog.og[1].gid";
connectAttr "lambert3SG.mwc" "polySurfaceShape14.iog.og[1].gco";
connectAttr "groupId28.id" "polySurfaceShape14.iog.og[2].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape14.iog.og[2].gco";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "polySurfaceShape1.o" "polyQuad1.ip";
connectAttr "block_rect_1x1:MeshShape.wm" "polyQuad1.mp";
connectAttr "polyQuad1.out" "polyQuad2.ip";
connectAttr "block_rect_1x1:MeshShape.wm" "polyQuad2.mp";
connectAttr "polyQuad2.out" "deleteComponent1.ig";
connectAttr "deleteComponent1.og" "polySubdFace1.ip";
connectAttr "ffd1GroupParts.og" "ffd1.ip[0].ig";
connectAttr "ffd1GroupId.id" "ffd1.ip[0].gi";
connectAttr "ffd1LatticeShape.wm" "ffd1.dlm";
connectAttr "ffd1LatticeShape.lo" "ffd1.dlp";
connectAttr "ffd1BaseShape.wm" "ffd1.blm";
connectAttr "groupParts2.og" "tweak1.ip[0].ig";
connectAttr "groupId2.id" "tweak1.ip[0].gi";
connectAttr "ffd1GroupId.msg" "ffd1Set.gn" -na;
connectAttr "block_rect_1x1:MeshShape.iog.og[0]" "ffd1Set.dsm" -na;
connectAttr "ffd1.msg" "ffd1Set.ub[0]";
connectAttr "tweak1.og[0]" "ffd1GroupParts.ig";
connectAttr "ffd1GroupId.id" "ffd1GroupParts.gi";
connectAttr "groupId2.msg" "tweakSet1.gn" -na;
connectAttr "block_rect_1x1:MeshShape.iog.og[1]" "tweakSet1.dsm" -na;
connectAttr "tweak1.msg" "tweakSet1.ub[0]";
connectAttr "MeshShapeOrig.w" "groupParts2.ig";
connectAttr "groupId2.id" "groupParts2.gi";
connectAttr "ffd1.og[0]" "polyExtrudeFace1.ip";
connectAttr "block_rect_1x1:MeshShape.wm" "polyExtrudeFace1.mp";
connectAttr "polyExtrudeFace1.out" "polyExtrudeFace2.ip";
connectAttr "block_rect_1x1:MeshShape.wm" "polyExtrudeFace2.mp";
connectAttr "polyTweak1.out" "polyTriangulate1.ip";
connectAttr "polyExtrudeFace2.out" "polyTweak1.ip";
connectAttr "file1.oc" "ground_surface.c";
connectAttr "ground_surface.oc" "lambert2SG.ss";
connectAttr "groupId5.msg" "lambert2SG.gn" -na;
connectAttr "groupId9.msg" "lambert2SG.gn" -na;
connectAttr "groupId16.msg" "lambert2SG.gn" -na;
connectAttr "groupId19.msg" "lambert2SG.gn" -na;
connectAttr "groupId22.msg" "lambert2SG.gn" -na;
connectAttr "groupId25.msg" "lambert2SG.gn" -na;
connectAttr "groupId28.msg" "lambert2SG.gn" -na;
connectAttr "block_rect_1x1:MeshShape.iog.og[3]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape3.iog.og[0]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape6.iog.og[2]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape9.iog.og[0]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape10.iog.og[2]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape13.iog.og[0]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape14.iog.og[2]" "lambert2SG.dsm" -na;
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "ground_surface.msg" "materialInfo1.m";
connectAttr "file1.msg" "materialInfo1.t" -na;
connectAttr "polyTriangulate1.out" "groupParts3.ig";
connectAttr "groupId3.id" "groupParts3.gi";
connectAttr "groupParts3.og" "groupParts4.ig";
connectAttr "groupId5.id" "groupParts4.gi";
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
connectAttr "groupParts4.og" "polyTweakUV1.ip";
connectAttr "polyTweak2.out" "polyMapCut1.ip";
connectAttr "polyTweakUV1.out" "polyTweak2.ip";
connectAttr "polyMapCut1.out" "polyTweakUV2.ip";
connectAttr "polyTweakUV2.out" "polyMapCut2.ip";
connectAttr "polyMapCut2.out" "polyTweakUV3.ip";
connectAttr "polyTweakUV3.out" "polyMapCut3.ip";
connectAttr "file2.oc" "ground_edge.c";
connectAttr "ground_edge.oc" "lambert3SG.ss";
connectAttr "groupId6.msg" "lambert3SG.gn" -na;
connectAttr "groupId8.msg" "lambert3SG.gn" -na;
connectAttr "groupId12.msg" "lambert3SG.gn" -na;
connectAttr "groupId13.msg" "lambert3SG.gn" -na;
connectAttr "groupId15.msg" "lambert3SG.gn" -na;
connectAttr "groupId18.msg" "lambert3SG.gn" -na;
connectAttr "groupId21.msg" "lambert3SG.gn" -na;
connectAttr "groupId24.msg" "lambert3SG.gn" -na;
connectAttr "groupId27.msg" "lambert3SG.gn" -na;
connectAttr "block_rect_1x1:MeshShape.iog.og[4]" "lambert3SG.dsm" -na;
connectAttr "polySurfaceShape2.iog.og[1]" "lambert3SG.dsm" -na;
connectAttr "polySurfaceShape5.iog.og[0]" "lambert3SG.dsm" -na;
connectAttr "polySurfaceShape5.ciog.cog[0]" "lambert3SG.dsm" -na;
connectAttr "polySurfaceShape6.iog.og[1]" "lambert3SG.dsm" -na;
connectAttr "polySurfaceShape8.iog.og[0]" "lambert3SG.dsm" -na;
connectAttr "polySurfaceShape10.iog.og[1]" "lambert3SG.dsm" -na;
connectAttr "polySurfaceShape12.iog.og[0]" "lambert3SG.dsm" -na;
connectAttr "polySurfaceShape14.iog.og[1]" "lambert3SG.dsm" -na;
connectAttr "lambert3SG.msg" "materialInfo2.sg";
connectAttr "ground_edge.msg" "materialInfo2.m";
connectAttr "file2.msg" "materialInfo2.t" -na;
connectAttr "polyMapCut3.out" "groupParts5.ig";
connectAttr "groupId6.id" "groupParts5.gi";
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
connectAttr "groupParts5.og" "polyTweakUV4.ip";
connectAttr "polyTweakUV4.out" "polyChipOff1.ip";
connectAttr "block_rect_1x1:MeshShape.wm" "polyChipOff1.mp";
connectAttr "block_rect_1x1:MeshShape.o" "polySeparate1.ip";
connectAttr "polySeparate1.out[0]" "groupParts6.ig";
connectAttr "groupId7.id" "groupParts6.gi";
connectAttr "groupParts6.og" "groupParts7.ig";
connectAttr "groupId8.id" "groupParts7.gi";
connectAttr "polySeparate1.out[1]" "groupParts8.ig";
connectAttr "groupId9.id" "groupParts8.gi";
connectAttr "groupParts8.og" "polyTweakUV5.ip";
connectAttr "groupParts7.og" "polyChipOff2.ip";
connectAttr "polySurfaceShape2.wm" "polyChipOff2.mp";
connectAttr "polySurfaceShape2.o" "polySeparate2.ip";
connectAttr "polySeparate2.out[1]" "polyAutoProj1.ip";
connectAttr "polySurfaceShape5.wm" "polyAutoProj1.mp";
connectAttr "file7.oc" "under_ground.c";
connectAttr "under_ground.oc" "lambert4SG.ss";
connectAttr "polySurfaceShape4.iog.og[0]" "lambert4SG.dsm" -na;
connectAttr "polySurfaceShape4.ciog.cog[0]" "lambert4SG.dsm" -na;
connectAttr "polySurfaceShape6.iog.og[0]" "lambert4SG.dsm" -na;
connectAttr "polySurfaceShape7.iog.og[0]" "lambert4SG.dsm" -na;
connectAttr "polySurfaceShape10.iog.og[0]" "lambert4SG.dsm" -na;
connectAttr "polySurfaceShape11.iog.og[0]" "lambert4SG.dsm" -na;
connectAttr "polySurfaceShape14.iog.og[0]" "lambert4SG.dsm" -na;
connectAttr "groupId10.msg" "lambert4SG.gn" -na;
connectAttr "groupId11.msg" "lambert4SG.gn" -na;
connectAttr "groupId14.msg" "lambert4SG.gn" -na;
connectAttr "groupId17.msg" "lambert4SG.gn" -na;
connectAttr "groupId20.msg" "lambert4SG.gn" -na;
connectAttr "groupId23.msg" "lambert4SG.gn" -na;
connectAttr "groupId26.msg" "lambert4SG.gn" -na;
connectAttr "lambert4SG.msg" "materialInfo3.sg";
connectAttr "under_ground.msg" "materialInfo3.m";
connectAttr "file7.msg" "materialInfo3.t" -na;
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
connectAttr "polySeparate2.out[0]" "polyPlanarProj1.ip";
connectAttr "polySurfaceShape4.wm" "polyPlanarProj1.mp";
connectAttr "polyPlanarProj1.out" "polyPlanarProj2.ip";
connectAttr "polySurfaceShape4.wm" "polyPlanarProj2.mp";
connectAttr "polyPlanarProj2.out" "polyTweakUV6.ip";
connectAttr "polyTweakUV6.out" "polyMapCut4.ip";
connectAttr "polyMapCut4.out" "polyTweakUV7.ip";
connectAttr "polyTweakUV7.out" "polyPlanarProj3.ip";
connectAttr "polySurfaceShape4.wm" "polyPlanarProj3.mp";
connectAttr "polyAutoProj1.out" "polyTweakUV8.ip";
connectAttr "polyPlanarProj3.out" "polyCylProj1.ip";
connectAttr "polySurfaceShape4.wm" "polyCylProj1.mp";
connectAttr "polySurfaceShape4.o" "polyUnite1.ip[0]";
connectAttr "polySurfaceShape5.o" "polyUnite1.ip[1]";
connectAttr "polySurfaceShape3.o" "polyUnite1.ip[2]";
connectAttr "polySurfaceShape4.wm" "polyUnite1.im[0]";
connectAttr "polySurfaceShape5.wm" "polyUnite1.im[1]";
connectAttr "polySurfaceShape3.wm" "polyUnite1.im[2]";
connectAttr "polyCylProj1.out" "groupParts9.ig";
connectAttr "groupId10.id" "groupParts9.gi";
connectAttr "polyTweakUV8.out" "groupParts10.ig";
connectAttr "groupId12.id" "groupParts10.gi";
connectAttr "polyUnite1.out" "groupParts11.ig";
connectAttr "groupId14.id" "groupParts11.gi";
connectAttr "groupParts11.og" "groupParts12.ig";
connectAttr "groupId15.id" "groupParts12.gi";
connectAttr "groupParts12.og" "groupParts13.ig";
connectAttr "groupId16.id" "groupParts13.gi";
connectAttr "polySurfaceShape6.o" "polySeparate3.ip";
connectAttr "polySeparate3.out[0]" "groupParts14.ig";
connectAttr "groupId17.id" "groupParts14.gi";
connectAttr "polySeparate3.out[1]" "groupParts15.ig";
connectAttr "groupId18.id" "groupParts15.gi";
connectAttr "polySeparate3.out[2]" "groupParts16.ig";
connectAttr "groupId19.id" "groupParts16.gi";
connectAttr "groupParts16.og" "polyTweakUV9.ip";
connectAttr "polySurfaceShape7.o" "polyUnite2.ip[0]";
connectAttr "polySurfaceShape8.o" "polyUnite2.ip[1]";
connectAttr "polySurfaceShape9.o" "polyUnite2.ip[2]";
connectAttr "polySurfaceShape7.wm" "polyUnite2.im[0]";
connectAttr "polySurfaceShape8.wm" "polyUnite2.im[1]";
connectAttr "polySurfaceShape9.wm" "polyUnite2.im[2]";
connectAttr "polyUnite2.out" "groupParts17.ig";
connectAttr "groupId20.id" "groupParts17.gi";
connectAttr "groupParts17.og" "groupParts18.ig";
connectAttr "groupId21.id" "groupParts18.gi";
connectAttr "groupParts18.og" "groupParts19.ig";
connectAttr "groupId22.id" "groupParts19.gi";
connectAttr "polySurfaceShape10.o" "polySeparate4.ip";
connectAttr "polySeparate4.out[0]" "groupParts20.ig";
connectAttr "groupId23.id" "groupParts20.gi";
connectAttr "polySeparate4.out[1]" "groupParts21.ig";
connectAttr "groupId24.id" "groupParts21.gi";
connectAttr "polySeparate4.out[2]" "groupParts22.ig";
connectAttr "groupId25.id" "groupParts22.gi";
connectAttr "groupParts22.og" "polyTweakUV10.ip";
connectAttr "polySurfaceShape11.o" "polyUnite3.ip[0]";
connectAttr "polySurfaceShape12.o" "polyUnite3.ip[1]";
connectAttr "polySurfaceShape13.o" "polyUnite3.ip[2]";
connectAttr "polySurfaceShape11.wm" "polyUnite3.im[0]";
connectAttr "polySurfaceShape12.wm" "polyUnite3.im[1]";
connectAttr "polySurfaceShape13.wm" "polyUnite3.im[2]";
connectAttr "polyUnite3.out" "groupParts23.ig";
connectAttr "groupId26.id" "groupParts23.gi";
connectAttr "groupParts23.og" "groupParts24.ig";
connectAttr "groupId27.id" "groupParts24.gi";
connectAttr "groupParts24.og" "groupParts25.ig";
connectAttr "groupId28.id" "groupParts25.gi";
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "lambert4SG.pa" ":renderPartition.st" -na;
connectAttr "block_rect_1x1:MeshShape.iog.og[2]" ":initialShadingGroup.dsm" -na;
connectAttr "block_rect_1x1:MeshShape.ciog.cog[0]" ":initialShadingGroup.dsm" -na
		;
connectAttr "polySurfaceShape2.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "groupId3.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId4.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId7.msg" ":initialShadingGroup.gn" -na;
connectAttr "ground_surface.msg" ":defaultShaderList1.s" -na;
connectAttr "ground_edge.msg" ":defaultShaderList1.s" -na;
connectAttr "under_ground.msg" ":defaultShaderList1.s" -na;
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
// End of block_rect_curved_hill_4x1.ma
