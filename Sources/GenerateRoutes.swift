//
//  CGGenerate.swift
//  RAML-Swift-CLI
//
//  Created by Christoph Pageler on 23.07.17.
//

import RAML
import SwiftyTextTable

public extension CommandGroup {
    
    public class Generate {
        
        public static func routes(argMainRamlFile: String) {
            guard let absolutePath = FileFinder.absoluteFilePath(fromArgument: argMainRamlFile) else {
                return
            }
            
            guard let raml = try? RAML(file: absolutePath.string) else {
                print("Failed parsing RAML File at path \(absolutePath)")
                return
            }
            
            let methodColumn        = TextTableColumn(header: "Method")
            let pathColumn          = TextTableColumn(header: "Path")
            let displayNameColumn   = TextTableColumn(header: "Display Name")
            var table               = TextTable(columns: [methodColumn, pathColumn, displayNameColumn])
            
            raml.enumerateResource { resource, _, _ in
                
                let method = "GET"
                let absolutePath = raml.absolutePathForResource(resource)
                let displayName = resource.displayName ?? ""
                
                table.addRow(values: [method, absolutePath, displayName])
            }
            
            let tableString = table.render()
            print(tableString)
            
            
        }
        
    }
    
}
