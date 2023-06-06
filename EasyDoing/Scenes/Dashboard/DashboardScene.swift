//
//  Copyright © 2023 alexanderpuchta.de -  All rights reserved.
//

import SwiftUI

struct DashboardScene: View {
    
    @StateObject
    private var router = DashboardRouter()
    
    
    // MARK: - View
    
    var body: some View {
        NavigationStack(path: self.$router.path) {
            ToDoesView()
                .environmentObject(self.router)
                .navigationDestination(for: DashboardRouter.Destination.self) { destination in
                    destination
                        .view
                        .environmentObject(self.router)
                }
        }
        .sheet(isPresented: self.$router.present) {
            DashboardRouter.Destination.create
                .view
                .presentationDetents([.medium])
        }
    }
}
