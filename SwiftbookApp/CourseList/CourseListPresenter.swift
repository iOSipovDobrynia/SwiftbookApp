//
//  CourseListPresenter.swift
//  SwiftbookApp
//
//  Created by Goodwasp on 12.12.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import Foundation

struct CourseListDataStore {
    let courses: [Course]
}

final class CourseListPresenter: CourseListViewOutputProtocol {
    
    // MARK: - Public properties
    var interactor: CourseListInteractorInputProtocol!
    var router: CourseListRouterInputProtocol!
    
    // MARK: - Private properties
    private unowned let view: CourseListViewInputProtocol
    private var dataStore: CourseListDataStore?
    
    // MARK: - Initialization
    required init(view: CourseListViewInputProtocol) {
        self.view = view
    }
    
    // MARK: - Public methods
    func viewDidLoad() {
        interactor.fetchCourses()
    }
    
    func didTappedCell(at indexPath: IndexPath) {
        guard let course = dataStore?.courses[indexPath.row] else { return }
        router.openCourseDetailsViewController(with: course)
    }
}

// MARK: - CourseListInteractorOutputProtocol
extension CourseListPresenter: CourseListInteractorOutputProtocol {
    func coursesDidReceive(with dataStore: CourseListDataStore) {
        self.dataStore = dataStore
        let section = CourseSectionViewModel()

        section.rows = dataStore.courses.map{ CourseCellViewModel(course: $0) }
        view.reloadData(for: section)
    }
}
