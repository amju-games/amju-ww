//Maya ASCII 2012 scene
//Name: field_2x2.ma
//Last modified: Sun, Jan 19, 2014 01:25:11 PM
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
	setAttr ".t" -type "double3" 553.15092415818538 866.52899109722773 751.86643894738461 ;
	setAttr ".r" -type "double3" -45.938352729602997 37.799999999996302 -2.0126143805002646e-15 ;
	setAttr ".rp" -type "double3" 7.1054273576010019e-15 -1.9539925233402755e-14 7.1054273576010019e-15 ;
	setAttr ".rpt" -type "double3" 2.1968924878205156e-14 -3.7612382976441285e-14 -3.942383094715046e-13 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999979;
	setAttr ".coi" 1411.9515828157639;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -81.527706266159171 -424.24722829228415 2.8037147455187892 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.10000000000005 2.2226664952982613e-14 ;
	setAttr ".r" -type "double3" -89.999999999999972 0 0 ;
	setAttr ".rp" -type "double3" 0 3.1554436208897869e-30 -1.4210854715202004e-14 ;
	setAttr ".rpt" -type "double3" 0 -1.421085471520201e-14 1.4210854715202016e-14 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.10000000000008;
	setAttr ".ow" 2756.7426027755955;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".tp" -type "double3" 0 -2.8421709430404007e-14 -1.3019360379767579e-26 ;
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -102.3025397654816 -0.1714230968702628 805.04658250315254 ;
	setAttr ".rpt" -type "double3" 0 -1.5526219415791109e-14 1.2848846766466393e-14 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 692.8203230275509;
	setAttr ".ow" 35.286222158615587;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" -1.5383701491068511e-13 5.8659883797390528e-11 0 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 511.28211747512034 -1.0644927599677247 -97.570872184984665 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
	setAttr ".rpt" -type "double3" 2.4565361851213581e-15 -1.1777647162931662e-14 -1.8183769399920443e-14 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 296.68067380699006;
	setAttr ".ow" 33.410509047267858;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".tp" -type "double3" -147.82960419966915 -135.00027245402069 -147.82960419966986 ;
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "block_rect_curved_1x1:plat_rect_1x1_std:Mesh";
	setAttr ".s" -type "double3" 2 3.9388661181301674 2 ;
	setAttr ".rp" -type "double3" 0 12.439055043289681 0 ;
	setAttr ".sp" -type "double3" 0 12.439055043289681 0 ;
