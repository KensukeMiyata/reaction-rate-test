//
//  ResultViewController.swift
//  kadai03
//
//  Created by ip3s on 2023/11/15.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var firstResult: UILabel!
    
    @IBOutlet weak var secondResult: UILabel!
    
    @IBOutlet weak var thirdResult: UILabel!
    
    @IBOutlet weak var fourthResult: UILabel!
    
    @IBOutlet weak var fifthResult: UILabel!
    
    @IBOutlet weak var avarage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadData(i1: Double,i2: Double,i3: Double,i4: Double,i5: Double) {
        self.firstResult.text = "\(String(format: "%.3f", i1))"
        self.secondResult.text = "\(String(format: "%.3f", i2))"
        self.thirdResult.text = "\(String(format: "%.3f", i3))"
        self.fourthResult.text = "\(String(format: "%.3f", i4))"
        self.fifthResult.text = "\(String(format: "%.3f", i5))"
        self.avarage.text = "\(String(format: "%.3f", (i1 + i2 + i3 + i4 + i5) / 5))"
    }
    
    @IBAction func resetButton(_ sender: Any) {
        let firstVC = self.storyboard?.instantiateViewController(identifier: "HomeView")
        firstVC?.modalPresentationStyle = .fullScreen
        self.present(firstVC!, animated: true, completion: nil)
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
