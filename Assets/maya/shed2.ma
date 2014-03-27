//Maya ASCII 2012 scene
//Name: shed2.ma
//Last modified: Sat, Dec 21, 2013 05:55:05 PM
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
	setAttr ".t" -type "double3" -147.04987103765151 98.778542653638738 -284.01741397331546 ;
	setAttr ".r" -type "double3" 350.66164727026103 -162.59999999998911 360 ;
	setAttr ".rp" -type "double3" 0 -1.2434497875801753e-14 5.6843418860808015e-14 ;
	setAttr ".rpt" -type "double3" -4.6057368789084565e-14 2.5126990681465885e-14 -9.0061040868004845e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v";
	setAttr ".fl" 34.999999999999979;
	setAttr ".coi" 423.44574484829565;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -6.7002525919501466 12.002410481999192 13.869170767253934 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".t" -type "double3" -0.39249992370605469 100.10111376708701 1.5356721216438167e-14 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 125.2093179427569;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".t" -type "double3" 0.9078367433488026 12.735876480335463 104.77348975071946 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 174.89528171887852;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".t" -type "double3" 100.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "Shed2_1:Mesh";
createNode mesh -n "Shed2_1:MeshShape" -p "Shed2_1:Mesh";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".pv" -type "double2" 0.19020725260762639 0.63567732274532318 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
createNode mesh -n "polySurfaceShape1" -p "Shed2_1:Mesh";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 28 ".vt[0:27]"  12.97859955 49.22280121 -22 22.10980034 31.46179962 -22
		 22.10980034 31.46179962 22 12.97859955 49.22280121 22 24.10810089 32.30699921 -22
		 24.10810089 32.30699921 22 -0.34995499 61.97800064 22 -0.34995499 61.97800064 -22
		 -0.40426499 61.9192009 -22 -0.40426499 61.9192009 22 14.82009983 50.37319946 -22
		 14.82009983 50.37319946 22 14.85210037 50.40779877 -22 14.85210037 50.40779877 22
		 -0.454032 61.97299957 22 -0.454032 61.97299957 -22 -15.35079956 50.63539886 -22 -15.35079956 50.63539886 22
		 -0.398752 59.40439987 22 -0.398752 59.40439987 -22 -14.0061998367 49.047798157 22
		 -14.0061998367 49.047798157 -22 -15.57439995 50.72980118 -22 -15.57439995 50.72980118 22
		 -24.89310074 32.60380173 -22 -24.89310074 32.60380173 22 -22.8946991 31.75839996 22
		 -22.8946991 31.75839996 -22;
	setAttr -s 78 ".ed[0:77]"  0 1 0 1 2 0 2 0 0 2 3 0 3 0 0 4 5 0 5 2 0
		 2 4 0 1 4 0 6 7 0 7 8 0 8 6 0 8 9 0 9 6 0 4 10 0 10 11 0 11 4 0 11 5 0 12 13 0 13 11 0
		 11 12 0 10 12 0 12 7 0 7 13 0 6 13 0 14 15 0 15 16 0 16 14 0 16 17 0 17 14 0 3 18 0
		 18 0 0 18 19 0 19 0 0 8 15 0 15 9 0 14 9 0 18 20 0 20 19 0 20 21 0 21 19 0 16 22 0
		 22 17 0 22 23 0 23 17 0 22 24 0 24 23 0 24 25 0 25 23 0 20 26 0 26 21 0 26 27 0 27 21 0
		 26 25 0 25 27 0 24 27 0 24 21 0 24 16 0 16 21 0 16 19 0 16 8 0 8 19 0 0 4 0 0 10 0
		 0 12 0 19 12 0 8 12 0 20 25 0 20 17 0 17 25 0 18 17 0 18 9 0 9 17 0 5 3 0 11 3 0
		 13 3 0 13 18 0 13 9 0;
	setAttr -s 156 ".n[0:155]" -type "float3"  -0.88934898 -0.457228 0 -0.88934898
		 -0.457228 0 -0.88934898 -0.457228 0 -0.88934898 -0.457228 0 -0.88934898 -0.457228
		 0 -0.88934898 -0.457228 0 0.389548 -0.92100602 0 0.389548 -0.92100602 0 0.389548
		 -0.92100602 0 0.389548 -0.92100602 0 0.389548 -0.92100602 0 0.389548 -0.92100602
		 0 -0.73459601 0.678505 0 -0.73459601 0.678505 0 -0.73459601 0.678505 0 -0.73459601
		 0.678505 0 -0.73459601 0.678505 0 -0.73459601 0.678505 0 0.88935202 0.45722401 0
		 0.88935202 0.45722401 0 0.88935202 0.45722401 0 0.88935202 0.45722401 0 0.88935202
		 0.45722401 0 0.88935202 0.45722401 0 0.73413998 -0.67899799 0 0.73413998 -0.67899799
		 0 0.73413998 -0.67899799 0 0.73413998 -0.67899799 0 0.73413998 -0.67899799 0 0.73413998
		 -0.67899799 0 0.60563499 0.79574198 0 0.60563499 0.79574198 0 0.60563499 0.79574198
		 0 0.60563499 0.79574198 0 0.60563499 0.79574198 0 0.60563499 0.79574198 0 -0.605627
		 0.79574901 0 -0.605627 0.79574901 0 -0.605627 0.79574901 0 -0.605627 0.79574901 0
		 -0.605627 0.79574901 0 -0.605627 0.79574901 0 -0.60564202 -0.79573798 0 -0.60564202
		 -0.79573798 0 -0.60564202 -0.79573798 0 -0.60564202 -0.79573798 0 -0.60564202 -0.79573798
		 0 -0.60564202 -0.79573798 0 0.73407698 0.679066 0 0.73407698 0.679066 0 0.73407698
		 0.679066 0 0.73407698 0.679066 0 0.73407698 0.679066 0 0.73407698 0.679066 0 0.60563701
		 -0.79574102 0 0.60563701 -0.79574102 0 0.60563701 -0.79574102 0 0.60563701 -0.79574102
		 0 0.60563701 -0.79574102 0 0.60563701 -0.79574102 0 0.38894901 0.92126 0 0.38894901
		 0.92126 0 0.38894901 0.92126 0 0.38894901 0.92126 0 0.38894901 0.92126 0 0.38894901
		 0.92126 0 -0.88935298 0.45722201 0 -0.88935298 0.45722201 0 -0.88935298 0.45722201
		 0 -0.88935298 0.45722201 0 -0.88935298 0.45722201 0 -0.88935298 0.45722201 0 0.889355
		 -0.45721799 0 0.889355 -0.45721799 0 0.889355 -0.45721799 0 0.889355 -0.45721799
		 0 0.889355 -0.45721799 0 0.889355 -0.45721799 0 -0.38960999 -0.92097998 0 -0.38960999
		 -0.92097998 0 -0.38960999 -0.92097998 0 -0.38960999 -0.92097998 0 -0.38960999 -0.92097998
		 0 -0.38960999 -0.92097998 0 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0
		 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0
		 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1
		 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0
		 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1
		 0 0 1;
	setAttr -s 52 ".fc[0:51]" -type "polyFaces" 
		f 3 0 1 2
		f 3 -3 3 4
		f 3 5 6 7
		f 3 -8 -2 8
		f 3 9 10 11
		f 3 -12 12 13
		f 3 14 15 16
		f 3 -17 17 -6
		f 3 18 19 20
		f 3 -21 -16 21
		f 3 -19 22 23
		f 3 -24 -10 24
		f 3 25 26 27
		f 3 -28 28 29
		f 3 -5 30 31
		f 3 -32 32 33
		f 3 -13 34 35
		f 3 -36 -26 36
		f 3 -33 37 38
		f 3 -39 39 40
		f 3 -29 41 42
		f 3 -43 43 44
		f 3 -44 45 46
		f 3 -47 47 48
		f 3 -40 49 50
		f 3 -51 51 52
		f 3 -52 53 54
		f 3 -55 -48 55
		f 3 -56 56 -53
		f 3 -57 57 58
		f 3 -58 -46 -42
		f 3 -59 59 -41
		f 3 -60 60 61
		f 3 -61 -27 -35
		f 3 -9 -1 62
		f 3 -63 63 -15
		f 3 -64 64 -22
		f 3 -65 -34 65
		f 3 -66 -62 66
		f 3 -67 -11 -23
		f 3 -54 -50 67
		f 3 -68 68 69
		f 3 -70 -45 -49
		f 3 -69 -38 70
		f 3 -71 71 72
		f 3 -73 -37 -30
		f 3 -7 73 -4
		f 3 -74 -18 74
		f 3 -75 -20 75
		f 3 -76 76 -31
		f 3 -77 77 -72
		f 3 -78 -25 -14;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "Shed2_2:Mesh";