createNode mesh -n "block_rect_curved_1x1:polySurfaceShape1" -p "block_rect_curved_1x1:plat_rect_1x1_std:Mesh";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".pv" -type "double2" 0.50179275870323181 0.5003928542137146 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 129 ".uvst[0].uvsp[0:128]" -type "float2" 0.0073465002 0.005442977
		 0.9932794 0.0054430161 0.15334548 0.1538451 0.84852403 0.15384521 0.76162666 0.15384518
		 0.67472941 0.15384516 0.58783203 0.15384522 0.50093478 0.15384518 0.41403741 0.15384524
		 0.32714003 0.15384521 0.24024287 0.15384516 0.41373926 0.67516243 0.50063658 0.67516243
		 0.50063658 0.76205969 0.41373926 0.76205969 0.50063658 0.58826506 0.41373926 0.58826506
		 0.58753383 0.67516243 0.58753383 0.76205969 0.50063658 0.84895706 0.41373926 0.84895706
		 0.32684204 0.76205969 0.32684204 0.67516243 0.58753383 0.58826506 0.32684204 0.58826506
		 0.41373926 0.50136781 0.50063658 0.50136781 0.67443126 0.67516243 0.67443126 0.76205969
		 0.58753383 0.84895706 0.32684204 0.84895706 0.23994471 0.67516243 0.23994471 0.76205969
		 0.58753383 0.50136781 0.67443126 0.58826506 0.23994471 0.58826506 0.32684204 0.50136781
		 0.50063658 0.41447049 0.41373926 0.41447049 0.76132858 0.67516243 0.76132858 0.76205969
		 0.67443126 0.84895706 0.23994471 0.84895706 0.15304738 0.76205969 0.15304738 0.67516243
		 0.58753383 0.41447049 0.67443126 0.50136781 0.76132858 0.58826506 0.15304738 0.58826506
		 0.23994471 0.50136781 0.32684204 0.41447049 0.41373926 0.32757318 0.50063658 0.32757318
		 0.84822595 0.67516243 0.84822595 0.76205969 0.76132858 0.84895706 0.15304738 0.84895706
		 0.58753383 0.32757318 0.67443126 0.41447049 0.76132858 0.50136781 0.84822595 0.58826506
		 0.15304738 0.50136781 0.23994471 0.41447049 0.32684204 0.32757318 0.50063658 0.24067591
		 0.41373926 0.24067591 0.84822595 0.84895706 0.58753383 0.24067591 0.67443126 0.32757318
		 0.76132858 0.41447049 0.84822595 0.50136781 0.15304738 0.41447049 0.23994471 0.32757318
		 0.32684204 0.24067591 0.41373926 0.15377857 0.50063658 0.15377857 0.58753383 0.15377857
		 0.67443126 0.24067591 0.76132858 0.32757318 0.84822595 0.41447049 0.15304738 0.32757318
		 0.23994471 0.24067591 0.32684204 0.15377857 0.67443126 0.15377857 0.76132858 0.24067591
		 0.84822595 0.32757318 0.15304738 0.24067591 0.23994471 0.15377857 0.76132858 0.15377857
		 0.84822595 0.24067591 0.15304738 0.15377857 0.84822595 0.15377857 0.15276965 0.84988523
		 0.23966718 0.84988523 0.32656437 0.84988487 0.41346163 0.84988487 0.500359 0.84988499
		 0.58725643 0.84988499 0.67415369 0.84988499 0.761051 0.84988505 0.84794831 0.84988505
		 0.003816545 0.99750662 0.99976897 0.99750662 0.079992235 0.032692075 0.056360185
		 0.032692075 0.079992235 0.010013342 0.056360185 0.010013342 0.99435437 0.0032790899
		 0.99435437 0.99277353 0.84848893 0.15459162 0.84848893 0.84977019 0.84848893 0.76287311
		 0.84848893 0.67597544 0.84848893 0.58907825 0.84848893 0.50218087 0.84848893 0.41528353
		 0.84848893 0.32838619 0.84848893 0.24148881 0.0069409311 0.99652088 0.0069409311
		 0.0048109293 0.15296206 0.84915066 0.15296224 0.15397191 0.15296215 0.24086905 0.15296215
		 0.32776642 0.15296215 0.41466385 0.15296206 0.50156122 0.15296206 0.58845842 0.15296206
		 0.67535573 0.15296206 0.76225322;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 85 ".vt[0:84]"  -50 -37.67844772 50 50 -37.67844772 50 -50 12.5 50
		 50 12.5 50 -50 12.5 -50 50 12.5 -50 -50 -37.67844772 -50 50 -37.67844772 -50 0 34.47094727 0
		 -50 12.5 0 0 12.5 50 50 12.5 0 0 12.5 -50 -25 23.482687 -25 -25 12.5 -50 -50 12.5 -25
		 -25 27.86803627 0 0 27.86803627 -25 -25 23.482687 25 -50 12.5 25 -25 12.5 50 0 27.86803627 25
		 25 23.482687 25 25 12.5 50 50 12.5 25 25 27.86803627 0 25 23.482687 -25 50 12.5 -25
		 25 12.5 -50 -12.5 20.11355591 -37.5 0 20.65644646 -37.5 -12.5 12.5 -50 -25 18.51164246 -37.5
		 -12.5 26.73765182 -25 -37.5 20.11355591 12.5 -37.5 20.65644646 0 -50 12.5 12.5 -37.5 18.51164246 25
		 -25 26.73765182 12.5 12.5 20.11355591 37.5 0 20.65644646 37.5 12.5 12.5 50 25 18.51164246 37.5
		 12.5 26.73765182 25 37.5 20.11355591 -12.5 37.5 20.65644646 0 50 12.5 -12.5 37.5 18.51164246 -25
		 25 26.73765182 -12.5 -37.5 15.93098354 -37.5 -37.5 12.5 -50 -50 12.5 -37.5 -37.5 18.51164246 -25
		 -37.5 20.11355591 -12.5 -50 12.5 -12.5 -25 26.73765182 -12.5 -12.5 31.18798828 -12.5
		 -12.5 32.75074768 0 0 32.75074768 -12.5 -37.5 15.93098354 37.5 -50 12.5 37.5 -37.5 12.5 50
		 -25 18.51164246 37.5 -12.5 20.11355591 37.5 -12.5 12.5 50 -12.5 26.73765182 25 -12.5 31.18798828 12.5
		 0 32.75074768 12.5 37.5 15.93098354 37.5 37.5 12.5 50 50 12.5 37.5 37.5 18.51164246 25
		 37.5 20.11355591 12.5 50 12.5 12.5 25 26.73765182 12.5 12.5 31.18798828 12.5 12.5 32.75074768 0
		 37.5 15.93098354 -37.5 50 12.5 -37.5 37.5 12.5 -50 25 18.51164246 -37.5 12.5 20.11355591 -37.5
		 12.5 12.5 -50 12.5 26.73765182 -25 12.5 31.18798828 -12.5;
	setAttr -s 249 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 0 0 1 3 0 3 69 0 4 51 0 3 70 0 5 79 0
		 5 6 0 6 4 0 5 7 0 7 6 0 7 0 0 0 6 0 7 1 0 7 3 0 0 4 0 9 36 0 10 64 0 11 46 0 12 31 0
		 9 35 0 10 40 0 11 45 0 12 30 0 14 50 0 15 54 0 16 57 1 17 58 1 14 32 0 15 52 0 16 55 1
		 17 33 1 19 60 0 20 61 0 21 67 1 19 37 0 20 62 0 21 65 1 16 38 1 23 41 0 24 73 0 25 76 1
		 23 42 0 24 71 0 25 74 1 21 43 1 27 78 0 28 82 0 27 47 0 28 80 0 17 83 1 25 48 1 30 17 1
		 31 14 0 32 13 1 33 13 1 30 29 1 31 29 0 32 29 1 33 29 1 35 16 1 36 19 0 37 18 1 38 18 1
		 35 34 1 36 34 0 37 34 1 38 34 1 40 21 1 41 10 0 42 22 1 43 22 1 40 39 1 41 39 0 42 39 1
		 43 39 1 45 25 1 46 27 0 47 26 1 48 26 1 45 44 1 46 44 0 47 44 1 48 44 1 50 4 0 51 15 0
		 52 13 1 50 49 0 51 49 0 52 49 1 32 49 1 54 9 0 55 13 1 54 53 0 35 53 1 55 53 1 52 53 1
		 57 8 1 58 8 1 57 56 1 58 56 1 33 56 1 55 56 1 60 2 0 61 2 0 62 18 1 60 59 0 61 59 0
		 62 59 1 37 59 1 64 20 0 65 18 1 64 63 0 40 63 1 65 63 1 62 63 1 67 8 1 67 66 1 57 66 1
		 38 66 1 65 66 1 69 23 0 70 24 0 71 22 1 69 68 0 70 68 0 71 68 1 42 68 1 73 11 0 74 22 1
		 73 72 0 45 72 1 74 72 1 71 72 1 76 8 1 76 75 1 67 75 1 43 75 1 74 75 1 78 5 0 79 28 0
		 80 26 1 78 77 0 79 77 0 80 77 1 47 77 1 82 12 0 83 26 1 82 81 0 30 81 1 83 81 1 80 81 1
		 58 84 1 76 84 1 48 84 1 83 84 1 1 61 0 1 20 0 1 64 0 1 10 0 1 41 0 1 23 0 1 69 0
		 30 33 1 6 79 0;
	setAttr ".ed[166:248]" 6 28 0 6 82 0 6 12 0 6 31 0 6 14 0 6 50 0 7 70 0 7 24 0
		 7 73 0 7 11 0 7 46 0 7 27 0 7 78 0 0 51 0 0 15 0 0 54 0 0 9 0 0 36 0 0 19 0 0 60 0
		 35 38 1 40 43 1 45 48 1 14 49 0 54 52 0 16 56 1 19 59 0 64 62 0 21 66 1 23 68 0 73 71 0
		 25 75 1 27 77 0 82 80 0 17 84 1 12 29 0 32 31 0 13 29 1 9 34 0 37 36 0 18 34 1 10 39 0
		 42 41 0 22 39 1 11 44 0 47 46 0 26 44 1 51 50 0 15 49 0 32 52 1 9 53 0 55 35 1 13 53 1
		 58 57 1 17 56 1 55 33 1 61 60 0 20 59 0 37 62 1 10 63 0 65 40 1 18 63 1 57 67 1 16 66 1
		 65 38 1 70 69 0 24 68 0 42 71 1 11 72 0 74 45 1 22 72 1 67 76 1 21 75 1 74 43 1 79 78 0
		 28 77 0 47 80 1 12 81 0 83 30 1 26 81 1 76 58 1 25 84 1 83 48 1;
	setAttr -s 283 ".n";
	setAttr ".n[0:165]" -type "float3"  1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 0 1 0 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 0 1 0 0 1 0 0 1 0 0 1 0 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 0 1 0 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 0 1
		 0 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 0 1 0 0 1 0 0 1 0 0 1 0 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 0 1 0 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 0 1 0 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 0 1 0 0 1 0;
	setAttr ".n[166:282]" -type "float3"  0 1 0 0 1 0 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 0 1 0 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 0 1 0 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 0 1 0 0 1 0 0 1 0 0 1
		 0 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 0 1 0 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20
		 1e+20 1e+20 1e+20 1e+20 1e+20 0 1 0 1e+20 1e+20 1e+20 0 1 0 0 1 0 0 1 0 1e+20 1e+20
		 1e+20 0 1 0 0 1 0 1e+20 1e+20 1e+20 0 1 0 1e+20 1e+20 1e+20 0 1 0 0 1 0 0 1 0 1e+20
		 1e+20 1e+20 0 1 0 0 1 0 1e+20 1e+20 1e+20 0 1 0 1e+20 1e+20 1e+20 0 1 0 0 1 0 0 1
		 0 1e+20 1e+20 1e+20 0 1 0 0 1 0 1e+20 1e+20 1e+20 0 1 0 1e+20 1e+20 1e+20 0 1 0 0
		 1 0 0 1 0 1e+20 1e+20 1e+20 0 1 0 0 1 0 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 0 1 0
		 0 1 0 0 1 0 0 1 0 1e+20 1e+20 1e+20 0 1 0 0 1 0 1e+20 1e+20 1e+20 0 1 0 0 1 0 0 1
		 0 1e+20 1e+20 1e+20 0 1 0 1e+20 1e+20 1e+20 1e+20 1e+20 1e+20 0 1 0 0 1 0 0 1 0 0
		 1 0 1e+20 1e+20 1e+20 0 1 0 0 1 0 1e+20 1e+20 1e+20 0 1 0 0 1 0 0 1 0 1e+20 1e+20
		 1e+20 0 1 0 1e+20 1e+20 1e+20 0 1 0 0 1 0 0 1 0 0 1 0 1e+20 1e+20 1e+20 0 1 0 0 1
		 0 1e+20 1e+20 1e+20 0 1 0 0 1 0 0 1 0 1e+20 1e+20 1e+20 0 1 0 1e+20 1e+20 1e+20 0
		 1 0 0 1 0 0 1 0 0 1 0 1e+20 1e+20 1e+20 0 1 0 0 1 0 1e+20 1e+20 1e+20 0 1 0 0 1 0
		 0 1 0 1e+20 1e+20 1e+20 0 1 0;
	setAttr -s 166 ".fc[0:165]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 0 1 2
		f 3 -2 157 105
		mu 0 3 2 1 10
		f 3 -158 158 34
		mu 0 3 10 1 9
		f 3 -159 159 111
		mu 0 3 9 1 8
		f 3 -160 160 18
		mu 0 3 8 1 7
		f 3 -161 161 70
		mu 0 3 7 1 6
		f 3 -162 162 40
		mu 0 3 6 1 5
		f 3 -163 163 122
		mu 0 3 5 1 4
		f 3 3 4 -164
		mu 0 3 1 3 4
		f 3 -54 164 -33
		mu 0 3 12 13 11
		f 3 -165 57 -61
		mu 0 3 11 13 14
		f 3 8 165 -8
		mu 0 3 100 101 99
		f 3 -166 166 -142
		mu 0 3 99 101 98
		f 3 -167 167 -49
		mu 0 3 98 101 97
		f 3 -168 168 -148
		mu 0 3 97 101 96
		f 3 -169 169 -21
		mu 0 3 96 101 95
		f 3 -170 170 -55
		mu 0 3 95 101 94
		f 3 -171 171 -26
		mu 0 3 94 101 93
		f 3 -86 -172 9
		mu 0 3 92 93 101
		f 3 -9 10 11
		mu 0 3 101 100 102
		f 3 -12 12 13
		mu 0 3 103 104 105
		f 3 -13 14 -1
		mu 0 3 105 104 106
		f 3 -15 15 -4
		mu 0 3 107 108 109
		f 3 -16 172 -7
		mu 0 3 109 108 117
		f 3 -173 173 -124
		mu 0 3 117 108 116
		f 3 -174 174 -42
		mu 0 3 116 108 115
		f 3 -175 175 -130
		mu 0 3 115 108 114
		f 3 -176 176 -20
		mu 0 3 114 108 113
		f 3 -177 177 -79
		mu 0 3 113 108 112
		f 3 -178 178 -48
		mu 0 3 112 108 111
		f 3 -11 -141 -179
		mu 0 3 108 110 111
		f 3 -14 16 -10
		mu 0 3 118 119 120
		f 3 -17 179 -6
		mu 0 3 120 119 128
		f 3 -180 180 -87
		mu 0 3 128 119 127
		f 3 -181 181 -27
		mu 0 3 127 119 126
		f 3 -182 182 -93
		mu 0 3 126 119 125
		f 3 -183 183 -18
		mu 0 3 125 119 124
		f 3 -184 184 -63
		mu 0 3 124 119 123
		f 3 -185 185 -34
		mu 0 3 123 119 122
		f 3 -3 -105 -186
		mu 0 3 119 121 122
		f 3 -62 186 -40
		mu 0 3 36 49 50
		f 3 -187 65 -69
		mu 0 3 50 49 62
		f 3 -70 187 -47
		mu 0 3 52 64 57
		f 3 -188 73 -77
		mu 0 3 57 64 67
		f 3 -78 188 -53
		mu 0 3 46 59 34
		f 3 -189 81 -85
		mu 0 3 34 59 47
		f 3 -30 189 -92
		mu 0 3 21 30 32
		f 3 -190 25 88
		mu 0 3 32 30 42
		f 3 26 190 -31
		mu 0 3 44 48 31
		f 3 -191 94 -98
		mu 0 3 31 48 35
		f 3 -32 191 -104
		mu 0 3 24 36 16
		f 3 -192 27 100
		mu 0 3 16 36 25
		f 3 -37 192 -111
		mu 0 3 72 80 81
		f 3 -193 33 107
		mu 0 3 81 80 86
		f 3 -112 193 -38
		mu 0 3 82 74 73
		f 3 -194 113 -117
		mu 0 3 73 74 65
		f 3 -39 194 -122
		mu 0 3 51 52 38
		f 3 -195 35 118
		mu 0 3 38 52 37
		f 3 -44 195 -129
		mu 0 3 77 83 84
		f 3 -196 -123 125
		mu 0 3 84 83 88
		f 3 41 196 -45
		mu 0 3 85 79 78
		f 3 -197 131 -135
		mu 0 3 78 79 69
		f 3 -46 197 -140
		mu 0 3 58 46 45
		f 3 -198 42 136
		mu 0 3 45 46 33
		f 3 -50 198 -147
		mu 0 3 39 53 40
		f 3 -199 47 143
		mu 0 3 40 53 54
		f 3 48 199 -51
		mu 0 3 41 29 28
		f 3 -200 149 -153
		mu 0 3 28 29 18
		f 3 -52 200 -157
		mu 0 3 17 12 23
		f 3 -201 28 153
		mu 0 3 23 12 15
		f 3 -25 201 -58
		mu 0 3 13 19 14
		f 3 -202 20 58
		mu 0 3 14 19 20
		f 3 29 202 54
		mu 0 3 30 21 20
		f 3 -203 59 -59
		mu 0 3 20 21 14
		f 3 55 203 -60
		mu 0 3 21 22 14
		f 3 -204 -57 60
		mu 0 3 14 22 11
		f 3 -22 204 -66
		mu 0 3 49 61 62
		f 3 -205 17 66
		mu 0 3 62 61 71
		f 3 36 205 62
		mu 0 3 80 72 71
		f 3 -206 67 -67
		mu 0 3 71 72 62
		f 3 63 206 -68
		mu 0 3 72 63 62
		f 3 -207 -65 68
		mu 0 3 62 63 50
		f 3 -23 207 -74
		mu 0 3 64 75 67
		f 3 -208 -71 74
		mu 0 3 67 75 76
		f 3 43 208 -41
		mu 0 3 83 77 76
		f 3 -209 75 -75
		mu 0 3 76 77 67
		f 3 71 209 -76
		mu 0 3 77 68 67
		f 3 -210 -73 76
		mu 0 3 67 68 57
		f 3 -24 210 -82
		mu 0 3 59 70 47
		f 3 -211 19 82
		mu 0 3 47 70 60
		f 3 49 211 78
		mu 0 3 53 39 60
		f 3 -212 83 -83
		mu 0 3 60 39 47
		f 3 79 212 -84
		mu 0 3 39 27 47
		f 3 -213 -81 84
		mu 0 3 47 27 34
		f 3 5 213 85
		mu 0 3 56 43 42
		f 3 -214 89 -89
		mu 0 3 42 43 32
		f 3 86 214 -90
		mu 0 3 43 44 32
		f 3 -215 30 90
		mu 0 3 32 44 31
		f 3 -56 215 87
		mu 0 3 22 21 31
		f 3 -216 91 -91
		mu 0 3 31 21 32
		f 3 92 216 -95
		mu 0 3 48 61 35
		f 3 -217 21 95
		mu 0 3 35 61 49
		f 3 31 217 61
		mu 0 3 36 24 49
		f 3 -218 96 -96
		mu 0 3 49 24 35
		f 3 93 218 -97
		mu 0 3 24 22 35
		f 3 -219 -88 97
		mu 0 3 35 22 31
		f 3 -100 219 98
		mu 0 3 26 15 25
		f 3 -220 101 -101
		mu 0 3 25 15 16
		f 3 -29 220 -102
		mu 0 3 15 12 16
		f 3 -221 32 102
		mu 0 3 16 12 11
		f 3 -94 221 56
		mu 0 3 22 24 11
		f 3 -222 103 -103
		mu 0 3 11 24 16
		f 3 -106 222 104
		mu 0 3 90 87 86
		f 3 -223 108 -108
		mu 0 3 86 87 81
		f 3 -35 223 -109
		mu 0 3 87 82 81
		f 3 -224 37 109
		mu 0 3 81 82 73
		f 3 -64 224 106
		mu 0 3 63 72 73
		f 3 -225 110 -110
		mu 0 3 73 72 81
		f 3 -19 225 -114
		mu 0 3 74 75 65
		f 3 -226 22 114
		mu 0 3 65 75 64
		f 3 38 226 69
		mu 0 3 52 51 64
		f 3 -227 115 -115
		mu 0 3 64 51 65
		f 3 112 227 -116
		mu 0 3 51 63 65
		f 3 -228 -107 116
		mu 0 3 65 63 73
		f 3 -99 228 117
		mu 0 3 26 25 37
		f 3 -229 119 -119
		mu 0 3 37 25 38
		f 3 -28 229 -120
		mu 0 3 25 36 38
		f 3 -230 39 120
		mu 0 3 38 36 50
		f 3 -113 230 64
		mu 0 3 63 51 50
		f 3 -231 121 -121
		mu 0 3 50 51 38
		f 3 6 231 -5
		mu 0 3 91 89 88
		f 3 -232 126 -126
		mu 0 3 88 89 84
		f 3 123 232 -127
		mu 0 3 89 85 84
		f 3 -233 44 127
		mu 0 3 84 85 78
		f 3 -72 233 124
		mu 0 3 68 77 78
		f 3 -234 128 -128
		mu 0 3 78 77 84
		f 3 129 234 -132
		mu 0 3 79 70 69
		f 3 -235 23 132
		mu 0 3 69 70 59
		f 3 45 235 77
		mu 0 3 46 58 59
		f 3 -236 133 -133
		mu 0 3 59 58 69
		f 3 130 236 -134
		mu 0 3 58 68 69
		f 3 -237 -125 134
		mu 0 3 69 68 78
		f 3 -118 237 135
		mu 0 3 26 37 33
		f 3 -238 137 -137
		mu 0 3 33 37 45
		f 3 -36 238 -138
		mu 0 3 37 52 45
		f 3 -239 46 138
		mu 0 3 45 52 57
		f 3 -131 239 72
		mu 0 3 68 58 57
		f 3 -240 139 -139
		mu 0 3 57 58 45
		f 3 7 240 140
		mu 0 3 66 55 54
		f 3 -241 144 -144
		mu 0 3 54 55 40
		f 3 141 241 -145
		mu 0 3 55 41 40
		f 3 -242 50 145
		mu 0 3 40 41 28
		f 3 -80 242 142
		mu 0 3 27 39 28
		f 3 -243 146 -146
		mu 0 3 28 39 40
		f 3 147 243 -150
		mu 0 3 29 19 18
		f 3 -244 24 150
		mu 0 3 18 19 13
		f 3 51 244 53
		mu 0 3 12 17 13
		f 3 -245 151 -151
		mu 0 3 13 17 18
		f 3 148 245 -152
		mu 0 3 17 27 18
		f 3 -246 -143 152
		mu 0 3 18 27 28
		f 3 -136 246 99
		mu 0 3 26 33 15
		f 3 -247 154 -154
		mu 0 3 15 33 23
		f 3 -43 247 -155
		mu 0 3 33 46 23
		f 3 -248 52 155
		mu 0 3 23 46 34
		f 3 -149 248 80
		mu 0 3 27 17 34
		f 3 -249 156 -156
		mu 0 3 34 17 23;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".ndt" 2;
	setAttr ".dn" yes;
