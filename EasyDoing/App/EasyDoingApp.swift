//
//  Copyright © 2023 alexanderpuchta.de -  All rights reserved.
//

import SFSafeSymbols
import SwiftUI
import SwiftData

@main
struct EasyDoingApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ToDoModel.self)
    }
}