createNode mesh -n "Shed2_2:MeshShape" -p "Shed2_2:Mesh";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:4]";
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 7 ".vt[0:6]"  22.049999237 1e-06 18.70969963 22.049999237 33.27780151 20
		 14.12790012 48.68740082 20 -0.65821499 59.94079971 20 -13.20250034 50.39339828 20
		 -22.049999237 33.18399811 20 -22.049999237 1e-06 19.17889977;
	setAttr -s 11 ".ed[0:10]"  0 1 0 1 2 0 2 0 0 2 3 0 3 0 0 3 4 0 4 0 0
		 4 5 0 5 0 0 5 6 0 6 0 0;
	setAttr -s 15 ".n[0:14]" -type "float3"  -0.075149998 -0.038635001 0.99642301
		 -0.075149998 -0.038635001 0.99642301 -0.075149998 -0.038635001 0.99642301 -0.023003999
		 -0.030226 0.99927801 -0.023003999 -0.030226 0.99927801 -0.023003999 -0.030226 0.99927801
		 0.012714 -0.016705001 0.99978 0.012714 -0.016705001 0.99978 0.012714 -0.016705001
		 0.99978 0.021090999 -0.010843 0.99971902 0.021090999 -0.010843 0.99971902 0.021090999
		 -0.010843 0.99971902 0.010636 -0.024735 0.99963701 0.010636 -0.024735 0.99963701
		 0.010636 -0.024735 0.99963701;
	setAttr -s 5 ".fc[0:4]" -type "polyFaces" 
		f 3 0 1 2
		f 3 -3 3 4
		f 3 -5 5 6
		f 3 -7 7 8
		f 3 -9 9 10;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "shed2_2bk:Mesh";
	setAttr ".t" -type "double3" 0 0 36.748009810049737 ;
