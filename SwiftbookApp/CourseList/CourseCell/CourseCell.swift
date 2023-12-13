//
//  CourseCell.swift
//  SwiftbookApp
//
//  Created by Alexey Efimov on 04/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

protocol CourseCellModelRepresentable {
    var viewModel: CourseCellViewModelProtocol? { get }
}

final class CourseCell: UITableViewCell, CourseCellModelRepresentable {
    
    // MARK: - Public properties
    var viewModel: CourseCellViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Private methods
    private func updateView() {
        guard let viewModel = viewModel as? CourseCellViewModel else {
            return
        }
        
        var content = defaultContentConfiguration()
        content.text = viewModel.courseName
        if let imageData = viewModel.imageData {
            content.image = UIImage(data: imageData)
        }
        contentConfiguration = content
    }
}
