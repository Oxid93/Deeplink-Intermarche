//
//  DeepLinksDetailView.swift
//  Links
//
//  Created by ghulam  on 12/04/2023.
//

import SwiftUI
import WebKit

struct DeepLinksDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel: DeepLinksDetailViewModel
    
    var body: some View {
        VStack {
            HStack {
                // Bouton croix pour fermer la page
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.intermarche)
                        .cornerRadius(15)
                })
                .padding()
                
                Spacer()
            }
            
            Spacer()
            
            // Afficher les champs de texte pour chaque paramètre de la deeplink
            if let params = viewModel.deeplink.params {
                ForEach(params.indices, id: \.self) { index in
                    let param = params[index]
                    
                    // Afficher le champ de texte pour le paramètre
                    TextField(param.description, text: Binding<String>(get: {
                        viewModel.dictionary[param.rank] ?? ""
                    }, set: {
                        viewModel.dictionary[param.rank] = $0
                    }))
                    .padding(.horizontal, 10)
                    .frame(height: 40)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                }
            }

            if let url = URL(string: viewModel.getUrl()) {
                // Verif ok
                Link(destination: url, label: {
                    Text("OK")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .background(Color.intermarche)
                        .cornerRadius(8)
                })
            }
            Spacer()
        }
    }
}
