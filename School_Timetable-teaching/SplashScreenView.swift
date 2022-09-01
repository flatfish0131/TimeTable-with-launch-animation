//
//  SplashScreenView.swift
//  School_TimeTable
//
//  Created by 王竣翔 on 2022/8/31.
//

import SwiftUI

// Custom View Bulider...
struct SplashScreenView<Content: View,Title: View,Logo: View>: View {
    
    var content: Content
    var titleView: Title
    var logoView: Logo
    
    var imageSize: CGSize
    
    init(imageSize: CGSize,@ViewBuilder content: @escaping () -> Content,@ViewBuilder titleView: @escaping () -> Title,@ViewBuilder logoView: @escaping () -> Logo){
        self.content = content()
        self.titleView = titleView()
        self.logoView = logoView()
        
        self.imageSize = imageSize
    }
    
    //Animation Properties...
    @State var textAnimation = false
    @State var imageAnimation = false
    @State var endAnimation = false
    
    //NameSpace...
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                Color.blue
                // were not going to do complex reading of top edge...
                // simply apply overlay or background it will automatically fill edge...
                    .ignoresSafeArea()
                // But the frame will be safe area...
                
                titleView
                    .scaleEffect(endAnimation ? 0.75 : 1)
                    .offset(y: textAnimation ? -5 : 110)
                
                if !endAnimation{
                    logoView
                        .matchedGeometryEffect(id: "logo", in: animation)
                        .frame(width: imageSize.width, height: imageSize.height)
                }
                //Moving Right...
                HStack{
                    //later Used for nav Buttons...
                    Spacer()
                    
                    if endAnimation{
                        logoView
                            .matchedGeometryEffect(id: "logo", in: animation)
                            .frame(width: 30, height: 30)
                            .padding(.trailing)
                            .offset(x: -20, y: -10)
                    }
                }
            }
            //decreasing size when animation ended
            //yout owen value
            .frame(height: endAnimation ? 64 : nil)
            content
                .frame(height: endAnimation ? nil : 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear{
            
            //Starting Animation with some delay...
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                withAnimation(.spring()){
                    textAnimation.toggle()
                }
                // Next Image Animation...
                
                withAnimation(Animation.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)){
                    endAnimation.toggle()
                
//                withAnimation(Animation.easeIn(duration: 2)){
//                    imageAnimation.toggle()
//                }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
