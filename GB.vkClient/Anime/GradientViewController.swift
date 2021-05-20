//
//  GradientViewController.swift
//  GB.vkClient
//
//  Created by Николай Коробейников on 18.05.2021.
//

import UIKit

class GradientViewController: UIViewController {
    
    
    @IBOutlet var viewAnime: UIView!
    @IBOutlet var gradientViewAnime: GradientView!
    @IBOutlet var setTimeAnimeSlider: UISlider!
    
    @IBAction func showViewAnime(_ sender: Any) {
        if self.gradientViewAnime.alpha == 0.0 {
            //show view with anuime
            UIView.animate(withDuration: Double(setTimeAnimeSlider.value), delay: 0.2, options: .curveEaseOut, animations: {
                self.gradientViewAnime.alpha = 1.0
            })
        } else {
            
            //hide anime with anime
            UIView.animate(withDuration: Double(setTimeAnimeSlider.value), delay: 0.2, options: .curveEaseOut, animations: {
                self.gradientViewAnime.alpha = 0.0
            })        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gradientViewAnime.alpha = 0.0
        //self.gradientViewAnime.backgroundColor = .orange
        //self.gradientViewAnime.layer.cornerRadius = 14.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
