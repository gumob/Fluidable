//
//  Extensions.swift
//  FluidableUITests
//
//  Created by kojirof on 2019/06/29.
//  Copyright © 2019 Gumob. All rights reserved.
//

import Foundation
import XCTest

/**
 Extension
 */
extension XCUIApplication {
    func setEnv(_ config: String) {
        self.launchEnvironment["testConfig"] = config
    }
}

extension Bool {
    var int: Int { return self == true ? 1 : 0 }
}
