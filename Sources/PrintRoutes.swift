//
//  CGGenerate.swift
//  RAML-Swift-CLI
//
//  Created by Christoph Pageler on 23.07.17.
//

import RAML
import SwiftyTextTable

public extension CommandGroup.Print {
    
    public static func routes(argMainRamlFile: String) {
        guard let raml = CommandGroup.ramlFromArg(argMainRamlFile: argMainRamlFile) else { return }
        
        // setup table
        let displayNameColumn   = TextTableColumn(header: "Display Name")
        let pathColumn          = TextTableColumn(header: "Path")
        let methodColumn        = TextTableColumn(header: "Method")
        var table               = TextTable(columns: [displayNameColumn, pathColumn, methodColumn])
        
        // generate table data
        raml.enumerateResource { resource, _, _ in
            
            // Row for each Method in Resoruce
            for (index, method) in (resource.methods ?? []).enumerated() {
                
                let displayName = index == 0 ? (resource.displayName ?? "")             : ""
                let path        = index == 0 ? raml.absolutePathForResource(resource)   : ""
                
                table.addRow(values: [
                    displayName,
                    path,
                    method.type.rawValue.uppercased()
                    ])
            }
        }
        
        // print table
        let tableString = table.render()
        print(tableString)
    }
    
}
