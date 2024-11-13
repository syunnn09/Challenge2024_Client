//
//  ToolbarManager.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/10/23.
//

import Foundation

class ToolbarManager: ObservableObject {
    static var shared = ToolbarManager()

    @Published var isHidden = false
}
