//
//  CourseListViewModel.swift
//  SwiftbookApp
//
//  Created by Goodwasp on 10.12.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseListViewModelProtocol {
    func fetchCourses(completion: @escaping() -> Void)
    func numbersOfRows() -> Int
    func getCourseCellViewModel(at indexPath: IndexPath) -> CourseCellViewModelProtocol
    func getCourseDetailsViewModel(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol
}

class CourseListViewModel: CourseListViewModelProtocol {
    private var courses: [Course] = []
    
    func fetchCourses(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { [unowned self] courses in
            self.courses = courses
            completion()
        }
    }
    
    func numbersOfRows() -> Int {
        courses.count
    }
    
    func getCourseCellViewModel(at indexPath: IndexPath) -> CourseCellViewModelProtocol {
        let course = courses[indexPath.row]
        return CourseCellViewModel(course: course)
    }
    
    func getCourseDetailsViewModel(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol {
        let course = courses[indexPath.row]
        return CourseDetailsViewModel(course: course)
    }
}
