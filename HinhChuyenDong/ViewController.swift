//
//  ViewController.swift
//  HinhChuyenDong
//
//  Created by Rea Won Kim on 1/22/16.
//  Copyright © 2016 Rea Won Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   // @IBOutlet weak var imgConCho: UIImageView!
    var timer:NSTimer!
    var hinh:Int!
    var imgConCho: UIImageView!
    var imgBlack: UIImageView!
    var imgGreen: UIImageView!
    var toaDoHinh1: Int!
    var toaDoHinh2: Int!
    var toaDoHinh3: Int!
    var thamSoTruyen : NSUserDefaults!
    var score : Int!
    @IBOutlet weak var lblThamSoTruyen: UILabel!
    @IBOutlet weak var lblplayerName1: UILabel!
    @IBOutlet weak var lblplayerName2: UILabel!
    @IBOutlet weak var lblplayerName3: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBAction func Run(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("BuocDi"), userInfo: nil, repeats: true)
    }
    @IBAction func rePlay(sender: AnyObject) {
        imgConCho.image = nil
        imgBlack.image = nil
        imgGreen.image = nil
        toaDoHinh1 = 50
        toaDoHinh2 = 50
        toaDoHinh3 = 50
        /*
         imgConCho = UIImageView(frame:CGRectMake(CGFloat(50), CGFloat(50), 116, 85))
         imgConCho.image = UIImage(named: "black1.png")
         imgBlack = UIImageView(frame: CGRectMake(CGFloat(50), CGFloat(150), 116, 85))
         imgBlack.image = UIImage(named: "green1.png")
         imgGreen = UIImageView(frame: CGRectMake(CGFloat(50), CGFloat(250), 116, 85))
         */
        imgConCho = UIImageView(frame:CGRectMake(CGFloat(50), CGFloat(50), 116, 85))
        imgConCho.image = UIImage(named: "black1.png")
        imgBlack = UIImageView(frame: CGRectMake(CGFloat(50), CGFloat(150), 116, 85))
        imgBlack.image = UIImage(named: "green1.png")
        imgGreen = UIImageView(frame: CGRectMake(CGFloat(50), CGFloat(250), 116, 85))
        imgGreen.image = UIImage(named: "pic1.png")
        self.view.addSubview(imgConCho)
        self.view.addSubview(imgBlack)
        self.view.addSubview(imgGreen)
        imgView.image = UIImage(named: "anhcuoi.jpg")
    }
    func BuocDi(){
        imgConCho.image = nil
        imgBlack.image = nil
        imgGreen.image = nil
        let randomPic1: Int = Int(arc4random())%20
        toaDoHinh1 = toaDoHinh1 + randomPic1
        let chuoi:String = "black" + String(hinh) + ".png"
        imgConCho = UIImageView(frame:CGRectMake(CGFloat(toaDoHinh1), CGFloat(50), 116, 85))
        imgConCho.image = UIImage(named: chuoi)
        self.view.addSubview(imgConCho)
        
        imgBlack.image = nil
        let randomPic2: Int = Int(arc4random())%20
        toaDoHinh2 = toaDoHinh2 + randomPic2
        let chuoi2:String = "green" + String(hinh) + ".png"
        imgBlack = UIImageView(frame:CGRectMake(CGFloat(toaDoHinh2), CGFloat(150), 116, 85))
        imgBlack.image = UIImage(named: chuoi2)
        self.view.addSubview(imgBlack)

        imgGreen.image = nil
        let randomPic3: Int = Int(arc4random())%20
        toaDoHinh3 = toaDoHinh3 + randomPic3
        let chuoi3:String = "pic" + String(hinh) + ".png"
        imgGreen = UIImageView(frame:CGRectMake(CGFloat(toaDoHinh3), CGFloat(250), 116, 85))
        imgGreen.image = UIImage(named: chuoi3)
        self.view.addSubview(imgGreen)
        
        hinh = hinh + 1
        if hinh ==  7 {
            hinh = 2
        }
        if toaDoHinh1 >= 300 || toaDoHinh2 >= 300 || toaDoHinh3 >= 300{
            if (toaDoHinh1 >= 300 && toaDoHinh2 < 300 && toaDoHinh3 < 300 && lblThamSoTruyen.text == "1") {
                score = score + 5
                
                lblThamSoTruyen.text = "You are WIN " + " Your score is " + String(score)
                imgView.image = UIImage(named: "anhcuoi.jpg")
                [timer .invalidate()]

            }
            else if toaDoHinh2 >= 300 && toaDoHinh1 < 300 && toaDoHinh3 < 300 && lblThamSoTruyen.text == "2" {
                score = score + 5
                lblThamSoTruyen.text = "You are WIN" + " Your score is " + String(score)
                imgView.image = UIImage(named: "anhcuoi.jpg")
                [timer .invalidate()]

            }
            else if toaDoHinh3 >= 300 && toaDoHinh1 < 300 && toaDoHinh2 < 300 && lblThamSoTruyen.text == "3" {
                score = score + 5
                lblThamSoTruyen.text = "You are WIN" + " Your score is " + String(score)
                imgView.image = UIImage(named: "anhcuoi.jpg")
                [timer .invalidate()]

            }
            else {
                score = score - 5
                lblThamSoTruyen.hidden = false
                lblThamSoTruyen.text = "You are LOSE" + " Your score is " + String(score)
                imgView.image = UIImage(named: "macbuon.jpg")
                [timer .invalidate()]

            }
            
        }
        //lblThamSoTruyen.text = String(toaDoHinh1)
        
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        thamSoTruyen = NSUserDefaults()
        hinh = 2
        toaDoHinh1 = 50
        toaDoHinh2 = 50
        toaDoHinh3 = 50
        imgConCho = UIImageView(frame:CGRectMake(CGFloat(50), CGFloat(50), 116, 85))
        imgConCho.image = UIImage(named: "black1.png")
        imgBlack = UIImageView(frame: CGRectMake(CGFloat(50), CGFloat(150), 116, 85))
        imgBlack.image = UIImage(named: "green1.png")
        imgGreen = UIImageView(frame: CGRectMake(CGFloat(50), CGFloat(250), 116, 85))
        imgGreen.image = UIImage(named: "pic1.png")
        self.view.addSubview(imgConCho)
        self.view.addSubview(imgBlack)
        self.view.addSubview(imgGreen)
        lblThamSoTruyen.text = thamSoTruyen.objectForKey("bien") as! String
        score = thamSoTruyen.integerForKey("score")
        if lblThamSoTruyen.text == "1"{
            lblplayerName2.hidden = true
            lblplayerName3.hidden = true
        }
        else if lblThamSoTruyen.text == "2"{
            lblplayerName1.hidden = true
            lblplayerName3.hidden = true
        }
        else{
            lblplayerName2.hidden = true
            lblplayerName1.hidden = true
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

