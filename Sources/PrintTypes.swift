//
//  PrintTypes.swift
//  RAML-Swift-CLI
//
//  Created by Christoph Pageler on 25.07.17.
//

import RAML
import SwiftyTextTable

public extension CommandGroup.Print {
    
    public static func types(argMainRamlFile: String) {
        guard let raml = CommandGroup.ramlFromArg(argMainRamlFile: argMainRamlFile) else { return }
        
        // setup table
        let displayNameColumn   = TextTableColumn(header: "Display Name")
        let typeColumn          = TextTableColumn(header: "Type")
        let propertiesColumn    = TextTableColumn(header: "Properties")
        let annotationsColumn   = TextTableColumn(header: "Annotations")
        var table               = TextTable(columns: [displayNameColumn, typeColumn, propertiesColumn, annotationsColumn])
        
        // generate table data
        for type in raml.types ?? [] {
            
            let rowTypeDisplayName = type.displayName ?? type.name
            let rowTypeString  = type.type?.string() ?? ""
            
            let numberOfRows = [
                type.properties?.count ?? 0,
                type.annotations?.count ?? 0
            ].max() ?? 1
            
            for rowIndex in 0...numberOfRows-1 {
                let property    = type.properties?[safe: rowIndex]
                let annotation  = type.annotations?[safe: rowIndex]
                
                let rowPropertyName  = property != nil ? (property?.name ?? "") : ""
                let rowAnnotatonName = annotation != nil ? (annotation?.name ?? "") : ""
                
                table.addRow(values: [
                    rowIndex == 0 ? rowTypeDisplayName : "",
                    rowIndex == 0 ? rowTypeString : "",
                    rowPropertyName,
                    rowAnnotatonName,
                    ])
            }
        }
        
        // print table
        let tableString = table.render()
        print(tableString)
    }
    
}