createNode transform -n "polySurface1" -p "block_rect_curved_1x1:plat_rect_1x1_std:Mesh";
createNode transform -n "transform5" -p "polySurface1";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape1" -p "transform5";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.62503182888031006 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".bw" 3;
createNode transform -n "polySurface2" -p "block_rect_curved_1x1:plat_rect_1x1_std:Mesh";
createNode transform -n "polySurface3" -p "polySurface2";
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
createNode transform -n "polySurface4" -p "polySurface2";
createNode transform -n "transform3" -p "polySurface4";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape4" -p "transform3";
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
createNode transform -n "transform2" -p "polySurface2";
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
createNode transform -n "polySurface5";
	setAttr ".s" -type "double3" 4 1 4 ;
createNode transform -n "polySurface7" -p "polySurface5";
	setAttr ".s" -type "double3" 0.5 9.9999999999999998e-13 0.5 ;
createNode transform -n "transform6" -p "polySurface7";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape7" -p "transform6";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" -0.066271781921386719 -0.025247838229549346 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 77 ".pt";
	setAttr ".pt[0:34]" -type "float3" 0 -4.8256139e+13 0  0 -4.8256139e+13 
		0  0 -4.8256139e+13 0  0 -4.8256139e+13 0  0 5.4209137 0  0 -4.8256139e+13 0  0 -4.8256139e+13 
		0  0 -4.8256139e+13 0  0 -4.8256139e+13 0  0 5.4209137 0  0 -4.8256139e+13 0  0 -4.8256139e+13 
		0  0 5.4209137 0  0 5.4209137 0  0 5.4209137 0  0 -4.8256139e+13 0  0 -4.8256139e+13 
		0  0 5.4209137 0  0 5.4209137 0  0 -4.8256139e+13 0  0 -4.8256139e+13 0  0 5.4209137 
		0  0 5.4209137 0  0 -4.8256139e+13 0  0 -4.8256139e+13 0  0 0 0  0 0 0  0 -4.8256139e+13 
		0  0 0 0  0 5.4209137 0  0 0 0  0 0 0  0 -4.8256139e+13 0  0 0 0  0 5.4209137 0 ;
	setAttr ".pt[37:57]" -type "float3" 0 -4.8256139e+13 0  0 0 0  0 5.4209137 
		0  0 0 0  0 0 0  0 -4.8256139e+13 0  0 0 0  0 5.4209137 0  0 0 0  0 -4.8256139e+13 
		0  0 -4.8256139e+13 0  0 0 0  0 0 0  0 -4.8256139e+13 0  0 5.4209137 0  0 5.4209137 
		0  0 5.4209137 0  0 5.4209137 0  0 0 0  0 -4.8256139e+13 0  0 -4.8256139e+13 0 ;
	setAttr ".pt[60:80]" -type "float3" 0 -4.8256139e+13 0  0 5.4209137 0  0 
		5.4209137 0  0 5.4209137 0  0 0 0  0 -4.8256139e+13 0  0 -4.8256139e+13 0  0 0 0  
		0 0 0  0 -4.8256139e+13 0  0 5.4209137 0  0 5.4209137 0  0 5.4209137 0  0 0 0  0 
		-4.8256139e+13 0  0 -4.8256139e+13 0  0 0 0  0 0 0  0 -4.8256139e+13 0  0 5.4209137 
		0  0 5.4209137 0 ;
	setAttr ".ndt" 2;
	setAttr ".dn" yes;
createNode transform -n "pCube1";
	setAttr ".t" -type "double3" 0 -450.06022518984406 0 ;
	setAttr ".s" -type "double3" 0.5 1 0.5 ;
createNode transform -n "transform7" -p "pCube1";
	setAttr ".v" no;
createNode mesh -n "pCubeShape1" -p "transform7";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5024724006652832 0.24800565000623465 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "polySurface8";
	setAttr ".s" -type "double3" 0.5 1 0.5 ;
createNode transform -n "polySurface9" -p "polySurface8";
createNode transform -n "transform10" -p "polySurface9";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape9" -p "transform10";
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
	setAttr -s 4 ".pt[2:5]" -type "float3"  0 1.4051628 0 0 1.4051628 
		0 0 1.4051628 0 0 1.4051628 0;
createNode transform -n "transform8" -p "polySurface8";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape8" -p "transform8";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.24531529124902196 0.20555736750972531 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ndt" 2;
	setAttr ".dn" yes;
createNode transform -n "pCube2";
	setAttr ".t" -type "double3" -6.3503242438998484 -13.729853923435449 5.2079887323351954 ;
createNode transform -n "transform9" -p "pCube2";
	setAttr ".v" no;
createNode mesh -n "pCubeShape2" -p "transform9";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.74234551191329956 0.74428841471672058 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "polySurface10";
	setAttr ".s" -type "double3" 2 1 2 ;
createNode transform -n "polySurface11" -p "polySurface10";
createNode mesh -n "polySurfaceShape11" -p "polySurface11";
	setAttr -k off ".v";
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "polySurface12" -p "polySurface10";
createNode mesh -n "polySurfaceShape12" -p "polySurface12";
	setAttr -k off ".v";
	setAttr -s 2 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.45383896702406323 0.47886239376603346 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "transform11" -p "polySurface10";
	setAttr ".v" no;
createNode mesh -n "polySurfaceShape10" -p "transform11";
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
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 10 ".lnk";
	setAttr -s 10 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode script -n "block_rect_curved_1x1:uiConfigurationScriptNode";
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
		+ "                -viewColor 0 0 0 1 \n                $editorName;\nstereoCameraView -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"quad\\\" -ps 1 50 50 -ps 2 50 50 -ps 3 50 50 -ps 4 50 50 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Top View\")) \n\t\t\t\t\t\"modelPanel\"\n"
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
createNode script -n "block_rect_curved_1x1:sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 24 -ast 1 -aet 48 ";
	setAttr ".st" 6;
createNode shadingEngine -n "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_4x4:initialShadingGroup";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_4x4:materialInfo1";
createNode lambert -n "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_4x4:initialShadingGroup1";
createNode shadingEngine -n "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_1x1:initialShadingGroup";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_1x1:materialInfo1";
createNode lambert -n "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_1x1:initialShadingGroup1";
createNode blinn -n "block_rect_curved_1x1:block_rect_curved_hill_4x4:blinn1";
createNode shadingEngine -n "block_rect_curved_1x1:block_rect_curved_hill_4x4:blinn1SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "block_rect_curved_1x1:block_rect_curved_hill_4x4:materialInfo1";
createNode file -n "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1";
createNode place2dTexture -n "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1";
createNode polySoftEdge -n "block_rect_curved_1x1:polySoftEdge1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 23 "e[21:24]" "e[27:32]" "e[35:39]" "e[42:46]" "e[49:53]" "e[55:61]" "e[63:69]" "e[71:77]" "e[79:84]" "e[87:91]" "e[93:103]" "e[106:110]" "e[112:121]" "e[124:128]" "e[130:139]" "e[142:146]" "e[148:156]" "e[164]" "e[186:212]" "e[214:221]" "e[223:230]" "e[232:239]" "e[241:248]";
	setAttr ".ix" -type "matrix" 2 0 0 0 0 3.9388661181301674 0 0 0 0 2 0 0 -36.556717408280221 0 1;
	setAttr ".mp" -type "matrix" 2 0 0 0 0 3.9388661181301674 0 0 0 0 2 0 0 -36.556717408280221 0 1;
	setAttr ".a" 180;
createNode polyExtrudeFace -n "polyExtrudeFace1";
	setAttr ".ics" -type "componentList" 1 "f[20:21]";
	setAttr ".ix" -type "matrix" 2 0 0 0 0 3.9388661181301674 0 0 0 0 2 0 0 -36.556717408280221 0 1;
	setAttr ".ws" yes;
	setAttr ".mp" -type "matrix" 2 0 0 0 0 3.9388661181301674 0 0 0 0 2 0 0 -36.556717408280221 0 1;
	setAttr ".pvt" -type "float3" 0 -184.96707 0 ;
	setAttr ".rs" 990707957;
	setAttr ".lt" -type "double3" 7.1054273576010019e-15 3.7869393872740368e-15 78.945141186597994 ;
	setAttr ".ls" -type "double3" 1 1 1.8921309352045992 ;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -100 -184.96707852967461 -100 ;
	setAttr ".cbx" -type "double3" 100 -184.96707852967461 100 ;
createNode polyTriangulate -n "polyTriangulate1";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyTweak -n "polyTweak1";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk";
	setAttr ".tk[0:1]" -type "float3" 0 44.999981 0  0 44.999981 0 ;
	setAttr ".tk[6:7]" -type "float3" 0 44.999981 0  0 44.999981 0 ;
	setAttr ".tk[85:88]" -type "float3" 0 17.903217 0  0 17.903217 0  0 17.903217 
		0  0 17.903217 0 ;
createNode lambert -n "top_surface";
createNode shadingEngine -n "lambert2SG";
	setAttr ".ihi" 0;
	setAttr -s 8 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 10 ".gn";
createNode materialInfo -n "materialInfo1";
createNode groupId -n "groupId1";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 3 "f[0:8]" "f[11:39]" "f[166:173]";
	setAttr ".irc" -type "componentList" 2 "f[9:10]" "f[40:165]";
createNode groupId -n "groupId3";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "f[9:10]" "f[40:165]";
createNode file -n "file1";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/pz-ground21.png";
createNode place2dTexture -n "place2dTexture1";
createNode file -n "file2";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/pz-ground21.png";
createNode place2dTexture -n "place2dTexture2";
createNode deleteComponent -n "deleteComponent1";
	setAttr ".dc" -type "componentList" 3 "map[101:102]" "map[108]" "map[118]";
createNode deleteComponent -n "deleteComponent2";
	setAttr ".dc" -type "componentList" 3 "map[101:102]" "map[108]" "map[118]";
createNode polyTweakUV -n "polyTweakUV1";
	setAttr ".uopa" yes;
	setAttr -s 117 ".uvtk";
	setAttr ".uvtk[2:100]" -type "float2" -0.18491723 -0.19695577  0.18522376 
		-0.19695576  0.13895613 -0.19695573  0.09268856 -0.19695577  0.046420872 -0.19695571  
		0.00015330315 -0.19695573  -0.046114355 -0.19695567  -0.092382014 -0.19695576  -0.13864952 
		-0.19695577  -0.046273112 0.098102689  -5.4836273e-06 0.098102689  -5.4836273e-06 
		0.1472854  -0.046273112 0.1472854  -5.4836273e-06 0.048920035  -0.046273112 0.048920035  
		0.046262145 0.098102689  0.046262145 0.1472854  -5.4836273e-06 0.19646811  -0.046273112 
		0.19646811  -0.092540652 0.1472854  -0.092540652 0.098102689  0.046262145 0.048920035  
		-0.092540652 0.048920035  -0.046273112 -0.00026267767  -5.4836273e-06 -0.00026267767  
		0.092529833 0.098102689  0.092529833 0.1472854  0.046262145 0.19646811  -0.092540652 
		0.19646811  -0.13880832 0.098102689  -0.13880832 0.1472854  0.046262145 -0.00026267767  
		0.092529833 0.048920035  -0.13880832 0.048920035  -0.092540652 -0.00026267767  -5.4836273e-06 
		-0.049445361  -0.046273112 -0.049445361  0.1387974 0.098102689  0.1387974 0.1472854  
		0.092529833 0.19646811  -0.13880832 0.19646811  -0.18507594 0.1472854  -0.18507594 
		0.098102689  0.046262145 -0.049445361  0.092529833 -0.00026267767  0.1387974 0.048920035  
		-0.18507594 0.048920035  -0.13880832 -0.00026267767  -0.092540652 -0.049445361  -0.046273112 
		-0.098628044  -5.4836273e-06 -0.098628044  0.18506515 0.098102689  0.18506515 0.1472854  
		0.1387974 0.19646811  -0.18507594 0.19646811  0.046262145 -0.098628044  0.092529833 
		-0.049445361  0.1387974 -0.00026267767  0.18506515 0.048920035  -0.18507594 -0.00026267767  
		-0.13880832 -0.049445361  -0.092540652 -0.098628044  -5.4836273e-06 -0.14781071  
		-0.046273112 -0.14781071  0.18506515 0.19646811  0.046262145 -0.14781071  0.092529833 
		-0.098628044  0.1387974 -0.049445361  0.18506515 -0.00026267767  -0.18507594 -0.049445361  
		-0.13880832 -0.098628044  -0.092540652 -0.14781071  -0.046273112 -0.19699349  -5.4836273e-06 
		-0.19699349  0.046262145 -0.19699349  0.092529833 -0.14781071  0.1387974 -0.098628044  
		0.18506515 -0.049445361  -0.18507594 -0.098628044  -0.13880832 -0.14781071  -0.092540652 
		-0.19699349  0.092529833 -0.19699349  0.1387974 -0.14781071  0.18506515 -0.098628044  
		-0.18507594 -0.14781071  -0.13880832 -0.19699349  0.1387974 -0.19699349  0.18506515 
		-0.14781071  -0.18507594 -0.19699349  0.18506515 -0.19699349  -0.18522379 0.19699347  
		-0.13895607 0.19699347  -0.092688531 0.19699323  -0.046420932 0.19699323  -0.00015330315 
		0.19699335  0.046114445 0.19699335  0.092381954 0.19699335  0.13864964 0.19699329  
		0.18491721 0.19699329 ;
	setAttr ".uvtk[109:117]" -type "float2" 0.1852051 -0.19653326  0.1852051 0.19692838  
		0.1852051 0.14774579  0.1852051 0.098562896  0.1852051 0.049380243  0.1852051 0.00019752979  
		0.1852051 -0.048985213  0.1852051 -0.098167896  0.1852051 -0.14735064 ;
	setAttr ".uvtk[120:128]" -type "float2" -0.18512139 0.19657767  -0.18512127 
		-0.19688404  -0.18512136 -0.14770141  -0.18512136 -0.098518699  -0.18512136 -0.049335927  
		-0.18512139 -0.00015318394  -0.18512139 0.049029469  -0.18512139 0.098212123  -0.18512139 
		0.14739496 ;
createNode lambert -n "ground_edge";
createNode shadingEngine -n "lambert3SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode groupParts -n "groupParts3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "f[20:21]" "f[166:173]";
	setAttr ".irc" -type "componentList" 3 "f[0:8]" "f[11:19]" "f[22:39]";
createNode groupId -n "groupId4";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts4";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 3 "f[0:8]" "f[11:19]" "f[22:39]";
createNode file -n "file3";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/ground21_edge.png";
createNode place2dTexture -n "place2dTexture3";
createNode polyMapCut -n "polyMapCut1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 19 "e[0:19]" "e[24:25]" "e[32:33]" "e[39:40]" "e[46:47]" "e[53]" "e[61]" "e[69]" "e[77]" "e[84:85]" "e[91]" "e[103:104]" "e[110]" "e[121:122]" "e[128]" "e[139:140]" "e[146]" "e[156:162]" "e[164:184]";
createNode polyTweakUV -n "polyTweakUV2";
	setAttr ".uopa" yes;
	setAttr -s 197 ".uvtk[0:196]" -type "float2" -1.20733058 0 -1.41492653
		 0 -1.42790127 -0.27571338 -1.21057427 -0.27895707 -1.21057427 -0.27895707 -1.21057427
		 -0.27895707 -1.21057427 -0.27895707 -1.21057427 -0.27895707 -1.21057427 -0.27895707
		 -1.21057427 -0.27895707 -1.21057427 -0.27895707 0.01141417 -0.023328006 0 -0.023328006
		 0 -0.034992039 0.01141417 -0.034992039 0 -0.011663973 0.01141417 -0.011663973 -0.011414111
		 -0.023328006 -0.011414111 -0.034992039 0 -0.046656013 0.01141417 -0.046656013 0.022828281
		 -0.034992039 0.022828281 -0.023328006 -0.011414111 -0.011663973 0.022828281 -0.011663973
		 0.01141417 0 0 0 -0.022828281 -0.023328006 -0.022828281 -0.034992039 -0.011414111
		 -0.046656013 0.022828281 -0.046656013 0.034242421 -0.023328006 0.034242421 -0.034992039
		 -0.011414111 0 -0.022828281 -0.011663973 0.034242421 -0.011663973 0.022828281 0 0
		 0.011664003 0.01141417 0.011664003 -0.034242392 -0.023328006 -0.034242392 -0.034992039
		 -0.022828281 -0.046656013 0.034242421 -0.046656013 0.045656562 -0.034992039 0.045656562
		 -0.023328006 -0.011414111 0.011664003 -0.022828281 0 -0.034242392 -0.011663973 0.045656562
		 -0.011663973 0.034242421 0 0.022828281 0.011664003 0.01141417 0.023328006 0 0.023328006
		 -0.045656562 -0.023328006 -0.045656562 -0.034992039 -0.034242392 -0.046656013 0.045656562
		 -0.046656013 -0.011414111 0.023328006 -0.022828281 0.011664003 -0.034242392 0 -0.045656562
		 -0.011663973 0.045656562 0 0.034242421 0.011664003 0.022828281 0.023328006 0 0.03499198
		 0.01141417 0.03499198 -0.045656562 -0.046656013 -0.011414111 0.03499198 -0.022828281
		 0.023328006 -0.034242392 0.011664003 -0.045656562 0 0.045656562 0.011664003 0.034242421
		 0.023328006 0.022828281 0.03499198 0.01141417 0.046656013 0 0.046656013 -0.011414111
		 0.046656013 -0.022828281 0.03499198 -0.034242392 0.023328006 -0.045656562 0.011664003
		 0.045656562 0.023328006 0.034242421 0.03499198 0.022828281 0.046656013 -0.022828281
		 0.046656013 -0.034242392 0.03499198 -0.045656562 0.023328006 0.045656562 0.03499198
		 0.034242421 0.046656013 -0.034242392 0.046656013 -0.045656562 0.03499198 0.045656562
		 0.046656013 -0.045656562 0.046656013 -1.42465758 0.217327 -1.20733058 0.2140833 -1.20733058
		 0.2140833 -1.20733058 0.2140833 -1.20733058 0.2140833 -1.20733058 0.2140833 -1.20733058
		 0.2140833 -1.20733058 0.2140833 -1.20733058 0.2140833 -1.2073307 0 -1.41492653 -7.4505806e-09
		 0.03605476 0.040149689 0.038080364 0.040149689 0.03605476 0.042093575 0.038080364
		 0.042093575 -1.41492653 0 -1.41492653 -7.4505806e-09 -1.21057427 -0.27895707 -1.20733058
		 0.2140833 -1.20733058 0 -1.20733058 0 -1.20733058 0 -1.20733058 0 -1.20733058 0 -1.20733058
		 0 -1.20733058 0 -1.20733058 0 -1.20733058 0 -1.42465758 0.217327 -1.42790115 -0.27571338
		 -1.43114495 0.0097310618 -1.43114495 0.0097310543 -1.43114495 0.0097310543 -1.43114495
		 0.0097310841 -1.43114495 0.0097310543 -1.43114495 0.0097310543 -1.43114495 0.0097310543
		 0.03605476 0.040149689 0.038080364 0.040149689 0.03605476 0.042093575 0.038080364
		 0.042093575 -1.20733058 0 -1.20733058 0 -1.20733058 0 -1.20733058 0 -1.20733058 0
		 -1.20733058 0 -1.20733058 0 -1.20733058 0 -1.43114495 0.0097310618 -1.43114495 0.0097310543
		 -1.43114495 0.0097310543 -1.43114495 0.0097310841 -1.43114495 0.0097310543 -1.43114495
		 0.0097310543 -1.43114495 0.0097310543 -1.41492653 -7.4505806e-09 -1.41492653 -7.4505806e-09
		 -1.41492653 -7.4505806e-09 -1.41492653 -7.4505806e-09 -1.41492653 -7.4505806e-09
		 -1.41492653 -7.4505806e-09 -1.41492653 -7.4505806e-09 -1.41492653 -7.4505806e-09
		 -1.20733058 0 -1.20733058 0 -1.20733058 0 -1.20733058 0 -1.20733058 0 -1.20733058
		 0 -1.20733058 0 -1.2073307 0 -1.2073307 0 -1.2073307 0 -1.2073307 0 -1.2073307 0
		 -1.2073307 0 -1.2073307 0 -1.2073307 0 -1.20733058 0.2140833 -1.20733058 0.2140833
		 -1.20733058 0.2140833 -1.20733058 0.2140833 -1.20733058 0.2140833 -1.20733058 0.2140833
		 -1.20733058 0.2140833 -1.41492653 0 -1.41492653 0 -1.41492653 0 -1.41492653 0 -1.41492653
		 0 -1.41492653 0 -1.41492653 0 -1.41492653 0 -1.21057427 -0.27895707 -1.21057427 -0.27895707
		 -1.21057427 -0.27895707 -1.21057427 -0.27895707 -1.21057427 -0.27895707 -1.21057427
		 -0.27895707 -1.21057427 -0.27895707 -1.20733058 0.2140833 -1.42790127 -0.27571338
		 -1.42465758 0.217327 -1.21057427 -0.27895707;
