//
//  StartViewController.swift
//  HinhChuyenDong
//
//  Created by Rea Won Kim on 1/24/16.
//  Copyright © 2016 Rea Won Kim. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var lblReaWonKim: UILabel!
    @IBOutlet weak var lblJohnTerry: UILabel!
    @IBOutlet weak var lblRonaldo: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var lblScore: UILabel!
    var hinh: Int = 2
    var timer: NSTimer!
    var player = ["Rea Won Kim", "John Terry", "Ronaldo"]
    var playerImage: [String]!
    var thamSoTruyen : NSUserDefaults!
    var i: Int! = 100
    var score : Int! = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblScore.text = String(score)
        thamSoTruyen = NSUserDefaults()
        pickerView.delegate = self
        playerImage = ["black1.png", "green1.png", "pic1.png"]
        //player = [NSMutableArray all

        // Do any additional setup after loading the view.
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return playerImage.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return playerImage[row]
    }
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let viewImageInPickerView: UIImageView = UIImageView(frame: CGRectMake(0, 0, 92, 142))
        viewImageInPickerView.image = UIImage(named: playerImage[row])
        return viewImageInPickerView
    }
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if player[row] == "Rea Won Kim" {
                //lblReaWonKim.text = "You selected this player"
           // timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("run"), userInfo: nil, repeats: true)
            //image1 = UIImageView(frame:CGRectMake(CGFloat(-8), CGFloat(250), 116, 85))
            image1.image = UIImage(named: "black2.png")
            self.view.addSubview(image1)
            lblReaWonKim.text = "Fighting!!!"
            
            image2.image = UIImage(named: "green1.png")
            self.view.addSubview(image2)
            lblJohnTerry.text = "John Terry"
            
            image3.image = UIImage(named: "pic1.png")
            self.view.addSubview(image3)
            lblRonaldo.text = "Ronaldo"
            i = 1
                }
        else if player[row] == "John Terry"{
            image2.image = UIImage(named: "green2.png")
            self.view.addSubview(image2)
            lblJohnTerry.text = "Fighting!!!"
            
            image1.image = UIImage(named: "black1.png")
            self.view.addSubview(image1)
            lblReaWonKim.text = "Rea Won Kim"
            
            image3.image = UIImage(named: "pic1.png")
            self.view.addSubview(image3)
            lblRonaldo.text = "Ronaldo"
            i = 2

        }
        else {
            image3.image = UIImage(named: "pic2.png")
            self.view.addSubview(image3)
            lblRonaldo.text = "Fighting!!!"
            
            image1.image = UIImage(named: "black1.png")
            self.view.addSubview(image1)
            lblReaWonKim.text = "Rea Won Kim"
            
            image2.image = UIImage(named: "green1.png")
            self.view.addSubview(image2)
            lblJohnTerry.text = "John Terry"
            i = 3

        }
        
    /*func run(){
        image1.image = nil
        let chuoi:String = "black" + String(hinh) + ".png"
        image1 = UIImageView(frame:CGRectMake(CGFloat(-8), CGFloat(250), 116, 85))
        image1.image = UIImage(named: chuoi)
        self.view.addSubview(image1)
        }
        hinh = hinh + 1
        if hinh == 7 {
            hinh = 1
        }*/

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        thamSoTruyen.setObject(String(i), forKey: "bien")
        thamSoTruyen.setObject(score, forKey: "score")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
