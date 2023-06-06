//
//  Copyright © 2023 alexanderpuchta.de -  All rights reserved.
//

import Combine
import Foundation

extension CreateToDoView {
    
    final class ViewModel: ObservableObject {
        
        @Published
        var level: PriorityLevel = .medium
        
        @Published
        var title: String = ""
        
        @Published
        var valid = false
        
        let levels: [PriorityLevel] = [
            .low,
            .medium,
            .high
        ]
        
        private var cancellables = Set<AnyCancellable>()
        
        
        // MARK: - Init
        
        init() {
            self.setupPublisher()
        }
    }
}


// MARK: - Publisher

private extension CreateToDoView.ViewModel {
    
    func setupPublisher() {
        self.$title
            .debounce(for: 0.25, scheduler: RunLoop.main)
            .sink { [weak self] title in
                self?.handleOnUpdateTitle(title)
            }
            .store(in: &self.cancellables)
    }
}


// MARK: - Helper

private extension CreateToDoView.ViewModel {
    
    func handleOnUpdateTitle(_ title: String) {
        
        guard !title.isEmpty,
              title.count > 4
        else {
            
            self.valid = false
            return
        }
        
        self.valid = true
    }
}
