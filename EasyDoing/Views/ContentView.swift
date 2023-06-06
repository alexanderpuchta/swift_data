//
//  Copyright © 2023 alexanderpuchta.de -  All rights reserved.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            self.content
        }
    }
}


// MARK: - Views

private extension ContentView {
    
    var content: some View {
        DashboardScene()
    }
}


// MARK: - Preview

#Preview {
    ContentView()
        .modelContainer(for: ToDoModel.self, inMemory: true)
}
