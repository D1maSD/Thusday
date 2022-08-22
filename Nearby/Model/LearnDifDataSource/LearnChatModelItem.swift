
//
//  ListViewController.swift
//  IChat
//
//  Created by Алексей Пархоменко on 27.01.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit
//#2
// MARK: Каждый Item должен иметь свой уникальный Id, для операций insert/delete, здесь это поле id
// Но для NSDiffableDataSource нельзя явно указать поле с уникальным id
// Для подтверждения уникальности здесь используется хэш-функция которая подписана под Hashable
// Rewrite her чтобы для расчета хэша брался только id
// This делается для того чтобы NSDiffableDataSource мог выполнять операции удаления и добавления новых item
struct LearnChatModelItem: Hashable, Decodable, CollectionViewViewModelType {
    
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    // MARK: Так же генерируется функция которая сравнивает id - поля ID - шников
    static func == (lhs: LearnChatModelItem, rhs: LearnChatModelItem) -> Bool {
        return lhs.id == rhs.id
    }
}
