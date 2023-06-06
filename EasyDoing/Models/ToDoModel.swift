//
//  Copyright © 2023 alexanderpuchta.de -  All rights reserved.
//

import Foundation
import SwiftData

@Model
final class ToDoModel {
    
    @Attribute(.unique)
    let createdAt: Date

    var isCompleted = false
    let level: String
    var title: String
    
    
    // MARK: - Init
    
    init(
        title: String,
        level: PriorityLevel
    ) {
        
        self.createdAt = .now
        self.level = level.rawValue
        self.title = title
    }
}


// MARK: - Properties

extension ToDoModel {
    
    var statusColor: ColorAsset {
        self.isCompleted ?
            Asset.Colors.informationColor :
            Asset.Colors.mainColor
    }
}
