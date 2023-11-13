//
//  ViewController.swift
//  BucketSystem
//
//  Created by Oh Chi Hyun on 2023/11/13.
//

import UIKit

class ViewController: UIViewController {
    
    var bucketOrder: ((BucketOrder) -> Void)?
    var size: Int = 0
    var dow: Bool = false
    
    @IBOutlet var radioButtons: [UIButton]!
    
    @IBOutlet weak var optionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.radioButtons.forEach {
            $0.addTarget(self, action: #selector(self.radioButton(_:)), for: .touchUpInside)
        }
    }

    @objc private func radioButton(_ sender: UIButton) {
        self.radioButtons.forEach {
                if $0.tag == sender.tag {
                    $0.setImage(UIImage(systemName: "circle.fill"), for: .normal)
                    size = sender.tag
                } else {
                    $0.setImage(UIImage(systemName: "circle"), for: .normal)
                }
        }
    }

    @IBAction func optionButonDidTab(_ sender: UIButton) {
        if (sender.isSelected) {
            sender.isSelected = false
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            sender.isSelected = true
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        }
        self.dow = sender.isSelected
    }
    
    
    @IBAction func sendToBucket(_ sender: UIButton) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "BucketVC") as? BucketController else {return}
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        
        present(nextVC, animated: true, completion: nil)
        
    }
    
}

