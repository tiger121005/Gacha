//
//  ResultViewController.swift
//  Gacha
//
//  Created by TAIGA ITO on 2024/04/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    //背景画像とモンスターの画像を表示するためのImageViewを用意
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var characterImageView: UIImageView!
    
    //乱数を入れるためのInt型の変数を用意
    //強制アンラップで指定するとswitchでエラーが出る
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        number = Int.random(in: 0...9)
        
        switch number {
        case 9:
            //激レアキャラ
            characterImageView.image = UIImage(named: "IoTMesh")
            backgroundImageView.image = UIImage(named: "bgBlue")
        case 7, 8:
            //レアキャラ
            characterImageView.image = UIImage(named: "camera")
            backgroundImageView.image = UIImage(named: "bgGreen")
        case 0..<7:
            //ノーマルキャラ
            characterImageView.image = UIImage(named: "iphone")
            backgroundImageView.image = UIImage(named: "bgRed")
            
        default:
            print("error")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //キャラクター出現時のアニメーション
        self.characterImageView.center = self.view.center
        UIView.animate(withDuration: 1.0,delay: 0, options: [.curveEaseIn, .autoreverse, .repeat], animations: {
            self.characterImageView.center.y += 10
        }) {_ in
            self.characterImageView.center.y -= 10
        }
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
}
