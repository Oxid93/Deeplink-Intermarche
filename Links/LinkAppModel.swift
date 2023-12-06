//
//  LinkAppModel.swift
//  Links
//
//  Created by ghulam  on 17/05/2023.
//

import Foundation

class LinkAppModel {
    
    let model: RemoteConfigModel
    
    init(model: RemoteConfigModel = RemoteConfigModel()) {
        self.model = model
    }
    
    func fetchJSON(completion: @escaping (Deeplinks?, Error?) -> Void) {
        model.fetchJSON(completion: completion)
    }
}
