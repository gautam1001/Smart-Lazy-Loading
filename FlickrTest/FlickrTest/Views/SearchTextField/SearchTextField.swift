//
//  SearchTextField.swift
//  FlickrTest
//
//  Created by Prashant Gautam on 11/06/18.
//  Copyright © 2018 gautam1001. All rights reserved.
//

import UIKit

class SearchTextField: UITextField {
    var activityIndicator : UIActivityIndicatorView!
    
    override func awakeFromNib() {
        activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.hidesWhenStopped = true
        self.addSubview(activityIndicator)
        activityIndicator.frame = self.bounds
    }
    
    func startAnimating () {
        activityIndicator.startAnimating()
    }
    func stopAnimating () {
        activityIndicator.stopAnimating()
    }

}
