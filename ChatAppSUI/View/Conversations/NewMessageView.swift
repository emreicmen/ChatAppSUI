//
//  NewMessageView.swift
//  ChatAppSUI
//
//  Created by Emre İÇMEN on 13.12.2024.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showChatView: Bool
    @Environment(\.presentationMode) var mode
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                ForEach((0...10), id: \.self){ _ in
                    Button {
                        showChatView.toggle()
                        mode.wrappedValue.dismiss()
                    } label: {
                        UserCell()
                    }

                }
            }
        }
    }
}

#Preview {
    NewMessageView(showChatView: .constant(true))
}
