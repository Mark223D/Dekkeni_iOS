//
//  StringUtils.swift
//  Dekkeni
//
//  Created by Mark on 6/18/19.
//  Copyright © 2019 Dekkeni. All rights reserved.
//

import Foundation

class StringUtils {
    
}

extension String {
    func localized(withComment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: withComment)
    }
}
