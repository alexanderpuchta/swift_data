//
//  Copyright © 2023 alexanderpuchta.de -  All rights reserved.
//

import Foundation

extension Array {
    
    func item(at index: Int) -> Element? {
        
        if 0 ..< self.count ~= index {
            return self[index]
        }
        
        return nil
    }
}
