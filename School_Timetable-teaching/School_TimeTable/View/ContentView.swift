//
//  ContentView.swift
//  School_TimeTable
//
//  Created by 王竣翔 on 2022/8/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        SplashScreenView(imageSize: CGSize(width: 128, height: 128)){
            
            NavigationView{
                VStack{
                    Text("歡迎使用")
                        .font(.system(.largeTitle,design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    
                    
                    NavigationLink {
                        HomeView()
                            .environmentObject(CourseViewModel())
                            .ignoresSafeArea()
                    } label: {
                        Text("點擊來開始")
                            .fontWeight(.bold)
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .padding(10)
                    }
                    
                    
                    
                }
                .offset(x: 0, y: -30)
                .ignoresSafeArea()
                
                //HomeView...
            }
            
        } titleView: {
            Text("課表通")
                .font(.system(size: 35).bold())
                .foregroundColor(.white)
        } logoView: {
            //make sure to give exact size of logo frame here...
            //in this project eg has 256x256...
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 64, height: 64)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
