//
//  ProfileViewController.swift
//  ExchangeAGram
//
//  Created by Andy Stannard on 03/02/2015.
//  Copyright (c) 2015 inni Accounts. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, FBLoginViewDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fbLoginView: FBLoginView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("Profile View Loaded")
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile","publish_actions"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MapViewButtonTapped(sender: UIButton) {
        
        performSegueWithIdentifier("mapSeque", sender: nil)
        
    }

    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
        self.profileImageView.hidden = false
        self.nameLabel.hidden = false
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        println(user)
        
        nameLabel.text = user.name
        let userImageURL = "https://graph.facebook.com/\(user.objectID)/picture?type=small"
        let url = NSURL(string: userImageURL)
        let imageData = NSData(contentsOfURL: url!)
        let image = UIImage(data: imageData!)
        self.profileImageView.image = image
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        println("User logged out")
        self.profileImageView.hidden = true
        self.nameLabel.hidden = true
        self.fbLoginView.hidden = false
        self.fbLoginView.sizeToFit()
    }
    
    func loginView(loginView: FBLoginView!, handleError error: NSError!) {
            println("Error: \(error.localizedDescription)")
    }
}
