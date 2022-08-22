//
//  CollectionCellViewModelProtocol.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 17.08.2022.
//

import Foundation


protocol CollectionCellViewModelType: ViewModelTypeProtocol {
    static var reuseId: String { get set }
    func configure(value: ActiveItem)
}
