//
//  DeepLinksViewModel.swift
//  Links
//
//  Created by ghulam  on 29/03/2023.
//
import SwiftUI
import Combine
import Foundation

struct DeepLink: Codable {
    let url: String
    let label: String
    let icon: String
    let params: [DeeplinksParams]?
}

struct Deeplinks: Codable {
    let links: [DeepLink]
}

struct DeeplinksParams: Codable, Hashable {
        let rank: Int
        let name: String
        let description: String
        let mandatory: Bool
}
