//
//  ContentView.swift
//  CustomAlert
//
//  Created by Inpyo Hong on 2021/08/24.
//

import SwiftUI

struct ContentView: View {
   
    @State var shown = false
    @State var title = ""
    @State var message = ""
    @State var alertAction: AlertAction?
    @State var isSuccess = false
    
    var body: some View {
        ZStack {
            VStack() {
                
                Image("demo")
                .resizable()
                    .frame(width: 300, height: 300)
                    .padding()
                
                VStack(spacing: 10) {
                    Button("Success Alert") {
                        isSuccess = true
                        title = "Integer"
                        message = "This is the succes alert!!"
                        shown.toggle()
                    }
                    
                    Button("Failure Alert") {
                        isSuccess = false
                        title = ""
                        message = "This is the failure alert!!"
                        shown.toggle()
                    }
                }
                
                Spacer()
            }

            if shown {
                AlertView(shown: $shown, title: $title, message: $message, alertAction: $alertAction, isSuccess: $isSuccess)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AlertView: View {
    @Binding var shown: Bool
    @Binding var title: String
    @Binding var message: String
    @Binding var alertAction: AlertAction?
    @Binding var isSuccess: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4).ignoresSafeArea()

            IHAlertView(shown: $shown,
                        closure: $alertAction,
                        isSuccess: isSuccess,
                        message: message,
                    title: title)
        }
    }
}
