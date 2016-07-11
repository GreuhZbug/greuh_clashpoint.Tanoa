// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUT_BUTTON  16 // Arma 2 - textured button

#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_List_N_Box       102 // Arma 2 - N columns list box


// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define CT_MAP_MAIN 101
#define ST_PICTURE 48

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200 // this style works for CT_STATIC in conjunction with ST_MULTI
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

#define FontM             "puristaMedium"

#define COLOR_BROWN { 0.30, 0.25, 0.2, 0.75 }
#define COLOR_GREEN { 0.2, 0.23, 0.18, 0.75 }
#define COLOR_GREEN_ALPHA { 0.2, 0.23, 0.18, 0.4 }
#define COLOR_GREEN_NOALPHA { 0.2, 0.23, 0.18, 1 }
#define COLOR_LIGHTGREEN { 0.4, 0.55, 0.36, 0.4 }
#define COLOR_LIGHTGRAY { 0.6, 0.6, 0.6, 0.8 }
#define COLOR_LIGHTGRAY_ALPHA { 0.6, 0.6, 0.6, 0.55 }
#define COLOR_WHITE { 1, 1, 1, 1 }
#define COLOR_NOALPHA { 0, 0, 0, 0 }
#define COLOR_BLUFOR { 0, 0.3, 1, 1 }
#define COLOR_OPFOR { 1, 0, 0, 1 }
#define COLOR_GUER { 0.5, 0.5, 0.5, 0.5 }
#define COLOR_WHITE_TRANSP { 1, 1, 1, 0.5 }
#define COLOR_BLACK { 0, 0, 0, 1 }
#define COLOR_BLACK_ALPHA { 0, 0, 0, 0.85 }
#define COLOR_BLUFOR_NOALPHA { 0, 0, 1, 1 }
#define COLOR_OPFOR_NOALPHA { 1, 0, 0, 1 }
#define COLOR_RED_DISABLED { 1,0,0,0.4 }
#define COLOR_BLEEDOUT { 0.66,0,0,0.8 }
#define COLOR_BRIGHTGREEN { 0.2,1,0.2,1 }
#define COLOR_BLUFOR_ALPHA { 0, 0.3, 1, 0.25 }
#define COLOR_OPFOR_ALPHA { 0.8, 0, 0, 0.25 }
#define COLOR_WHITE_80ALPHA { 1, 1, 1, 0.8 }

#define SHADOW_X  0.0008
#define SHADOW_Y 0.0011
#define ICONE_SPACY 0.025

#define BORDERSIZE	0.01

#define MAP_IDC 10023

class RscText
{
        type = CT_STATIC;
        idc = -1;
        style = ST_LEFT;
        colorBackground[] = {0, 0, 0, 0};
        colorText[] = {1, 1, 1, 1};
        font = FontM;
        sizeEx = 0.04;
};


class RscTitles
{
   class intro
   {
      name = "intro";
      duration = 10;
      idd = -1;
      movingEnable = false;
      controls[]=
      {
         GenericLabelShadow, VersionLabelShadow, GenericLabel2, Clashpoint, MapLabelShadow, MapLabel, VersionLabel
      };
	  class GenericLabel2 {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.05;
		x = 0.0; y = 0.5;
		w = 1.0;  h = 0.2;
		text = "[GREUH] Zbug presents";
	  };
	  class GenericLabelShadow : GenericLabel2{
		colorText[] = COLOR_BLACK;
		y = 0.505;
	  };
	  	class Clashpoint {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_PICTURE;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.1;
		x = 0.1; y = 0.5;
		w = 0.8;  h = 0.5;
		text = "res\clashpoint.paa";
	  };
	  class MapLabel {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.15;
		x = 0.0; y = 0.82;
		w = 1.0;  h = 0.2;
		text = $STR_Map;
	  };
	  class MapLabelShadow : MapLabel{
		colorText[] = COLOR_BLACK;
		y = 0.825;
	  };
	  class VersionLabel {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.075;
		x = 0.0; y = 0.92;
		w = 1.0;  h = 0.2;
		text = $STR_Version;
	  };
	  class VersionLabelShadow : VersionLabel{
		colorText[] = COLOR_BLACK;
		y = 0.925;
	  };

   };

   class fasttravel
   {
      name = "fasttravel";
      duration = 8;
      idd = -1;
      movingEnable = true;

      controls[]=
      {
         OuterBackground,GenericLabel111
      };
	  class OuterBackground {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_LEFT;
		colorText[] = COLOR_BLACK;
		colorBackground[] = COLOR_BLACK;
		font = FontM;
		sizeEx = 0.023;
		x = -3; y = -3;
		w = 9;  h = 9;
		text = "";
	  };
		class GenericLabel111 {
		idc = -1;
		type = CT_STATIC;
		style = ST_CENTER;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.03;
		x = 0; y = 0.75;
		w = 1.0;  h = 0.1;
		text = $STR_Deploy_InProgress;
	  };
   };