createNode mesh -n "shed2_2bk:MeshShape" -p "shed2_2bk:Mesh";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:4]";
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 7 ".vt[0:6]"  -20.94750023 1e-06 -18.70969963 -20.94750023 33.27780151 -20
		 -13.42150021 48.68740082 -20 0.62530202 59.94079971 -20 12.54240036 50.39339828 -20
		 20.94750023 33.18399811 -20 20.94750023 1e-06 -19.17889977;
	setAttr -s 11 ".ed[0:10]"  0 1 0 1 2 0 2 0 0 2 3 0 3 0 0 3 4 0 4 0 0
		 4 5 0 5 0 0 5 6 0 6 0 0;
	setAttr -s 15 ".n[0:14]" -type "float3"  0.079081997 -0.038623001 -0.99611998
		 0.079081997 -0.038623001 -0.99611998 0.079081997 -0.038623001 -0.99611998 0.024214
		 -0.030224999 -0.99924999 0.024214 -0.030224999 -0.99924999 0.024214 -0.030224999
		 -0.99924999 -0.013383 -0.016705001 -0.999771 -0.013383 -0.016705001 -0.999771 -0.013383
		 -0.016705001 -0.999771 -0.022201 -0.010843 -0.999695 -0.022201 -0.010843 -0.999695
		 -0.022201 -0.010843 -0.999695 -0.011195 -0.024735 -0.99963099 -0.011195 -0.024735
		 -0.99963099 -0.011195 -0.024735 -0.99963099;
	setAttr -s 5 ".fc[0:4]" -type "polyFaces" 
		f 3 0 1 2
		f 3 -3 3 4
		f 3 -5 5 6
		f 3 -7 7 8
		f 3 -9 9 10;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "Shed2_5:Mesh";
createNode mesh -n "Shed2_5:MeshShape" -p "Shed2_5:Mesh";
	setAttr -k off ".v";
	setAttr ".pv" -type "double2" 0.50419700145721436 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
createNode mesh -n "polySurfaceShape2" -p "Shed2_5:Mesh";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 22 ".vt[0:21]"  14.12790012 48.68730164 -20 8.26875019 -1e-06 -18.95199966
		 8.26875019 20 -19.39579964 -0.65821499 59.94079971 -20 -8.26875019 20 -19.42630005
		 -13.20250034 50.39350128 -20 22.049999237 33.27780151 -20 20.67609978 -0.058660999 -18.7682991
		 -8.26875019 -1e-06 -18.98250008 -20.74160004 -0.059340999 -19.0028991699 -22.049999237 33.1841011 -20
		 8.26875019 20 -15.13199997 8.26875019 -1e-06 -15.13199997 -8.26875019 20 -15.13199997
		 -8.26875019 -1e-06 -15.13199997 14.12790012 48.68730164 -15.13199997 -0.65821499 59.94079971 -15.13199997
		 -13.20250034 50.39350128 -15.13199997 20.80940056 -0.052960999 -15.13199997 22.049999237 33.27780151 -15.13199997
		 -20.87420082 -0.053321 -15.13199997 -22.049999237 33.1841011 -15.13199997;
	setAttr -s 45 ".ed[0:44]"  0 1 0 1 2 0 2 0 0 2 3 0 3 0 0 2 4 0 4 3 0
		 4 5 0 5 3 0 6 7 0 7 0 0 0 6 0 7 1 0 4 8 0 8 5 0 8 9 0 9 5 0 9 10 0 10 5 0 11 2 0
		 1 11 0 1 12 0 12 11 0 4 13 0 13 14 0 14 4 0 14 8 0 11 4 0 11 13 0 11 15 0 15 16 0
		 16 11 0 16 13 0 16 17 0 17 13 0 17 14 0 18 19 0 19 15 0 15 18 0 11 18 0 12 18 0 17 20 0
		 20 14 0 17 21 0 21 20 0;
	setAttr -s 72 ".n[0:71]" -type "float3"  0.0055229999 -0.022183999 -0.99973899
		 0.0055229999 -0.022183999 -0.99973899 0.0055229999 -0.022183999 -0.99973899 -0.01387
		 -0.018223001 -0.99973798 -0.01387 -0.018223001 -0.99973798 -0.01387 -0.018223001
		 -0.99973798 0.001844 -0.014714 -0.99989003 0.001844 -0.014714 -0.99989003 0.001844
		 -0.014714 -0.99989003 0.012784 -0.016796 -0.99977702 0.012784 -0.016796 -0.99977702
		 0.012784 -0.016796 -0.99977702 -0.066349 -0.034109998 -0.99721301 -0.066349 -0.034109998
		 -0.99721301 -0.066349 -0.034109998 -0.99721301 0.01469 -0.023285 -0.99962097 0.01469
		 -0.023285 -0.99962097 0.01469 -0.023285 -0.99962097 -0.020408001 -0.02218 -0.99954599
		 -0.020408001 -0.02218 -0.99954599 -0.020408001 -0.02218 -0.99954599 0.00173 -0.020018
		 -0.999798 0.00173 -0.020018 -0.999798 0.00173 -0.020018 -0.999798 0.054092001 -0.027809
		 -0.99814898 0.054092001 -0.027809 -0.99814898 0.054092001 -0.027809 -0.99814898 -1
		 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 0 -1 0
		 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0
		 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1;
	setAttr -s 24 ".fc[0:23]" -type "polyFaces" 
		f 3 0 1 2
		f 3 -3 3 4
		f 3 -4 5 6
		f 3 -7 7 8
		f 3 9 10 11
		f 3 -11 12 -1
		f 3 13 14 -8
		f 3 -15 15 16
		f 3 -17 17 18
		f 3 19 -2 20
		f 3 -21 21 22
		f 3 23 24 25
		f 3 -26 26 -14
		f 3 -6 -20 27
		f 3 -28 28 -24
		f 3 29 30 31
		f 3 -32 32 -29
		f 3 -33 33 34
		f 3 -25 -35 35
		f 3 36 37 38
		f 3 -39 -30 39
		f 3 -40 -23 40
		f 3 -36 41 42
		f 3 -42 43 44;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "Shed2_6:Mesh";
