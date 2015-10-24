#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version : 3.3.12.0
 Auteur:         Clark17

 Fonction du Script :
	Compiler le répertoire courant pour en faire un fichier scs utilisable dans ETS2

#ce ----------------------------------------------------------------------------

#include "7Zip.au3"

; Début du script - Ajouter votre code ci-dessous.
#pragma compile(Icon, C:\Program Files (x86)\AutoIt3\Icons\au3.ico)

; Demande pour lancer le programme
Local $reponse = MsgBox(1, "Compilation", "Lancer la compilation?")

If $reponse = "2" Then
	Exit
EndIf

; Création de l'archive zip contenant le mod
Local $retourresultat = _7zipAdd(0, @ScriptDir & "\Real World.zip", @ScriptDir & "\..\Binaires\*.*")
If @error Then
    MsgBox(64, "Compilation", "Erreur lors de la création de l'archive zip")
		Exit
EndIf

; Déplacement de l'archive
FileMove("Real World.zip", @MyDocumentsDir & "\Euro Truck Simulator 2\mod\Real World.scs", 1)

; Message de fin
Local $reponse = MsgBox(0, "Compilation", "Compilation terminée.")