createNode polyChipOff -n "polyChipOff1";
	setAttr ".ics" -type "componentList" 3 "f[0:8]" "f[11:19]" "f[22:39]";
	setAttr ".ix" -type "matrix" 2 0 0 0 0 3.9388661181301674 0 0 0 0 2 0 0 -36.556717408280221 0 1;
	setAttr ".ws" yes;
	setAttr ".mp" -type "matrix" 2 0 0 0 0 3.9388661181301674 0 0 0 0 2 0 0 -36.556717408280221 0 1;
	setAttr ".pvt" -type "float3" 0 -36.556717 0 ;
	setAttr ".rs" 548524584;
	setAttr ".dup" no;
createNode polySeparate -n "polySeparate1";
	setAttr ".ic" 3;
	setAttr ".rs" -type "Int32Array" 1 0 ;
	setAttr -s 2 ".out";
createNode groupId -n "groupId6";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts6";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "f[2:3]" "f[130:137]";
createNode groupId -n "groupId7";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts7";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "f[0:1]" "f[4:129]";
createNode polyChipOff -n "polyChipOff2";
	setAttr ".ics" -type "componentList" 2 "f[2:3]" "f[130:137]";
	setAttr ".ix" -type "matrix" 2 0 0 0 0 3.9388661181301674 0 0 0 0 2 0 0 -36.556717408280221 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 -36.556717 0 ;
	setAttr ".rs" 2060295653;
	setAttr ".dup" no;
createNode lambert -n "ground_edge2";
createNode shadingEngine -n "lambert4SG";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 3 ".gn";
createNode materialInfo -n "materialInfo3";
createNode file -n "file4";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/ground21_edge.png";
createNode place2dTexture -n "place2dTexture4";
createNode polyMapCut -n "polyMapCut2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[1:2]" "e[4:5]";
createNode polyTweakUV -n "polyTweakUV3";
	setAttr ".uopa" yes;
	setAttr -s 27 ".uvtk";
	setAttr ".uvtk[28]" -type "float2" -0.027857119 0 ;
	setAttr ".uvtk[31]" -type "float2" -0.027857119 0 ;
	setAttr ".uvtk[34]" -type "float2" -0.027857119 0 ;
	setAttr ".uvtk[37]" -type "float2" -0.027857119 0 ;
	setAttr ".uvtk[40]" -type "float2" -0.027857119 0 ;
	setAttr ".uvtk[43]" -type "float2" -0.027857119 0 ;
	setAttr ".uvtk[46]" -type "float2" -0.027857119 0 ;
	setAttr ".uvtk[48]" -type "float2" -0.027857119 0 ;
	setAttr ".uvtk[50:51]" -type "float2" -0.027857119 0  -0.027857119 0 ;
	setAttr ".uvtk[81]" -type "float2" -0.027857119 0 ;
	setAttr ".uvtk[83:84]" -type "float2" -0.027857119 0  -0.027857119 0 ;
	setAttr ".uvtk[89:90]" -type "float2" -0.027857119 0  -0.027857119 0 ;
	setAttr ".uvtk[92:93]" -type "float2" -0.027857119 0  -0.027857119 0 ;
	setAttr ".uvtk[95:96]" -type "float2" -0.027857119 0  -0.027857119 0 ;
	setAttr ".uvtk[98:99]" -type "float2" -0.027857119 0  -0.027857119 0 ;
	setAttr ".uvtk[101]" -type "float2" -0.027857119 0 ;
	setAttr ".uvtk[103:107]" -type "float2" -0.027857119 0  -0.027857119 0  -0.027857119 
		0  -0.027857119 0  -0.027857119 0 ;
createNode polyCylProj -n "polyCylProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:35]";
	setAttr ".ix" -type "matrix" 2 0 0 0 0 3.9388661181301674 0 0 0 0 2 0 0 -36.556717408280221 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" 0 2.4804716110229492 0 ;
	setAttr ".ps" -type "double2" 180 20.397294998168945 ;
	setAttr ".r" 200;
createNode polyTweakUV -n "polyTweakUV4";
	setAttr ".uopa" yes;
	setAttr -s 38 ".uvtk[0:37]" -type "float2" -3.19616985 0 1.065389872
		 0 -3.19616985 0 -2.81120372 0 -2.32326269 0 -1.73001516 0 -1.065389872 0 -0.40076435
		 0 0.19248277 0 0.68042433 0 1.065389872 0 5.32694864 0 -7.45772934 0 -9.58850956
		 0 -8.92388344 0 -8.33063602 0 -7.84269524 0 -7.45772934 0 1.45035517 0 1.93829703
		 0 2.53154421 0 3.19616938 0 3.86079597 0 4.45404148 0 4.94198418 0 -7.072763443 0
		 -6.5848217 0 -5.99157572 0 -5.32695007 0 -4.66232443 0 -4.069076538 0 -3.58113527
		 0 5.71191502 0 6.19985676 0 6.79310322 0 9.58850956 0 7.45772791 0 5.32694864 0;
createNode polyChipOff -n "polyChipOff3";
	setAttr ".ics" -type "componentList" 2 "f[2:3]" "f[130:137]";
	setAttr ".ix" -type "matrix" 2 0 0 0 0 3.9388661181301674 0 0 0 0 2 0 0 -36.556717408280221 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 -36.556717 0 ;
	setAttr ".rs" 61098504;
	setAttr ".dup" no;
createNode polySeparate -n "polySeparate2";
	setAttr ".ic" 2;
	setAttr -s 2 ".out";
createNode groupId -n "groupId8";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts8";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:127]";
createNode lambert -n "under_ground";
createNode shadingEngine -n "lambert5SG";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 3 ".gn";
createNode materialInfo -n "materialInfo4";
createNode file -n "file5";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/underground1.png";
createNode place2dTexture -n "place2dTexture5";
createNode polyCylProj -n "polyCylProj2";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:9]";
	setAttr ".ix" -type "matrix" 2 0 0 0 0 3.9388661181301674 0 0 0 0 2 0 0 -36.556717408280221 0 1;
	setAttr ".ws" yes;
	setAttr ".pc" -type "double3" 0 -100.55600070953369 0 ;
	setAttr ".ps" -type "double2" 180 185.67565727233887 ;
	setAttr ".r" 200;
createNode polyUnite -n "polyUnite1";
	setAttr -s 3 ".ip";
	setAttr -s 3 ".im";
createNode groupId -n "groupId9";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts9";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:35]";
createNode groupId -n "groupId10";
	setAttr ".ihi" 0;
createNode groupId -n "groupId11";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts10";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:9]";
createNode groupId -n "groupId12";
	setAttr ".ihi" 0;
createNode groupId -n "groupId13";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts11";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:35]";
createNode groupId -n "groupId14";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts12";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[36:163]";
createNode groupId -n "groupId15";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts13";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[164:173]";
createNode polySeparate -n "polySeparate3";
	setAttr ".ic" 3;
