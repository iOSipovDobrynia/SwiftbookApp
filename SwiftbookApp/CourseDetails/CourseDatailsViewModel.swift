//
//  CourseDatailsViewModel.swift
//  SwiftbookApp
//
//  Created by Goodwasp on 10.12.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseDetailsViewModelProtocol {
    var courseName: String { get }
    var numberOfLessons: String { get }
    var numberOfTests: String { get }
    var imageData: Data? { get }
    var isFavorite: Bool { get }
    
    var viewModelDidChange: ((CourseDetailsViewModelProtocol) -> Void)? { get set }
    init(course: Course)
    func favoriteButtonPressed()
}

class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
    var viewModelDidChange: ((CourseDetailsViewModelProtocol) -> Void)?
    
    var numberOfLessons: String {
        "Lessons: \(course.numberOfLessons)"
    }
    
    var numberOfTests: String {
        "Lessons: \(course.numberOfTests)"
    }
    
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    var isFavorite: Bool {
        get {
            DataManager.shared.getFavoriteStatus(for: course.name)
        }
        set {
            DataManager.shared.setFavoriteStatus(for: courseName, with: newValue)
            viewModelDidChange?(self)
        }
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
    
    func favoriteButtonPressed() {
        isFavorite.toggle()
    }
}
