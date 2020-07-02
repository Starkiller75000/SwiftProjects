//
//  GodGetter.swift
//  GreekGodsApp
//
//  Created by Benoît Bouton on 19/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import Foundation

class GodGetter {
    let zeus = God(name: "Zeus", desc: "Fils de Cronos et de Rhéa, il règne sur le ciel et sur le panthéon grec. Malgré son mariage avec Héra, il eut de nombreux enfants (divins ou humains) de ses nombreuses conquêtes.")
    let hera = God(name: "Héra", desc: "Fille de Cronos et de Rhéa, déesse du mariage, elle siège, en sa qualité d'épouse de Zeus, sur le trône olympien.")
    let poseidon = God(name: "Poséidon", desc: "Dieu des tremblements de terre, des tempêtes, de la mer et des océans, époux d'Amphitrite.")
    let demeter = God(name: "Déméter", desc: "Fille de Cronos et de Rhéa, déesse de l'agriculture et des moissons.")
    let aphrodite = God(name: "Aphrodite", desc: "Née de l'écume de la mer1 ou fille de Zeus et de Dioné2 selon les traditions, elle préside à la beauté, à l'amour, à la sensualité. Elle est mariée à Héphaïstos mais a de nombreux amants, Arès notamment.")
    let artemis = God(name: "Artémis", desc: "Fille de Zeus et de Léto, elle est la déesse de la chasse et de la lune. Elle est, avec Athéna et Hestia, l'une des seules déesses du panthéon ayant juré de préserver sa virginité.")
    let apollon = God(name: "Apollon", desc: "Frère jumeau d'Artémis, il est le dieu de l'art, de la beauté, du soleil, mais aussi de la médecine. En tant qu'Apollon Loxias (en grec Ἀπόλλων λοξίας / Apóllôn loxías, c'est-à-dire Apollon l'oblique), il est le dieu des oracles et possède un temple oraculaire à Delphes.")
    let athena = God(name: "Athéna", desc: "Fille de Zeus et de Métis, elle est la déesse de la sagesse, de la guerre et de l'artisanat. Elle est également la protectrice d'Athènes.")
    let hermes = God(name: "Hermès", desc: "Fis de Zeus et de Maïa, il est le messager des dieux. Outre ce rôle, il assure la fonction de « conducteur des âmes » (Hermès psychopompe, en grec Ἑρμῆς ψυχοπομπός / Hermễs psukhopompós). Enfin il est le patron des voyageurs, qu'ils soient simples itinérants, commerçants ou même encore voleurs.")
    let hephaistos = God(name: "Héphaistos", desc: "Fils de Zeus et d'Héra ou d'Héra seule selon les traditions, il travaille dans sa forge sur l'île de Lemnos. On le décrit comme laid et boiteux, contrastant avec son épouse, la belle Aphrodite.")
    let ares = God(name: "Arès", desc: "Fils de Zeus et d'Héra, il est le dieu de la guerre. Mais contrairement à sa sœur Athéna, il représente non pas la stratégie militaire, qui mène à la victoire, mais la guerre dans sa dimension violente, celle qui provoque les ravages et rougit la terre.")
    let dyonisos = God(name: "Dyonisos", desc: "Fils de Zeus et de Sémélé, il est le dieu de la fureur et de la folie. D'une part, associé à l'ivresse, il est le dieu du vin et de la vigne. D'autre part, en tant que dieu de l'enthousiasme, il préside aux rassemblements déchaînés et aux processions confuses, où l'ordre alterne avec le chaos. C'est parmi ces foules, souvent déguisées, que prend place l'émergence de troupes masquées, annonçant ainsi la naissance du théâtre.")
    
    func getGods() -> [God] {
        return [zeus, hera, poseidon, demeter, aphrodite, artemis, apollon, athena, hermes, hephaistos, ares, dyonisos]
    }
}
