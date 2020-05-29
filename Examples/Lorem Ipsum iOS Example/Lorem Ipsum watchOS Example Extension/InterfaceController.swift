/*
*        __                                 ____
*       / /   ____  ________  ____ ___     /  _/___  _______  ______ ___
*      / /   / __ \/ ___/ _ \/ __ `__ \    / // __ \/ ___/ / / / __ `__ \
*     / /___/ /_/ / /  /  __/ / / / / /  _/ // /_/ (__  ) /_/ / / / / / /
*    /_____/\____/_/   \___/_/ /_/ /_/  /___/ .___/____/\__,_/_/ /_/ /_/
*                                          /_/
*
*                           InterfaceController.swift
*                   http://github.com/lukaskubanek/LoremIpsum
*             2013-2020 (c) Lukas Kubanek (http://lukaskubanek.com)
*/

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var image: WKInterfaceImage!
    @IBOutlet weak var infoLabel: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        setTitle(LoremIpsum.title)
        loadImage()
    }
    
    @IBAction func userPressedReloadMenuItem() {
        loadImage()
    }

    func loadImage() {
        let services: [LIPlaceholderImageService] = [.loremPixel,
                                                     .dummyImage,
                                                     .placeKitten]

        guard let service = services.randomElement() else { fatalError() }

        let width = contentFrame.width
        let height = contentFrame.height

        let imageHeight = floor(CGFloat.random(in: (height * 0.5)...(height * 0.75)))
        self.image.setHeight(imageHeight)

        var serviceString: String

        switch service {
        case .dummyImage: serviceString = "dummyimage.com"
        case .loremPixel: serviceString = "lorempixel.com"
        case .placeKitten: serviceString = "placekitten.com"
        @unknown default: return
        }

        serviceString.append(" \(Int(width)) x \(Int(imageHeight))")

        infoLabel.setText("Loading…")
        image.setImage(nil)

        let scale = WKInterfaceDevice.current().screenScale
        let imageSize = CGSize(width: width * scale, height: imageHeight * scale)

        LoremIpsum.asyncPlaceholderImage(from: service, with: imageSize) { (image) in
            self.image.setImage(image)
            self.infoLabel.setText(serviceString)
        }
    }

}
