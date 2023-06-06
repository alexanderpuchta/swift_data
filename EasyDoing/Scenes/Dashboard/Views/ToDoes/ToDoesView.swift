//
//  Copyright © 2023 alexanderpuchta.de -  All rights reserved.
//

import SwiftData
import SwiftUI

struct ToDoesView: View {
    
    @Environment(\.modelContext)
    private var modelContext
    
    @EnvironmentObject
    private var router: DashboardRouter
    
    @Query
    private var toDoes: [ToDoModel]
    
    
    // MARK: - View
    
    var body: some View {
        self.content
            .padding(16)
            .navigationTitle(Localization.Labels.title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.router.go(to: .create)
                    } label: {
                        Image(systemSymbol: .plus)
                    }
                }
            }
    }
}


// MARK: - Localization

private extension ToDoesView {
    typealias Localization = L10n.Localizable.ToDoes
}


// MARK: - Views

private extension ToDoesView {
    
    @ViewBuilder
    var content: some View {
        
        if self.toDoes.isEmpty {
            VStack {
                
                Text(Localization.Labels.empty)
                    .font(.caption)
                
                Button {
                    self.router.go(to: .create)
                } label: {
                    Text(Localization.Buttons.create)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .center
                        )
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 48)
            }
        } else {
            List {
                ForEach(self.toDoes) { toDo in
                    HStack {
                        
                        Text(toDo.title)
                            .font(.subheadline)
                        
                        Spacer()
                        
                        Circle()
                            .fill(toDo.statusColor.swiftUIColor)
                            .frame(
                                width: 16,
                                height: 16
                            )
                    }
                    .background(Color.clear)
                    .onTapGesture {
                        self.router.go(to: .detail(toDo))
                    }
                }
                .onDelete(perform: self.handleOnDelete)
            }
            .listStyle(.plain)
        }
    }
}


// MARK: - Helper

private extension ToDoesView {
    
    func handleOnDelete(at offset: IndexSet) {
        
        offset
            .compactMap {
                
                if let item = self.toDoes.item(at: $0) {
                    return item
                }
                
                return nil
            }
            .forEach {
                self.modelContext.delete($0)
            }
    }
}
