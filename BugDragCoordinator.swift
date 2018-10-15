//
//  BugDragCoordinator.swift
//  Bugray
//
//  Created by Alex Fedoseev on 15.10.2018.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import UIKit

class BugDragCoordinator {
    
    var sourceIndexPaths: [IndexPath] = []
    var sourceIndexes: [Int] {
        get {
            return sourceIndexPaths.map { $0.item }
        }
    }
    
    var destination: Bug.Context?
    var destinationIndexPaths: [IndexPath]?
    var dragCompleted = false
    
    var isReordering: Bool {
        get {
            guard let destination = destination else { return false }
            return source == destination
        }
    }
    
    let source: Bug.Context
    init(source: Bug.Context) {
        self.source = source
    }
    
    func dragItemForBugAt(indexPath: IndexPath) -> UIDragItem {
        sourceIndexPaths.append(indexPath)
        return UIDragItem(itemProvider: NSItemProvider())
    }
    
    func calculateDestinationIndexPaths(from indexPath: IndexPath,
                                        count: Int) {
        // 1
        let indexes = Array(indexPath.item..<(indexPath.item + count))
        // 2
        destinationIndexPaths =
            indexes.map { IndexPath(item: $0, section: 0)}
    }
    
}
