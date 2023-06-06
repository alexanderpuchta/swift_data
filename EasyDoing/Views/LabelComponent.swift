//
//  Copyright © 2023 alexanderpuchta.de -  All rights reserved.
//

import SwiftUI

struct LabelComponent<Content: View>: View {
    
    private let content: Content
    private let label: String
    
    
    // MARK: - Init
    
    init(
        label: String,
        @ViewBuilder content: () -> Content
    ) {
        
        self.content = content()
        self.label = label
    }
    
    
    // MARK: - View
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            self.content
            
            Text(self.label)
                .font(.caption)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
}
