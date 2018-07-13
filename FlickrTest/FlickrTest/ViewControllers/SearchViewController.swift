//
//  SearchViewController.swift
//  FlickrTest
//
//  Created by Prashant Gautam on 08/06/2018.
//  Copyright © 2018. All rights reserved.
//

import UIKit

final class SearchViewController: UICollectionViewController {
    
    @IBOutlet weak var searchTextField: SearchTextField!
    var footerView:CustomFooterView?
    var searches = FlickrSearchResults()
    let flickr = Flickr()
    var itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    var paging : Paging?
    var loadMore: Bool = false
    var selectedCellFrame: CGRect?
    var selectedIndexPath: IndexPath?
    let footerViewReuseIdentifier = "RefreshFooterView"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView?.register(UINib(nibName: "CustomFooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerViewReuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func photoForIndexPath(indexPath: IndexPath) -> FlickrPhoto {
        return searches.searchResults[(indexPath as NSIndexPath).row]
    }
    
    @IBAction func showOptionsAction (_ sender: Any) {
        self.searchTextField.resignFirstResponder()
        self.showOptions()
    }
    
    func showOptions () {
        let actionSheetController: UIAlertController = UIAlertController(title: "FlickrTest", message: "Images per row", preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        actionSheetController.addAction(cancelActionButton)
        
        let option1 = UIAlertAction(title: "2", style: .default)
        { _ in
            print("2")
            self.itemsPerRow = 2
            self.collectionView?.reloadData()
        }
        actionSheetController.addAction(option1)
        
        let option2 = UIAlertAction(title: "3", style: .default)
        { _ in
            print("3")
            self.itemsPerRow = 3
            self.collectionView?.reloadData()
        }
        actionSheetController.addAction(option2)
        let option3 = UIAlertAction(title: "4", style: .default)
        { _ in
            print("4")
            self.itemsPerRow = 4
            self.collectionView?.reloadData()
        }
        actionSheetController.addAction(option3)
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    
}

// MARK: UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.paging = nil
        self.loadMore = true
        guard let searchText = textField.text, searchText.count > 0 else {
            ImageDownloadManager.shared.cancelAll()
            self.searches.searchResults.removeAll()
            self.collectionView?.reloadData()
            self.loadMore = false
            return true
        }
        searchTextField.startAnimating()
        self.callSearchApi(searchText: searchText, pageNo: 1)
    
        return true
    }
}






