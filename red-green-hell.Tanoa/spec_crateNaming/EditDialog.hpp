#include "const.hpp"

class spec_crateNaming_EditDialog {
	idd = IDC_SPEC_CRATENAMING_DIALOGID;
	movingenable = false;
    onload = "[false] call Spec_crateNaming_fnc_editDialog_init;";
    controls[]=
    {
        IGUIBack_2200,
        RscEdit_1400,
        RscButton_1600,
        RscButtonMenuCancel_2700,
        RscButtonMenuOK_2600
    };
    ////////////////////////////////////////////////////////
    // GUI EDITOR OUTPUT START (by Spec, v1.063, #Vuwuwy)
    ////////////////////////////////////////////////////////
    class IGUIBack_2200: IGUIBack
    {
        idc = 2200;
        x = 0.334993 * safezoneW + safezoneX;
        y = 0.400975 * safezoneH + safezoneY;
        w = 0.350639 * safezoneW;
        h = 0.15404 * safezoneH;
        colorBackground[] = {0.2,0.2,0.2,0.8};
    };
    class RscEdit_1400: RscEdit
    {
        idc = IDC_SPEC_CRATENAMING_EDITBOX;
        x = 0.355619 * safezoneW + safezoneX;
        y = 0.42298 * safezoneH + safezoneY;
        w = 0.309387 * safezoneW;
        h = 0.0440113 * safezoneH;
    };
    class RscButton_1600: RscButton
    {
        idc = IDC_SPEC_CRATENAMING_BUTTON_RESET;
        x = 0.355619 * safezoneW + safezoneX;
        y = 0.488997 * safezoneH + safezoneY;
        w = 0.0515646 * safezoneW;
        h = 0.0440113 * safezoneH;
        text = $STR_Spec_crateNaming_Button_Default; //--- ToDo: Localize;
        tooltip = $STR_Spec_crateNaming_Button_Default_Tooltip; //--- ToDo: Localize;
        action = "[true] call Spec_crateNaming_fnc_editDialog_init;";
    };
    class RscButtonMenuCancel_2700: RscButton
    {
        idc = IDC_SPEC_CRATENAMING_BUTTON_OK;
        x = 0.541252 * safezoneW + safezoneX;
        y = 0.488997 * safezoneH + safezoneY;
        w = 0.0515646 * safezoneW;
        h = 0.0440113 * safezoneH;
        text = $STR_Spec_crateNaming_Button_Cancel; //--- ToDo: Localize;
        tooltip = $STR_Spec_crateNaming_Button_Cancel_Tooltip; //--- ToDo: Localize;
        action = "[true] call Spec_crateNaming_fnc_editDialog_close;";
    };
    class RscButtonMenuOK_2600: RscButton
    {
        idx = IDC_SPEC_CRATENAMING_BUTTON_CANCEL;
        x = 0.613442 * safezoneW + safezoneX;
        y = 0.488997 * safezoneH + safezoneY;
        w = 0.0515646 * safezoneW;
        h = 0.0440113 * safezoneH;
        text = $STR_Spec_crateNaming_Button_OK;
        tooltip = $STR_Spec_crateNaming_Button_OK_Tooltip; //--- ToDo: Localize;
        action = "[] call Spec_crateNaming_fnc_editDialog_save;";
    };
    ////////////////////////////////////////////////////////
    // GUI EDITOR OUTPUT END
    ////////////////////////////////////////////////////////
};
