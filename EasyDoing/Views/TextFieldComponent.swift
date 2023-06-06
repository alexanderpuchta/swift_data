//
//  Copyright © 2023 alexanderpuchta.de -  All rights reserved.
//

import SwiftUI

struct TextFieldComponent: View {
    
    @Binding
    private var text: String
    
    private let label: String
    
    
    // MARK: - Init
    
    init(
        _ text: Binding<String>,
        label: String
    ) {
        
        self._text = text
        self.label = label
    }
    
    
    // MARK: - View
    
    var body: some View {
        LabelComponent(label: self.label) {
            TextField("", text: self.$text)
                .textFieldStyle(.roundedBorder)
        }
    }
}
