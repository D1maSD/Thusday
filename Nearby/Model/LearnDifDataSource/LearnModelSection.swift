//
//  LearnSectionModel.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 20.08.2022.
//

import Foundation

//MARK: In fact секция для DiffableDataSorce это просто идентификатор. Тоесть это может быть любой Hashable обьект
// Как и в случае с Item hash нужен для операций insert/delete только применительно не к item а к секциям
// Однако нужно все равно как то связать Section model and Item
struct LearnModelSection {
    
    let identity: String
    let items: [LearnChatModelItem]
}

extension LearnModelSection: Hashable {
    static func == (lhs: LearnModelSection, rhs: LearnModelSection) -> Bool {
        return lhs.identity == rhs.identity
    }
}
