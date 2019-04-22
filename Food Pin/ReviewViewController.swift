//
//  ReviewViewController.swift
//  Food Pin
//
//  Created by George on 3/10/19.
//  Copyright © 2019 GeorgeMagdy. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        let scaleTransform = CGAffineTransform.init(scaleX: 0, y: 0)
        let translateTransform = CGAffineTransform.init(translationX: 0, y: -1000)
        let combineTransform = scaleTransform.concatenating(translateTransform)
        containerView.transform = combineTransform
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3, animations: {
            self.containerView.transform = CGAffineTransform.identity
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
