//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Nilesh Rathod on 10/05/23.
//

import Foundation


extension Bundle {
    
    func decode<T: Codable>(_ fileName : String) -> T{
        guard let url = self.url(forResource: fileName, withExtension: nil) else {
            fatalError("Failed to locate \(fileName) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(fileName) in bundle.")
        }
        
        let decoder = JSONDecoder()
        let formater = DateFormatter()
        
        formater.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formater)
        
        

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(fileName) from bundle.")
        }
        
        return loaded
    }
}
