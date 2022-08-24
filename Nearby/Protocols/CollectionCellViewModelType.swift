//
//  CollectionCellViewModelProtocol.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 17.08.2022.
//

import Foundation

protocol TypeModel {
    static var model: ViewModelType { get set }
}

protocol CollectionCellViewModelType: ViewModelTypeProtocol {
    associatedtype TViewModel
    
    static var reuseId: String { get set }
    func configure(value: TViewModel)
}

