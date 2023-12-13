//
//  CourseCellViewMode.swift
//  SwiftbookApp
//
//  Created by Goodwasp on 13.12.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseCellViewModelProtocol {
    var cellID: String { get }
    var cellHeigh: Double { get }
    var courseName: String { get }
    var imageData: Data? { get }
    init(course: Course)
}

protocol CourseSectionViewModelProtocol {
    var rows: [CourseCellViewModelProtocol] { get }
    var numberOfRows: Int { get }
}

final class CourseCellViewModel: CourseCellViewModelProtocol {
    
    // MARK: - Public properties
    var cellID: String {
        "CourseCell"
    }
    
    var cellHeigh: Double {
        100
    }
    
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    // MARK: - Private properties
    private let course: Course
    
    // MARK: - Initialization
    required init(course: Course) {
        self.course = course
    }
}

final class CourseSectionViewModel: CourseSectionViewModelProtocol {
    
    // MARK: - Public properties
    var rows: [CourseCellViewModelProtocol] = []
    
    var numberOfRows: Int {
        rows.count
    }
}
