//
//  SplashView.swift
//  EasyRider
//
//  Created by Ahmed Yamany on 07/05/2024.
//

import SwiftUI

struct SplashView<ViewModel: SplashViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    @State var progressValue : Float = 1.0/3
    @State var animationValue : Float = 300.0
    @State var currentStep : Int = 0
    
    var body: some View {
        onBoardingView
        progressButton
    }
    
    var onBoardingView:some View {
        
        VStack{
            HStack{
                Spacer()
                Button{
                    self.currentStep = viewModel.getSplashData().count - 1
                    self.animationValue = animationValue - 100
                    self.progressValue = 1.0
                }label: {
                    Text("Skip")
                        .padding(16)
                        .tint(.black)
                }
            }
            TabView(selection:$currentStep)
            {
                ForEach(0..<viewModel.getSplashData().count, id: \.self) { i in
                    VStack{
                        Image(viewModel.getSplashData()[i].image)
                            .resizable()
                            .frame(width: 350, height: 220)
                        Text(viewModel.getSplashData()[i].title)
                            .padding(.top,30)
                            .padding(.bottom,15)
                            .font(.custom(size: 24, weight: .regular))
                        Text(viewModel.getSplashData()[i].descreption).multilineTextAlignment(.center)
                            .font(.custom(size: 14, weight: .regular))
                            .foregroundStyle(.erContentTertiary)
                            .padding(.horizontal,30)
                        
                    }.tag(i)
                }
            }.animation(.easeInOut(duration: 1.0),value: animationValue)
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({_ in }))
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
        }
    }
    
    var progressButton : some View {
        ZStack{
            ProgressBar(progress: self.$progressValue, value: self.$animationValue, color: Color.erPrimary)
                .frame(width: 80, height: 80).onAppear(){
                    progressValue = 0.35
                }
            Button{
                if progressValue < 1.0 {
                    progressValue += 1.0/3
                    animationValue = animationValue - 100
                    sliderAction()
                }else{
                    
                    //TODO: - Navigation
                    progressValue = 1.0/3
                    animationValue = animationValue + 300
                    self.currentStep = 0
                }
            }label: {
                Image(systemName: "arrow.right")
            }
            .frame(width: 65, height: 65, alignment: .center)
            .background(Color(.erPrimary))
            .tint(Color.gray)
            .clipShape(Circle())
            
        }.padding(.bottom,50)
            .padding(.top,150)
    }
    
    private func sliderAction(){
        if self.currentStep < viewModel.getSplashData().count-1{
            self.currentStep += 1
        }
    }
}

struct ProgressBar :View {
    @Binding var progress : Float
    @Binding var value : Float
    var color : Color 
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .opacity(0.3)
            .foregroundColor(.yellow)
        Circle()
            .trim(from: 0.0,to: CGFloat(min(self.progress, 1.0)))
            .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
            .foregroundColor(color)
            .rotationEffect(Angle(degrees:270))
            .animation(.easeIn(duration: 0.3),value: value)
    }
}
