//
//  Bundle+Extensions.swift
//  Nearby
//
//  Created by Мельник Дмитрий on 10.08.2022.
//

import Foundation
// write a extension to bundle 
extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else { fatalError("Unrecognized url") }
        
        guard let data = try? Data(contentsOf: url) else { fatalError("Unrecognized data") }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else { fatalError("data can't be decoded") }
        
        return loaded
    }
}