createNode mesh -n "Shed2_6:MeshShape" -p "Shed2_6:Mesh";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:39]";
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 24 ".vt[0:23]"  -7.72999001 -0.096821003 -13.80200005 -7.72999001 17.90320015 -13.80200005
		 -12.82349968 17.90320015 -13.80200005 -12.82349968 -0.096821003 -13.80200005 -12.82349968 -0.096821003 -20.80200005
		 -7.72999001 -0.096821003 -20.80200005 -7.72999001 17.90320015 -20.80200005 -12.82349968 17.90320015 -20.80200005
		 14.53610039 17.93930054 -13.30200005 14.53610039 21.93930054 -13.30200005 -13.47840023 21.93930054 -13.30200005
		 -13.47840023 17.93930054 -13.30200005 13.35249996 17.93930054 -20.68479919 14.53610039 17.93930054 -21.30200005
		 13.35249996 17.93930054 -13.68470001 8.25893974 17.93930054 -13.68470001 -13.47840023 17.93930054 -21.30200005
		 8.25893974 17.93930054 -20.68479919 14.53610039 21.93930054 -21.30200005 -13.47840023 21.93930054 -21.30200005
		 8.25893974 0.080518998 -20.68479919 13.35249996 0.080518998 -20.68479919 13.35249996 0.080518998 -13.68470001
		 8.25893974 0.080518998 -13.68470001;
	setAttr -s 60 ".ed[0:59]"  0 1 0 1 2 0 2 0 0 2 3 0 3 0 0 4 5 0 5 0 0
		 0 4 0 3 4 0 6 1 0 0 6 0 5 6 0 6 7 0 7 2 0 2 6 0 4 6 0 4 7 0 4 2 0 8 9 0 9 10 0 10 8 0
		 10 11 0 11 8 0 12 13 0 13 14 0 14 12 0 13 8 0 8 14 0 15 14 0 8 15 0 11 15 0 16 13 0
		 12 16 0 12 17 0 17 16 0 17 15 0 15 16 0 11 16 0 18 9 0 8 18 0 13 18 0 18 19 0 19 10 0
		 10 18 0 16 18 0 16 19 0 16 10 0 20 21 0 21 22 0 22 20 0 22 23 0 23 20 0 12 21 0 20 12 0
		 20 17 0 20 15 0 23 15 0 22 14 0 15 22 0 22 12 0;
	setAttr -s 120 ".n[0:119]" -type "float3"  0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1
		 0 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1
		 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 -1
		 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0
		 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0
		 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 0 -1 0
		 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 0 -1 0
		 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 -1 0
		 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 1 0 0 1
		 0 0 1 0 0 1 0 0 1 0 0 1 0 0;
	setAttr -s 40 ".fc[0:39]" -type "polyFaces" 
		f 3 0 1 2
		f 3 -3 3 4
		f 3 5 6 7
		f 3 -8 -5 8
		f 3 9 -1 10
		f 3 -11 -7 11
		f 3 12 13 14
		f 3 -15 -2 -10
		f 3 -12 -6 15
		f 3 -16 16 -13
		f 3 -14 -17 17
		f 3 -18 -9 -4
		f 3 18 19 20
		f 3 -21 21 22
		f 3 23 24 25
		f 3 -25 26 27
		f 3 28 -28 29
		f 3 -30 -23 30
		f 3 31 -24 32
		f 3 -33 33 34
		f 3 -35 35 36
		f 3 -37 -31 37
		f 3 38 -19 39
		f 3 -40 -27 40
		f 3 41 42 43
		f 3 -44 -20 -39
		f 3 -41 -32 44
		f 3 -45 45 -42
		f 3 -43 -46 46
		f 3 -47 -38 -22
		f 3 47 48 49
		f 3 -50 50 51
		f 3 52 -48 53
		f 3 -54 54 -34
		f 3 -36 -55 55
		f 3 -56 -52 56
		f 3 57 -29 58
		f 3 -59 -57 -51
		f 3 -26 -58 59
		f 3 -60 -49 -53;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "shed2_21:Mesh";
createNode mesh -n "shed2_21:MeshShape" -p "shed2_21:Mesh";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:3]";
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 8 ".vt[0:7]"  -22.049999237 33.18399811 20 -22.049999237 33.18399811 -20
		 -22.049999237 1e-06 19.17889977 -20.74160004 -0.059340999 -19.0028991699 22.049999237 33.27780151 -20
		 22.049999237 33.27780151 20 22.049999237 1e-06 18.70969963 20.67609978 -0.058660999 -18.7682991;
	setAttr -s 10 ".ed[0:9]"  0 1 0 1 2 0 2 0 0 1 3 0 3 2 0 4 5 0 5 6 0
		 6 4 0 6 7 0 7 4 0;
	setAttr -s 12 ".n[0:11]" -type "float3"  -1 0 0 -0.99965101 -0.020171
		 -0.017084001 -0.99965101 -0.020171 -0.017084001 -0.99965101 -0.020171 -0.017084001
		 -0.99965101 -0.020171 -0.017084001 -0.99860299 -0.040328 -0.034157 0.99960703 -0.021257
		 -0.018275 1 0 0 0.99960703 -0.021257 -0.018275 0.99960703 -0.021257 -0.018275 0.99960703
		 -0.021257 -0.018275 0.99842799 -0.042498 -0.036534999;
	setAttr -s 4 ".fc[0:3]" -type "polyFaces" 
		f 3 0 1 2
		f 3 -2 3 4
		f 3 5 6 7
		f 3 -8 8 9;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "shed2_21bk:Mesh";
