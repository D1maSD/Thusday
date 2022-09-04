//
//  ChatScreenViewModel.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 22.08.2022.
//

import Foundation
import UIKit


struct UsersViewModel: CollectionViewViewModelType {
    var model: UsersItem?
    
    func createCell<T, E>(cell: T.Type, for model: ViewModelType, for indexPath: IndexPath, collectionView: E) -> T where T : CollectionCellViewModelType, E : UICollectionView {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell.reuseId, for: indexPath) as? T else {
            
            return fatalError("not dequeue \(cell) ") as! T
        }
        cell.configure(value: model as! T.TViewModel)
        return cell
    }
}
    
    
    
