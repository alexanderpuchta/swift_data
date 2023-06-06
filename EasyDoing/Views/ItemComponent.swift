//
//  Copyright © 2023 alexanderpuchta.de -  All rights reserved.
//

import SwiftUI

struct ItemComponent: View {
    
    private let caption: String
    private let title: String
    
    
    // MARK: - Init
    
    init(
        title: String,
        caption: String
    ) {
        
        self.caption = caption
        self.title = title
    }
    
    
    // MARK: - View
    
    var body: some View {
        LabelComponent(label: self.caption.uppercased()) {
            Text(self.title)
                .font(.subheadline)
        }
    }
}
