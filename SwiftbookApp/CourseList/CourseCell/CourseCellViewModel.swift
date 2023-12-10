//
//  CourseCellViewModel.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 05.10.2022.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseCellViewModelProtocol {
    var courserName: String { get }
    var imageData: Data? { get }
    init(course: Course)
}

class CourseCellViewModel: CourseCellViewModelProtocol {
    var courserName: String {
        course.name
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
}
