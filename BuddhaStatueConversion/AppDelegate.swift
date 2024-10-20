//
//  AppDelegate.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/15.
//

import Foundation
import FirebaseCore
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
