//
//  HomeView.swift
//  Coordinatorr
//
//  Created by Salma on 12/05/2024.
//

import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View{
  @ObservedObject var viewModel: ViewModel
  @State var name: String = ""
  @State var email: String = ""
  @State private var isDropdownVisible = false
  @State private var selectedOption: String = ""
  @State private var buttonTitle = "Gender"
  
  let gender = ["Female", "Male"]
  
  var body: some View {
    VStack {
      HStack{
        Text("Sign up")
          .font(.system(size: 24, weight: .medium))
          .padding(.bottom, 16)
          .padding(.leading, 20)
        Spacer()
        
      }
      TextField("   Name", text: $name)
        .frame(width: 360, height: 50)
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
      
      TextField("   Email", text: $email)
        .frame(width: 360, height: 50)
        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
        .padding(.top, 10)
      
      Button(action: {
        isDropdownVisible.toggle()
      }) {
        HStack {
          Text(buttonTitle)
          Spacer()
          Image(systemName: "chevron.down")
            .padding(.trailing, 3)
        }
        .padding()
        .foregroundColor(.gray)
        .background(Color.white)
        .cornerRadius(8)
        .frame(width: 360, height: 50)
        .overlay(
          RoundedRectangle(cornerRadius: 5)
            .stroke(Color.gray, lineWidth: 1)
        )
      }
      .padding(.top, 10)
      
      if isDropdownVisible {
        List(gender, id: \.self) { option in
          Button(action: {
            selectedOption = option
            buttonTitle = option
            isDropdownVisible.toggle()
          }){
            Text(option)
          }
          .frame(width: 360)
          .foregroundColor(.black)
          .background(Color.clear)
        }
      }
      HStack{
        Image(systemName: "checkmark.circle")
        Text("By signing up you agree to the")
          .foregroundColor(.gray)
          .font(.system(size: 12, weight: .light))
        Text("Terms of Service")
          .foregroundColor(.yellow)
          .font(.system(size: 12, weight: .light))
        Text("and")
          .foregroundColor(.gray)
          .font(.system(size: 12, weight: .light))
        Text("Privacy policy")
          .foregroundColor(.yellow)
          .font(.system(size: 12, weight: .light))
      }.padding(.top, 10)
      
      Button("Sign up") {
        viewModel.SignupTapped()
      }.frame(width: 360, height: 50)
        .background(Color.yellow)
        .cornerRadius(5)
        .foregroundColor(.white)
        .padding(.top , 10)
      
      Text("───────── or ─────────")
        .foregroundColor(.gray)
        .padding(.top, 15)
      
      HStack{
        Button(action: {
          
        }) {
          Image("gmail")
            .aspectRatio(contentMode: .fill)
            .frame(width: 32, height: 32)
        }
        .frame(width: 50, height: 50)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
        .padding(.trailing, 8)
        
        Button(action: {
          
        }) {
          Image("facebook")
            .aspectRatio(contentMode: .fill)
            .frame(width: 32, height: 32)
        }
        .frame(width: 50, height: 50)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
        .padding(.trailing, 8)
        
        Button(action: {
          
        }) {
          Image("apple")
            .aspectRatio(contentMode: .fill)
            .frame(width: 32, height: 32)
        }
        .frame(width: 50, height: 50)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
      }.padding(.top, 20)
      
      HStack{
        Text("Already have an account?")
          .foregroundColor(.gray)
        Button("Sign in"){
          
        }
        .foregroundColor(.yellow)
        .font(.system(size: 16, weight: .medium))
      }.padding(.top, 20)
    }
    Spacer()
  }
}
