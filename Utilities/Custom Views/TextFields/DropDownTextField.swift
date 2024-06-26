//
//  DropDownTextField.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 16/05/2024.
//

import SwiftUI

struct DropDownTextField<Item: CustomStringConvertible>: View {
    let items: [Item]
    @Binding var text: Item
    let placeholder: String
    @State private var showDropDown = false

    var body: some View {
        VStack(spacing: 0) {
            ERTextField(placeholder: placeholder, text: .constant(text.description))
                .overlay(alignment: .trailing) {
                    dropDownButton
                }
            
            ScrollView {
                LazyVStack {
                    ForEach(items, id: \.description) { item in
                        menuItemView(item: item)
                    }
                }
            }
            .frame(minHeight: showDropDown ? 60 : 0)
            .frame(maxHeight: showDropDown ? 200 : 0)
            .background(.erBackground)
            .shadow(radius: 3)
            .animation(.smooth, value: showDropDown)
        }
        .animation(.none, value: showDropDown)
    }
    
    private var dropDownButton: some View {
        HStack {
            Button {
                showDropDown.toggle()
            } label: {
                Image(systemName: "chevron.down")
                    .padding(.trailing, 3)
            }
            .padding(.horizontal, 25)
            .foregroundStyle(Asset.Colors.erContentSecondary.swiftUIColor)
        }
    }
    
    @ViewBuilder
    private func menuItemView(item: Item) -> some View {
        HStack {
            Text(item.description)
                .font(.custom(size: 14, weight: .medium))
                .foregroundStyle(Asset.Colors.erContentPrimary.swiftUIColor)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, .constants.padding)
    }
}

//#Preview {
//    DropDownTextField(items: Gender.allCases, text: .constant(Gender.male), placeholder: "Gender")
//        .padding()
//}
