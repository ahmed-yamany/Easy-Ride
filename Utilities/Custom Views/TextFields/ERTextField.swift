//
//  ERTextField.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 16/05/2024.
//

import SwiftUI

struct ERTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .padding(.horizontal, 20)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1)
            }
    }
}

#Preview {
    ERTextField(placeholder: "Name", text: .constant(""))
        .padding()
}
