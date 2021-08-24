//
//  IHAlertView.swift
//  CustomAlert
//
//  Created by Inpyo Hong on 2021/08/24.
//

import SwiftUI

enum AlertAction {
    case ok
    case cancel
    case others
}

struct IHAlertView: View {
    @Binding var shown: Bool
    @Binding var closure: AlertAction?
    var isSuccess: Bool
    var message: String
    var title: String
    
    var body: some View {
        ZStack {
            VStack {
                if title.count > 0 {
                    Text(title)
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .padding(.all, 20)
                }
                else{
                    Image(isSuccess ? "check":"remove")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.all, 20)
                }
                
                Spacer()
                
                Text(message)
                    .foregroundColor(Color.black)
                
                Spacer()
                
                Divider()
                
                HStack() {
                    Button("Close"){
                        closure = .cancel
                        shown.toggle()
                    }.frame(width: UIScreen.main.bounds.width/2-30, height: 40)
                    .foregroundColor(.black)
                    
                    Divider().frame(height: 40)
                    
                    Button("OK"){
                        closure = .ok
                        shown.toggle()
                    }.frame(width: UIScreen.main.bounds.width/2-30, height: 40)
                    .foregroundColor(.black)
                    .font(.title3.bold())
                }
                Spacer()
                    .frame(height: 4)
            }.frame(width: UIScreen.main.bounds.width - 50, height: 200)
            .background(Color.white)//.opacity(0.5))
            .cornerRadius(12)
            .clipped()
        }
    }
}

struct IHAlertView_Previews: PreviewProvider {
    static var previews: some View {
        IHAlertView(shown: .constant(true),
                    closure: .constant(AlertAction.ok),
                    isSuccess: true,
                    message: "test", title: "title")
            .previewLayout(.sizeThatFits)
    }
}
