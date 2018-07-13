//
//  DetailViewController.swift
//  FlickrTest
//
//  Created by Prashant Gautam on 10/06/18.
//  Copyright © 2018 Appster. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    //var photo: FlickrPhoto!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
        scrollView.delegate = self
         NotificationCenter.default.addObserver(self, selector: #selector(loadImage(_:)), name: NSNotification.Name("LoadImage") , object: nil)
        
    }
    
    @objc func loadImage (_ notification: Notification) {
        guard let photo = notification.object as? FlickrPhoto else {
            return
        }
        self.loaderView.startAnimating()
        ImageDownloadManager.shared.downloadImage(photo, indexPath: nil, size: "b") { [weak self] (image, url, indexPathh, error) in
            if indexPathh  == nil {
                DispatchQueue.main.async {
                    self?.loaderView.stopAnimating()
                    self?.imageView.image = image
                }
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for view in scrollView.subviews where view is UIImageView {
            return view as! UIImageView
        }
        return nil
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

