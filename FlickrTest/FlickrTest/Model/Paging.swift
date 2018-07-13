//
//  Paging.swift
//  FlickrTest
//
//  Created by Prashant Gautam on 08/06/2018.
//  Copyright © 2018 gautam1001. All rights reserved.
//

import Foundation

public class Paging {

    // MARK: Properties
    public var totalPages: Int?
    public var numberOfElements: Int32?
    public var currentSize: Int = 20
    public var currentPage: Int?

    init(totalPages: Int, elements: Int32, currentPage: Int) {
        self.totalPages = totalPages
        self.numberOfElements = elements
        self.currentPage = currentPage
    }
}
