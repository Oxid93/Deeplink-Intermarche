//
//  RemoteConfigModel.swift
//  Links
//
//  Created by ghulam  on 17/05/2023.
//

import Foundation
import SwiftUI
import FirebaseRemoteConfig

class RemoteConfigModel {
        //la classe est conçu avec le modèle singleton avec une instance partagée
    init() {
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    
    //@escape sert à indiquer une closure passé en tant que paramètre peut-être stocké et utilisée en dehors de la portée de cette fonct
    func fetchJSON(completion: @escaping (Deeplinks?, Error?) -> Void) {
        let remoteConfig = RemoteConfig.remoteConfig()
        //fetchJSON effectue la récupération de la config à distance en appelant 'fetch' sur l'instance de 'remoteconfig', si c'est réussi, le JSON est extrait de la valeur de config "deeplinks"
        remoteConfig.fetch { (status, error) in
            if status == .success {
                remoteConfig.activate { (_, _) in
                    let data = remoteConfig.configValue(forKey: "deeplinks").dataValue
                    let decoder = JSONDecoder()
                    let results = try? decoder.decode(Deeplinks.self, from: data)
                    completion(results, nil)
                }
            } else {
                completion(nil, error)
            }
        }
    }
}
