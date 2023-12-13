//
//  CourseListInteractor.swift
//  SwiftbookApp
//
//  Created by Goodwasp on 12.12.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseListInteractorInputProtocol {
    init(presenter: CourseListInteractorOutputProtocol)
    func fetchCourses()
}

protocol CourseListInteractorOutputProtocol: AnyObject {
    func coursesDidReceive(with dataStore: CourseListDataStore)
}

final class CourseListInteractor: CourseListInteractorInputProtocol {
    
    // MARK: - Private properties
    private unowned let presenter: CourseListInteractorOutputProtocol
    
    // MARK: - Initialization
    required init(presenter: CourseListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    // MARK: - Public methods
    func fetchCourses() {
        NetworkManager.shared.fetchData { [weak self] courses in
            let dataStore = CourseListDataStore(courses: courses)
            self?.presenter.coursesDidReceive(with: dataStore)
        }
    }
}