createNode groupId -n "groupId17";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts15";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:127]";
createNode polyTweakUV -n "polyTweakUV5";
	setAttr ".uopa" yes;
	setAttr -s 81 ".uvtk[0:80]" -type "float2" -1.53499949 -0.7496224 -1.53499949
		 -0.36723614 -1.9307996 -0.7496224 -1.9307996 -0.36723614 -2.32659936 -1.51439488
		 -2.72239947 -1.51439488 -2.32659936 -1.89678133 -2.72239947 -1.89678133 -1.53499949
		 -2.27916765 -1.53499949 -2.66155386 -1.1391995 -2.27916765 -1.1391995 -2.66155386
		 -0.74339896 -1.51439488 -0.34759891 -1.51439488 -0.74339896 -1.13200855 -0.34759891
		 -1.13200855 -2.32659936 -0.36723614 -2.32659936 0.015150495 -2.72239947 -0.36723614
		 -2.72239947 0.015150495 -3.11819959 -0.7496224 -3.11819959 -1.13200855 -2.72239947
		 -0.7496224 -2.72239947 -1.13200855 -2.32659936 -1.13200855 -1.9307996 -1.13200855
		 -1.9307996 -1.51439488 -2.72239947 -2.27916765 -3.11819959 -2.27916765 -2.72239947
		 -2.66155386 -3.11819959 -2.66155386 -2.32659936 -3.043940306 -1.9307996 -3.043940306
		 -2.32659936 -2.66155386 -1.9307996 -2.66155386 -1.9307996 -2.27916765 -1.9307996
		 -1.89678133 -1.53499949 -1.89678133 -0.74339896 -2.66155386 -0.74339896 -3.043940306
		 -0.34759891 -2.66155386 -0.34759891 -3.043940306 0.048201479 -2.27916765 0.048201479
		 -1.89678133 -0.34759891 -2.27916765 -0.34759891 -1.89678133 -0.74339896 -1.89678133
		 -1.1391995 -1.89678133 -1.1391995 -1.51439488 -0.34759891 -0.7496224 0.048201479
		 -0.7496224 -0.34759891 -0.36723614 0.048201479 -0.36723614 -0.74339896 0.015150495
		 -1.1391995 0.015150495 -0.74339896 -0.36723614 -1.1391995 -0.36723614 -1.1391995
		 -0.7496224 -1.1391995 -1.13200855 -1.53499949 -1.13200855 -1.53499949 0.015150495
		 -1.9307996 0.015150495 -2.32659936 -0.7496224 -3.11819959 -1.51439488 -3.11819959
		 -1.89678133 -2.32659936 -2.27916765 -1.53499949 -3.043940306 -1.1391995 -3.043940306
		 -0.74339896 -2.27916765 0.048201479 -1.51439488 0.048201479 -1.13200855 -0.74339896
		 -0.7496224 -3.11819959 0.015150495 -3.11819959 -0.36723614 -1.53499949 -1.51439488
		 -3.11819959 -3.043940306 -2.72239947 -3.043940306 0.048201479 -3.043940306 0.048201479
		 -2.66155386 0.048201479 0.015150495 -0.34759891 0.015150495;
createNode polyFlipEdge -n "polyFlipEdge1";
	setAttr ".uopa" yes;
	setAttr ".e" -type "componentList" 4 "e[190]" "e[199]" "e[172]" "e[181]";
createNode polyTweakUV -n "polyTweakUV6";
	setAttr ".uopa" yes;
	setAttr -s 81 ".uvtk[0:80]" -type "float2" 0.9680962 0.47081658 0.9680962
		 0.21220404 1.22467685 0.47081658 1.22467685 0.21220404 1.48125768 0.98804194 1.73783851
		 0.98804194 1.48125768 1.24665487 1.73783851 1.24665487 0.9680962 1.50526762 0.9680962
		 1.76388013 0.71151543 1.50526762 0.71151543 1.76388013 0.45493421 0.98804194 0.19835338
		 0.98804194 0.45493421 0.72942919 0.19835338 0.72942919 1.48125768 0.21220404 1.48125768
		 -0.046409119 1.73783851 0.21220404 1.73783851 -0.046409119 1.99441957 0.47081658
		 1.99441957 0.72942919 1.73783851 0.47081658 1.73783851 0.72942919 1.48125768 0.72942919
		 1.22467685 0.72942919 1.22467685 0.98804194 1.73783851 1.50526762 1.99441957 1.50526762
		 1.73783851 1.76388013 1.99441957 1.76388013 1.48125768 2.022492886 1.22467685 2.022492886
		 1.48125768 1.76388013 1.22467685 1.76388013 1.22467685 1.50526762 1.22467685 1.24665487
		 0.9680962 1.24665487 0.45493421 1.76388013 0.45493421 2.022492886 0.19835338 1.76388013
		 0.19835338 2.022492886 -0.058227554 1.50526762 -0.058227554 1.24665487 0.19835338
		 1.50526762 0.19835338 1.24665487 0.45493421 1.24665487 0.71151543 1.24665487 0.71151543
		 0.98804194 0.19835338 0.47081658 -0.058227554 0.47081658 0.19835338 0.21220404 -0.058227554
		 0.21220404 0.45493421 -0.046409119 0.71151543 -0.046409119 0.45493421 0.21220404
		 0.71151543 0.21220404 0.71151543 0.47081658 0.71151543 0.72942919 0.9680962 0.72942919
		 0.9680962 -0.046409119 1.22467685 -0.046409119 1.48125768 0.47081658 1.99441957 0.98804194
		 1.99441957 1.24665487 1.48125768 1.50526762 0.9680962 2.022492886 0.71151543 2.022492886
		 0.45493421 1.50526762 -0.058227554 0.98804194 -0.058227554 0.72942919 0.45493421
		 0.47081658 1.99441957 -0.046409119 1.99441957 0.21220404 0.9680962 0.98804194 1.99441957
		 2.022492886 1.73783851 2.022492886 -0.058227554 2.022492886 -0.058227554 1.76388013
		 -0.058227554 -0.046409119 0.19835338 -0.046409119;
createNode polyCube -n "polyCube1";
	setAttr ".w" 800;
	setAttr ".h" 800;
	setAttr ".d" 800;
	setAttr ".cuv" 4;
createNode deleteComponent -n "deleteComponent3";
	setAttr ".dc" -type "componentList" 1 "f[1]";
createNode deleteComponent -n "deleteComponent4";
	setAttr ".dc" -type "componentList" 1 "f[2]";
createNode polyAutoProj -n "polyAutoProj1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "f[0:3]";
	setAttr ".ix" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 -450.06022518984406 0 1;
	setAttr ".s" -type "double3" 800 800 800 ;
	setAttr ".ps" 0.20000000298023224;
	setAttr ".dl" yes;
createNode polyTweakUV -n "polyTweakUV7";
	setAttr ".uopa" yes;
	setAttr -s 16 ".uvtk[0:15]" -type "float2" 0.0038193017 -0.010244813
		 0.043317251 -0.010244813 0.043317251 0.0490021 0.0038193017 0.0490021 0.043886684
		 -0.010244805 0.083384566 -0.010244805 0.083384566 0.0490021 0.043886684 0.0490021
		 -0.038423352 0.048076279 0.010949116 0.048076279 0.010949116 0.087574251 -0.038423352
		 0.087574251 -0.088463604 0.048076279 -0.039091192 0.048076279 -0.039091192 0.087574251
		 -0.088463604 0.087574251;
createNode lambert -n "lambert6";
createNode shadingEngine -n "lambert6SG";
	setAttr ".ihi" 0;
	setAttr -s 6 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 6 ".gn";
createNode materialInfo -n "materialInfo5";
createNode file -n "file6";
	setAttr ".ftn" -type "string" "/Users/jay/projects/amju-ww/Assets/tex/common/underground2.png";
createNode place2dTexture -n "place2dTexture6";
createNode polyUnite -n "polyUnite2";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "groupId18";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts16";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:3]";
createNode groupId -n "groupId19";
	setAttr ".ihi" 0;
createNode groupId -n "groupId20";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts17";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:3]";
createNode groupId -n "groupId21";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts18";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[4:131]";
createNode polyTweakUV -n "polyTweakUV8";
	setAttr ".uopa" yes;
	setAttr -s 82 ".uvtk";
	setAttr ".uvtk[16:96]" -type "float2" 0.31158736 -0.143538  0.31158736 -0.33070964  
		0.50586283 -0.143538  0.50586283 -0.33070964  0.70013785 0.23080514  0.89441323 0.23080514  
		0.70013785 0.4179768  0.89441323 0.4179768  0.31158736 0.60514838  0.31158736 0.79231995  
		0.11731207 0.60514838  0.11731207 0.79231995  -0.07696338 0.23080514  -0.27123877 
		0.23080514  -0.07696338 0.043633603  -0.27123877 0.043633603  0.70013785 -0.33070964  
		0.70013785 -0.51788127  0.89441323 -0.33070964  0.89441323 -0.51788127  1.0886885 
		-0.143538  1.0886885 0.043633603  0.89441323 -0.143538  0.89441323 0.043633603  0.70013785 
		0.043633603  0.50586283 0.043633603  0.50586283 0.23080514  0.89441323 0.60514838  
		1.0886885 0.60514838  0.89441323 0.79231995  1.0886885 0.79231995  0.70013785 0.97949171  
		0.50586283 0.97949171  0.70013785 0.79231995  0.50586283 0.79231995  0.50586283 0.60514838  
		0.50586283 0.4179768  0.31158736 0.4179768  -0.07696338 0.79231995  -0.07696338 0.97949171  
		-0.27123877 0.79231995  -0.27123877 0.97949171  -0.46551433 0.60514838  -0.46551433 
		0.4179768  -0.27123877 0.60514838  -0.27123877 0.4179768  -0.07696338 0.4179768  
		0.11731207 0.4179768  0.11731207 0.23080514  -0.27123877 -0.143538  -0.46551433 -0.143538  
		-0.27123877 -0.33070964  -0.46551433 -0.33070964  -0.07696338 -0.51788127  0.11731207 
		-0.51788127  -0.07696338 -0.33070964  0.11731207 -0.33070964  0.11731207 -0.143538  
		0.11731207 0.043633603  0.31158736 0.043633603  0.31158736 -0.51788127  0.50586283 
		-0.51788127  0.70013785 -0.143538  1.0886885 0.23080514  1.0886885 0.4179768  0.70013785 
		0.60514838  0.31158736 0.97949171  0.11731207 0.97949171  -0.07696338 0.60514838  
		-0.46551433 0.23080514  -0.46551433 0.043633603  -0.07696338 -0.143538  1.0886885 
		-0.51788127  1.0886885 -0.33070964  0.31158736 0.23080514  1.0886885 0.97949171  
		0.89441323 0.97949171  -0.46551433 0.97949171  -0.46551433 0.79231995  -0.46551433 
		-0.51788127  -0.27123877 -0.51788127 ;
createNode polyTriangulate -n "polyTriangulate2";
	setAttr ".ics" -type "componentList" 1 "f[*]";
createNode polyTweak -n "polyTweak2";
	setAttr ".uopa" yes;
	setAttr -s 85 ".tk";
	setAttr ".tk[2:5]" -type "float3" 0 48.655048 0  0 48.655048 0  0 48.655048 
		0  0 48.655048 0 ;
	setAttr ".tk[8:88]" -type "float3" 0 48.655048 0  0 48.655048 0  0 48.655048 
		0  0 48.655048 0  0 23.169067 0  0 48.655048 0  0 48.655048 0  0 48.655048 0  0 48.655048 
		0  0 23.169067 0  0 48.655048 0  0 48.655048 0  0 23.169067 0  0 23.169067 0  0 23.169067 
		0  0 48.655048 0  0 48.655048 0  0 23.169067 0  0 23.169067 0  0 48.655048 0  0 48.655048 
		0  0 23.169067 0  0 23.169067 0  0 48.655048 0  0 48.655048 0  0 23.169067 0  0 23.169067 
		0  0 48.655048 0  0 23.169067 0  0 23.169067 0  0 23.169067 0  0 23.169067 0  0 48.655048 
		0  0 23.169067 0  0 23.169067 0  0 23.169067 0  0 23.169067 0  0 48.655048 0  0 23.169067 
		0  0 23.169067 0  0 23.169067 0  0 23.169067 0  0 48.655048 0  0 23.169067 0  0 23.169067 
		0  0 23.169067 0  0 48.655048 0  0 48.655048 0  0 23.169067 0  0 23.169067 0  0 48.655048 
		0  0 23.169067 0  0 23.169067 0  0 23.169067 0  0 23.169067 0  0 23.169067 0  0 48.655048 
		0  0 48.655048 0  0 23.169067 0  0 23.169067 0  0 48.655048 0  0 23.169067 0  0 23.169067 
		0  0 23.169067 0  0 23.169067 0  0 48.655048 0  0 48.655048 0  0 23.169067 0  0 23.169067 
		0  0 48.655048 0  0 23.169067 0  0 23.169067 0  0 23.169067 0  0 23.169067 0  0 48.655048 
		0  0 48.655048 0  0 23.169067 0  0 23.169067 0  0 48.655048 0  0 23.169067 0  0 23.169067 
		0 ;
