class arsenal {
	idd = 5251;
	movingEnable = false;
	controlsBackground[] = {};

	controls[] = {"OuterBG","OuterBG_F", "InnerBG", "InnerBG_F", "Header","LoadoutList","EditButton","LoadButton", "RespawnButton", "TransferButton", "PlayersCombo"};

	objects[] = {};

	class StdBG {
			idc = -1;
			type =  CT_STATIC;
			style = ST_SINGLE;
			colorText[] = COLOR_BLACK;
			font = FontM;
			sizeEx = 0.023;
			text = "";
	};

	class StdText {
	    idc = -1;
		type =  CT_STATIC;
		style = ST_LEFT;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.02 * safezoneH;
	    shadow = 2;
		text = "";
	};

	class StdHeader : StdText {
	  	style = ST_CENTER;
	    sizeEx = 0.03 * safezoneH;
		colorBackground[] = COLOR_LIGHTGRAY;
	};

	class StdButton {
	  	idc = -1;
		type = CT_BUTTON;
		style = ST_CENTER;
		default = false;
		font = FontM;
		sizeEx = 0.018 * safezoneH;
		colorText[] = { 0, 0, 0, 1 };
		colorFocused[] = { 1, 1, 1, 1 };
		colorDisabled[] = { 0.2, 0.2, 0.2, 0.7 };
		colorBackground[] = { 0.8, 0.8, 0.8, 0.8 };
		colorBackgroundDisabled[] = { 0.5, 0.5, 0.5, 0.5 };
		colorBackgroundActive[] = { 1, 1, 1, 1 };
		offsetX = 0.003;
		offsetY = 0.003;
		offsetPressedX = 0.002;
		offsetPressedY = 0.002;
		colorShadow[] = { 0, 0, 0, 0.5 };
		colorBorder[] = { 0, 0, 0, 1 };
		borderSize = 0;
		soundEnter[] = { "", 0, 1 };  // no sound
		soundPush[] = {"\a3\Ui_f\data\Sound\CfgIngameUI\hintExpand", 0.891251, 1};
		soundClick[] = { "", 0, 1 };  // no sound
		soundEscape[] = { "", 0, 1 };  // no sound
		x = 0.4 * safezoneW + safezoneX;
		w = 0.2 * safezoneW; h = 0.03 * safezoneH;
		text = "";
		action = "";
		shadow = 1;
	  };

	class StdListBox {
		idc = -1;
		type = 5;
		style = 0 + 0x10;
		font = FontM;
		sizeEx = 0.018 * safezoneH;
	    rowHeight = 0.018 * safezoneH * 1.25;
		color[] = COLOR_LIGHTGRAY;
		colorText[] = COLOR_WHITE;
		colorScrollbar[] = COLOR_BRIGHTGREEN;
		colorSelect[] = COLOR_BRIGHTGREEN;
		colorSelect2[] = COLOR_BRIGHTGREEN;
		colorSelectBackground[] = COLOR_LIGHTGRAY;
		colorSelectBackground2[] = COLOR_LIGHTGRAY;
		colorActive[] = COLOR_BRIGHTGREEN;
		colorDisabled[] = COLOR_GREEN;
		columns[] = {0.1, 0.9};
		period = 0.3;
		colorBackground[] = COLOR_GREEN;
		maxHistoryDelay = 1.0;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		soundSelect[] = {"\a3\Ui_f\data\Sound\CfgIngameUI\hintExpand", 0.09, 1};

		class ListScrollBar {
			color[] = {1, 1, 1, 0.6};
			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		};
	};

	class StdCombo {
		idc = -1;
		type = 4;
		style = 1;
		x = 0;
		y = 0;
		w = 0.3;
		h = 0.035;
		colorSelect[] = COLOR_BRIGHTGREEN;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_GREEN_NOALPHA;
		colorSelectBackground[] = COLOR_LIGHTGRAY;
		colorScrollbar[] = COLOR_BRIGHTGREEN;
		arrowEmpty ="\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		wholeHeight = 0.45;
		color[] = COLOR_LIGHTGRAY;
		colorActive[] = COLOR_BRIGHTGREEN;
		colorDisabled[] = COLOR_GREEN;
		font = FontM;
		sizeEx = 0.031;
		soundSelect[] = {"\a3\Ui_f\data\Sound\CfgIngameUI\hintExpand", 0.09, 1};
		soundExpand[] = {"\a3\Ui_f\data\Sound\CfgIngameUI\hintExpand", 0.09, 1};
		soundCollapse[] = {"\a3\Ui_f\data\Sound\CfgIngameUI\hintExpand", 0.09, 1};
		maxHistoryDelay = 1.0;

