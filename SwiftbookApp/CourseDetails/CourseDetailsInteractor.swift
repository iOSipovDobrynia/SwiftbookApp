//
//  CourseDetailsInteractor.swift
//  SwiftbookApp
//
//  Created by Goodwasp on 12.12.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseDetailsInteractorInputProtocol {
    var isFavorite: Bool { get }
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course)
    func provideCourseDetails()
}

protocol CourseDetailsInteractorOutputProtocol: AnyObject {
    func receiveCourseDetails(with dataStore: CourseDetailsDataStore)
}

class CourseDetailsInteractor: CourseDetailsInteractorInputProtocol {
    
    var isFavorite: Bool {
        DataManager.shared.getFavoriteStatus(for: course.name)
    }
    
    private unowned let presenter: CourseDetailsInteractorOutputProtocol
    private let course: Course
    
    required init(presenter: CourseDetailsInteractorOutputProtocol, course: Course) {
        self.course = course
        self.presenter = presenter
    }
    
    func provideCourseDetails() {
        let imageData = ImageManager.shared.fetchImageData(from: course.imageUrl)
        let dataStore = CourseDetailsDataStore(
            courseName: course.name,
            numberOfLessons: course.numberOfLessons,
            numberOfTests: course.numberOfTests,
            imageData: imageData,
            isFavorite: isFavorite
        )
        presenter.receiveCourseDetails(with: dataStore)
    }
}
