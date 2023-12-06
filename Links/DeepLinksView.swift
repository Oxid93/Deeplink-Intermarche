//
//  ContentView.swift
//  Links
//
//  Created by ghulam  on 20/03/2023.
//

import SwiftUI

extension Color {
    static let intermarche = Color(red: 228/255, green: 0/255, blue: 17/255)
    static let background = Color(red: 238/255, green: 238/255, blue: 238/255)
}

struct Constants {
    static let size: CGFloat = 22
    static let width: CGFloat = 320
    static let height: CGFloat = 50
}

struct LinkView: View {
    let deep: DeepLink
    @State private var isDetailViewPresented = false // Ajout de la variable d'état
    
    var body: some View {
        if deep.params != nil {
            Button(action: {
                isDetailViewPresented = true // Activation de la variable d'état pour afficher la vue de détail
            }) {
                HStack {
                    Image(systemName: deep.icon)
                        .font(.system(size: Constants.size, weight: .bold, design: .default))
                    Text(deep.label)
                        .bold()
                }
                .frame(width: Constants.width, height: Constants.height, alignment: .center)
                .background(Color.intermarche)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .sheet(isPresented: $isDetailViewPresented) {
                DeepLinksDetailView(viewModel: DeepLinksDetailViewModel(deeplink: deep))
            }
        } else {
            Link(destination: URL(string: deep.url) ?? URL(string: "monintermarche://intermarche.com/accueil")!) {
                HStack {
                    Image(systemName: deep.icon)
                        .font(.system(size: Constants.size, weight: .bold, design: .default))
                    Text(deep.label)
                        .bold()
                }
                .frame(width: Constants.width, height: Constants.height, alignment: .center)
                .background(Color.intermarche)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
    }
}

struct DeepLinksView: View {
    @StateObject var viewModel = DeepLinksViewModel()
    @State private var searchText = ""
    
    var filteredLinks: [DeepLink] {
        if searchText.isEmpty {
            return viewModel.links
        } else {
            return viewModel.links.filter { $0.label.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        VStack {
            Image("Deeplinks")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding(.bottom, -60)
                .padding(.top, -20)
            
            if let error = viewModel.error {
                Text(error.localizedDescription)
            } else {
                NavigationView {
                    VStack {
                        TextField("Rechercher", text: $searchText)
                            .padding(.horizontal, 10)
                            .frame(height: 40)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                        List(filteredLinks, id: \.url) { link in
                            LinkView(deep: link)
                        }
                    }
                }
            }
        }
        // Appeler la méthode de récupération des liens lorsque la vue apparaît
        .onAppear {
            viewModel.fetchLinks()
        }
    }
}

struct DeepLinksView_Previews: PreviewProvider {
    static var previews: some View {
        DeepLinksView()
    }
}

