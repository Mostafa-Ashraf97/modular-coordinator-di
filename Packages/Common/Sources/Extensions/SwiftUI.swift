//
//  SwiftUI.swift
//  Common
//
//  Created by Mostafa on 26/10/2025.
//

import SwiftUI

public extension View {
    /// Wraps the SwiftUI view inside a UIHostingController for UIKit use
    func asViewController() -> UIViewController {
        UIHostingController(rootView: self)
    }
}
