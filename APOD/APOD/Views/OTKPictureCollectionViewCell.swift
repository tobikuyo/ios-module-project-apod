//
//  OTKPictureCollectionViewCell.swift
//  APOD
//
//  Created by Tobi Kuyoro on 21/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit

class OTKPictureCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!

    // MARK: - Properties

    var pictureOD: Pod?

}
