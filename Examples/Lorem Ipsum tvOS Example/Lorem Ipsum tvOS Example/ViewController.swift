//
//  ViewController.swift
//  Lorem Ipsum tvOS Example
//
//  Created by Jeff Kelley on 8/7/18.
//  Copyright © 2018 Lukas Kubanek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var informationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadImage()
    }

    @IBAction func userPressedReloadButton() {
        loadImage()
    }

    func loadImage() {
        let services: [LIPlaceholderImageService] = [.dummyImage,
                                                     .placeKitten]

        guard let service = services.randomElement() else { fatalError() }

        var imageSize = imageView.bounds.size

        var serviceString: String

        switch service {
        case .dummyImage: serviceString = "dummyimage.com"
        case .loremPixel: serviceString = "lorempixel.com"
        case .placeKitten: serviceString = "placekitten.com"
        }

        serviceString.append(" \(Int(imageSize.width)) x \(Int(imageSize.height))")

        informationLabel.text = "Loading…"
        imageView.image = nil

        let scale = UIScreen.main.scale
        imageSize = imageSize * scale

        LoremIpsum.asyncPlaceholderImage(from: service, with: imageSize) { (image) in
            self.imageView.image = image
            self.informationLabel.text = serviceString
        }
    }

}

func *(lhs: CGSize, rhs: CGFloat) -> CGSize {
    return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
}

