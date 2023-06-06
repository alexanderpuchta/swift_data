//
//  Copyright © 2023 alexanderpuchta.de -  All rights reserved.
//

import Foundation
import SwiftUI

final class DashboardRouter: ObservableObject {
    
    @Published
    var path: [Destination] = []
    
    @Published
    var present = false
    
    
    // MARK: - Routing
    
    func go(to route: Destination) {
        switch route {
        case .create:
            self.present = true
            
        case .detail:
            self.path = [route]
        }
    }
}


// MARK: - Destination

extension DashboardRouter {
    
    enum Destination: Hashable {
        
        case create
        case detail(ToDoModel)
    }
}


// MARK: - Identifiable

extension DashboardRouter.Destination: Identifiable {
    
    var id: Self {
        self
    }
}


// MARK: - View

extension DashboardRouter.Destination {
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .create:
            CreateToDoView()
            
        case let .detail(toDoModel):
            ToDoView(item: toDoModel)
        }
    }
}
