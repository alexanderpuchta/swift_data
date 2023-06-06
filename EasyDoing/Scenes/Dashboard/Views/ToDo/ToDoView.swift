//
//  Copyright © 2023 alexanderpuchta.de -  All rights reserved.
//

import SwiftData
import SwiftUI

struct ToDoView: View {
    
    @Environment(\.modelContext)
    private var modelContext
    
    private var item: ToDoModel
    
    
    // MARK: - Init
    
    init(item: ToDoModel) {
        self.item = item
    }
    
    
    // MARK: - View
    
    var body: some View {
        self.content
            .padding(16)
            .navigationTitle(self.item.title)
    }
}


// MARK: - Localization

private extension ToDoView {
    typealias Localization = L10n.Localizable.ToDo
}


// MARK: - Views

private extension ToDoView {
    
    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            ItemComponent(
                title: self.item.createdAt.formatted(date: .numeric, time: .shortened),
                caption: Localization.Labels.createdAt
            )
            
            ItemComponent(
                title: self.item.level.capitalized,
                caption: Localization.Labels.priorty
            )
            
            Button(action: self.handleOnTapComplete) {
                Text(self.item.buttonLabel)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .center
                    )
            }
            .buttonStyle(.bordered)
            
            Spacer()
        }
    }
}


// MARK: - ToDoModel + Properties

private extension ToDoModel {
    
    var buttonLabel: String {
        self.isCompleted ?
            L10n.Localizable.ToDo.Buttons.undone :
            L10n.Localizable.ToDo.Buttons.done
    }
}


// MARK: - Helper

private extension ToDoView {
    
    func handleOnTapComplete() {
        
        self.item.isCompleted.toggle()
        
        do {
            try self.modelContext.save()
        } catch {
            print("***", error.localizedDescription)
        }
    }
}
