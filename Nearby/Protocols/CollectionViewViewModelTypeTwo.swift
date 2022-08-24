//
//  CollectionViewViewModelType.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 17.08.2022.
//

import Foundation
import UIKit


protocol CollectionViewViewModelType {
    func createCell<T, E>(cell: T.Type, for model: ActiveItem, for indexPath: IndexPath, collectionView: E) -> T where T : CollectionCellViewModelType, E: UICollectionView
    
}
