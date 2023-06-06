//
//  Copyright © 2023 alexanderpuchta.de -  All rights reserved.
//

import SwiftData
import SwiftUI

struct CreateToDoView: View {
    
    @Environment(\.dismiss)
    private var dismiss
    
    @Environment(\.modelContext)
    private var modelContext
    
    @StateObject
    private var viewModel = ViewModel()
    
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            self.content
                .padding(16)
                .navigationTitle(Localization.Labels.title)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: self.dismiss.callAsFunction) {
                            Image(systemSymbol: .xmark)
                        }
                    }
                }
        }
    }
}


// MARK: - Localization

private extension CreateToDoView {
    typealias Localization = L10n.Localizable.CreateToDo
}


// MARK: - Views

private extension CreateToDoView {
    
    var content: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            TextFieldComponent(
                self.$viewModel.title,
                label: Localization.TextFields.Labels.title
            )
            
            LabelComponent(label: Localization.Labels.priority) {
                Picker("", selection: self.$viewModel.level) {
                    ForEach(self.viewModel.levels, id: \.rawValue) { level in
                        Text(level.rawValue)
                            .tag(level)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Spacer()
            
            Button(action: self.handleOnTapCreate) {
                Text(Localization.Buttons.create)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .center
                    )
            }
            .buttonStyle(.borderedProminent)
            .disabled(!self.viewModel.valid)
        }
    }
}


// MARK: - Helper

private extension CreateToDoView {
    
    func handleOnTapCreate() {
        
        let toDoModel = ToDoModel(
            title: self.viewModel.title,
            level: self.viewModel.level
        )
        
        self.modelContext.insert(toDoModel)
        
        self.dismiss.callAsFunction()
    }
}