createNode mesh -n "shed2_21bk:MeshShape" -p "shed2_21bk:Mesh";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:3]";
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 8 ".vt[0:7]"  20.94750023 33.18399811 19 20.94750023 33.18399811 -19
		 20.94750023 1e-06 18.21999931 19.70439911 -0.059340999 -18.052799225 -20.94750023 33.27780151 -19
		 -20.94750023 33.27780151 19 -20.94750023 1e-06 17.77420044 -19.64220047 -0.058660999 -17.82990074;
	setAttr -s 10 ".ed[0:9]"  0 1 0 1 2 0 2 0 0 1 3 0 3 2 0 4 5 0 5 6 0
		 6 4 0 6 7 0 7 4 0;
	setAttr -s 12 ".n[0:11]" -type "float3"  -1 0 0 -0.99967003 0.019165
		 0.017086999 -0.99967003 0.019165 0.017086999 -0.99967003 0.019165 0.017086999 -0.99967003
		 0.019165 0.017086999 -0.99868101 0.038318001 0.034162998 0.99962902 0.020197 0.018277001
		 1 0 0 0.99962902 0.020197 0.018277001 0.99962902 0.020197 0.018277001 0.99962902
		 0.020197 0.018277001 0.99851602 0.040380001 0.036541;
	setAttr -s 4 ".fc[0:3]" -type "polyFaces" 
		f 3 0 1 2
		f 3 -2 3 4
		f 3 5 6 7
		f 3 -8 8 9;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "shedbase2:Mesh";
createNode mesh -n "shedbase2:MeshShape" -p "shedbase2:Mesh";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:11]";
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 8 ".vt[0:7]"  22.27050018 0 22.21999931 22.27050018 2 22.21999931
		 -22.27050018 2 22.21999931 -22.27050018 0 22.21999931 -22.27050018 0 -22.21999931
		 22.27050018 0 -22.21999931 22.27050018 2 -22.21999931 -22.27050018 2 -22.21999931;
	setAttr -s 18 ".ed[0:17]"  0 1 0 1 2 0 2 0 0 2 3 0 3 0 0 4 5 0 5 0 0
		 0 4 0 3 4 0 6 1 0 0 6 0 5 6 0 6 7 0 7 2 0 2 6 0 4 6 0 4 7 0 4 2 0;
	setAttr -s 36 ".n[0:35]" -type "float3"  0 0 1 0 0 1 0 0 1 0 0 1 0 0
		 1 0 0 1 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1
		 0 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1
		 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0;
	setAttr -s 12 ".fc[0:11]" -type "polyFaces" 
		f 3 0 1 2
		f 3 -3 3 4
		f 3 5 6 7
		f 3 -8 -5 8
		f 3 9 -1 10
		f 3 -11 -7 11
		f 3 12 13 14
		f 3 -15 -2 -10
		f 3 -12 -6 15
		f 3 -16 16 -13
		f 3 -14 -17 17
		f 3 -18 -9 -4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "shedleg2:Mesh";
	setAttr ".t" -type "double3" 19.542752177580944 -7.1518516688017204 17.920292716714279 ;
createNode mesh -n "shedleg2:MeshShape" -p "shedleg2:Mesh";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:3]";
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 5 ".vt[0:4]"  0 10 0 2.20499992 0 -2 -2.20499992 0 -2 -2.20499992 0 2
		 2.20499992 0 2;
	setAttr -s 8 ".ed[0:7]"  0 1 0 1 2 0 2 0 0 2 3 0 3 0 0 3 4 0 4 0 0
		 4 1 0;
	setAttr -s 12 ".n[0:11]" -type "float3"  0 0.196116 -0.98058099 0 0.196116
		 -0.98058099 0 0.196116 -0.98058099 -0.976542 0.21532699 0 -0.976542 0.21532699 0
		 -0.976542 0.21532699 0 0 0.196116 0.98058099 0 0.196116 0.98058099 0 0.196116 0.98058099
		 0.976542 0.21532699 0 0.976542 0.21532699 0 0.976542 0.21532699 0;
	setAttr -s 4 ".fc[0:3]" -type "polyFaces" 
		f 3 0 1 2
		f 3 -3 3 4
		f 3 -5 5 6
		f 3 -7 7 -1;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 13 ".lnk";
	setAttr -s 13 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode shadingEngine -n "Shed2_1:Shed2_1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "Shed2_1:materialInfo1";
createNode lambert -n "Shed2_1:Shed2_2";
	setAttr ".c" -type "float3" 0.80000001 0.80000001 0.80000001 ;
	setAttr ".ambc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
createNode shadingEngine -n "Shed2_2:Shed2_2";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "Shed2_2:materialInfo1";
createNode groupId -n "Shed2_2:groupId1";
	setAttr ".ihi" 0;
createNode lambert -n "Shed2_2:Shed2_3";
	setAttr ".c" -type "float3" 0.80000001 0.80000001 0.80000001 ;
	setAttr ".ambc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
createNode shadingEngine -n "shed2_2bk:shed2_2bk";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "shed2_2bk:materialInfo1";
createNode groupId -n "shed2_2bk:groupId1";
	setAttr ".ihi" 0;
createNode lambert -n "shed2_2bk:shed2_2bk1";
	setAttr ".c" -type "float3" 0.80000001 0.80000001 0.80000001 ;
	setAttr ".ambc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
createNode shadingEngine -n "Shed2_5:Shed2_5";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "Shed2_5:materialInfo1";
createNode lambert -n "Shed2_5:Shed2_6";
	setAttr ".c" -type "float3" 0.80000001 0.80000001 0.80000001 ;
	setAttr ".ambc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
createNode shadingEngine -n "Shed2_6:Shed2_6";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "Shed2_6:materialInfo1";
createNode groupId -n "Shed2_6:groupId1";
	setAttr ".ihi" 0;
