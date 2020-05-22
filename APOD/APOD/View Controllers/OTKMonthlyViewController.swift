//
//  OTKMonthlyViewController.swift
//  APOD
//
//  Created by Tobi Kuyoro on 21/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit

class OTKMonthlyViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var collectionView: UICollectionView!

    // MARK: - Properties

    let apiController = APIController()
    var date = Date()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    // MARK: - IBActions
    
    @IBAction func backButtonTapped(_ sender: Any) {
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}

extension OTKMonthlyViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        apiController.photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as? OTKPictureCollectionViewCell else {
            return UICollectionViewCell()
        }

        let pictureOD = apiController.photos[indexPath.row]
        cell.pictureOD = pictureOD

        return cell
    }
}
