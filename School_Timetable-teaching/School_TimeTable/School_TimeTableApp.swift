//
//  School_TimeTableApp.swift
//  School_TimeTable
//
//  Created by 王竣翔 on 2022/8/29.
//

import SwiftUI

@main
struct School_TimeTableApp: App {
    @StateObject var courseVM: CourseViewModel = CourseViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(courseVM)
        }
    }
}
