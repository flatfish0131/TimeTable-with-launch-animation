//
//  HomeView.swift
//  School_TimeTable
//
//  Created by 王竣翔 on 2022/8/29.
//

import SwiftUI

struct HomeView: View {
    let titles = ["週一", "週二", "週三", "週四", "週五"]
    
    let cols = Array(repeating: GridItem(), count: 5)
    
    @EnvironmentObject var courseVM: CourseViewModel
    @State private var isPresentingCourse: CourseModel? = nil
    
    var body: some View {
        ZStack {
            Color.mint
                .ignoresSafeArea()
            
            VStack {
                Text("我的課表")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                HStack {
                    ForEach(titles, id: \.self) { title in
                        Text(title)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        Divider()
                    }
                }
                .frame(height: 30)
                .padding()
                
                ScrollView{
                    LazyVGrid(columns: cols, spacing: 20) {
                        ForEach(courseVM.courseData) { course in
                            Button {
                                print("selected course: \(course.id)")
                                isPresentingCourse = course
                            } label: {
                                CourseView(course: course)
                            }
                        }
                        .sheet(item: $isPresentingCourse) { course in
                            EditingSheetView(course: course)
                        }
                    }
                    .padding()
                    
                }
                
            }
            
            //MENU
            VStack {
                HStack {
                    Spacer()
                    Menu("Options")
                    { Button("Reset", action: courseVM.resetData) }
                        .padding()
                }
                Spacer()
            }
        }
//        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CourseViewModel())
    }
}