createNode polySeparate -n "polySeparate4";
	setAttr ".ic" 2;
createNode groupId -n "groupId22";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts19";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:7]";
createNode polyCube -n "polyCube2";
	setAttr ".w" 145.88181321664553;
	setAttr ".h" 30.59115593087428;
	setAttr ".d" 103.07747760200971;
	setAttr ".cuv" 4;
createNode deleteComponent -n "deleteComponent5";
	setAttr ".dc" -type "componentList" 2 "f[0]" "f[2:5]";
createNode polyTweakUV -n "polyTweakUV9";
	setAttr ".uopa" yes;
	setAttr -s 4 ".uvtk[0:3]" -type "float2" 0.11703105 0.26044482 0.36765999
		 0.26044482 0.11703105 0.47813198 0.36765999 0.47813198;
createNode polyTriangulate -n "polyTriangulate3";
	setAttr ".ics" -type "componentList" 1 "f[0]";
createNode polyTweak -n "polyTweak3";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk[0:3]" -type "float3"  -20.70876312 -1.5657239 43.2532692
		 33.4094162 -1.5657239 43.25327301 -20.70876884 -1.5657239 -53.6692543 33.4094162
		 -1.5657239 -53.66925049;
createNode polyUnite -n "polyUnite3";
	setAttr -s 2 ".ip";
	setAttr -s 2 ".im";
createNode groupId -n "groupId23";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts20";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:1]";
createNode groupId -n "groupId24";
	setAttr ".ihi" 0;
createNode groupId -n "groupId25";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts21";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:7]";
createNode groupId -n "groupId26";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts22";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[8:9]";
createNode polySeparate -n "polySeparate5";
	setAttr ".ic" 2;
	setAttr -s 2 ".out";
createNode groupId -n "groupId27";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts23";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:7]";
createNode groupId -n "groupId28";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts24";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:1]";
createNode polyTweakUV -n "polyTweakUV10";
	setAttr ".uopa" yes;
	setAttr -s 4 ".uvtk[0:3]" -type "float2" -0.52492428 -0.51497692 -0.052088808
		 -0.51497692 -0.52492428 -0.015875114 -0.052088808 -0.015875114;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 10 ".st";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
	setAttr -s 2 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -s 10 ".s";
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
connectAttr "groupParts9.og" "polySurfaceShape1.i";
connectAttr "groupId9.id" "polySurfaceShape1.iog.og[1].gid";
connectAttr "lambert4SG.mwc" "polySurfaceShape1.iog.og[1].gco";
connectAttr "polyTweakUV4.uvtk[0]" "polySurfaceShape1.uvst[0].uvtw";
connectAttr "groupId10.id" "polySurfaceShape1.ciog.cog[0].cgid";
connectAttr "groupParts8.og" "polySurfaceShape3.i";
connectAttr "groupId8.id" "polySurfaceShape3.iog.og[0].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape3.iog.og[0].gco";
connectAttr "groupParts10.og" "polySurfaceShape4.i";
connectAttr "groupId11.id" "polySurfaceShape4.iog.og[1].gid";
connectAttr "lambert5SG.mwc" "polySurfaceShape4.iog.og[1].gco";
connectAttr "groupId12.id" "polySurfaceShape4.ciog.cog[0].cgid";
connectAttr "polyChipOff3.out" "polySurfaceShape2.i";
connectAttr "groupId6.id" "polySurfaceShape2.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "polySurfaceShape2.iog.og[0].gco";
connectAttr "groupId7.id" "polySurfaceShape2.iog.og[1].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape2.iog.og[1].gco";
connectAttr "polyTweakUV6.out" "polySurfaceShape7.i";
connectAttr "groupId17.id" "polySurfaceShape7.iog.og[0].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape7.iog.og[0].gco";
connectAttr "polyTweakUV6.uvtk[0]" "polySurfaceShape7.uvst[0].uvtw";
connectAttr "groupId18.id" "pCubeShape1.iog.og[0].gid";
connectAttr "lambert6SG.mwc" "pCubeShape1.iog.og[0].gco";
connectAttr "groupParts16.og" "pCubeShape1.i";
connectAttr "polyTweakUV7.uvtk[0]" "pCubeShape1.uvst[0].uvtw";
connectAttr "groupId19.id" "pCubeShape1.ciog.cog[0].cgid";
connectAttr "groupParts19.og" "polySurfaceShape9.i";
connectAttr "groupId22.id" "polySurfaceShape9.iog.og[0].gid";
connectAttr "lambert6SG.mwc" "polySurfaceShape9.iog.og[0].gco";
connectAttr "polyTriangulate2.out" "polySurfaceShape8.i";
connectAttr "groupId20.id" "polySurfaceShape8.iog.og[0].gid";
connectAttr "lambert6SG.mwc" "polySurfaceShape8.iog.og[0].gco";
connectAttr "groupId21.id" "polySurfaceShape8.iog.og[1].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape8.iog.og[1].gco";
connectAttr "polyTweakUV8.uvtk[0]" "polySurfaceShape8.uvst[0].uvtw";
connectAttr "groupId23.id" "pCubeShape2.iog.og[0].gid";
connectAttr "lambert2SG.mwc" "pCubeShape2.iog.og[0].gco";
connectAttr "groupParts20.og" "pCubeShape2.i";
connectAttr "polyTweakUV9.uvtk[0]" "pCubeShape2.uvst[0].uvtw";
connectAttr "groupId24.id" "pCubeShape2.ciog.cog[0].cgid";
connectAttr "groupParts23.og" "polySurfaceShape11.i";
connectAttr "groupId27.id" "polySurfaceShape11.iog.og[0].gid";
connectAttr "lambert6SG.mwc" "polySurfaceShape11.iog.og[0].gco";
connectAttr "polyTweakUV10.out" "polySurfaceShape12.i";
connectAttr "groupId28.id" "polySurfaceShape12.iog.og[0].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape12.iog.og[0].gco";
connectAttr "polyTweakUV10.uvtk[0]" "polySurfaceShape12.uvst[0].uvtw";
connectAttr "groupParts22.og" "polySurfaceShape10.i";
connectAttr "groupId25.id" "polySurfaceShape10.iog.og[0].gid";
connectAttr "lambert6SG.mwc" "polySurfaceShape10.iog.og[0].gco";
connectAttr "groupId26.id" "polySurfaceShape10.iog.og[1].gid";
connectAttr "lambert2SG.mwc" "polySurfaceShape10.iog.og[1].gco";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_4x4:initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_1x1:initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "block_rect_curved_1x1:block_rect_curved_hill_4x4:blinn1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert5SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert6SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_4x4:initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_1x1:initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "block_rect_curved_1x1:block_rect_curved_hill_4x4:blinn1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert5SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert6SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_4x4:initialShadingGroup1.oc" "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_4x4:initialShadingGroup.ss"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_4x4:initialShadingGroup.msg" "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_4x4:materialInfo1.sg"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_4x4:initialShadingGroup1.msg" "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_4x4:materialInfo1.m"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_1x1:initialShadingGroup1.oc" "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_1x1:initialShadingGroup.ss"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_1x1:initialShadingGroup.msg" "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_1x1:materialInfo1.sg"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_1x1:initialShadingGroup1.msg" "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_1x1:materialInfo1.m"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.oc" "block_rect_curved_1x1:block_rect_curved_hill_4x4:blinn1.c"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:blinn1.oc" "block_rect_curved_1x1:block_rect_curved_hill_4x4:blinn1SG.ss"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:blinn1SG.msg" "block_rect_curved_1x1:block_rect_curved_hill_4x4:materialInfo1.sg"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:blinn1.msg" "block_rect_curved_1x1:block_rect_curved_hill_4x4:materialInfo1.m"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.msg" "block_rect_curved_1x1:block_rect_curved_hill_4x4:materialInfo1.t"
		 -na;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.c" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.c"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.tf" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.tf"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.rf" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.rf"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.mu" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.mu"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.mv" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.mv"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.s" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.s"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.wu" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.wu"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.wv" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.wv"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.re" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.re"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.of" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.of"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.r" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.ro"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.n" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.n"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.vt1" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.vt1"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.vt2" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.vt2"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.vt3" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.vt3"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.vc1" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.vc1"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.o" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.uv"
		;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.ofs" "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.fs"
		;
connectAttr "block_rect_curved_1x1:polySurfaceShape1.o" "block_rect_curved_1x1:polySoftEdge1.ip"
		;