   class blufor_victory
    {
      name = "blufor_victory";
      duration = 9;
      idd = -1;
      movingEnable = false;

      controls[]=
      {
         Label
      };
	  class Label {
		idc = -1;
		type =  CT_STATIC;
		style = ST_CENTER;
		colorText[] = COLOR_BLUFOR;
		colorBackground[] = COLOR_NOALPHA;
		shadow = 1;
		font = FontM;
		sizeEx = 0.06 * safezoneH;
		x = 0.2 * safezoneW + safezoneX;
		w = 0.6 * safezoneW;
		y = 0.6 * safezoneH + safezoneY;
		h = (0.1 * safezoneH);
		text = $STR_BLUFOR_win
	  };
   };




      class opfor_victory
    {
      name = "opfor_victory";
      duration = 9;
      idd = -1;
      movingEnable = false;

      controls[]=
      {
         Label
      };
	  class Label {
		idc = -1;
		type =  CT_STATIC;
		style = ST_CENTER;
		colorText[] = COLOR_OPFOR;
		colorBackground[] = COLOR_NOALPHA;
		shadow = 1;
		font = FontM;
		sizeEx = 0.06 * safezoneH;
		x = 0.2 * safezoneW + safezoneX;
		w = 0.6 * safezoneW;
		y = 0.6 * safezoneH + safezoneY;
		h = (0.1 * safezoneH);
		text = $STR_OPFOR_win
	  };
   };

   class blackscreen
   {
      name = "blackscreen";
      duration = 5;
      idd = -1;
      movingEnable = true;

      controls[]=
      {
         OuterBackground
      };
	  class OuterBackground {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_LEFT;
		colorText[] = COLOR_BLACK;
		colorBackground[] = COLOR_BLACK;
		font = FontM;
		sizeEx = 0.023;
		x = -3; y = -3;
		w = 9;  h = 9;
		text = "";
	  };
   };


   class blank
   {
      name = "blank";
      duration = 999999;
      idd = 6666;
      movingEnable = true;
	  onLoad = "";
      controls[]={};
   };

