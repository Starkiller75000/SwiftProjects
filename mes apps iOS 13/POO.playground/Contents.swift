import UIKit

//POO
//class ou struct pour créer un plan
//Propriétés ou des méthodes
//Créer un objet à partir d'un init
//Presque tout est un objet

//UI -> Objets
//Variables -> Objets
//Nos propres objets. ex: Un utilisateur, restaurant, posts (facebook),

//Struct et class

class Ordinateur {
    // Propriétés stockées
    var marque: String
    private var _modele: String
    var processeur: String
    var ram: Int
    private var _ssd: Int
    
    init(marque: String, modele: String, processeur: String, ram: Int, ssd: Int) {
        self.marque = marque
        self._modele = modele
        self.processeur = processeur
        self.ram = ram
        self._ssd = ssd
    }
    
    var modele: String {
        return _modele
    }
    
    // Propriétés calculées
    var nomComplet: String {
        get {
            return marque + " " + modele
        }
    }
    
    var ramManager: Int {
        get {
            return ram
        }
        set(newValue) {
            ram = newValue
        }
    }
    
    // Propriétés observatrices
    var mouse: String = "trackpad" {
        willSet(newValue) {
            print("Je vais ajouter cette souris: \(newValue), ma souris actuelle est: \(mouse)")
        }
        didSet {
            print("J'ai ajouté cette souris: \(mouse) alors qu'avant j'utilisais: \(oldValue)")
        }
    }
    // Méthodes
    func allumer() {
        print("Bruit de l'allumage Apple")
    }
    
    func ChangeSSD(capacity: Int) {
        _ssd = capacity
    }
    
    func showCompleteName() -> String {
        return marque + " " + modele + " " + String(ram) + " " + String(_ssd)
    }
}

class Portable: Ordinateur {
    var autonomie: Int
    
    init(marque: String, modele: String, processeur: String, ram: Int, ssd: Int, autonomie: Int) {
        self.autonomie = autonomie
        super.init(marque: marque, modele: modele, processeur: processeur, ram: ram, ssd: ssd)
    }
}

struct Voiture {
    var marque: String
    var modele: String
    private var _kilometres: Float = 0
    var couleur: String
    var puissance: Int
    var spoiler: Bool = false {
        didSet {
            print(spoiler)
        }
    }
    
    var kilometres: Float {
        get {
            return _kilometres
        }
        set(newKms) {
            if (newKms > _kilometres) {
                _kilometres = newKms
            }
        }
    }
    
    var kmsAvantVidange: String {
        get {
            let nextVidange = Int(_kilometres) % 40000
            return "Prochaine vidange dans \(nextVidange) kms."
        }
    }
    
    var showPower: String {
        "Ma puissance est de \(puissance) chevaux"
    }
    
    
    var colorChanger: String {
        get {
            return couleur
        }
        set(newColor) {
            couleur = newColor
        }
    }
    
    init(marque: String, modele: String, kms: Float, couleur: String, puissance: Int) {
        self.marque = marque
        self.modele = modele
        self._kilometres = kms
        self.couleur = couleur
        self.puissance = puissance
    }
    
    // Méthodes
    func fairePlein() {
        print("Réservoir plein")
    }
    
    mutating func rouler(kms: Float) {
        kilometres += kms
    }
}

extension Voiture {
    func isHybride(_ bool: Bool) -> String {
        return bool ? "Je suis hybride" : "Je ne suis pas hybride"
    }
}

var macbook = Ordinateur(marque: "Apple", modele: "Macbook air 2018", processeur: "i5", ram: 8, ssd: 128)
var iMac = Ordinateur(marque: "Apple", modele: "iMac 27", processeur: "i7", ram: 32, ssd: 1024)
var asus = Ordinateur(marque: "Asus", modele: "protable 13'", processeur: "AMD", ram: 16, ssd: 512)
var macBookPro = Portable(marque: "Apple", modele: "Macbook pro 13' 2018", processeur: "i7", ram: 16, ssd: 128, autonomie: 600)

print(macBookPro.autonomie)
print(macBookPro.nomComplet)

//var clio = Voiture(marque: "Renault", modele: "Clio", couleur: "bleu", puissance: 120)
//var yaris = Voiture(marque: "Toyota", modele: "Yaris", couleur: "Gris", puissance: 65, spoiler: true)
var clio = Voiture(marque: "Renault", modele: "Clio", kms: 3, couleur: "bleu", puissance: 75)
clio.isHybride(false)

print(clio.couleur)
clio.couleur = "Noir mat"
print(clio.couleur)

//Calculées
print(macbook.modele)
print(clio.kmsAvantVidange)
print(macbook.ramManager)
macbook.ramManager = 32
print(macbook.ramManager)
print(clio.colorChanger)
clio.colorChanger = "Violet"
print(clio.colorChanger)
print(clio.showPower)

print(clio.kilometres)
clio.kilometres += 12
print(clio.kilometres)
clio.kilometres -= 100000
print(clio.kilometres)

macbook.mouse = "Magic Mouse"
clio.spoiler = true
clio.spoiler = false

macbook.allumer()
macbook.ChangeSSD(capacity: 512)
macbook.showCompleteName()
clio.fairePlein()
clio.rouler(kms: 30)

extension String {
    func addEmoji() -> String {
        return self.replacingOccurrences(of: "panda", with: "🐼").replacingOccurrences(of: "renard", with: "🦊")
    }
}

var str = "J'entends le loup le renard et la belette, mais pas le panda"
str.addEmoji()

extension Int {
    var secondes: Int {
        return self
    }
    
    var minutes: Int {
        return self / 60
    }
    
    var hours: Int {
        return self / 3600
    }
    
    func showElapsed() -> String {
        let hour = self.hours
        let hoursRemain = self % 3600
        let minutes = hoursRemain / 60
        let minutesRemain = hoursRemain % 60
        let secondes = minutesRemain
        return "\(hour) heures, \(minutes) minutes, \(secondes) secondes"
    }
}

var mins = 37232
mins.secondes
mins.minutes
mins.hours
mins.showElapsed()
