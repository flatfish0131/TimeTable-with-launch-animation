//
//  Course.swift
//  School_TimeTable
//
//  Created by 王竣翔 on 2022/8/29.
//

import Foundation

struct CourseModel: Identifiable, Codable {
    var id = UUID().uuidString
    var name: String
    var place: String
}
