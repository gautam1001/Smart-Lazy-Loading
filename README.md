# Smart-Lazy-Loading
Smart 'Lazy Loading' in UICollectionView using NSOperation and NSOperationQueue in iOS

So in this project you will learn how we can download the multiple images in UICollectionView by optimising the performance of an app by using Operation and OperationQueue for concurrency. Following are the key point of this project :

Creating image download manager.

Prioritise the downloading based on the visibility of cells.

For the images we will use the Flickr api. Flickr is a wonderful image sharing service that has a publicly accessible and dead- simple API for developers to use. With the API you can search for photos, add photos, comment on photos, and much more. To use the Flickr API, you need an API key.

ImageDownloadManager class will create a singleton instance and have NSCache instance to cache the images that have been downloaded.


We have inherited the Operation class to PGOperation to mauled the functionality according to our need. I think the properties of the operation subclass are pretty clear to you in terms of functionality. We are monitoring operations changes of state by using KVO.
