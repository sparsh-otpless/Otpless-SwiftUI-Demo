import SwiftUI
import OtplessSDK

struct ContentView: View {
    
    // Create a state variable to control the presentation of the login page
    @State var showLoginPage = false
    @State var otplessREsp : OtplessResponse? = nil
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            
            Text("Hello, world!")
                .onTapGesture {
                    showLoginPage = true
                }
            
            if let responseData = otplessREsp?.responseData?["data"] as? [String: Any] {
                
                let email = responseData["email"] as? [String: Any]
                let waName = responseData["waName"] as? String
                let mobile = responseData["mobile"] as? [String: Any]
                
                // Format the information as a string
                let formattedText = """
                                Email: \(email?["email"] as? String ?? "")
                                Name: \(email?["name"] as? String ?? "")
                                WA Name: \(waName ?? "")
                                Mobile: \(mobile?["name"] as? String ?? "") - \(mobile?["number"] as? String ?? "Unable to get number")
                                """
                
                
                Text(formattedText)
                    .font(.body)
                    .padding()
            }
            
        }
        .padding()
        //        .sheet(isPresented: $showLoginPage) {
        //            OtplessVCWrapperSwiftUI() { response in
        //                self.otplessREsp = response
        //                showLoginPage = false
        //            }
        //        }
        .overlay(showOtplessLoginPage)
    }
    
    var showOtplessLoginPage: some View {
        Group {
            if showLoginPage {
                OtplessVCWrapperSwiftUI() { response in
                    self.otplessREsp = response
                    showLoginPage = false
                }
            }
        }
    }
}

//import SwiftUI
//import OtplessSDK
//
//struct ContentView: View {
//    @State var otplessREsp: OtplessResponse? = nil
//    @State var isPresentingOtplessView = false
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
//
//                // Use NavigationLink for "Hello, world!" text
//
//
//                // Display response data
//                if let responseData = otplessREsp?.responseData?["data"] as? [String: Any] {
//                    // Extract information from the responseData dictionary
//                    let email = responseData["email"] as? [String: Any]
//                    let waName = responseData["waName"] as? String
//                    let mobile = responseData["mobile"] as? [String: Any]
//
//                    // Format the information as a string
//                    let formattedText = """
//                        Email: \(email?["email"] as? String ?? "")
//                        Name: \(email?["name"] as? String ?? "")
//                        WA Name: \(waName ?? "")
//                        Mobile: \(mobile?["name"] as? String ?? "") - \(mobile?["number"] as? String ?? "Unable to get number")
//                        """
//
//                    Text(formattedText)
//                        .font(.body)
//                        .padding()
//                }
//            }
//            .padding()
//        }
//    }
//}