createNode lambert -n "Shed2_6:Shed2_7";
	setAttr ".c" -type "float3" 0.80000001 0.80000001 0.80000001 ;
	setAttr ".ambc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
createNode shadingEngine -n "shed2_21:shed2_21";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "shed2_21:materialInfo1";
createNode groupId -n "shed2_21:groupId1";
	setAttr ".ihi" 0;
createNode lambert -n "shed2_21:shed2_22";
	setAttr ".c" -type "float3" 0.80000001 0.80000001 0.80000001 ;
	setAttr ".ambc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
createNode shadingEngine -n "shed2_21bk:shed2_21bk";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "shed2_21bk:materialInfo1";
createNode groupId -n "shed2_21bk:groupId1";
	setAttr ".ihi" 0;
createNode lambert -n "shed2_21bk:shed2_21bk1";
	setAttr ".c" -type "float3" 0.80000001 0.80000001 0.80000001 ;
	setAttr ".ambc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
createNode shadingEngine -n "shedbase2:shedbase2";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "shedbase2:materialInfo1";
createNode groupId -n "shedbase2:groupId1";
	setAttr ".ihi" 0;
createNode lambert -n "shedbase2:shedbase3";
	setAttr ".c" -type "float3" 0.80000001 0.80000001 0.80000001 ;
	setAttr ".ambc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
createNode shadingEngine -n "shedleg2:shedleg2";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "shedleg2:materialInfo1";
createNode groupId -n "shedleg2:groupId1";
	setAttr ".ihi" 0;
createNode lambert -n "shedleg2:shedleg3";
	setAttr ".c" -type "float3" 0.80000001 0.80000001 0.80000001 ;
	setAttr ".ambc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
createNode lambert -n "lambert2";
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode file -n "file1";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-scp/Assets/shed2rf.png";
createNode place2dTexture -n "place2dTexture1";
createNode polyAutoProj -n "polyAutoProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:51]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".s" -type "double3" 49.001201629638672 49.001201629638672 49.001201629638672 ;
	setAttr ".ps" 0.20000000298023224;
	setAttr ".dl" yes;
createNode polyTweakUV -n "polyTweakUV1";
	setAttr ".uopa" yes;
	setAttr -s 62 ".uvtk";
	setAttr ".uvtk[0:5]" -type "float2" 0.78031993 1.1177549  0.46372244 1.1177549  
		0.46372244 0.80004942  0.78031993 0.80004942  0.96181118 0.80004942  0.96181118 1.1177549 ;
	setAttr ".uvtk[10:27]" -type "float2" -2.0966706 1.4395822  -1.7414742 1.4395822  
		-1.7414742 1.6883876  -1.7407938 1.4395822  -2.0966706 1.6883876  -1.7407938 1.6883876  
		-1.513314 1.4395822  -1.513314 1.6883876  -0.68925714 1.2772262  -0.68925714 1.7174203  
		-0.69149405 1.7174203  -0.54022378 1.2772262  -0.69149405 1.2772262  -0.54022378 
		1.7174203  -0.53972584 1.2772262  -0.53972584 1.7174203  -0.53918248 1.2772262  -0.53918248 
		1.7174203 ;
	setAttr ".uvtk[32:69]" -type "float2" 0.89142865 0  0.89142865 0  0.89142859 
		0  0.89142865 0  0.89142859 0  0.89142865 0  -0.10255639 0  -0.10255639 0  -0.10255639 
		0  -0.10255639 0  -1.4158051 -0.25667816  -1.3905272 -0.2670128  -1.3403639 -0.023931887  
		-1.3142631 -0.021845367  -1.3114364 -0.023003396  -1.3686721 0.18941519  -1.3461782 
		0.21168059  -1.3452563 0.21171388  -1.5842946 0.24570268  -1.5782468 0.21846637  
		-1.3461353 0.2126871  -1.5843196 0.24511003  -1.8279798 0.16770029  -1.8177918 0.14236523  
		-1.311831 0.11244173  -1.286553 0.1227767  -1.3619971 0.35552448  -1.3880982 0.35761073  
		-1.3336905 0.56887376  -1.3909248 0.35645273  -1.356185 0.5911392  -1.1180665 0.62516379  
		-1.3571069 0.5911724  -1.1241142 0.59792721  -1.3562279 0.59214574  -1.1180418 0.6245712  
		-0.87437838 0.54716295  -0.88456625 0.52182758 ;
createNode lambert -n "lambert3";
createNode shadingEngine -n "lambert3SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode file -n "file2";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-scp/Assets/shed2_1.png";
createNode place2dTexture -n "place2dTexture2";
createNode polyCylProj -n "polyCylProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:23]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" 0 29.940729357302189 -17.565999984741211 ;
	setAttr ".ps" -type "double2" 180 60.000140711665154 ;
	setAttr ".r" 44.099998474121094;
createNode deleteComponent -n "deleteComponent1";
	setAttr ".dc" -type "componentList" 1 "f[15:23]";
createNode polyPlanarProj -n "polyPlanarProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:14]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" -0.15806484222412109 29.925363540649414 -19.426149368286133 ;
	setAttr ".ro" -type "double3" 179.66164725939535 15.399999794309648 179.99999999759612 ;
	setAttr ".ps" -type "double2" 42.516605897669891 60.024858497422187 ;
	setAttr ".per" yes;
	setAttr ".cam" -type "matrix" -1.8746299743652344 -0.0058870762586593628 -0.26555681228637695 -0.26555147767066956
		 3.0430603918879875e-14 3.7539737224578857 -0.0059054531157016754 -0.0059053348377346992
		 -0.51635909080505371 0.021372895687818527 0.96409785747528076 0.96407860517501831
		 -232.06736755371094 -81.000968933105469 340.08343505859375 340.27664184570312;
	setAttr ".prgt" 863;
	setAttr ".ptop" 447;
