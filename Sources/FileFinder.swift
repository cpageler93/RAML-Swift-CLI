//
//  FileFinder.swift
//  RAML-Swift-CLI
//
//  Created by Christoph Pageler on 23.07.17.
//

import Foundation
import PathKit

public class FileFinder {
    
    public static func absoluteFilePath(fromArgument string: String) -> Path? {
        
        // replace ~ with absolute home directory
        var filepath = Path(string.replacingOccurrences(of: "~", with: NSHomeDirectory()))
        
        // make path absolute
        if filepath.isRelative {
            filepath = Path(FileManager.default.currentDirectoryPath) + filepath
        }
        
        if !filepath.exists{
            print("no file at \(filepath)")
            return nil
        }
        
        return filepath
    }
    
}
