//
//  CGGenerate.swift
//  RAML-Swift-CLI
//
//  Created by Christoph Pageler on 23.07.17.
//

import RAML

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
            print("raml \(raml.title)")
            
        }
        
    }
    
}
