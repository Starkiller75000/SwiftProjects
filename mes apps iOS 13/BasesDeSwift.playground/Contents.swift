import Foundation

//Nombres Entiers
var signed: Int = 32
signed = 64
var signed2 = 3
var unsigned: UInt = 5
var eight: UInt8 = 8
var sixteenBits: Int16 = 234
var minEight = UInt8.max

//Nombres décimaux
var decimal = 543.999
var myFloat: Float = -34.76
var myDouble: Double = 2.13

//Conversion
signed = Int(eight)
myDouble = Double(signed)
myFloat = Float(decimal)
var unsigned16: UInt16 = UInt16(myFloat)

//Strings
var salutations: String = "Salut les codeurs!"
var nombreString = "12"
var nombreCoverti = String(signed)
var multiLine = "Salut les codeurs!\nComment allez vous?"
print(multiLine)
var multiLineVariante = """
Comment se passe votre apprentissage?
Super! j'adore Swift

"Moi aussi"
"""
print(multiLineVariante)
var citation = "\"La vie est belle\""
print(citation)

var url = "https://www.codabee.com"
url += "/swiflang"

var prenom = "matthieu"
var nom = "codabee"
var identite = prenom + " " + nom

var bestScore = 2
var bestString = "Votre meilleur score est de \(bestScore)"
print(bestString)

var macOSName = "macOS Catalina"

for character in macOSName {
    print(character)
}
print(macOSName.count)

var place = "La Ciotat"
print(place.uppercased())
print(place.lowercased())
print(identite.capitalized)

var fruitsDeMer = "J'aime les moules, les Huitres, et palourdes et les oursins"
var huitres = "huitres"
print(fruitsDeMer.replacingOccurrences(of: huitres.capitalized, with: "frites"))

var emoji = "Je suis un panda 🐼"

//Booléens
var isPanda = false

if isPanda == false {
    print(emoji)
}

//Tuples
var player1: (String, Bool, Int) = ("Gérard", false, 123)
print(player1.0 + " en train de jouer: \(player1.1).\nSon meilleur score est de: \(player1.2)")
var player2: (name: String, active: Bool, bestScore: Int) = ("Simon", true, 0)
print(player2.name + " en train de jouer: \(player2.active).\nSon meilleur score est de: \(player2.bestScore).")
let (name, active, score) = player1
print(name + " actif: \(active). Score: \(score)")

let (n, _, s) = player1
print("\(n) \(s)")


//Array
var listeDeCourses: [String] = ["Carottes", "Salade", "Tomates"]
var listeVide: [String] = []
print(listeDeCourses)
print(listeDeCourses.count)
print(listeDeCourses.isEmpty)
print(listeVide.count)
print(listeVide.isEmpty)

for achat in listeDeCourses {
    print(achat.uppercased())
}

let carotte = listeDeCourses[listeDeCourses.count - 1]
print(carotte)
listeDeCourses.append("Courgettes")
listeDeCourses.append(contentsOf: ["Ciboulettes", "oignons"])
listeDeCourses += ["Poulet"]
listeDeCourses.insert("Pain", at: 0)
listeDeCourses.count
listeDeCourses.insert(contentsOf: ["Camembert", "Frommage de chèvre", "Mozza"], at: 1)
listeDeCourses.remove(at: 6)
print(listeDeCourses)
listeDeCourses.removeLast()
print(listeDeCourses)
listeDeCourses.removeFirst()
print(listeDeCourses)
listeDeCourses.removeAll()
print(listeDeCourses)

//Dictionnaires

var maFamille: [String: Int] = ["Bob": 50, "Jane": 47, "Bill": 23, "Kensi": 17]
var maBelleFamille = Dictionary<String, Int>()
print(maFamille.count)
print(maFamille.isEmpty)
print(maBelleFamille.count)
print(maBelleFamille.isEmpty)

for (key, value) in maFamille {
    print(key + " " + String(value) + " ans.")
}
print(maFamille["Jane"])

maFamille["Matt"] = 34
print(maFamille)
maFamille["Bob"] = 45
print(maFamille)
maFamille.updateValue(42, forKey: "Bobby")
print(maFamille)

print(maFamille.removeValue(forKey: "Kensi"))
print(maFamille)

print(maFamille.removeAll())

//Optionnels
var username: String?
username = "Matt"
print(username)
var currentScore: Int?
//currentScore = 0
print(currentScore)