connectAttr "block_rect_curved_1x1:polySoftEdge1.out" "polyExtrudeFace1.ip";
connectAttr "polyTweak1.out" "polyTriangulate1.ip";
connectAttr "polyExtrudeFace1.out" "polyTweak1.ip";
connectAttr "file2.oc" "top_surface.c";
connectAttr "top_surface.oc" "lambert2SG.ss";
connectAttr "groupId3.msg" "lambert2SG.gn" -na;
connectAttr "groupId7.msg" "lambert2SG.gn" -na;
connectAttr "groupId8.msg" "lambert2SG.gn" -na;
connectAttr "groupId14.msg" "lambert2SG.gn" -na;
connectAttr "groupId17.msg" "lambert2SG.gn" -na;
connectAttr "groupId21.msg" "lambert2SG.gn" -na;
connectAttr "groupId23.msg" "lambert2SG.gn" -na;
connectAttr "groupId24.msg" "lambert2SG.gn" -na;
connectAttr "groupId26.msg" "lambert2SG.gn" -na;
connectAttr "groupId28.msg" "lambert2SG.gn" -na;
connectAttr "polySurfaceShape2.iog.og[1]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape3.iog.og[0]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape7.iog.og[0]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape8.iog.og[1]" "lambert2SG.dsm" -na;
connectAttr "pCubeShape2.iog.og[0]" "lambert2SG.dsm" -na;
connectAttr "pCubeShape2.ciog.cog[0]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape10.iog.og[1]" "lambert2SG.dsm" -na;
connectAttr "polySurfaceShape12.iog.og[0]" "lambert2SG.dsm" -na;
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "top_surface.msg" "materialInfo1.m";
connectAttr "file2.msg" "materialInfo1.t" -na;
connectAttr "polyTriangulate1.out" "groupParts1.ig";
connectAttr "groupId1.id" "groupParts1.gi";
connectAttr "groupParts1.og" "groupParts2.ig";
connectAttr "groupId3.id" "groupParts2.gi";
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
connectAttr "groupParts2.og" "deleteComponent1.ig";
connectAttr "deleteComponent1.og" "deleteComponent2.ig";
connectAttr "deleteComponent2.og" "polyTweakUV1.ip";
connectAttr "file3.oc" "ground_edge.c";
connectAttr "ground_edge.oc" "lambert3SG.ss";
connectAttr "groupId4.msg" "lambert3SG.gn" -na;
connectAttr "lambert3SG.msg" "materialInfo2.sg";
connectAttr "ground_edge.msg" "materialInfo2.m";
connectAttr "file3.msg" "materialInfo2.t" -na;
connectAttr "polyTweakUV1.out" "groupParts3.ig";
connectAttr "groupId1.id" "groupParts3.gi";
connectAttr "groupParts3.og" "groupParts4.ig";
connectAttr "groupId4.id" "groupParts4.gi";
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
connectAttr "groupParts4.og" "polyMapCut1.ip";
connectAttr "polyMapCut1.out" "polyTweakUV2.ip";
connectAttr "polyTweakUV2.out" "polyChipOff1.ip";
connectAttr "polyChipOff1.out" "polySeparate1.ip";
connectAttr "polySeparate1.out[1]" "groupParts6.ig";
connectAttr "groupId6.id" "groupParts6.gi";
connectAttr "groupParts6.og" "groupParts7.ig";
connectAttr "groupId7.id" "groupParts7.gi";
connectAttr "groupParts7.og" "polyChipOff2.ip";
connectAttr "polySurfaceShape2.wm" "polyChipOff2.mp";
connectAttr "file4.oc" "ground_edge2.c";
connectAttr "ground_edge2.oc" "lambert4SG.ss";
connectAttr "polySurfaceShape1.iog.og[1]" "lambert4SG.dsm" -na;
connectAttr "polySurfaceShape1.ciog.cog[0]" "lambert4SG.dsm" -na;
connectAttr "groupId9.msg" "lambert4SG.gn" -na;
connectAttr "groupId10.msg" "lambert4SG.gn" -na;
connectAttr "groupId13.msg" "lambert4SG.gn" -na;
connectAttr "lambert4SG.msg" "materialInfo3.sg";
connectAttr "ground_edge2.msg" "materialInfo3.m";
connectAttr "file4.msg" "materialInfo3.t" -na;
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
connectAttr "polySeparate1.out[0]" "polyMapCut2.ip";
connectAttr "polyMapCut2.out" "polyTweakUV3.ip";
connectAttr "polyTweakUV3.out" "polyCylProj1.ip";
connectAttr "polySurfaceShape1.wm" "polyCylProj1.mp";
connectAttr "polyCylProj1.out" "polyTweakUV4.ip";
connectAttr "polyChipOff2.out" "polyChipOff3.ip";
connectAttr "polySurfaceShape2.wm" "polyChipOff3.mp";
connectAttr "polySurfaceShape2.o" "polySeparate2.ip";
connectAttr "polySeparate2.out[0]" "groupParts8.ig";
connectAttr "groupId8.id" "groupParts8.gi";
connectAttr "file5.oc" "under_ground.c";
connectAttr "under_ground.oc" "lambert5SG.ss";
connectAttr "polySurfaceShape4.iog.og[1]" "lambert5SG.dsm" -na;
connectAttr "polySurfaceShape4.ciog.cog[0]" "lambert5SG.dsm" -na;
connectAttr "groupId11.msg" "lambert5SG.gn" -na;
connectAttr "groupId12.msg" "lambert5SG.gn" -na;
connectAttr "groupId15.msg" "lambert5SG.gn" -na;
connectAttr "lambert5SG.msg" "materialInfo4.sg";
connectAttr "under_ground.msg" "materialInfo4.m";
connectAttr "file5.msg" "materialInfo4.t" -na;
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
connectAttr "polySeparate2.out[1]" "polyCylProj2.ip";
connectAttr "polySurfaceShape4.wm" "polyCylProj2.mp";
connectAttr "polySurfaceShape1.o" "polyUnite1.ip[0]";
connectAttr "polySurfaceShape3.o" "polyUnite1.ip[1]";
connectAttr "polySurfaceShape4.o" "polyUnite1.ip[2]";
connectAttr "polySurfaceShape1.wm" "polyUnite1.im[0]";
connectAttr "polySurfaceShape3.wm" "polyUnite1.im[1]";
connectAttr "polySurfaceShape4.wm" "polyUnite1.im[2]";
connectAttr "polyTweakUV4.out" "groupParts9.ig";
connectAttr "groupId9.id" "groupParts9.gi";
connectAttr "polyCylProj2.out" "groupParts10.ig";
connectAttr "groupId11.id" "groupParts10.gi";
connectAttr "polyUnite1.out" "groupParts11.ig";
connectAttr "groupId13.id" "groupParts11.gi";
connectAttr "groupParts11.og" "groupParts12.ig";
connectAttr "groupId14.id" "groupParts12.gi";
connectAttr "groupParts12.og" "groupParts13.ig";
connectAttr "groupId15.id" "groupParts13.gi";
connectAttr "groupParts13.og" "polySeparate3.ip";
connectAttr "polySeparate3.out[1]" "groupParts15.ig";
connectAttr "groupId17.id" "groupParts15.gi";
connectAttr "groupParts15.og" "polyTweakUV5.ip";
connectAttr "polyTweakUV5.out" "polyFlipEdge1.ip";
connectAttr "polyFlipEdge1.out" "polyTweakUV6.ip";
connectAttr "polyCube1.out" "deleteComponent3.ig";
connectAttr "deleteComponent3.og" "deleteComponent4.ig";
connectAttr "deleteComponent4.og" "polyAutoProj1.ip";
connectAttr "pCubeShape1.wm" "polyAutoProj1.mp";
connectAttr "polyAutoProj1.out" "polyTweakUV7.ip";
connectAttr "file6.oc" "lambert6.c";
connectAttr "lambert6.oc" "lambert6SG.ss";
connectAttr "pCubeShape1.iog.og[0]" "lambert6SG.dsm" -na;
connectAttr "pCubeShape1.ciog.cog[0]" "lambert6SG.dsm" -na;
connectAttr "polySurfaceShape8.iog.og[0]" "lambert6SG.dsm" -na;
connectAttr "polySurfaceShape9.iog.og[0]" "lambert6SG.dsm" -na;
connectAttr "polySurfaceShape10.iog.og[0]" "lambert6SG.dsm" -na;
connectAttr "polySurfaceShape11.iog.og[0]" "lambert6SG.dsm" -na;
connectAttr "groupId18.msg" "lambert6SG.gn" -na;
connectAttr "groupId19.msg" "lambert6SG.gn" -na;
connectAttr "groupId20.msg" "lambert6SG.gn" -na;
connectAttr "groupId22.msg" "lambert6SG.gn" -na;
connectAttr "groupId25.msg" "lambert6SG.gn" -na;
connectAttr "groupId27.msg" "lambert6SG.gn" -na;
connectAttr "lambert6SG.msg" "materialInfo5.sg";
connectAttr "lambert6.msg" "materialInfo5.m";
connectAttr "file6.msg" "materialInfo5.t" -na;
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
connectAttr "pCubeShape1.o" "polyUnite2.ip[0]";
connectAttr "polySurfaceShape7.o" "polyUnite2.ip[1]";
connectAttr "pCubeShape1.wm" "polyUnite2.im[0]";
connectAttr "polySurfaceShape7.wm" "polyUnite2.im[1]";
connectAttr "polyTweakUV7.out" "groupParts16.ig";
connectAttr "groupId18.id" "groupParts16.gi";
connectAttr "polyUnite2.out" "groupParts17.ig";
connectAttr "groupId20.id" "groupParts17.gi";
connectAttr "groupParts17.og" "groupParts18.ig";
connectAttr "groupId21.id" "groupParts18.gi";
connectAttr "groupParts18.og" "polyTweakUV8.ip";
connectAttr "polyTweak2.out" "polyTriangulate2.ip";
connectAttr "polyTweakUV8.out" "polyTweak2.ip";
connectAttr "polySurfaceShape8.o" "polySeparate4.ip";
connectAttr "polySeparate4.out[0]" "groupParts19.ig";
connectAttr "groupId22.id" "groupParts19.gi";
connectAttr "polyCube2.out" "deleteComponent5.ig";
connectAttr "deleteComponent5.og" "polyTweakUV9.ip";
connectAttr "polyTweak3.out" "polyTriangulate3.ip";
connectAttr "polyTweakUV9.out" "polyTweak3.ip";
connectAttr "polySurfaceShape9.o" "polyUnite3.ip[0]";
connectAttr "pCubeShape2.o" "polyUnite3.ip[1]";
connectAttr "polySurfaceShape9.wm" "polyUnite3.im[0]";
connectAttr "pCubeShape2.wm" "polyUnite3.im[1]";
connectAttr "polyTriangulate3.out" "groupParts20.ig";
connectAttr "groupId23.id" "groupParts20.gi";
connectAttr "polyUnite3.out" "groupParts21.ig";
connectAttr "groupId25.id" "groupParts21.gi";
connectAttr "groupParts21.og" "groupParts22.ig";
connectAttr "groupId26.id" "groupParts22.gi";
connectAttr "polySurfaceShape10.o" "polySeparate5.ip";
connectAttr "polySeparate5.out[0]" "groupParts23.ig";
connectAttr "groupId27.id" "groupParts23.gi";
connectAttr "polySeparate5.out[1]" "groupParts24.ig";
connectAttr "groupId28.id" "groupParts24.gi";
connectAttr "groupParts24.og" "polyTweakUV10.ip";
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_4x4:initialShadingGroup.pa" ":renderPartition.st"
		 -na;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_1x1:initialShadingGroup.pa" ":renderPartition.st"
		 -na;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:blinn1SG.pa" ":renderPartition.st"
		 -na;
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "lambert4SG.pa" ":renderPartition.st" -na;
connectAttr "lambert5SG.pa" ":renderPartition.st" -na;
connectAttr "lambert6SG.pa" ":renderPartition.st" -na;
connectAttr "polySurfaceShape2.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "groupId1.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId6.msg" ":initialShadingGroup.gn" -na;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_4x4:initialShadingGroup1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:block_rect_curved_1x1:initialShadingGroup1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:blinn1.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "top_surface.msg" ":defaultShaderList1.s" -na;
connectAttr "ground_edge.msg" ":defaultShaderList1.s" -na;
connectAttr "ground_edge2.msg" ":defaultShaderList1.s" -na;
connectAttr "under_ground.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert6.msg" ":defaultShaderList1.s" -na;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:file1.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "file3.msg" ":defaultTextureList1.tx" -na;
connectAttr "file4.msg" ":defaultTextureList1.tx" -na;
connectAttr "file5.msg" ":defaultTextureList1.tx" -na;
connectAttr "file6.msg" ":defaultTextureList1.tx" -na;
connectAttr "block_rect_curved_1x1:block_rect_curved_hill_4x4:place2dTexture1.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of field_2x2.ma
