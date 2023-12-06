//
//  DeepLinksDetailViewModel.swift
//  Links
//
//  Created by ghulam  on 25/04/2023.
//

import Foundation
import SwiftUI

class DeepLinksDetailViewModel : ObservableObject {
    let deeplink : DeepLink
    // Dictionnaire pour stocker les valeurs des paramètres de la deeplink
    @Published var dictionary: [Int: String] = [:]
    init(deeplink: DeepLink) {
        self.deeplink = deeplink
        
        // Initialiser le dictionnaire avec les valeurs par défaut des paramètres
        if let params = deeplink.params {
            for param in params {
                dictionary[param.rank] = ""
            }
        }
    }
    // Construire l'URL en utilisant les valeurs des paramètres du dictionnaire
    func getUrl() -> String {
        var  url = deeplink.url
        let ordreparams = dictionary.sorted {$0.key < $1.key}
            //recup un url ordonné a partir dictionary

        // Convertir dictionary en tab de string, dans l'ordre des rank du param
        //map une méthode de collection pour convertir
        for (_, value) in ordreparams where value.isEmpty == false {
            url = "\(url)/\(value)"
        }
        return url
    }
}
