//
//  OtplessTestSwiftUIApp.swift
//  OtplessTestSwiftUI
//
//  Created by Sparsh on 27/11/23.
//

import SwiftUI
import OtplessSDK

@main
struct OtplessTestSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            // Check for deep link
                .onOpenURL(perform: { url in
                    if Otpless.sharedInstance.isOtplessDeeplink(url: url.absoluteURL) {
                       Otpless.sharedInstance.processOtplessDeeplink(url: url.absoluteURL)
                      }
                })
        }
    }
}