		class ComboScrollBar {
			color[] = {1, 1, 1, 0.6};
			colorActive[] = {1, 1, 1, 1};
			colorDisabled[] = {1, 1, 1, 0.3};
			thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		};
	};

	class RecycleBG {
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		colorText[] = {0.5, 0.4, 0.25, 0.6};
		colorBackground[] = {0, 0, 0, 1};
		font = FontM;
		sizeEx = 0.023;
		moving = false;
		text = "res\camo03.jpg";
		x = (0.17 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = (0.1 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.16 * safezoneW) + (4 * BORDERSIZE);
		h = (0.75 * safezoneH) + (6 * BORDERSIZE);
	};

	class OuterBG : StdBG{
		colorBackground[] = COLOR_BROWN;
		x = (0.17 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = (0.1 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.16 * safezoneW) + (4 * BORDERSIZE);
		h = (0.75 * safezoneH) + (6 * BORDERSIZE);
	};
	class OuterBG_F : OuterBG {
		style = ST_FRAME;
	};
	class InnerBG : OuterBG {
		colorBackground[] = COLOR_GREEN;
		x = (0.17 * safezoneW + safezoneX)  - ( BORDERSIZE);
		y = (0.15 * safezoneH + safezoneY) - (1.5 * BORDERSIZE);
		w = (0.16 * safezoneW) +  (2 * BORDERSIZE);
		h = (0.7 * safezoneH)  + (3 * BORDERSIZE);
	};
	class InnerBG_F : InnerBG {
		style = ST_FRAME;
	};
	class Header : StdHeader{
		x = 0.17 * safezoneW + safezoneX - (BORDERSIZE);
		y = 0.09 * safezoneH + safezoneY;
		w = 0.16 * safezoneW + ( 2 * BORDERSIZE);
		h = 0.05 * safezoneH - (BORDERSIZE);
		text = $STR_ARSENAL_TITLE;
	};
	class LoadoutList : StdListBox {
		idc = 201;
		x = 0.17 * safezoneW + safezoneX;
		w = 0.16 * safezoneW;
		y = 0.15 * safezoneH + safezoneY;
		h = (0.45 * safezoneH) - (1.5 * BORDERSIZE);
		shadow = 2;
		onLBSelChanged="";
	};
	class LoadButton : StdButton{
		idc = 202;
		x = (0.18 * safezoneW + safezoneX);
		y = (0.6 * safezoneH + safezoneY);
		w = (0.14 * safezoneW);
		h = (0.04 * safezoneH);
		sizeEx = 0.03 * safezoneH;
		text = $STR_LOAD_LOADOUT;
		action = "load_loadout = 1;";
	};
	class EditButton : StdButton{
		idc = -1;
		x = (0.18 * safezoneW + safezoneX);
		y = (0.65 * safezoneH + safezoneY);
		w = (0.14 * safezoneW);
		h = (0.04 * safezoneH);
		sizeEx = 0.03 * safezoneH;
		text = $STR_EDIT_LOADOUT;
		action = "edit_loadout = 1;";
	};
	class RespawnButton : StdButton{
		idc = -1;
		x = (0.18 * safezoneW + safezoneX);
		y = (0.7 * safezoneH + safezoneY);
		w = (0.14 * safezoneW);
		h = (0.04 * safezoneH);
		sizeEx = 0.024 * safezoneH;
		text = $STR_MAKE_RESPAWN_LOADOUT;
		action = "respawn_loadout = 1;";
	};
	class PlayersCombo : StdCombo{
		idc = 203;
		x = (0.18 * safezoneW + safezoneX);
		w = 0.14 * safezoneW;
		y = 0.75 * safezoneH + safezoneY;
		h = 0.04 * safezoneH;
		sizeEx = 0.02 * safezoneH;
	  };
	class TransferButton : StdButton{
		idc = 204;
		x = (0.18 * safezoneW + safezoneX);
		y = (0.8 * safezoneH + safezoneY);
		w = (0.14 * safezoneW);
		h = (0.04 * safezoneH);
		sizeEx = 0.024 * safezoneH;
		text = $STR_LOAD_PLAYER_LOADOUT;
		action = "load_from_player = lbCurSel 203;";
	};
	class ButtonClose : StdButton{
		idc = 101;
		x = 0.315 * safezoneW + safezoneX;
		w = 0.015 * safezoneW;
		h = 0.02 * safezoneH;
		y = 0.095 * safezoneH + safezoneY;
		text = "X";
		action = "closeDialog 0";
	};

};