params [ ["_triggerNumber",-1,[0]] ];

if(!isServer) exitWith { true };

#define INCREASE_COUNT(VAR_NAME) missionNameSpace setVariable [VAR_NAME, (missionNamespace getVariable [VAR_NAME, 0]) + 1];

switch (_triggerNumber) do {
    case 1 : {
        INCREASE_COUNT("civi_cargo_count")
        "Die Informanten im Timurkalay hatten sich schon gewundert, wann die versprochene Belohnung eintrifft..." remoteExecCall ["hint"];
    };
    case 2 : {
        INCREASE_COUNT("civi_cargo_count")
        "In Sultansafe sind Hilfsgueter angekommen." remoteExecCall ["hint"];
    };
    case 3 : {
        INCREASE_COUNT("civi_cargo_count")
        "In Huzrutimam warteten die Einwohner schon sehnsuechtig auf das TTT." remoteExecCall ["hint"];
    };
    case 4 : {
        INCREASE_COUNT("civi_cargo_count")
        "Der in Chack Chak anwesende Journalist berichtet ueber die Hilfsgueter des TTT, die trotz des laufenden Konfliktes gebracht wurden." remoteExecCall ["hint"];
    };
    case 5 : {
        INCREASE_COUNT("civi_cargo_count")
        "Die Einwohner von Ahmaday freuen sich ueber die Lieferung des TTT." remoteExecCall ["hint"];
    };
    case 6 : {
        INCREASE_COUNT("civi_cargo_count")
        "Eine Lieferung Hilfsgueter hat Landay erreicht." remoteExecCall ["hint"];
    };
    case 7 : {
        "Das sich das TTT trotz der Krisenzeit fuer die nahe Zivilbevoelkerung einsetzt, kriegt man auch in Zavarak mit. Von dort hat sich ein Einwohner gemeldet und laut seiner Aussage die letzten Tage eine Patrouille aus Norden mit schweren Kriegsgeraet gesehen. Er meldet sich, wenn er diese heute sieht." remoteExecCall ["hint"];
    };
    case 8 : {
        "Der Einwohner aus Zavarak hat sich soeben gemeldet. Er behauptet, dass sich das schwere Kriegsgeraet mit hoher Geschwindigkeit Richtung Sueden bewegt." remoteExecCall ["hint"];
    };
    case 20 : {
        INCREASE_COUNT("resist_cargo_count")
        format["%1/4 Feindliche Gueter sichergestellt.", missionNamespace getVariable ["resist_cargo_count",0]] remoteExecCall ["hint"];
    };
    case 30 : {
        if(missionNamespace getVariable ["spotted", false]) then {
            [opfor_pat_1, [opfor_pat_1, 8]] remoteExecCall ["setCurrentWaypoint", leader opfor_pat_1];
            [opfor_pat_2, [opfor_pat_2, 11]] remoteExecCall ["setCurrentWaypoint", leader opfor_pat_2];
        };
    };
};
true
