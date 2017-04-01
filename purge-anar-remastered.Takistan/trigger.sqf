params [ ["_triggerNumber",-1,[0]] ];

if(!isServer) exitWith { true };

#define INCREASE_COUNT(VAR_NAME) missionNameSpace setVariable [VAR_NAME, (missionNamespace getVariable [VAR_NAME, 0]) + 1];

switch (_triggerNumber) do {
    case 1 : {
        INCREASE_COUNT("civi_cargo_count")
        hint "Die Informanten im Timurkalay hatten sich schon gewundert, wann die versprochene Belohnung eintrifft...";
    };
    case 2 : {
        INCREASE_COUNT("civi_cargo_count")
        hint "In Sultansafe sind Hilfsgueter angekommen.";
    };
    case 3 : {
        INCREASE_COUNT("civi_cargo_count")
        hint "In Huzrutimam warteten die Einwohner schon sehnsuechtig auf das TTT.";
    };
    case 4 : {
        INCREASE_COUNT("civi_cargo_count")
        hint "Der in Chack Chak anwesende Journalist berichtet ueber die Hilfsgueter des TTT, die trotz des laufenden Konfliktes gebracht wurden.";
    };
    case 5 : {
        INCREASE_COUNT("civi_cargo_count")
        hint "Die Einwohner von Ahmaday freuen sich ueber die Lieferung des TTT.";
    };
    case 6 : {
        INCREASE_COUNT("civi_cargo_count")
        hint "ine Lieferung Hilfsgueter hat Landay erreicht.";
    };
    case 7 : {
        hint "Das sich das TTT trotz der Krisenzeit fuer die nahe Zivilbevoelkerung einsetzt, kriegt man auch in Zavarak mit. Von dort hat sich ein Einwohner gemeldet und laut seiner Aussage die letzten Tage eine Patrouille aus Norden mit schweren Kriegsgeraet gesehen. Er meldet sich, wenn er diese heute sieht.";
    };
    case 8 : {
        hint "Der Einwohner aus Zavarak hat sich soeben gemeldet. Er behauptet, dass sich das schwere Kriegsgeraet mit hoher Geschwindigkeit Richtung Sueden bewegt.";
    };
    case 20 : {
        INCREASE_COUNT("resist_cargo_count")
        hint format["%1/4 Feindliche Gueter sichergestellt.", missionNamespace getVariable ["resist_cargo_count",0]];
    };
    case 30 : {
        if(isServer && missionNamespace getVariable ["spotted", false]) then {
            [opfor_pat_1, [opfor_pat_1, 8]] remoteExecCall ["setCurrentWaypoint", opfor_pat_1];
            [opfor_pat_2, [opfor_pat_2, 11]] remoteExecCall ["setCurrentWaypoint", opfor_pat_2];
        };
    };
};
true
