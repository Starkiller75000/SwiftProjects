import UIKit

var isCodingCool = false
var minAge = 18
var myAge = 18

if !isCodingCool {
    print("J'aime pas le code")
}

if myAge < minAge {
    print("Retourne jouer aux légos")
} else {
    print("Bienvenue chez nous")
}

var classementFifa = 1

if classementFifa < 4 {
    print("Bravo vous êtes dans le top 3")
} else if classementFifa <= 10 {
    print("Vous êtes dans le top 10")
} else {
    print("Retournez vous entraîner")
}

switch classementFifa {
case 1:
    print("Belgique")
case 2:
    print("France")
case 3:
    print("Brésil")
case 4:
    print("Allemagne")
case 5:
    print("Espagne")
case 6:
    print("Portugual")
case 7, 8, 9:
    print("équipes pas trop mauvaise que je ne connais pas")
default:
    print("Inconnue ou trop loin dans le classement")
}

func useGuard() {
    //guard classementFifa == 1 else { return }
    guard classementFifa == 1 else {
        print("Tu n'es pas premier")
        return
    }
    print("Tu es le meilleur")
}

useGuard()

//Déballer les optionnels
var myString: String?
myString = "Test"

//Vérifier si pas nil avec un if
if myString != nil {
    print(myString!)
} else {
    print("Je n'ai pas de valeur")
}

//Attribuer la valeur de l'optionnel à un non optionnel
if let nonOptional = myString {
    print(nonOptional)
} else {
    print("Je n'ai pas de valeur")
}

//Avec les guard

func nonNil() {
    guard myString != nil else { return }
    print(myString!)
}

func canCreate() {
    guard let iCan = myString else { return }
    print(iCan)
}

nonNil()
canCreate()
