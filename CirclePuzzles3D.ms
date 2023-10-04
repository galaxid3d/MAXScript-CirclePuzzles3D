-- Date: 2018-9-(28-30)+2019-07-(15-17)+2019-10-06+2019-10-10+2020-03-06+2020-03-17+2020-04-12+2022-03-31+2023-05-07 by galaxid3d
-- This script create 3D circle puzzles with various categories of offsets (displacements) in the puzzles themselves

try (
	rollout сirclePuzzle_rllt "CirclePuzzles3D" width:580 height:276 (
		GroupBox 'count_grp' "Count" pos:[4,2] width:122 height:60
		spinner 'X_Count_spnr' "X_Count：" pos:[8,18] width:65 height:16 range:[1,1e+006,5] type:#integer fieldwidth:54 align:#left
		spinner 'Y_Count_spnr' "Y_Count：" pos:[8,40] width:65 height:16 range:[1,1e+006,5] type:#integer fieldwidth:54 align:#left
		GroupBox 'seed_grp' "Seeds" pos:[4,64] width:122 height:80
		spinner 'seed_spnr' "Shape:     " pos:[8,80] width:65 height:16 range:[0,1e+007,12345] type:#integer fieldwidth:54 align:#left
		checkbox 'isSeedOffsets_chk' "Offset:" pos:[6,102] width:54 height:16 checked:true
		spinner 'seedOffsets_spnr' "" pos:[58,102] width:65 height:16 range:[0,1e+007,12345] type:#integer fieldwidth:54 align:#left
		checkbox 'isSeedColumns_chk' "Column:" pos:[6,124] width:54 height:16 checked:true
		spinner 'seedColumns_spnr' "" pos:[58,124] width:65 height:16 range:[0,1e+007,12345] type:#integer fieldwidth:54 align:#left
		checkbox 'isUpdate_chk' "Automatically Update" pos:[4,148] width:122 height:16 checked:true
		button 'Update_btn' "Update" pos:[4,166] width:122 height:34 enabled:false
		checkbox 'is3D_chk' "Generate 3D Puzzles" pos:[4,205] width:122 height:16 checked:false
		button 'Generate_btn' "Generate" pos:[4,228] width:399 height:44
		GroupBox 'Shape_grp' "Shape Parameters" pos:[130,2] width:122 height:98
		spinner 'shapeType_spnr' "Type shape:" pos:[134,20] width:35 height:16 range:[-8,8,2] type:#float fieldwidth:42 align:#left --"-8" - new feature 2020-03-04
		checkbox 'isAdaptive_chk' "High" pos:[132,41] width:40 height:16 checked:true --new feature 2019-07-17
		spinner 'stepsCount_spnr' "Steps:" pos:[176,42] width:34 height:16 range:[0,200,6] type:#integer fieldwidth:30 enabled:false align:#left
		checkbox 'isSeamless_chk' "Seamless puzzle set" pos:[132,62] width:118 height:16 checked:false --new feature 2019-07-15
		checkbox 'isBorders_chk' "Affect border angles" pos:[132,82] width:118 height:16 checked:true enabled:false
		GroupBox 'Columns_grp' "Columns Parameters" pos:[258,2] width:145 height:98 --new feature 2020-03-05
		checkbox 'isColumns_chk' "Total of:" pos:[262,20] width:58 height:16 checked:false
		spinner 'Percent_spnr' "" pos:[320,20] width:84 height:16 range:[0,100,20] type:#float fieldwidth:54 enabled:false align:#left
		label 'Percent_lbl' "%" pos:[388,21] width:12 height:16 align:#left
		slider 'Percent_sldr' "" pos:[265,44] width:143 height:25 range:[0,100,20] orient:#horizontal ticks:10 enabled:false
		checkbox 'isIndividBevel_chk' "Individual Bevel Columns" pos:[262,82] width:139 height:16 checked:false enabled:false --new feature 2020-03-06
		GroupBox 'angle_grp' "in Angles Random Offset" pos:[130,102] width:273 height:120
		GroupBox 'angle_x_grp' "" pos:[134,112] width:121 height:106
		checkbox 'angle_isX_chk' "Offset on X" pos:[140,122] width:88 height:16 checked:true
		checkButton 'angle_xLock_chkBtn' "🔓" pos:[233,122] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max" --new feature 2020-04-12 (🔒)
		spinner 'angle_xMax_spnr' "X max:" pos:[140,142] width:86 height:16 range:[-20,20,1] fieldwidth:46 align:#left
		checkButton 'angle_xMirror_chkBtn' "+" pos:[233,142] width:18 height:16 checked:true tooltip:"Wnen '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'angle_xMin_spnr' "X min: " pos:[140,162] width:86 height:16 range:[-20,20,-1] fieldwidth:46 align:#left
		checkButton 'angle_xAbs_chkBtn' "▢" pos:[233,162] width:18 height:16 tooltip:"Wnen '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'angle_xVertex_grp' "Select Vertexes:" pos:[137,180] width:115 height:35 --new feature 2023-04-30
		checkbox 'angle_x1_chk' "1" pos:[139,196] width:26 height:16 checked:true tooltip:"Affect for first vertex in angles"  --new feature 2023-05-07
		checkButton 'angle_xSign1_chkBtn' "+/-" pos:[166,195] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"  --new feature 2023-05-07 (isSign for vertexes [1-4])
		checkbox 'angle_x2_chk' "2" pos:[195,196] width:26 height:16 checked:true tooltip:"Affect for second vertex in angles"
		checkButton 'angle_xSign2_chkBtn' "+/-" pos:[223,195] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkButton 'angle_xyLock_chkBtn' "🔓" pos:[258,118] width:18 height:16 tooltip:"When '🔓':\n        random Y_value ≠ random X_value\nWhen '🔒':\n        random Y_value = random X_value"
		checkButton 'angle_xyMirror_chkBtn' "=" pos:[258,142] width:18 height:54 checked:true tooltip:"All X_parameters and Y_parameters is equals"
		button 'angle_xyCopySwap_btn' "↔" pos:[258,202] width:18 height:16 tooltip:"Copy/Swap all X_parameters in Y_parameters or conversely" --new feature 2022-03-31
		GroupBox 'angle_y_grp' "" pos:[278,112] width:121 height:106
		checkbox 'angle_isY_chk' "Offset on Y" pos:[284,122] width:88 height:16 checked:true
		checkButton 'angle_yLock_chkBtn' "🔓" pos:[377,122] width:18 height:16 tooltip:"When '🔓':\n        min ≠ max\nWhen '🔒':\n        min = max"
		spinner 'angle_yMax_spnr' "Y max:" pos:[284,142] width:86 height:16 range:[-20,20,1] fieldwidth:46 align:#left
		checkButton 'angle_yMirror_chkBtn' "+" pos:[377,142] width:18 height:16 checked:true tooltip:"Wnen '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
		spinner 'angle_yMin_spnr' "Y min: " pos:[284,162] width:86 height:16 range:[-20,20,-1] fieldwidth:46 align:#left
		checkButton 'angle_yAbs_chkBtn' "▢" pos:[377,162] width:18 height:16 tooltip:"Wnen '▢':\n        range = [min; max]\nWhen '▣':\n        range = [-|max|; -|min|] ⋃ [|min|; |max|]"
		GroupBox 'angle_yVertex_grp' "Select Vertexes:" pos:[281,180] width:115 height:35
		checkbox 'angle_y1_chk' "1" pos:[283,196] width:26 height:16 checked:true tooltip:"Affect for first vertex in angles"
		checkButton 'angle_ySign1_chkBtn' "+/-" pos:[310,195] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		checkbox 'angle_y2_chk' "2" pos:[339,196] width:26 height:16 checked:true tooltip:"Affect for second vertex in angles"
		checkButton 'angle_ySign2_chkBtn' "+/-" pos:[367,195] width:26 height:16 tooltip:"Left Mouse click: ᙂ + | Right Mouse click: ᙂ -\nWhen 'ᙂ +':\n        Sign Offsets in Jut: no change\n        Sign Offsets in Slot: inverse\nWhen 'ᙂ -':\n        Sign Offsets in Jut: inverse\n        Sign Offsets in Slot: no change"
		GroupBox 'changes_grp' "" pos:[407,2] width:170 height:270 --new feature 2020-03-17
		checkbox 'isChange_chk' "Change shapes array custom" pos:[411,12] width:162 height:16 checked:false
		button 'add_btn' "Add" pos:[411,31] width:56 height:18 enabled:false
		button 'refrsh_btn' "Refresh" pos:[411,53] width:56 height:18 enabled:false
		button 'sort_btn' "Sorting" pos:[411,74] width:56 height:16 enabled:false
		button 'del_btn' "Del" pos:[411,94] width:56 height:16 enabled:false
		button 'clr_btn' "Clear" pos:[411,113] width:56 height:16 enabled:false
		spinner 'row_spnr' "Row: " pos:[477,31] width:65 height:16 range:[1,Y_Count_spnr.range[3],1] type:#integer fieldwidth:54 enabled:false align:#left
		spinner 'col_spnr' "Col:   " pos:[477,51] width:65 height:16 range:[1,X_Count_spnr.range[3],1] type:#integer fieldwidth:54 enabled:false align:#left
		listBox 'side_lbx' "   Side:" items:#("Right ", "Down", "Diag  ") pos:[477,68] width:44 height:3 enabled:false
		listBox 'state_lbx' "  State:" items:#("Jut  ᙂ", "Slot ᙅ") pos:[527,68] width:44 height:2 enabled:false
		listBox 'changes_lbx' "" pos:[410,131] width:164 height:10 enabled:false
		
		local selSet = undefined --if need "global variable" not use: global selSet! ... (in MAXScript help "Accessing Locals and Other Items in a Rollout from External Code")
		local randomOffsets = #()
		
		fn strToInt str = (
			result = ""
			for i = 1 to str.count do if matchPattern "0123456789" pattern:("*" + str[i] + "*") then result += str[i]
			result as integer
		)
		
		fn fill_int val isLeft:true = (
			result = val as String
			for i = 1 to 6 - result.count do 
				if isLeft then result = " " + result
				else result = result + " "
			if result.count < 7 then result + " " --smallest space-symbol for length always equal
			else result
		)
		
		rollout yesNoCancel_rllt "" (
			label 'Info_lbl' "What to do with X and Y parameters?"		
			button 'copyX_btn' "Copy X 🡪 Y" pos:[5,26] width:100 height:20
			button 'copyY_btn' "Copy X 🡨 Y" pos:[110,26] width:100 height:20
			button 'swapXY_btn' "Swap X ↔ Y" pos:[5,50] width:205 height:20
			
			local isAutoUpdate, is_chk1, min_spnr1, max_spnr1, lock_btn1, mirror_btn1, abs_btn1, isV1_chk1, isV2_chk1, sign1_btn1, sign2_btn1, is_chk2, min_spnr2, max_spnr2, lock_btn2, mirror_btn2, abs_btn2, isV1_chk2, isV2_chk2, sign1_btn2, sign2_btn2, from_str, in_str
			
			fn copyParameters is_chk1 min_spnr1 max_spnr1 lock_btn1 mirror_btn1 abs_btn1 isV1_chk1 isV2_chk1 sign1_btn1 sign2_btn1 is_chk2 min_spnr2 max_spnr2 lock_btn2 mirror_btn2 abs_btn2 isV1_chk2 isV2_chk2 sign1_btn2 sign2_btn2 = (
				is_chk2.changed(is_chk2.checked = is_chk1.checked)
				min_spnr2.value = min_spnr1.value
				max_spnr2.value = max_spnr1.value
				lock_btn2.changed(lock_btn2.checked = lock_btn1.checked)
				abs_btn2.changed(abs_btn2.checked = abs_btn1.checked)
				isV1_chk2.changed(isV1_chk2.checked = isV1_chk1.checked)
				isV2_chk2.changed(isV2_chk2.checked = isV2_chk1.checked)
				sign1_btn2.checked = sign1_btn1.checked
				sign2_btn2.checked = sign2_btn1.checked
				sign1_btn2.caption = sign1_btn1.caption
				sign2_btn2.caption = sign2_btn1.caption
				mirror_btn2.changed(mirror_btn2.checked = mirror_btn1.checked)
			)
			
			on copyX_btn pressed do
				if (yesNoCancelBox (angle_grp.caption + "\nCopy all " + from_str + "_parameters in " + in_str + "_parameters?") title:сirclePuzzle_rllt.title) == #yes then (
					copyParameters is_chk1 min_spnr1 max_spnr1 lock_btn1 mirror_btn1 abs_btn1 isV1_chk1 isV2_chk1 sign1_btn1 sign2_btn1 is_chk2 min_spnr2 max_spnr2 lock_btn2 mirror_btn2 abs_btn2 isV1_chk2 isV2_chk2 sign1_btn2 sign2_btn2
					if isAutoUpdate then seed_spnr.changed seed_spnr.value
					destroyDialog yesNoCancel_rllt
				)
			
			on copyY_btn pressed do
				if (yesNoCancelBox (angle_grp.caption + "\nCopy all " + in_str + "_parameters in " + from_str + "_parameters?") title:сirclePuzzle_rllt.title) == #yes then (
					copyParameters is_chk2 min_spnr2 max_spnr2 lock_btn2 mirror_btn2 abs_btn2 isV1_chk2 isV2_chk2 sign1_btn2 sign2_btn2 is_chk1 min_spnr1 max_spnr1 lock_btn1 mirror_btn1 abs_btn1 isV1_chk1 isV2_chk1 sign1_btn1 sign2_btn1
					if isAutoUpdate then seed_spnr.changed seed_spnr.value
					destroyDialog yesNoCancel_rllt
				)
			
			on swapXY_btn pressed do (
				tmp = #(/*1*/is_chk1.checked, /*2*/min_spnr1.value, /*3*/max_spnr1.value, /*4*/lock_btn1.checked, /*5*/abs_btn1.checked, /*6*/mirror_btn1.checked, /*7*/isV1_chk1.checked, /*8*/isV2_chk1.checked, /*9*/sign1_btn1.checked, /*10*/sign2_btn1.checked, /*11*/sign1_btn1.caption, /*12*/sign2_btn1.caption) --save X
				copyParameters is_chk2 min_spnr2 max_spnr2 lock_btn2 mirror_btn2 abs_btn2 isV1_chk2 isV2_chk2 sign1_btn2 sign2_btn2 is_chk1 min_spnr1 max_spnr1 lock_btn1 mirror_btn1 abs_btn1 isV1_chk1 isV2_chk1 sign1_btn1 sign2_btn1 --copy Y in X
				is_chk2.changed(is_chk2.checked = tmp[1]) --set Y by saved X
				min_spnr2.value = tmp[2]
				max_spnr2.value = tmp[3]
				lock_btn2.changed(lock_btn2.checked = tmp[4])
				abs_btn2.changed(abs_btn2.checked = tmp[5])
				mirror_btn2.changed(mirror_btn2.checked = tmp[6])
				isV1_chk2.changed(isV1_chk2.checked = tmp[7])
				isV2_chk2.changed(isV2_chk2.checked = tmp[8])
				sign1_btn2.checked = tmp[9]
				sign2_btn2.checked = tmp[10]
				sign1_btn2.caption = tmp[11]
				sign2_btn2.caption = tmp[12]
				if isAutoUpdate then seed_spnr.changed seed_spnr.value
				destroyDialog yesNoCancel_rllt
			)
			
			on yesNoCancel_rllt close do (
				isUpdate_chk.enabled = true
				isUpdate_chk.checked = isAutoUpdate
			)
		)
		
		fn copySwap_btnClick is_chk1 min_spnr1 max_spnr1 lock_btn1 mirror_btn1 abs_btn1 isV1_chk1 isV2_chk1 sign1_btn1 sign2_btn1 is_chk2 min_spnr2 max_spnr2 lock_btn2 mirror_btn2 abs_btn2 isV1_chk2 isV2_chk2 sign1_btn2 sign2_btn2 from_str in_str = (
			posParent = GetDialogPos сirclePuzzle_rllt
			createDialog yesNoCancel_rllt pos:[posParent.X+lock_btn1.pos.X-74,posParent.Y+lock_btn1.pos.Y+11] width:215 height:75 style:#(#style_titlebar, #style_sysmenu) parent:сirclePuzzle_rllt.hwnd; yesNoCancel_rllt.title = angle_grp.caption
			setFocus yesNoCancel_rllt
			yesNoCancel_rllt.is_chk1 = is_chk1; yesNoCancel_rllt.min_spnr1 = min_spnr1; yesNoCancel_rllt.max_spnr1 = max_spnr1; yesNoCancel_rllt.lock_btn1 = lock_btn1; yesNoCancel_rllt.mirror_btn1 = mirror_btn1; yesNoCancel_rllt.abs_btn1 = abs_btn1
				yesNoCancel_rllt.isV1_chk1 = isV1_chk1; yesNoCancel_rllt.isV2_chk1 = isV2_chk1; yesNoCancel_rllt.sign1_btn1 = sign1_btn1; yesNoCancel_rllt.sign2_btn1 = sign2_btn1
			yesNoCancel_rllt.is_chk2 = is_chk2; yesNoCancel_rllt.min_spnr2 = min_spnr2; yesNoCancel_rllt.max_spnr2 = max_spnr2; yesNoCancel_rllt.lock_btn2 = lock_btn2; yesNoCancel_rllt.mirror_btn2 = mirror_btn2; yesNoCancel_rllt.abs_btn2 = abs_btn2
				yesNoCancel_rllt.isV1_chk2 = isV1_chk2; yesNoCancel_rllt.isV2_chk2 = isV2_chk2; yesNoCancel_rllt.sign1_btn2 = sign1_btn2; yesNoCancel_rllt.sign2_btn2 = sign2_btn2
			yesNoCancel_rllt.from_str = from_str; yesNoCancel_rllt.in_str = in_str; yesNoCancel_rllt.isAutoUpdate = isUpdate_chk.checked; isUpdate_chk.enabled = isUpdate_chk.checked = false
		)
		
		fn chkClick is_chk min_spnr max_spnr lock_btn mirror_btn abs_btn isV1_chk isV2_chk sign1_btn sign2_btn = (
			max_spnr.enabled = mirror_btn.enabled = lock_btn.enabled = isV1_chk.enabled = isV2_chk.enabled = is_chk.checked and is_chk.enabled
			sign1_btn.enabled = isV1_chk.checked and isV1_chk.enabled; sign2_btn.enabled = isV2_chk.checked and isV2_chk.enabled
			if isSeamless_chk.checked and isSeamless_chk.enabled then
				if is_chk == angle_isX_chk then angle_x2_chk.enabled = angle_xSign2_chkBtn.enabled = false
				else if is_chk == angle_isY_chk then angle_y2_chk.enabled = angle_ySign2_chkBtn.enabled = false
			min_spnr.enabled = abs_btn.enabled = is_chk.checked and is_chk.enabled and not lock_btn.checked and not mirror_btn.checked
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		fn lock_btnClick is_chk min_spnr lock_btn mirror_btn abs_btn = (
			if lock_btn.checked then (
				lock_btn.caption = "🔒"
				min_spnr.enabled = abs_btn.enabled = false
				mirror_btn.tooltip = "Wnen '+':\n        range = [max]\nWhen '-':\n        range = [-max] ⋃ [max]"
			) else (
				lock_btn.caption = "🔓"
				min_spnr.enabled = abs_btn.enabled = not mirror_btn.checked and is_chk.checked and is_chk.enabled
				mirror_btn.tooltip = "Wnen '+':\n        range = [min; max]\nWhen '-':\n        range = [-max; max]"
			)
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		fn mirror_btnClick is_chk min_spnr lock_btn mirror_btn abs_btn = (
			if mirror_btn.checked then (
				mirror_btn.caption = "-"
				min_spnr.enabled = abs_btn.enabled = false
			) else (
				mirror_btn.caption = "+"
				min_spnr.enabled = abs_btn.enabled = not lock_btn.checked and is_chk.checked and is_chk.enabled
			)
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
	
		fn abs_btnClick abs_btn = (
			if abs_btn.checked then abs_btn.caption = "▣" else abs_btn.caption = "▢"
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		fn xyMirror_btnClick xyMirror_btn is_chk lock_btn min_spnr mirror_btn max_spnr abs_btn isV1_chk isV2_chk sign1_btn sign2_btn = (
			is_chk.enabled = xyMirror_btn.enabled and not xyMirror_btn.checked
			if xyMirror_btn.checked then (
				min_spnr.enabled = mirror_btn.enabled = max_spnr.enabled = abs_btn.enabled = isV1_chk.enabled = isV2_chk.enabled = sign1_btn.enabled = sign2_btn.enabled = lock_btn.enabled = false
				if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
			) else chkClick is_chk min_spnr max_spnr lock_btn mirror_btn abs_btn isV1_chk isV2_chk sign1_btn sign2_btn
		)
		
		fn sign_btnClick sign_btn sign state = (
			sign_btn.checked = state or sign_btn.caption[3] != sign 
			if sign_btn.checked then sign_btn.caption = "ᙂ " + sign
			else sign_btn.caption = "+/-"
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		fn isSignNeedChange param isJut vertex = (param[4][vertex][1]) and (param[4][vertex][2] != isJut)
		
		fn randomRange param isJut vertex isSign:true = (
			if param[3] then ( --if isAbs
				if (random 0.0 1.0) < 0.5 then result = -random param[1] param[2] --random 0.0 1.0 more accurate than random 0 1
				else result = random param[1] param[2]
			) else if (random 0.0 1.0) < 2 then result = random param[1] param[2] --"if (random 0.0 1.0) < 2 then" need because count of number calls function random
			if isSign then if isSignNeedChange param isJut vertex then result = -result --if isSign
			result
		)
		
		fn paramsSet param min_spnr max_spnr isLock isMirror =
			if isLock then (
				param[1] = max_spnr
				param[2] = max_spnr
				param[3] = isMirror --equal if it isAbs: [-max] U [max] or only [max]
			) else if isMirror then (
				param[1] = -max_spnr
				param[2] = max_spnr
			) else if param[3] then ( --if isAbs
				param[1] = abs(min_spnr)
				param[2] = abs(max_spnr)
			) else (
				param[1] = min_spnr
				param[2] = max_spnr
			)
		
		fn paramsAllSet xParams yParams xMin_spnr xMax_spnr xLock xMirror isX yMin_spnr yMax_spnr yLock yMirror isY isEqual = (
			if isX then paramsSet xParams xMin_spnr xMax_spnr xLock xMirror
			if isEqual then ( --need copy by element! (not yParams = xParams) or use deepcopy()
				yParams[1] = xParams[1] --min
				yParams[2] = xParams[2] --max
				yParams[3] = xParams[3] --isAbs
				yParams[4][1][1] = xParams[4][1][1]; yParams[4][1][2] = xParams[4][1][2]; yParams[4][2][1] = xParams[4][2][1]; yParams[4][2][2] = xParams[4][2][2] --isSign
				yParams[5][1] = xParams[5][1]; yParams[5][2] = xParams[5][2] --isVertex
			) else if isY then paramsSet yParams yMin_spnr yMax_spnr yLock yMirror
		)
		
		fn fill_str s = (
			end_s = ""
			for i = 1 to (3 - s.count) do end_s += "0"
			(end_s + s)
		)
		
		fn UniqName name_input = (
			k = 1
			num_str = fill_str (k as String)
			isHaving = selectionSets.count > 0
			while isHaving do 
				for s in selectionSets do
					if s.name == (name_input + num_str) then (
						k += 1
						num_str = fill_str (k as String)
						isHaving = true
					) else isHaving = false
			(name_input + num_str)
		)
		
		fn f_columnArray piecesArray isSeamless = (/*
			aaaaa = ?
			aaaaaaa = #()
			for a = ? to A_Aaaaa_aaaa.aaaaa do
				for a = ? to A_Aaaaa_aaaa.aaaaa do (
					if aaAaaaaaaa or (a < A_Aaaaa_aaaa.aaaaa) then (
						aaaaa += ?
						aaaaaaa[aaaaa] = #(a, a, true)
					)
					if aaAaaaaaaa or (a < A_Aaaaa_aaaa.aaaaa) then (
						aaaaa += ?
						aaaaaaa[aaaaa] = #(a, a, false)
					)
					--aaaa aaaaaaAaaaa to aaaaa aaaaa (? and ?)
					if a > ? then aaaaaaAaaaa[a][a][?] = ? - aaaaaaAaaaa[a - ?][a][?]
					else if aaAaaaaaaa then aaaaaaAaaaa[?][a][?] = ? - aaaaaaAaaaa[A_Aaaaa_aaaa.aaaaa][a][?]
					if a > ? then aaaaaaAaaaa[a][a][?] = ? - aaaaaaAaaaa[a][a - ?][?]
					else if aaAaaaaaaa then aaaaaaAaaaa[a][?][?] = ? - aaaaaaAaaaa[a][A_Aaaaa_aaaa.aaaaa][?]
				)
			
			if (not aaAaaaaaa_aaa.aaaaaaa) or (Aaaaaaa_aaaa.aaaaa == ?) or (not aaAaaaaaaa and (A_Aaaaa_aaaa.aaaaa + A_Aaaaa_aaaa.aaaaa < ?)) then return ?
			if aaAaaaAaaaaaa_aaa.aaaaaaa then aaaa aaaaAaaaaaa_aaaa.aaaaa
			aaaaa = aaaa(aaaaa * ?.?? * Aaaaaaa_aaaa.aaaaa) --aaaaa of aaaa aaaaaa aaaaaaa
			aaaAaaaa = aaaaaaa.aaaaa
			for a = ? to aaaaa do (
				aaaaa = aaaaaa ? aaaAaaaa
				if aaaaaaa[aaaaa][?] then ( --aaaaa
					aaAaaaaaaa = aaaaaaa[aaaaa][?] == A_Aaaaa_aaaa.aaaaa
					if aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]][?] == ? then (
						aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]][?] = ?
						if aaAaaaaaaa then aaaaaaAaaaa[?][aaaaaaa[aaaaa][?]][?] = ? --aaaaaaaa
						else aaaaaaAaaaa[aaaaaaa[aaaaa][?]+?][aaaaaaa[aaaaa][?]][?] = ?
					) else (
						aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]][?] = ?
						if aaAaaaaaaa then aaaaaaAaaaa[?][aaaaaaa[aaaaa][?]][?] = ?
						else aaaaaaAaaaa[aaaaaaa[aaaaa][?]+?][aaaaaaa[aaaaa][?]][?] = ?
					)
				) else ( --aaaa
					aaAaaaaaaa = aaaaaaa[aaaaa][?] == A_Aaaaa_aaaa.aaaaa
					if aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]][?] == ? then (
						aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]][?] = ?
						if aaAaaaaaaa then aaaaaaAaaaa[aaaaaaa[aaaaa][?]][?][?] = ? --aaaaaaaa
						else aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]+?][?] = ?
					) else (
						aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]][?] = ?
						if aaAaaaaaaa then aaaaaaAaaaa[aaaaaaa[aaaaa][?]][?][?] = ?
						else aaaaaaAaaaa[aaaaaaa[aaaaa][?]][aaaaaaa[aaaaa][?]+?][?] = ?
					)
				)
				aaaaaaa[aaaaa] = aaaaaaa[aaaAaaaa]
				aaaAaaaa -= ?
			)*/
		)
		
		fn f_puzzleArray isSeamless = (/*
			--array faster that struct by 6%. [_1_ minValue, _2_maxValue, _3_isAbs, _4_isSign[1-4], _5_isVertexes[1-4]]. use array instead variable (xMin, xMax) for compact code. can use other way: fn foo &min min_spnr = min = min_spnr.value; min = 0; foo &min angle_xMin_spnr;
			aaaaaA = #(?, ?, aaaaa_aAaa_aaaAaa.aaaaaaa, #(#(aaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+")), #(aaaaa_a?_aaa.aaaaaaa and aaaaa_a?_aaa.aaaaaaa, aaaaa_a?_aaa.aaaaaaa and aaaaa_a?_aaa.aaaaaaa))
			aaaaaA = #(?, ?, aaaaa_aAaa_aaaAaa.aaaaaaa, #(#(aaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+"), #(aaaaa_aAaaa?_aaaAaa.aaaaaaa and aaaaa_aAaaa?_aaaAaa.aaaaaaa, aaaaa_aAaaa?_aaaAaa.aaaaaaa[?] == "+")), #(aaaaa_a?_aaa.aaaaaaa and aaaaa_a?_aaa.aaaaaaa, aaaaa_a?_aaa.aaaaaaa and aaaaa_a?_aaa.aaaaaaa))
			aaaaaAaAAaaaa = aaaaa_aaAaaa_aaaAaa.aaaaaaa
			aaaaaaAaaAaa aaaaaA aaaaaA aaaaa_aAaa_aaaa.aaaaa aaaaa_aAaa_aaaa.aaaaa aaaaa_aAaaa_aaaAaa.aaaaaaa aaaaa_aAaaaaa_aaaAaa.aaaaaaa aaaaa_aaA_aaa.aaaaaaa aaaaa_aAaa_aaaa.aaaaa aaaaa_aAaa_aaaa.aaaaa aaaaa_aAaaa_aaaAaa.aaaaaaa aaaaa_aAaaaaa_aaaAaa.aaaaaaa aaaaa_aaA_aaa.aaaaaaa aaaaa_aaAaaaaa_aaaAaa.aaaaaaa
			aaaaaaAaaaaaa = #() --aaaaa of aaaaaa aaaaaaa for aaaaaa: ?-aaa_aaaa, ?-aaa_aaaaa, ?-aaaa_aaaa, ?-aaaa_aaaaa
			aaaaaaAaaaa = #() --aaaaa for aaaaaa: where aaa or aaaa
			for a = ? to A_Aaaaa_aaaa.aaaaa do (
				aaaaaaAaaaa[a] = #()
				aaaaaaAaaaaaa[a] = #()
				for a = ? to A_Aaaaa_aaaa.aaaaa do (
					aaaaaaAaaaa[a][a] = #(aaaaaa ? ?, aaaaaa ? ?, undefined, undefined) --aaaaaaaa aaaaaaAaaaa aaaaaaa aaaa aaaaaaAaaaaaa for aaaaa aaAaaaaa
					aaaaaaAaaaaaa[a][a] = #([?,?], [?,?], [?,?], [?,?]) --aaaaaa aaaa for ? and ?. ? and ? aaa from ? and ? aaaaaaa aaa or aaaaaa
				)
			)
			if aaAaaaaa_aaa.aaaaaaa then for aaa in aaaaaaa_aaa.aaaaa do (
				a = aaaAaAaa(aaaaaaaaa aaa ? ?)
				a = aaaAaAaa(aaaaaaaaa aaa ? ?)
				if (a <= A_Aaaaa_aaaa.aaaaa) and (a <= A_Aaaaa_aaaa.aaaaa) then
					aaaaaaAaaaa[a][a][if aaa[??] == "A" then ? else if aaa[??] == "a" then ? else ?] = if aaa[aaa.aaaaa-?] == "a" then ? else ? -- !!!!!!!!!!! if "A" then ... else if "a" then ... else ?/?# (when aaaaa aaaaaaaaa aaaaaa aaaa) !!!!!!!!!!
			)
			
			a_aaaaaaAaaaa aaaaaaAaaaa aaAaaaaaaa --aaaaaaaa aaaaaa aaaaa and aaaaaaaaaaaaAaaaa (aaaaaaAaaaa[a][a] == ? then aaaaa aaaaaa)
			if aaAaaaAaaaaaa_aaa.aaaaaaa then aaaa aaaaAaaaaaa_aaaa.aaaaa
			for a = ? to A_Aaaaa_aaaa.aaaaa do
				for a = ? to A_Aaaaa_aaaa.aaaaa do (
					if a > ? then ( --for aaaaa #?_A
						aaaaaaAaaaaaa[a][a][?].A = aaaaaaAaaaa aaaaaA (aaaaaaAaaaa[a - ?][a][?] != ?) ?; if not aaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?].A = ?
						aaaaaaAaaaaaa[a - ?][a][?].A = aaaaaaAaaaaaa[a][a][?].A
						if a < A_Aaaaa_aaaa.aaaaa then (
							aaaaaaAaaaaaa[a][a + ?][?].A = aaaaaaAaaaaaa[a][a][?].A
							aaaaaaAaaaaaa[a - ?][a + ?][?].A = aaaaaaAaaaaaa[a][a][?].A
						)
					)
					if a < A_Aaaaa_aaaa.aaaaa then ( --for aaaaa #?_A
						aaaaaaAaaaaaa[a][a][?].A = if aaaaaAaAAaaaa then if a > ? then aaaaaaAaaaaaa[a][a][?].A else aaaaaaAaaaa aaaaaA (aaaaaaAaaaa[a][a + ?][?] != ?) ? else aaaaaaAaaaa aaaaaA (aaaaaaAaaaa[a][a + ?][?] != ?) ?; if not aaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?].A = ?
						aaaaaaAaaaaaa[a][a + ?][?].A = aaaaaaAaaaaaa[a][a][?].A
						if a > ? then (
							aaaaaaAaaaaaa[a - ?][a][?].A = aaaaaaAaaaaaa[a][a][?].A
							aaaaaaAaaaaaa[a - ?][a + ?][?].A = aaaaaaAaaaaaa[a][a][?].A
						)
					)
					if (a == ?) or (a == A_Aaaaa_aaaa.aaaaa) then (
						if a < A_Aaaaa_aaaa.aaaaa then ( --for aaaaa #?_A
							aaaaaaAaaaaaa[a][a][?].A = aaaaaaAaaaa aaaaaA ((aaaaaa ?.? ?.?) < ?.?) ?; if not aaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?].A = ?
							aaaaaaAaaaaaa[a + ?][a][?].A = aaaaaaAaaaaaa[a][a][?].A
						)
						if a > ? then ( --for aaaaa #?_A
							aaaaaaAaaaaaa[a][a][?].A = if aaaaaAaAAaaaa then aaaaaaAaaaa aaaaaA ((aaaaaa ?.? ?.?) < ?.?) ? else aaaaaaAaaaa aaaaaA ((aaaaaa ?.? ?.?) < ?.?) ?; if not aaaaaA[?][?] then aaaaaaAaaaaaa[a][a][?].A = ?
							aaaaaaAaaaaaa[a][a - ?][?].A = aaaaaaAaaaaaa[a][a][?].A
						)
					)
					
					if aaAaaaaaaa then (
						if a == A_Aaaaa_aaaa.aaaaa then (
							aaaaaaAaaaaaa[?][a][?] = aaaaaaAaaaaaa[a][a][?]
							aaaaaaAaaaaaa[?][a][?] = aaaaaaAaaaaaa[a][a][?]
						)
						if a == A_Aaaaa_aaaa.aaaaa then (
							aaaaaaAaaaaaa[a][?][?] = aaaaaaAaaaaaa[a][a][?]
							aaaaaaAaaaaaa[a][?][?] = aaaaaaAaaaaaa[a][a][?]
						)
					)
				)
			
			if aaAaaaaaaa_aaa.aaaaaaa then (
				aaAaaaaaa = aaAaaaaaa_aaa.aaaaaaa
				for a = ? to A_Aaaaa_aaaa.aaaaa do (
					if aaAaaaaaa then ( --aaa aaaaaa A
						if a > ? then aaaaaaAaaaaaa[a][A_Aaaaa_aaaa.aaaaa][?].A = aaaaaaAaaaaaa[a - ?][A_Aaaaa_aaaa.aaaaa][?].A
						aaaaaaAaaaaaa[a][A_Aaaaa_aaaa.aaaaa][?].A = aaaaaaAaaaa aaaaaA ((aaaaaa ?.? ?.?) < ?.?) ?; if not aaaaaA[?][?] then aaaaaaAaaaaaa[a][A_Aaaaa_aaaa.aaaaa][?].A = ?
					)
					aaaaaaAaaaaaa[a][?][?] = aaaaaaAaaaaaa[a][A_Aaaaa_aaaa.aaaaa][?]
					aaaaaaAaaaaaa[a][?][?] = aaaaaaAaaaaaa[a][A_Aaaaa_aaaa.aaaaa][?]
				)
				for a = ? to A_Aaaaa_aaaa.aaaaa do (
					if aaAaaaaaa then ( --aaa aaaaaa A
						if a > ? then aaaaaaAaaaaaa[A_Aaaaa_aaaa.aaaaa][a][?].A = aaaaaaAaaaaaa[A_Aaaaa_aaaa.aaaaa][a - ?][?].A
						aaaaaaAaaaaaa[A_Aaaaa_aaaa.aaaaa][a][?].A = aaaaaaAaaaa aaaaaA ((aaaaaa ?.? ?.?) < ?.?) ?; if not aaaaaA[?][?] then aaaaaaAaaaaaa[A_Aaaaa_aaaa.aaaaa][a][?].A = ?
					)
					aaaaaaAaaaaaa[?][a][?] = aaaaaaAaaaaaa[A_Aaaaa_aaaa.aaaaa][a][?]
					aaaaaaAaaaaaa[?][a][?] = aaaaaaAaaaaaa[A_Aaaaa_aaaa.aaaaa][a][?]
				)
			)
			
			aaaaaaAaaaa*/
		)
		
		fn buildPuzzle x y r d l u isSeamless = (/*
			aaaaaAaaa = aaaaaAaaa_aaaa.aaaaa
			aaaaaa = aaaaaaaaaaa()
			aaaaaaaaaaaa aaaaaa
			aaaaaa.aaaaa = aaaaaAaaaa_aaaa.aaaaa
			aaaaaa.aaaaaaaa = aaAaaaaaaa_aaa.aaaaaaa
			aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?].A, ??+aaaaaaAaaaaaa[a][a][?].A, ?.?] ( --in aaaaaaaa aaaaaa aaa #aaaaaa, aaa aaaaa Aaaaaa Aaaaaa Aaaaa in aaaaaa aaaaaaa aaa'a aaaaa
				if a == ? then ([?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ??.????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
					else if (a == ?) or (a == ?) then ([?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
						else ([??+aaaaaaAaaaaaa[a][a][?].A, ??+aaaaaaAaaaaaa[a][a][?].A, ?.?])) ( --if undefined (aaaaaa)
				if (a == ?) and (aaAaaaaaaa or (a != A_Aaaaa_aaaa.aaaaa)) then ([??.????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
					else if ((a == ?) or (a == ?)) and (aaAaaaaaaa or (a != A_Aaaaa_aaaa.aaaaa)) then ([?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
						else ([??+aaaaaaAaaaaaa[a][a][?].A, ??+aaaaaaAaaaaaa[a][a][?].A, ?.?]))
			
			aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?].A, -??+aaaaaaAaaaaaa[a][a][?].A, ?.?] (
				if (a == ?) and (aaAaaaaaaa or (a != A_Aaaaa_aaaa.aaaaa)) then ([??.????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
					else if ((a == ?) or (a == ?)) and (aaAaaaaaaa or (a != A_Aaaaa_aaaa.aaaaa)) then ([?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
						else ([??+aaaaaaAaaaaaa[a][a][?].A, -??+aaaaaaAaaaaaa[a][a][?].A, ?.?])) (
				if (a == ?) and (aaAaaaaaaa or (a != A_Aaaaa_aaaa.aaaaa)) then ([?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -??.????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
					else if ((a == ?) or (a == ?)) and (aaAaaaaaaa or (a != A_Aaaaa_aaaa.aaaaa)) then ([?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
						else ([??+aaaaaaAaaaaaa[a][a][?].A, -??+aaaaaaAaaaaaa[a][a][?].A, ?.?]))
			
			aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][?].A, -??+aaaaaaAaaaaaa[a][a][?].A, ?.?] (
				if (a == ?) and (aaAaaaaaaa or (a != A_Aaaaa_aaaa.aaaaa)) then ([-?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -??.????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
					else if ((a == ?) or (a == ?)) and (aaAaaaaaaa or (a != A_Aaaaa_aaaa.aaaaa)) then ([-?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
						else ([-??+aaaaaaAaaaaaa[a][a][?].A, -??+aaaaaaAaaaaaa[a][a][?].A, ?.?])) (
				if a == ? then ([-??.????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
					else if (a == ?) or (a == ?) then ([-?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
						else ([-??+aaaaaaAaaaaaa[a][a][?].A, -??+aaaaaaAaaaaaa[a][a][?].A, ?.?]))
			
			aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][?].A, ??+aaaaaaAaaaaaa[a][a][?].A, ?.?] (
				if a == ? then ([-??.????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
					else if (a == ?) or (a == ?) then ([-?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
						else ([-??+aaaaaaAaaaaaa[a][a][?].A, ??+aaaaaaAaaaaaa[a][a][?].A, ?.?])) (
				if a == ? then ([-?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ??.????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
					else if (a == ?) or (a == ?) then ([-?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?])
						else ([-??+aaaaaaAaaaaaa[a][a][?].A, ??+aaaaaaAaaaaaa[a][a][?].A, ?.?]))
			
			aaaaa aaaaaa ?
			aaaaaaAaaaa aaaaaa --aaaaaaa aa aaaaa aaaaaa aaa'a aaaaaa aaa aaaa/aaaaaaa/aaaaaa in AaaaAaaaaa and aaa aaaa aaaaaa
			aaaaaa.aaaaaaaaa = aaaaaa (aaaaa ? ? ?) (aaaaa ??? ??? ???)
			aaaaaa.aaa = [?? * a, -?? * a, ?]
			aaaaaaAaaa aaaaaa*/
		)
		
		fn buildColumn x y side = (/*
			aaaaaAaaa = aaaaaAaaa_aaaa.aaaaa
			aaaaaa = aaaaaaaaaaa()
			aaaaaaaaaaaa aaaaaa
			aaaaaa.aaaaa = aaaaaAaaaa_aaaa.aaaaa
			aaaaaa.aaaaaaaa = aaAaaaaaaa_aaa.aaaaaaa
			if aaaa == ? then ( --Aaaa_#?_a=?_a=?; Aaaa_#?_a=?_a=?
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?].A, ??+aaaaaaAaaaaaa[a][a][?].A, ?.?] [?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?] [??.????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?]
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?].A, -??+aaaaaaAaaaaaa[a][a][?].A, ?.?] [??.????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?] [?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?]
			) else if aaaa == ? then ( --Aaaa_#?_a=?_a=?; Aaaa_#?_a=?_a=?
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?].A, -??+aaaaaaAaaaaaa[a][a][?].A, ?.?] [?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?] [?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -??.????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?]
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][?].A, -??+aaaaaaAaaaaaa[a][a][?].A, ?.?] [-?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -??.????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?] [-?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?]
			) else if aaaa == ? then ( --Aaaa_#?_a=?_a=?; Aaaa_#?_a=?_a=?
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][?].A, -??+aaaaaaAaaaaaa[a][a][?].A, ?.?] [-?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?] [-??.????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, -?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?]
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][?].A, ??+aaaaaaAaaaaaa[a][a][?].A, ?.?] [-??.????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?] [-?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?]
			) else if aaaa == ? then ( --Aaaa_#?_a=?_a=?; Aaaa_#?_a=?_a=?
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [-??+aaaaaaAaaaaaa[a][a][?].A, ??+aaaaaaAaaaaaa[a][a][?].A, ?.?] [-?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?] [-?.?????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ??.????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?]
				aaaaaaa aaaaaa ? #aaaaaaAaaaaa #aaaaa [??+aaaaaaAaaaaaa[a][a][?].A, ??+aaaaaaAaaaaaa[a][a][?].A, ?.?] [?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ??.????-aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?] [?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?????+aaaaaAaaa+aaaaaaAaaaaaa[a][a][?].A, ?.?]
			)
			aaaaa aaaaaa ?
			aaaaaaAaaaa aaaaaa
			aaaaaa.aaaaaaaaa = aaaaaa (aaaaa ? ? ?) (aaaaa ??? ??? ???)
			aaaaaa.aaa = [?? * a, -?? * a, ?]
			aaaaaa aaaAaa aaaaaa*/
		)
		
		fn applyModifiers = (
			newModifier = Bevel(); newModifier.Level_1_Height = 2; newModifier.Use_Level_2 = 1; newModifier.Level_2_Height = 1; newModifier.Level_2_Outline = -0.5
			modPanel.addModToSelection newModifier --when modifier is variable (newModifier) it work faster than selSet[1].modifiers[#Bevel].Level_1_Height = ... (in MAXScript help "Cache frequently used functions and objects")
			newModifier = Smooth(); newModifier.autoSmooth = true; newModifier.Threshold = 30
			modPanel.addModToSelection newModifier
			modPanel.addModToSelection (Uvwmap())
		)
		
		on сirclePuzzle_rllt open do (
			seedColumns_spnr.value = random 0 1e+006
			seedOffsets_spnr.value = random 0 1e+006
			seed_spnr.value = random 0 1e+006
			seed seed_spnr.value
			angle_xMirror_chkBtn.changed true
			angle_yMirror_chkBtn.changed true
			angle_xyMirror_chkBtn.changed true
		)
		
		on Generate_btn pressed do with redraw off ( suspendEditing()
			isSeamless = isSeamless_chk.checked
			selSet = #()
			clearSelection()
			pArray = f_puzzleArray isSeamless
			for j = 1 to Y_Count_spnr.value do
				for i = 1 to X_Count_spnr.value do (/*
					buildPuzzle i j pArray[i][j][1] pArray[i][j][2] pArray[i][j][3] pArray[i][j][4] isSeamless
					if pArray[i][j][1] == 2 then buildColumn i j 1
					if pArray[i][j][2] == 2 then buildColumn i j 2
					if pArray[i][j][3] == 2 then buildColumn i j 3
					if pArray[i][j][4] == 2 then buildColumn i j 4*/
				)
			
			tmp = UniqName "сirclePuzzles"; selectionSets[tmp] = selection --only puzzles
			resumeEditing()
			max modify mode --instead ui:on for each modifier
			if isIndividBevel_chk.enabled and isIndividBevel_chk.checked then (
				if is3D_chk.checked then applyModifiers()
				select selSet
				if is3D_chk.checked then applyModifiers() --for columns
				selectMore selectionSets[tmp]
			) else (
				selectMore selSet
				if is3D_chk.checked then applyModifiers()
			)
			selectionSets[tmp] = selection; selSet = selectionSets[tmp] --puzzles and columns
			puzzlesLeft = #(-15 * X_Count_spnr.value, 15 * Y_Count_spnr.value) --left-top angle of puzzles
			/*move $ [puzzlesLeft[1]-15, puzzlesLeft[2]+15, 0]*/
		)
		
		on seed_spnr changed val do with redraw off (
			seed seed_spnr.value
			if selSet != undefined then
				if not (isDeleted selSet) then (
					delete selSet
					for obj in selSet do delete obj
					deleteItem selectionSets selSet
					Generate_btn.pressed()
				)
		)
		
		on seedOffsets_spnr changed val do seed_spnr.changed seed_spnr.value
		
		on seedColumns_spnr changed val do seed_spnr.changed seed_spnr.value
		
		on isSeedOffsets_chk changed state do (seedOffsets_spnr.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on isSeedColumns_chk changed state do (seedColumns_spnr.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on is3D_chk changed state do (isIndividBevel_chk.enabled = isColumns_chk.checked and state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on isAdaptive_chk changed state do (stepsCount_spnr.enabled = not state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on isSeamless_chk changed state do (
			isBorders_chk.enabled = state
			if state then angle_x2_chk.enabled = angle_xSign2_chkBtn.enabled = angle_y2_chk.enabled = angle_ySign2_chkBtn.enabled = false
			else (
				angle_x2_chk.enabled = angle_isX_chk.enabled
				angle_xSign2_chkBtn.enabled = angle_x2_chk.checked and angle_x2_chk.enabled
				angle_y2_chk.enabled = angle_isY_chk.enabled
				angle_ySign2_chkBtn.enabled = angle_y2_chk.checked and angle_y2_chk.enabled
			)
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		on isBorders_chk changed state do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on isColumns_chk changed state do (
			Percent_spnr.enabled = Percent_sldr.enabled = state
			isIndividBevel_chk.enabled = state and is3D_chk.checked
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		on isIndividBevel_chk changed state do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on Percent_sldr changed val do Percent_spnr.changed val
		
		on Percent_sldr rightClick do Percent_spnr.changed 20
		
		on Percent_spnr changed val do (Percent_spnr.value = Percent_sldr.value = val; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on isChange_chk changed state do (
			add_btn.enabled = refrsh_btn.enabled = sort_btn.enabled = del_btn.enabled = clr_btn.enabled = row_spnr.enabled = col_spnr.enabled = side_lbx.enabled = state_lbx.enabled = changes_lbx.enabled = state
			if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		)
		
		on add_btn pressed do (
			i = 1
			isNeedAdd = true
			while i <= changes_lbx.items.count do ( --find copy of row and col and side
				if row_spnr.value == strToInt(substring changes_lbx.items[i] 1 7) then
					if col_spnr.value == strToInt(substring changes_lbx.items[i] 9 7) then 
						if changes_lbx.items[i][19] == side_lbx.selected[3] then (
							isNeedAdd = false
							i = changes_lbx.items.count
						)
				i += 1
			)
			if isNeedAdd then (changes_lbx.items = append changes_lbx.items (fill_int(row_spnr.value) + ":" + (fill_int col_spnr.value isLeft:false) + "|" + side_lbx.selected + " = " + state_lbx.selected); if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		)
		
		on refrsh_btn pressed do if changes_lbx.selection > 0 then (tmp = changes_lbx.items; tmp[changes_lbx.selection] = fill_int(row_spnr.value) + ":" + (fill_int col_spnr.value isLeft:false) + "|" + side_lbx.selected + " = " + state_lbx.selected; changes_lbx.items = tmp; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on sort_btn pressed do if changes_lbx.items.count > 0 then (tmp = changes_lbx.items; sort tmp; changes_lbx.items = tmp)
		
		on del_btn pressed do if changes_lbx.selection > 0 then (changes_lbx.items = deleteItem changes_lbx.items changes_lbx.selection; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on clr_btn pressed do (changes_lbx.items = #(); if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on changes_lbx rightClick do if changes_lbx.selection > 0 then (
			row_spnr.value = strToInt(substring changes_lbx.selected 1 7)
			col_spnr.value = strToInt(substring changes_lbx.selected 9 7)
			if changes_lbx.selected[17] == "R" then side_lbx.selection = 1 else if changes_lbx.selected[19] == "w" then side_lbx.selection = 2 else side_lbx.selection = 3
			if changes_lbx.selected[changes_lbx.selected.count-1] == "u" then state_lbx.selection = 1 else state_lbx.selection = 2
		)
		
		on angle_isX_chk changed state do chkClick angle_isX_chk angle_xMin_spnr angle_xMax_spnr angle_xLock_chkBtn angle_xMirror_chkBtn angle_xAbs_chkBtn angle_x1_chk angle_x2_chk angle_xSign1_chkBtn angle_xSign2_chkBtn
		
		on angle_xLock_chkBtn changed state do lock_btnClick angle_isX_chk angle_xMin_spnr angle_xLock_chkBtn angle_xMirror_chkBtn angle_xAbs_chkBtn
		
		on angle_xMirror_chkBtn changed state do mirror_btnClick angle_isX_chk angle_xMin_spnr angle_xLock_chkBtn angle_xMirror_chkBtn angle_xAbs_chkBtn
		
		on angle_xAbs_chkBtn changed state do abs_btnClick angle_xAbs_chkBtn
		
		on angle_x1_chk changed state do (angle_xSign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on angle_x2_chk changed state do (angle_xSign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on angle_xSign1_chkBtn changed state do sign_btnClick angle_xSign1_chkBtn "+" state
		
		on angle_xSign2_chkBtn changed state do sign_btnClick angle_xSign2_chkBtn "+" state
		
		on angle_xSign1_chkBtn rightclick do sign_btnClick angle_xSign1_chkBtn "-" (not angle_xSign1_chkBtn.checked)
		
		on angle_xSign2_chkBtn rightclick do sign_btnClick angle_xSign2_chkBtn "-" (not angle_xSign2_chkBtn.checked)
		
		on angle_xyLock_chkBtn changed state do (
			angle_xyMirror_chkBtn.enabled = not state
			xyMirror_btnClick angle_xyMirror_chkBtn angle_isY_chk angle_yLock_chkBtn angle_yMin_spnr angle_yMirror_chkBtn angle_yMax_spnr angle_yAbs_chkBtn angle_y1_chk angle_y2_chk angle_ySign1_chkBtn angle_ySign2_chkBtn
		)
		
		on angle_xyMirror_chkBtn changed state do xyMirror_btnClick angle_xyMirror_chkBtn angle_isY_chk angle_yLock_chkBtn angle_yMin_spnr angle_yMirror_chkBtn angle_yMax_spnr angle_yAbs_chkBtn angle_y1_chk angle_y2_chk angle_ySign1_chkBtn angle_ySign2_chkBtn
		
		on angle_xyCopySwap_btn pressed do copySwap_btnClick angle_isX_chk angle_xMin_spnr angle_xMax_spnr angle_xLock_chkBtn angle_xMirror_chkBtn angle_xAbs_chkBtn angle_x1_chk angle_x2_chk angle_xSign1_chkBtn angle_xSign2_chkBtn angle_isY_chk angle_yMin_spnr angle_yMax_spnr angle_yLock_chkBtn angle_yMirror_chkBtn angle_yAbs_chkBtn angle_y1_chk angle_y2_chk angle_ySign1_chkBtn angle_ySign2_chkBtn "X" "Y"
		
		on angle_isY_chk changed state do chkClick angle_isY_chk angle_yMin_spnr angle_yMax_spnr angle_yLock_chkBtn angle_yMirror_chkBtn angle_yAbs_chkBtn angle_y1_chk angle_y2_chk angle_ySign1_chkBtn angle_ySign2_chkBtn
		
		on angle_yLock_chkBtn changed state do lock_btnClick angle_isY_chk angle_yMin_spnr angle_yLock_chkBtn angle_yMirror_chkBtn angle_yAbs_chkBtn
		
		on angle_yMirror_chkBtn changed state do mirror_btnClick angle_isY_chk angle_yMin_spnr angle_yLock_chkBtn angle_yMirror_chkBtn angle_yAbs_chkBtn
		
		on angle_yAbs_chkBtn changed state do abs_btnClick angle_yAbs_chkBtn
		
		on angle_y1_chk changed state do (angle_ySign1_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on angle_y2_chk changed state do (angle_ySign2_chkBtn.enabled = state; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on angle_ySign1_chkBtn changed state do sign_btnClick angle_ySign1_chkBtn "+" state
		
		on angle_ySign2_chkBtn changed state do sign_btnClick angle_ySign2_chkBtn "+" state
		
		on angle_ySign1_chkBtn rightclick do sign_btnClick angle_ySign1_chkBtn "-" (not angle_ySign1_chkBtn.checked)
		
		on angle_ySign2_chkBtn rightclick do sign_btnClick angle_ySign2_chkBtn "-" (not angle_ySign2_chkBtn.checked)
		
		on X_Count_spnr changed val do (col_spnr.range = [1,val,1]; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on Y_Count_spnr changed val do (row_spnr.range = [1,val,1]; if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value)
		
		on shapeType_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on stepsCount_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on angle_xMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on angle_xMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on angle_yMax_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on angle_yMin_spnr changed val do if isUpdate_chk.checked then seed_spnr.changed seed_spnr.value
		
		on isUpdate_chk changed state do Update_btn.enabled = not state
		
		on Update_btn pressed do seed_spnr.changed seed_spnr.value
	)
	createdialog сirclePuzzle_rllt style:#(#style_minimizebox, #style_titlebar, #style_border, #style_sysmenu)
) catch (messagebox "Error...")