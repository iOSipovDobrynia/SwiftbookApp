//
//  CourseDetailsPresenter.swift
//  SwiftbookApp
//
//  Created by Goodwasp on 12.12.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import Foundation

struct CourseDetailsDataStore {
    let courseName: String
    let numberOfLessons: Int
    let numberOfTests: Int
    let imageData: Data?
    let isFavorite: Bool
}

class CourseDetailsPresenter: CourseDetailsViewOutputProtocol {
    
    // MARK: - Private properties
    unowned private let view: CourseDetailsViewInputProtocol
    
    // MARK: - Public properties
    var interactor: CourseDetailsInteractorInputProtocol!
    
    // MARK: - Initialization
    required init(view: CourseDetailsViewInputProtocol) {
        self.view = view
    }
    
    // MARK: - Public methods
    func showDetails() {
        interactor.provideCourseDetails()
    }
}

// MARK: - CourseDetailsInteractorOutputProtocol
extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    func receiveCourseDetails(with dataStore: CourseDetailsDataStore) {
        view.displayCourseName(with: dataStore.courseName)
        view.displayNumberOfLessons(with: "Lessons: \(dataStore.numberOfLessons)")
        view.displayNumberOfTests(with: "Tests: \(dataStore.numberOfTests)")
        view.displayImageFavoriteButton(with: dataStore.isFavorite)
        
        if let imageData = dataStore.imageData {
            view.displayImage(with: imageData)
        }
    }
}
