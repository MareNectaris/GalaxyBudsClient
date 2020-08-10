; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Galaxy Buds Manager (Unofficial)"
!define PRODUCT_VERSION "2.3.1"
!define PRODUCT_PUBLISHER "ThePBone"
!define PRODUCT_WEB_SITE "https://github.com/ThePBone/GalaxyBudsClient"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\Galaxy Buds Client.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_LICENSEPAGE_CHECKBOX
!insertmacro MUI_PAGE_LICENSE "LICENSE"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\Galaxy Buds Client.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "Setup_GalaxyBudsManager_${PRODUCT_VERSION}.exe"
InstallDir "$PROGRAMFILES\Galaxy Buds Manager"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "Hauptgruppe" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite on
  File "Galaxy Buds Client\bin\Release\Galaxy Buds Client.exe"
  CreateDirectory "$SMPROGRAMS\Galaxy Buds Manager"
  CreateShortCut "$SMPROGRAMS\Galaxy Buds Manager\Galaxy Buds Manager.lnk" "$INSTDIR\Galaxy Buds Client.exe"
  CreateShortCut "$DESKTOP\Galaxy Buds Manager.lnk" "$INSTDIR\Galaxy Buds Client.exe"
  File "Galaxy Buds Client\bin\Release\Galaxy Buds Client.pdb"
  File "Galaxy Buds Client\bin\Release\Galaxy Buds Client.exe.config"
  File "Galaxy Buds Client\bin\Release\InTheHand.Net.Personal.dll"
  File "Galaxy Buds Client\bin\Release\InTheHand.Net.Personal.xml"
  File "packages\Autoupdater.NET.Official.1.6.0\lib\net40\AutoUpdater.NET.XML"
  File "packages\Autoupdater.NET.Official.1.6.0\lib\net40\AutoUpdater.NET.dll"
  File "packages\Autoupdater.NET.Official.1.6.0\lib\net40\AutoUpdater.NET.pdb"
  File "Galaxy Buds Client\bin\Release\Hardcodet.Wpf.TaskbarNotification.dll"
  File "Galaxy Buds Client\bin\Release\Hardcodet.Wpf.TaskbarNotification.xml"
  File "Galaxy Buds Client\bin\Release\Hardcodet.Wpf.TaskbarNotification.pdb"
  File "Galaxy Buds Client\bin\Release\WindowsInput.dll"
  File "Galaxy Buds Client\bin\Release\WindowsInput.xml"
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\Galaxy Buds Client.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\Galaxy Buds Client.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) has been successfully uninstalled."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Do you want to uninstall $(^Name) and all its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\InTheHand.Net.Personal.xml"
  Delete "$INSTDIR\InTheHand.Net.Personal.dll"
  Delete "$INSTDIR\Galaxy Buds Client.exe.config"
  Delete "$INSTDIR\Galaxy Buds Client.pdb"
  Delete "$INSTDIR\Galaxy Buds Client.exe"
  
  Delete "$INSTDIR\AutoUpdater.NET.XML"
  Delete "$INSTDIR\AutoUpdater.NET.pdb"
  Delete "$INSTDIR\AutoUpdater.NET.dll"

  Delete "$INSTDIR\Hardcodet.Wpf.TaskbarNotification.dll"
  Delete "$INSTDIR\Hardcodet.Wpf.TaskbarNotification.xml"
  Delete "$INSTDIR\Hardcodet.Wpf.TaskbarNotification.pdb"
  
  Delete "$INSTDIR\WindowsInput.dll"
  Delete "$INSTDIR\WindowsInput.xml"

  Delete "$DESKTOP\Galaxy Buds Manager.lnk"
  Delete "$SMPROGRAMS\Galaxy Buds Manager\Galaxy Buds Manager.lnk"

  RMDir "$SMPROGRAMS\Galaxy Buds Manager"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd