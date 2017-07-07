//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Sebastian Crossa on 7/4/17.
//  Copyright © 2017 CROSS-A. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let partyRock1 = PartyRock(imageURL: "https://i.ytimg.com/vi/SjmTFIHX1yo/hqdefault.jpg?sqp=-oaymwEWCKgBEF5IWvKriqkDCQgBFQAAiEIYAQ==&rs=AOn4CLBe8Kw_x1cv2GzhdEfHiAXe6rN33Q" , videoURL: "<div style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube.com/embed/SjmTFIHX1yo?list=PL0SSw9dW4gTRDD0mE2SC2uFLcs2j9FE2j?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe></div>", videoTitle: "Lights Out")
        
        let partyRock2 = PartyRock(imageURL: "https://i.ytimg.com/vi/1w9DiGlZksU/hqdefault.jpg?sqp=-oaymwEWCKgBEF5IWvKriqkDCQgBFQAAiEIYAQ==&rs=AOn4CLAp-1dna6TRCJwfAvHghmKi5mq57w", videoURL: "<div style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube.com/embed/1w9DiGlZksU?list=PL0SSw9dW4gTRDD0mE2SC2uFLcs2j9FE2j?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe></div>", videoTitle: "Let's Get Ridiculous")
        
        let partyRock3 = PartyRock(imageURL: "https://i.ytimg.com/vi/tWyuglGCKgE/hqdefault.jpg?sqp=-oaymwEWCKgBEF5IWvKriqkDCQgBFQAAiEIYAQ==&rs=AOn4CLByFkUYbfXo6bA_AYpseb5BRftjvw", videoURL: "<div style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube.com/embed/tWyuglGCKgE?list=PL0SSw9dW4gTRDD0mE2SC2uFLcs2j9FE2j?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe></div>", videoTitle: "Juicy Wiggle")
        
        let partyRock4 = PartyRock(imageURL: "https://i.ytimg.com/vi/rBCZBPjylHA/hqdefault.jpg?sqp=-oaymwEWCKgBEF5IWvKriqkDCQgBFQAAiEIYAQ==&rs=AOn4CLDAv4fN_2ttagbK_asBuqt8hX-XnQ", videoURL: "<div style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube.com/embed/rBCZBPjylHA?list=PL0SSw9dW4gTRDD0mE2SC2uFLcs2j9FE2j?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe></div>", videoTitle: "Sock It To Ya")
        
        let partyRock5 = PartyRock(imageURL: "https://i.ytimg.com/vi/X_BnKa-nxt0/hqdefault.jpg?sqp=-oaymwEWCKgBEF5IWvKriqkDCQgBFQAAiEIYAQ==&rs=AOn4CLAfD0o8Jjg9mrDxSNsTvosCzJ_OaQ", videoURL: "<div style=\"position:relative;height:0;padding-bottom:56.25%\"><iframe src=\"https://www.youtube.com/embed/X_BnKa-nxt0?list=PL0SSw9dW4gTRDD0mE2SC2uFLcs2j9FE2j?ecver=2\" width=\"640\" height=\"360\" frameborder=\"0\" style=\"position:absolute;width:100%;height:100%;left:0\" allowfullscreen></iframe></div>", videoTitle: "Party Train")
        
        partyRocks.append(partyRock1)
        partyRocks.append(partyRock2)
        partyRocks.append(partyRock3)
        partyRocks.append(partyRock4)
        partyRocks.append(partyRock5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // In charge of recycled cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // If it doesn't find a cell it will create one for us
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            let partyRock = partyRocks[indexPath.row]
            
            // Update UI every time a cell is recycled
            cell.updateUI(partyRock: partyRock)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