createNode polyTweakUV -n "polyTweakUV2";
	setAttr ".uopa" yes;
	setAttr -s 15 ".uvtk[0:14]" -type "float2" -0.0050955564 0 0.038111851
		 -9.3132257e-09 0.037508413 0 0.099348582 0 0.1529067 0 0.18623695 0 -0.061947882
		 0.0051278137 -0.050243758 0 0.15330772 -9.3132257e-10 0.23816076 8.3819032e-09 0.24654949
		 0.0051278137 0.04039681 0 0.040691823 9.3132257e-09 0.15431921 0 0.15456925 -1.3969839e-08;
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
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 13 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 13 ".s";
select -ne :defaultTextureList1;
	setAttr -s 2 ".tx";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 2 ".u";
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
connectAttr "polyTweakUV1.out" "Shed2_1:MeshShape.i";
connectAttr "polyTweakUV1.uvtk[0]" "Shed2_1:MeshShape.uvst[0].uvtw";
connectAttr "Shed2_2:groupId1.id" "Shed2_2:MeshShape.iog.og[0].gid";
connectAttr "Shed2_2:Shed2_2.mwc" "Shed2_2:MeshShape.iog.og[0].gco";
connectAttr "shed2_2bk:groupId1.id" "shed2_2bk:MeshShape.iog.og[0].gid";
connectAttr "shed2_2bk:shed2_2bk.mwc" "shed2_2bk:MeshShape.iog.og[0].gco";
connectAttr "polyTweakUV2.out" "Shed2_5:MeshShape.i";
connectAttr "polyTweakUV2.uvtk[0]" "Shed2_5:MeshShape.uvst[0].uvtw";
connectAttr "Shed2_6:groupId1.id" "Shed2_6:MeshShape.iog.og[0].gid";
connectAttr "Shed2_6:Shed2_6.mwc" "Shed2_6:MeshShape.iog.og[0].gco";
connectAttr "shed2_21:groupId1.id" "shed2_21:MeshShape.iog.og[0].gid";
connectAttr "shed2_21:shed2_21.mwc" "shed2_21:MeshShape.iog.og[0].gco";
connectAttr "shed2_21bk:groupId1.id" "shed2_21bk:MeshShape.iog.og[0].gid";
connectAttr "shed2_21bk:shed2_21bk.mwc" "shed2_21bk:MeshShape.iog.og[0].gco";
connectAttr "shedbase2:groupId1.id" "shedbase2:MeshShape.iog.og[0].gid";
connectAttr "shedbase2:shedbase2.mwc" "shedbase2:MeshShape.iog.og[0].gco";
connectAttr "shedleg2:groupId1.id" "shedleg2:MeshShape.iog.og[0].gid";
connectAttr "shedleg2:shedleg2.mwc" "shedleg2:MeshShape.iog.og[0].gco";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Shed2_1:Shed2_1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Shed2_2:Shed2_2.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shed2_2bk:shed2_2bk.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Shed2_5:Shed2_5.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Shed2_6:Shed2_6.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shed2_21:shed2_21.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shed2_21bk:shed2_21bk.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shedbase2:shedbase2.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shedleg2:shedleg2.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Shed2_1:Shed2_1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Shed2_2:Shed2_2.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shed2_2bk:shed2_2bk.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Shed2_5:Shed2_5.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Shed2_6:Shed2_6.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shed2_21:shed2_21.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shed2_21bk:shed2_21bk.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shedbase2:shedbase2.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shedleg2:shedleg2.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "Shed2_1:Shed2_2.oc" "Shed2_1:Shed2_1.ss";
connectAttr "Shed2_1:Shed2_1.msg" "Shed2_1:materialInfo1.sg";
connectAttr "Shed2_1:Shed2_2.msg" "Shed2_1:materialInfo1.m";
connectAttr "Shed2_2:Shed2_3.oc" "Shed2_2:Shed2_2.ss";
connectAttr "Shed2_2:groupId1.msg" "Shed2_2:Shed2_2.gn" -na;
connectAttr "Shed2_2:MeshShape.iog.og[0]" "Shed2_2:Shed2_2.dsm" -na;
connectAttr "Shed2_2:Shed2_2.msg" "Shed2_2:materialInfo1.sg";
connectAttr "Shed2_2:Shed2_3.msg" "Shed2_2:materialInfo1.m";
connectAttr "shed2_2bk:shed2_2bk1.oc" "shed2_2bk:shed2_2bk.ss";
connectAttr "shed2_2bk:groupId1.msg" "shed2_2bk:shed2_2bk.gn" -na;
connectAttr "shed2_2bk:MeshShape.iog.og[0]" "shed2_2bk:shed2_2bk.dsm" -na;
connectAttr "shed2_2bk:shed2_2bk.msg" "shed2_2bk:materialInfo1.sg";
connectAttr "shed2_2bk:shed2_2bk1.msg" "shed2_2bk:materialInfo1.m";
connectAttr "Shed2_5:Shed2_6.oc" "Shed2_5:Shed2_5.ss";
connectAttr "Shed2_5:Shed2_5.msg" "Shed2_5:materialInfo1.sg";
connectAttr "Shed2_5:Shed2_6.msg" "Shed2_5:materialInfo1.m";
connectAttr "Shed2_6:Shed2_7.oc" "Shed2_6:Shed2_6.ss";
connectAttr "Shed2_6:groupId1.msg" "Shed2_6:Shed2_6.gn" -na;
connectAttr "Shed2_6:MeshShape.iog.og[0]" "Shed2_6:Shed2_6.dsm" -na;
connectAttr "Shed2_6:Shed2_6.msg" "Shed2_6:materialInfo1.sg";
connectAttr "Shed2_6:Shed2_7.msg" "Shed2_6:materialInfo1.m";
connectAttr "shed2_21:shed2_22.oc" "shed2_21:shed2_21.ss";
connectAttr "shed2_21:groupId1.msg" "shed2_21:shed2_21.gn" -na;
connectAttr "shed2_21:MeshShape.iog.og[0]" "shed2_21:shed2_21.dsm" -na;
connectAttr "shed2_21:shed2_21.msg" "shed2_21:materialInfo1.sg";
connectAttr "shed2_21:shed2_22.msg" "shed2_21:materialInfo1.m";
connectAttr "shed2_21bk:shed2_21bk1.oc" "shed2_21bk:shed2_21bk.ss";
connectAttr "shed2_21bk:groupId1.msg" "shed2_21bk:shed2_21bk.gn" -na;
connectAttr "shed2_21bk:MeshShape.iog.og[0]" "shed2_21bk:shed2_21bk.dsm" -na;
connectAttr "shed2_21bk:shed2_21bk.msg" "shed2_21bk:materialInfo1.sg";
connectAttr "shed2_21bk:shed2_21bk1.msg" "shed2_21bk:materialInfo1.m";
connectAttr "shedbase2:shedbase3.oc" "shedbase2:shedbase2.ss";
connectAttr "shedbase2:groupId1.msg" "shedbase2:shedbase2.gn" -na;
connectAttr "shedbase2:MeshShape.iog.og[0]" "shedbase2:shedbase2.dsm" -na;
connectAttr "shedbase2:shedbase2.msg" "shedbase2:materialInfo1.sg";
connectAttr "shedbase2:shedbase3.msg" "shedbase2:materialInfo1.m";
connectAttr "shedleg2:shedleg3.oc" "shedleg2:shedleg2.ss";
connectAttr "shedleg2:groupId1.msg" "shedleg2:shedleg2.gn" -na;
connectAttr "shedleg2:MeshShape.iog.og[0]" "shedleg2:shedleg2.dsm" -na;
connectAttr "shedleg2:shedleg2.msg" "shedleg2:materialInfo1.sg";
connectAttr "shedleg2:shedleg3.msg" "shedleg2:materialInfo1.m";
connectAttr "file1.oc" "lambert2.c";
connectAttr "lambert2.oc" "lambert2SG.ss";
connectAttr "Shed2_1:MeshShape.iog" "lambert2SG.dsm" -na;
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
connectAttr "polySurfaceShape1.o" "polyAutoProj1.ip";
connectAttr "Shed2_1:MeshShape.wm" "polyAutoProj1.mp";
connectAttr "polyAutoProj1.out" "polyTweakUV1.ip";
connectAttr "file2.oc" "lambert3.c";
connectAttr "lambert3.oc" "lambert3SG.ss";
connectAttr "Shed2_5:MeshShape.iog" "lambert3SG.dsm" -na;
connectAttr "lambert3SG.msg" "materialInfo2.sg";
connectAttr "lambert3.msg" "materialInfo2.m";
connectAttr "file2.msg" "materialInfo2.t" -na;
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
connectAttr "polySurfaceShape2.o" "polyCylProj1.ip";
connectAttr "Shed2_5:MeshShape.wm" "polyCylProj1.mp";
connectAttr "polyCylProj1.out" "deleteComponent1.ig";
connectAttr "deleteComponent1.og" "polyPlanarProj1.ip";
connectAttr "Shed2_5:MeshShape.wm" "polyPlanarProj1.mp";
connectAttr "polyPlanarProj1.out" "polyTweakUV2.ip";
connectAttr "Shed2_1:Shed2_1.pa" ":renderPartition.st" -na;
connectAttr "Shed2_2:Shed2_2.pa" ":renderPartition.st" -na;
connectAttr "shed2_2bk:shed2_2bk.pa" ":renderPartition.st" -na;
connectAttr "Shed2_5:Shed2_5.pa" ":renderPartition.st" -na;
connectAttr "Shed2_6:Shed2_6.pa" ":renderPartition.st" -na;
connectAttr "shed2_21:shed2_21.pa" ":renderPartition.st" -na;
connectAttr "shed2_21bk:shed2_21bk.pa" ":renderPartition.st" -na;
connectAttr "shedbase2:shedbase2.pa" ":renderPartition.st" -na;
connectAttr "shedleg2:shedleg2.pa" ":renderPartition.st" -na;
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "Shed2_1:Shed2_2.msg" ":defaultShaderList1.s" -na;
connectAttr "Shed2_2:Shed2_3.msg" ":defaultShaderList1.s" -na;
connectAttr "shed2_2bk:shed2_2bk1.msg" ":defaultShaderList1.s" -na;
connectAttr "Shed2_5:Shed2_6.msg" ":defaultShaderList1.s" -na;
connectAttr "Shed2_6:Shed2_7.msg" ":defaultShaderList1.s" -na;
connectAttr "shed2_21:shed2_22.msg" ":defaultShaderList1.s" -na;
connectAttr "shed2_21bk:shed2_21bk1.msg" ":defaultShaderList1.s" -na;
connectAttr "shedbase2:shedbase3.msg" ":defaultShaderList1.s" -na;
connectAttr "shedleg2:shedleg3.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert3.msg" ":defaultShaderList1.s" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of shed2.ma
