//
//  BucketController.swift
//  BucketSystem
//
//  Created by Oh Chi Hyun on 2023/11/13.
//

import UIKit

class BucketController: UIViewController {
    var previousViewController: ViewController?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let feedNib = UINib(nibName: "BucketTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "BucketCell")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
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

extension BucketController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: BucketTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BucketCell", for:    indexPath) as? BucketTableViewCell else {
            return UITableViewCell()
        }
        if (previousViewController?.dow == true) {
            cell.dowLavel.isHidden = false
        } else {
            cell.dowLavel.isHidden = true
        }
        print("\(previousViewController?.dow as Bool?)")
        print("\(previousViewController?.size as Int?)")
        
        if (previousViewController?.size == 0) {
            cell.sizeLabel.text = "M"
        } else if (previousViewController?.size == 1) {
            cell.sizeLabel.text = "L"
        }
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
