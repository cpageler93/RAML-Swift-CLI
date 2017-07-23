import Foundation
import Commander
import PathKit

let main = command {
    Group {
        $0.group("generate", closure: {
            $0.command("routes") { (argMainRamlFile: String) in
                CommandGroup.Generate.routes(argMainRamlFile: argMainRamlFile)
            }
        })
    }.run()
}

main.run()
