import Foundation
import Commander
import PathKit

let main = command {
    Group {
        $0.group("print", closure: {
            $0.command("routes") { (argMainRamlFile: String) in
                CommandGroup.Print.routes(argMainRamlFile: argMainRamlFile)
            }
            $0.command("types") { (argMainRamlFile: String) in
                CommandGroup.Print.types(argMainRamlFile: argMainRamlFile)
            }
        })
    }.run()
}

main.run()
