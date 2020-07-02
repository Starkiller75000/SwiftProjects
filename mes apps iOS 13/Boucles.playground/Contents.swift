import UIKit

let villes = ["Marseille", "Paris", "Lille", "Nice"]
let dict = ["Panda": "🐼", "Ours": "🐻", "Renard": "🦊", "Lapin": "🐰"]
let str = "Salut"

for ville in villes {
    print("Je suis originaire de : \(ville)")
}

for (nom, emoji) in dict {
    print("l'émoji de : \(nom) est \(emoji)")
}

for character in str {
    print(character)
}

for number in 0...20 {
    print("index: \(number)")
}

for index in 0..<20 {
    print("index < : \(index)")
}

for v in 0..<villes.count {
    print(villes[v])
}

for city in stride(from: 0, to: villes.count, by: 2) {
    print("\(villes[city]) index: \(city) count: \(villes.count)")
}

for x in stride(from: 0, through: 100, by: 5) {
    print("\(x)")
}

villes.forEach { (ville) in
    print(ville)
}

var bonsNumeros = 5

while bonsNumeros < 5 {
    print("Jouons encore: seulement \(bonsNumeros) bon numéros")
    bonsNumeros += 1
}

var index = 5

while index < villes.count {
    print(villes[index])
    index += 1
}

//while villes[index] != "Lille" {
    //print("Mauvaise ville")
    //index += 1
//}

//repeat {
    //print("ville: \(villes[index])")
    //index += 1
//} while index < villes.count
