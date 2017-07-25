//
//  CollectionExtensions.swift
//  RAML-Swift-CLI
//
//  Created by Christoph Pageler on 25.07.17.
//

import Foundation

internal extension Collection {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
