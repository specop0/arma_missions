set directoriesToCopy=FUPS spec_crates spec_dynamic spec_heli spec_loadout spec_tfar spec_zeus
set filesToCopy=briefing.sqf description.ext initPlayerLocal.sqf initServer.sqf

set sourceDirectory=dynamic_fups.Altis
set pboManager="C:\Program Files\PBO Manager v.1.4 beta\PBOConsole.exe"

for %%s in (
    dynamic_fups_al.pja310
    dynamic_fups_celle.mbg_celle2
    dynamic_fups_cher.Chernarus
    dynamic_fups_malden.Malden
    dynamic_fups_pan.Panthera3
    dynamic_fups_panw.Winthera3
    dynamic_fups_taki.Takistan
    dynamic_fups_tanoa.Tanoa
    dynamic_fups_tmountain.Mountains_ACR
    ) do (
    for %%d in (%directoriesToCopy%) do (
        xcopy "%sourceDirectory%\%%d" "%%s\%%d" /s /e /y
    )
    for %%f in (%filesToCopy%) do (
        xcopy "%sourceDirectory%\%%f" "%%s\%%f" /s /e /y
    )
    %pboManager% -pack  "%~dp0\%%s" "%~dp0\%%s.pbo"
)

%pboManager% -pack "%~dp0\%sourceDirectory%" "%~dp0\%sourceDirectory%.pbo"

pause