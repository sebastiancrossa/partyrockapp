//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Sebastian Crossa on 7/7/17.
//  Copyright © 2017 CROSS-A. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet var videoPreviewImage: UIImageView!
    
    @IBOutlet var videoTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Pass info to the app every time a cell is created
    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        
        // When downloading stuff from the internet it should be ASYNC
        let url = URL(string: partyRock.imageURL)! // We unwrap because we are sure it does exist
        
        // Creates a thread in the background (IT CANNOT UPDATE THE VIEWS, ONLY DOES OPERATIONS)
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                
                // Will use the MAIN thread (IS ABLE TO UPDATE THE UI)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                // Error handling
            }
        }
    }
    
}
