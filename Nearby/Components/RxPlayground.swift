//
//  RxPlayground.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 14.09.2022.
//

import Foundation
import RxSwift
import RxCocoa


public func example(of description: String, action: () -> Void) {
    print("\n--- Example of:", description, "---")
    action()
}
