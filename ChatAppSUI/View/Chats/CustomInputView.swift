//
//  CustomInputView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 16.12.2024.
//

import SwiftUI

struct CustomInputView: View {
    
    @Binding var text: String
    var action: () -> Void
    
    var body: some View {
        VStack{
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
            HStack{
                TextField("Message here...", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.body)
                    .frame(minHeight: 30)
                Button("", systemImage: "paperplane.fill") {
                    action()
                }
                .buttonBorderShape(.roundedRectangle(radius: 16))
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .padding(.trailing, 2)

            }
        }
    }
}

#Preview {
    //CustomInputView(text: .constant("Message"), action: <#T##() -> Void#>)
}