   class statusoverlay
   {
      name = "statusoverlay";
      duration = 999999;
      idd = 6666;
      movingEnable = true;
	  onLoad = "uiNamespace setVariable ['GUI_OVERLAY', _this select 0];";
      controls[]=
      {
         BGPicture,BluFrame_Mid, RedFrame_Mid, LabelTimeBlufor,LabelTimeOpfor, LabelScoreBlufor, LabelScoreOpfor,
		 BluFrame, RedFrame, killspam_label1, killspam_label2, killspam_label3,
		 killspam_label4, killspam_label5, killspam_label6, killspam_label7, killspam_label8,
		 killspam_label9, killspam_label10, killspam_label11, killspam_label12, killspam_label13,
		 killspam_label14 ,killspam_label15, killspam_label16, killspam_label17, killspam_label18,
		 killspam_label19, killspam_label20, spawn_protect_label
      };
	  class BGPicture {
	  	idc = -1;
		type =  CT_STATIC ;
		style = ST_PICTURE;
		colorText[] = COLOR_WHITE_80ALPHA;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.5;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.1 * safezoneW;
		y = 0.5 * safezoneH + safezoneY;
		h = 0.06 * safezoneH;
		text = "res\gradient.paa";
	  };
	  class GenericLabel69 {
		idc = -1;
		type =  CT_STATIC ;
		style = ST_CENTER;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.025 * safezoneH;
		x = 0.92 * safezoneW + safezoneX;
		w = 0.04 * safezoneW;
		y = 0.5225 * safezoneH + safezoneY;
		h = 0.04 * safezoneH;
		text = "";
		shadow = 1;
	  };
	  class Frame {
		type =  CT_STATIC ;
		style = ST_FRAME;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.025 * safezoneH;
		x = 0.92 * safezoneW + safezoneX;
		w = 0.0385 * safezoneW;
		y = 0.5325 * safezoneH + safezoneY;
		h = 0.025 * safezoneH;
		text = "";
	  };
      class BluFrame : Frame {
		idc = 103;
		colorText[] = COLOR_BLUFOR;
		x = 0.92 * safezoneW + safezoneX;
	  };
	  class RedFrame : Frame  {
		idc = 104;
		colorText[] = COLOR_OPFOR;
		x = 0.96 * safezoneW + safezoneX;
	  };
	  class BluFrame_Mid : BluFrame {
		idc = 105;
		style = ST_LEFT;
		colorBackground[] = COLOR_BLUFOR_ALPHA;
	  };
	  class RedFrame_Mid : RedFrame  {
		idc = 106;
		style = ST_LEFT;
		colorBackground[] = COLOR_OPFOR_ALPHA;
	  };
	  class LabelTimeBlufor : GenericLabel69 {
	  	idc = 101;
		text = "";
		x = 0.92 * safezoneW + safezoneX;
		colorText[] = COLOR_BLUFOR;
	  };
	  class LabelTimeOpfor : GenericLabel69 {
	  	idc = 102;
		text = "";
		x = 0.96 * safezoneW + safezoneX;
		colorText[] = COLOR_OPFOR;
	  };
	 class LabelScoreBlufor : GenericLabel69 {
	  	idc = 151;
		text = "";
		x = 0.92 * safezoneW + safezoneX;
		y = 0.4925 * safezoneH + safezoneY;
		colorText[] = COLOR_BLUFOR;
	  };
	  class LabelScoreOpfor : GenericLabel69 {
	  	idc = 152;
		text = "";
		y = 0.4925 * safezoneH + safezoneY;
		x = 0.96 * safezoneW + safezoneX;
		colorText[] = COLOR_OPFOR;
	  };
	  class killspam_label {
	  	idc = -1;
		type =  CT_STRUCTURED_TEXT ;
		style = ST_RIGHT;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;
		sizeEx = 0.018 * safezoneH;
		size = 0.018 * safezoneH;
		x = 0.7 * safezoneW + safezoneX;
		w = 0.298 * safezoneW;
		y = 0.48 * safezoneH + safezoneY;
		h = 0.02 * safezoneH;
		shadow = 1;
		text = "";
	  };
	  class killspam_label1 : killspam_label {
		idc = 201;
	  	y = 0.48 * safezoneH + safezoneY;
	  };
	  	  class killspam_label2 : killspam_label {
		idc = 202;
	  	y = 0.46 * safezoneH + safezoneY;
	  };
	  	  class killspam_label3 : killspam_label {
		idc = 203;
	  	y = 0.44 * safezoneH + safezoneY;
	  };
	  	  class killspam_label4 : killspam_label {
		idc = 204;
	  	y = 0.42 * safezoneH + safezoneY;
	  };
	  	  class killspam_label5 : killspam_label {
		idc = 205;
	  	y = 0.40 * safezoneH + safezoneY;
	  };
	  	  class killspam_label6 : killspam_label {
		idc = 206;
	  	y = 0.38 * safezoneH + safezoneY;
	  };
	  	  class killspam_label7 : killspam_label {
		idc = 207;
	  	y = 0.36 * safezoneH + safezoneY;
	  };
	  	  class killspam_label8 : killspam_label {
		idc = 208;
	  	y = 0.34 * safezoneH + safezoneY;
	  };
	  	  class killspam_label9 : killspam_label {
		idc = 209;
	  	y = 0.32 * safezoneH + safezoneY;
	  };
	  	  class killspam_label10 : killspam_label {
		idc = 210;
	  	y = 0.30 * safezoneH + safezoneY;
	  };
	  	  class killspam_label11 : killspam_label {
		idc = 211;
	  	y = 0.28 * safezoneH + safezoneY;
	  };
	  	  class killspam_label12 : killspam_label {
		idc = 212;
	  	y = 0.26 * safezoneH + safezoneY;
	  };
	  	  class killspam_label13 : killspam_label {
		idc = 213;
	  	y = 0.24 * safezoneH + safezoneY;
	  };
	  	  class killspam_label14 : killspam_label {
		idc = 214;
	  	y = 0.22 * safezoneH + safezoneY;
	  };
	  	  class killspam_label15 : killspam_label {
		idc = 215;
	  	y = 0.20 * safezoneH + safezoneY;
	  };
	  	  class killspam_label16 : killspam_label {
		idc = 216;
	  	y = 0.18 * safezoneH + safezoneY;
	  };
	  	  class killspam_label17 : killspam_label {
		idc = 217;
	  	y = 0.16 * safezoneH + safezoneY;
	  };
	  	  	  class killspam_label18 : killspam_label {
		idc = 218;
	  	y = 0.14 * safezoneH + safezoneY;
	  };
	  	  	  class killspam_label19 : killspam_label {
		idc = 219;
	  	y = 0.12 * safezoneH + safezoneY;
	  };
	  	  	  class killspam_label20 : killspam_label {
		idc = 220;
	  	y = 0.10 * safezoneH + safezoneY;
	  };
	  class spawn_protect_label : killspam_label {
	  	type =  CT_STATIC ;
		idc = 321;
		y = 0.56 * safezoneH + safezoneY;
	  };
	};
};