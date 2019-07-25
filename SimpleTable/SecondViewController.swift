//
//  SecondViewController.swift
//  SimpleTable
//
//  Created by 정재훈 on 24/07/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var textToSet: String?
    
    @IBOutlet weak var textLabel: UILabel! 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.textLabel.text = textToSet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
