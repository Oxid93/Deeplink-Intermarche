//
//  DeepLinksViewModel.swift
//  Links
//
//  Created by ghulam  on 05/04/2023.
//

import SwiftUI
import Combine
//import Foundation


class DeepLinksViewModel: ObservableObject {
    // Déclaration d'une variable `cancellable` de type `AnyCancellable pour stocker l'abonnement en cours
    private var cancellable: AnyCancellable?
    
    // Déclaration d'une variable `links` de type `[ArrayLink]` qui est publiée
    // pour mettre à jour l'interface utilisateur lorsqu'elle est modifiée
    @Published var links: [DeepLink] = []
    
    // Déclaration d'une variable `error` de type `Error` qui est publiée
    // pour afficher des messages d'erreur dans l'interface utilisateur
    @Published var error: Error?
    
    // Fonction qui récupère les données à partir d'un fichier JSON et met à jour
    // les variables `links` et `error`
    
    let model: RemoteConfigModel

    init(model: RemoteConfigModel = RemoteConfigModel()) {
        self.model = model
    }
    
    func fetchLinks() {
        //  tu vas chercher le json depuis FireBase
        model.fetchJSON { json, error in
            if let json = json {
                // Utilisez le JSON récupéré
                print(json)
                self.links = json.links
            } else if let error = error {
                print("Erreur lors de la récupération du JSON : \(error.localizedDescription)")
            }
        }
    }
}

