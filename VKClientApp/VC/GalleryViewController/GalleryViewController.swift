//
//  GalleryViewController.swift
//  VKClientApp
//
//  Created by Sergey Simashov on 01.12.2021.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var sourceArray = ["2","2","2","4","2"]
   
    let reuseIdentifier = "reuseIdentifier"
    let moveToPhoto = "moveToPhoto"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }


}


extension GalleryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sourceArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        cell.configure(image: UIImage(named: sourceArray[indexPath.item]), index: indexPath.item)
        return cell
    }
    
}


extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: moveToPhoto, sender: nil)
}
        
        
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.identifier == moveToPhoto else {return}
//        let cellPhoto = sender as! CustomCollectionViewCell
//        let image = cellPhoto.imageView.image
//        let photoVC: PhotoViewController = segue.destination as! PhotoViewController
//        photoVC.photo = image
//    }

}





extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let whiteSpace = CGFloat(1)
        let lineCountCell = CGFloat(2)
        let cellWidth = collectionViewWidth / lineCountCell - whiteSpace
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    
}
