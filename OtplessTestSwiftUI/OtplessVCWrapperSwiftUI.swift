//
//  OtplessView.swift
//  OtplessTestSwiftUI
//
//  Created by Sparsh on 27/11/23.
//

import SwiftUI
import OtplessSDK

struct OtplessVCWrapperSwiftUI: UIViewControllerRepresentable {
    let vc = MyOtplessVC()
    var data: (OtplessResponse?) -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(vc: vc, data: data)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, onResponseDelegate {
        var otplessResponse: (OtplessResponse?) -> Void
        
        init(vc: MyOtplessVC, data: @escaping (OtplessResponse?) -> Void) {
            self.otplessResponse = data
            super.init()
            Otpless.sharedInstance.delegate = self
            Otpless.sharedInstance.shouldHideButton(hide: true)
            Otpless.sharedInstance.showOtplessLoginPage(vc: vc)
        }
        
        func onResponse(response: OtplessSDK.OtplessResponse?) {
            print("User response - \(response?.responseData)")
            otplessResponse(response)
        }
    }
 }
