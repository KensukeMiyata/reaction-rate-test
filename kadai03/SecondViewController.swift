//
//  SecondViewController.swift
//  kadai03
//
//  Created by ip3s on 2023/09/06.
//

import UIKit

class SecondViewController: UIViewController {

    
    // 時間を記録
    private var time:Double = 0.0
    private var timer:Timer = Timer()

    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var color: UIButton!
    
    var timerFlag = false
    
    var count = 0
    
    var Times:Array<Double> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.color.backgroundColor = .red

        ramdomStart()

    }
    
    
    
    func ramdomStart(){
        // 数秒経ったらボタンの色が変わると同時に測定スタート&タイマーリセット
        let randomFloat = Float.random(in: 0...4)
        UIView.animate(withDuration: 0, delay: 2.0 + Double(randomFloat), animations: {
            self.color.backgroundColor = .green
        }, completion: { [self] flag in
            //緑に変わった後の処理
            self.timerFlag = true
            timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { [self] timer in
                self.time += 0.001
                let minutes = Int(self.time / 60)
                let second = Int(self.time) % 60
                let milliSecond = Int(self.time * 1000) % 1000
                self.timeLabel.text = String(format: "%01d:%02d.%03d", minutes, second, milliSecond)
            })
            
        })
    }

    
    //ボタンを押して測定ストップ
    @IBAction func pushButton(_ sender: UIButton) {
        
        if timerFlag {
            self.timer.invalidate()
            self.color.backgroundColor = .blue
            Times.append(time)
            count += 1
            timerFlag = false

        }
        if count < 5 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.timeLabel.text = "0:00.000"
                self.time = 0
            }
            ramdomStart()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                let nextVC = self.storyboard?.instantiateViewController(identifier: "ResultView") as? ResultViewController
                nextVC?.modalPresentationStyle = .fullScreen
                self.present(nextVC!, animated: true, completion: {
                    nextVC?.loadData(i1: self.Times[0], i2: self.Times[1], i3: self.Times[2], i4: self.Times[3], i5: self.Times[4])
                })
            }
            
        }
        
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
