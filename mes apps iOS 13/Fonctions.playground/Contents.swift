import UIKit

var name = "Matthieu"
var date = "Il y a 3 minutes"
var texte = "Salut"
print("\(name): \(date), \(texte)")
var name2 = "Jean"
var date2 = "Il y a 2 minutes"
var texte2 = "Comment vas-tu?"
print("\(name2): \(date2), \(texte2)")

func ajoutPost(name: String, date: String, texte: String) {
    print("\(name): \(date), \(texte)")
}

ajoutPost(name: "George", date: "Maintenant", texte: "Coucou")
ajoutPost(name: "Mila", date: "Hier", texte: "J'ai faim")

//Basique
var nombreDePersonnes = 0

func ajouterPersonne() {
    nombreDePersonnes += 1
    print("Nous sommes \(nombreDePersonnes)")
}
ajouterPersonne()
ajouterPersonne()
ajouterPersonne()

//Avec param
func ajoutPersonneEtSaluer(name: String) {
    nombreDePersonnes += 1
    print("Bonjour \(name), nous sommes ici \(nombreDePersonnes) personnes.")
}

ajoutPersonneEtSaluer(name: "Matthieu")
ajoutPersonneEtSaluer(name: "Kensi")

func showTotem(isPanda: Bool) {
    if isPanda {
        print("🐼")
    } else {
        print("🐔")
    }
}

showTotem(isPanda: true)
showTotem(isPanda: false)

var compte = 100

func ajouterArgentSurLeCompte(_ nombre: Int) {
    compte += nombre
}

ajouterArgentSurLeCompte(24)

//Retour

func run(kms: Double) -> String {
    return "J'ai couru \(kms) kilomètres."
}

func calculateEra(width: Int, height: Int) -> Int {
    let era = width * height
    return era
}

let newRun = run(kms: 6.5)
let newRun2 = run(kms: 12)
let office = calculateEra(width: 6, height: 3)

var bankAccount: Float = 100

func updateAccount(value: Float) -> Float? {
    if value <= bankAccount {
        print("Assez d'argent")
        return bankAccount - value
    } else {
        print("Broke")
        return nil
    }
}

bankAccount = updateAccount(value: 10) ?? bankAccount
print(bankAccount)
bankAccount = updateAccount(value: -300) ?? bankAccount
bankAccount = updateAccount(value: 150) ?? bankAccount
