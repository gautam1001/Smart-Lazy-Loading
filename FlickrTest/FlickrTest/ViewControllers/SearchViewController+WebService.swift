//
//  SearchViewController+WebService.swift
//  FlickrTest
//
//  Created by Prashant Gautam on 12/06/18.
//  Copyright © 2018 gautam1001. All rights reserved.
//

import Foundation

extension SearchViewController {
    
    func callSearchApi (searchText: String, pageNo: Int) {
        // use Flickr wrapper class to search Flickr for photos that match the given search term asynchronously
        // when search complets, the completion block will be called with the result set of FlickrPhoto objects and error (if there is one)
        flickr.searchFlickrForTerm(searchText, page: pageNo) { results, paging, error in
            
            self.searchTextField.stopAnimating()
            if let paging = paging, paging.currentPage == 1 {
                ImageDownloadManager.shared.cancelAll()
               self.searches.searchResults.removeAll()
                self.collectionView?.reloadData()
            }
            
            if let error = error {
                // 2
                // log any errors to the console. In production display these errors to user
                print("Error searching: \(error)")
                return
            }
            
            if let results = results {
                // 3
                // results get logged and added to the front of the searches array
                print("Found \(results.searchResults.count) matching \(results.searchTerm)")
                self.searches.searchResults.append(contentsOf: results.searchResults)
                for photo in self.searches.searchResults {
                    print("URL:  \(photo.flickrImageURL()?.absoluteString ?? "")")
                }
                self.paging = paging
                self.collectionView?.reloadData()
            }
            self.loadMore = false
        }
    }
    
}
