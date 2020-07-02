import UIKit

var assignation = "Je suis utilisé pour une assignation"
assignation = "Je suis modifié"

let firstNumber: Int
firstNumber = 5

let a = 13
let b = 4

//Classiques
let addition = a + b
let soustraction = a - b
let multiplication = a * b
let division = a / b
let remainder = a % b

//Unaire
print(-a)

//Combinés
var c = 12
c += 10
//c = c + 10
c -= 10
//c = c - 10
c *= 2
c /= 6

// Conversion
var d = 4.5
let add = Double(c) + d
let sub = a - Int(d)

//Comparaison
var e = 3
var f = 4
print(e == f)
print(e != f)
print(e > f)
print(e < f)
print(e >= f)
print(e <= f)

//&& ||

var array = ["Jean", "Jacques", "José"]
var number = 5

print((array.count == number) || (array.contains("jean")))
print((array.isEmpty) || (array.count == number))

//Ternaire

let goodIndex = (array.count == number) ? "On est bons" : "Mauvais compte"
print(goodIndex)

let isPanda = true
let phrase = isPanda ? "Je suis un 🐼" : "Je suis plutôt une 🐝"
print(phrase)
