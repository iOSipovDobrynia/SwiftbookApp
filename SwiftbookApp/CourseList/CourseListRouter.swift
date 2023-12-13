//
//  CourseListRouter.swift
//  SwiftbookApp
//
//  Created by Goodwasp on 13.12.2023.
//  Copyright © 2023 Alexey Efimov. All rights reserved.
//

import Foundation

protocol CourseListRouterInputProtocol {
    init(view: CourseListViewController)
    func openCourseDetailsViewController(with course: Course)
}

final class CourseListRouter: CourseListRouterInputProtocol {
    
    // MARK: - Private properties
    private unowned let view: CourseListViewController
    
    // MARK: - Initialization
    required init(view: CourseListViewController) {
        self.view = view
    }
    
    // MARK: - Public methods
    func openCourseDetailsViewController(with course: Course) {
        view.performSegue(withIdentifier: "showDetails", sender: course)
    }
}
