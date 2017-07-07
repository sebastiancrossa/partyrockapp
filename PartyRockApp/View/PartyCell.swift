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
        // TODO: Set image from URL
    }
    
}
