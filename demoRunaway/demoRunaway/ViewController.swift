    //
    //  ViewController.swift
    //  demoRunaway
    //
    //  Created by Kien on 5/10/16.
    //  Copyright © 2016 Kienpham. All rights reserved.
    
    // App đang được phát triển để up Appstore mong thầy giữ mật sourch code
    
    import UIKit
    import AVFoundation
    
    class ViewController: UIViewController {
        
        
        var mp3:[String] = ["n4","n3","n2","n1","n16","n15","n14","n13","n12","n11","n10","n9","n8","n7","n6","n5"]
        
        var sovong:[String] = ["4","3","2","1","16","15","14","13","12","11","10","9","8","7","6","5"]
        
        var ketquathuduoc:[String] = ["một ly","bên trái uống","nửa ly","uống tuỳ ý","một ly","bên phải uống","qua lượt","tat cả cùng uống","một ly","bên trái uống","uống tuỳ ý","nua ly","bên phải uống","một ly","mời 1 bạn cùng uống","nửa ly"]

        
        var timer:NSTimer!

        var flag : CGFloat!
        var flagCount = 20
        
        var kiemtra,am:Bool!
 
        var pos = 0
        
        @IBOutlet weak var lblketqua1: UILabel!
        
        @IBOutlet weak var lblketqua2: UILabel!
        
        
        @IBOutlet weak var lbl2vongquay: UILabel!
        @IBOutlet weak var lblvongquay: UILabel!
        
        @IBOutlet weak var myIM: UIImageView!
        // ham ramdom
        
        func random1(min: Int, max: Int) -> Int {
            return Int(arc4random_uniform(UInt32(max - min + 1))) + min
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //lable se mat di
            lblketqua1.hidden=true
            lblketqua2.hidden=true
            lblvongquay.hidden=true
            lbl2vongquay.hidden=true
            
            
        }
        //lbl hien thi
        
        func hienthi(){
            lblketqua1.hidden=false
            lblketqua2.hidden=false
            lblvongquay.hidden=false
            lbl2vongquay.hidden=false

        }
        // ramdom
        func  ramdom(){
            
            
            var  quay:[CGFloat] = [22.5,45,67.5,90,112.5,135,157.5,180,202.5,225,247.5,270,295.5,315,337.5,360]
            //************
            
            
            if pos > 15 {
                pos = 0
            }

            var posss = random1(0, max: 15)
            while posss > 7{
                posss = random1(0, max: 15)
                

            }
            
           //*********//
        
        //khoang thoi gian delay

            _  = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT)
            dispatch_after(30, dispatch_get_main_queue(), {
                self.lblketqua1.hidden=true
                self.lblketqua2.hidden=true
                self.lblvongquay.hidden=true
                self.lbl2vongquay.hidden=true
                
            })

        
            lblketqua1.text=ketquathuduoc[pos]
            
            lblvongquay.text = sovong[pos]
            
            playnhac(self.mp3[pos], type: "wav")

            
            let angle = quay[pos]*CGFloat(M_PI/180)
            pos = pos + posss
            UIView.animateWithDuration(5) {
                self.myIM.transform = CGAffineTransformMakeRotation(-angle)
                

  
               

                
            }
                
        
            
            
        }
        func ketqua()
        {
            
            
            player.play()
            

        }
        
       
            @IBAction func Touch(sender: AnyObject) {
                ramdom()
                timer=NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: #selector(ViewController.ketqua), userInfo: nil, repeats: false)

                               timer=NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: #selector(ViewController.hienthi), userInfo: nil, repeats: false)
               
                }
                
        
    }
    
    
    var player:AVAudioPlayer!
    func playnhac(ten:String,type:String){
        
        let duongdan = NSBundle.mainBundle().pathForResource(ten, ofType: type)
        let url  = NSURL(fileURLWithPath: duongdan!)
        do {
            player = try AVAudioPlayer(contentsOfURL: url)
        }
        catch{
            
            print("loi roi")
        }
        
    }
    // App đang được phát triển để up Appstore mong thầy giữ mật sourch code

    
