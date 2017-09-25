//
//  QuizViewController.swift
//  Encyclopediarepair
//
//  Created by Rumana Nazmul on 3/8/17.
//  Copyright © 2017 ALFA. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var temp = 0
    var cntQ: Int = 0    // for counting questions
    
    var totalQ: Int = 4  // In list there are 4 questions
    var gameCompletionFlag: Bool = false
    
    var countryData = [Data]()
    //var temp = 0
    
    var Q: Ques!
    
    var testScore: Int = 0
    var totalCntryFav: Int!
    
    var setTask: Int = 5       // Display 5 questions in test
    var totalOption: Int = 4
    var trackLen: Int = 26
    
    var myQ: String!
    var myAns: String!
    
    var RndForOtherAns = [Int]()
    var otherAns = [String]()
    
    var track = [Int]()
    var optionButtons = [UIButton]()
    
    
    var k: Int!
    
    var buttonFlag: Bool!
    let nextbtn = UIButton(type: UIButtonType.custom) as UIButton
    
    var qRnd: Int!
    var cntryRnd: Int!
    var rightPos: Int = 100
    var cntryIndex: Int!
    var rnd: Int!
    
    var ansLabel = UILabel()
    var msgLabel = UILabel()
    var headerLabel = UILabel()
    var qLabel = UILabel()
    
    struct qTrack{
        
        var quesTrack: Int!
        var cntryTrack = [Int]()
        var flagTrack: Int = 0
    }
    
    var l = 0
    
    var qTrackArray = [qTrack]()
    
    
    var optionCapital = ["Tirana","Kabul","Pago Pago","Luanda","The Valley","Buenos Aires","Yerevan","Canberra","Vienna","Baku","Nassau","Manama","Bridgetown","Brussels","Thimphu","Bandar Seri Begawan","Sofia","Ottawa","Beijing","Moroni","Havana","Prague","Copenhagen","Cairo","Malabo","Addis Ababa"]
    var optionContinent = ["Asia","Europe","Africa","North America","South America","Australia","Antarctica","Oceania","Central America", "Caribbean"]
    var optionLanguage = ["Pashtu","Arabic","Greek","English","French","Urdu","Hindi","Bangla","German","Spanish","Swahili","Portuguese","Turkish","Japanese","Korean","Latvian","Malay","Burmese","Dutch","Baluchi","Hebrew","Polish","Mandarin","Siamese","Samoan","Persian"]
    var optionCurrency = ["Afghan afghani","Algerian dinar","European euro","East Caribbean dollar","United States dollar","Indonesian rupiah","Iranian rial","Iraqi dinar","Japanese yen","Kenyan shilling","Malaysian ringgit","Mongolian tugrik","Moroccan dirham","North Korean won","Pakistani rupee","Polish zloty","Saudi Arabian riyal","Singapore dollar","Swiss franc","Thai baht","Turkish lira","Pound sterling","CFP franc","UAE dirham","Samoan tala","Saint Helena pound"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
       //Hiding status bar
        
       
        
        Q = getQ.getQues()
        totalCntryFav = myFav.count
        
        print(myFav.count)
        
        if (myFav.count * totalQ) < setTask{
            
           setTask = totalQ
            
        }
        
        newQues()
        
        
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    func createHeaderLbl()->UILabel{
        print("Head ")
        //Creating header Label
        let headerLabel = UILabel()
        headerLabel.frame = CGRect(x: 100, y: 100, width: 200, height: 30)   //setting frame
        headerLabel.backgroundColor = UIColor.lightGray//setting backgroundColor
        headerLabel.textColor = UIColor.white     //setting text color
        headerLabel.textAlignment = NSTextAlignment.center//setting alignment of text to left in label
        headerLabel.text = "Your question no." + String(cntQ)           //writing text on the label
        
        return headerLabel
        
        
    }
    
    func createQuesLbl()->UILabel{
        
        //   Creating Question Label
        let qLabel = UILabel()               //declaring variable of label type
        qLabel.frame = CGRect(x: 60, y: 150, width: 300, height: 30)   //setting frame
        qLabel.backgroundColor = UIColor(red: 0.5, green: 0.8, blue: 0.8, alpha: 1)//setting backgroundColor
        qLabel.textColor = UIColor.black      //setting text color
        qLabel.textAlignment = NSTextAlignment.center//setting alignment of text to left in label
        qLabel.text = myQ
        
        return qLabel
        
    }
    
    func createMsgLbl()-> UILabel{
        
        let msgLabel = UILabel()               //declaring variable of label type
        msgLabel.frame = CGRect(x: 55, y: 500, width: 250, height: 30)   //setting frame
        msgLabel.backgroundColor = UIColor(red: 0.5, green: 0.8, blue: 0.8, alpha: 1)//setting backgroundColor
        msgLabel.textColor = UIColor.black      //setting text color
        msgLabel.textAlignment = NSTextAlignment.center//setting alignment of text to left in label
        msgLabel.text = "Test Finished. Your Score:" + String(testScore)              //writing text on the label
        
        return msgLabel
    }
    
    
    func createRnd(){
        
        print("In Rnd")
        qRnd = Int(arc4random_uniform(UInt32(totalQ)))
        cntryRnd = Int(arc4random_uniform(UInt32(totalCntryFav)))
        
        print("qTrackArray[qRnd].flagTrack \(qTrackArray[qRnd].flagTrack)")
        print("qRnd \(qRnd)")
        
        if qTrackArray[qRnd].flagTrack == 0{   // To avoid duplical ques with same cntry while selecting cntry randomly
            
           qTrackArray[qRnd].flagTrack = 1
           qTrackArray[qRnd].cntryTrack.append(cntryRnd)
            
        }
        
        else{
          
            var i = 0
            while(qTrackArray[qRnd].cntryTrack[i] == cntryRnd){
              cntryRnd = Int(arc4random_uniform(UInt32(totalCntryFav)))
            }
            
             qTrackArray[qRnd].cntryTrack.append(cntryRnd)
            
        }
        
        rightPos = Int(arc4random_uniform(UInt32(totalOption)))
        
        print("qRnd \(qRnd), cntryRnd \(cntryRnd), rightPos \(rightPos)")
        
    }
    
    func createQ(){
        temp = temp + 1
        
        print("In Q")
        print("temp \(temp)")
        print(qRnd)
        let myQ1 = Q.QuestionList[qRnd]              //writing text on the label
        cntryIndex = myFav[cntryRnd]
        let myQ2 = InfoDataArray[cntryIndex].country
        myQ = myQ1 + "" + myQ2
        print(myQ)
    }
    
    func genUniqRnd(len: Int)-> Int{
    
       var rndm = Int(arc4random_uniform(UInt32(len)))
    
          while track[rndm] != 0 {
            
            print("CLASH")
            rndm = Int(arc4random_uniform(UInt32(len)))
    
         }
    
          return rndm
    
  }

    
    func setAnswers(){
        
        print("In Ans")
     // track[cntryRnd] = 1   // Real ans
        
        RndForOtherAns.removeAll()
        otherAns.removeAll()
        
       //To collect options from InfoDataArray
        
//        var ct = 0
//        
//        while ct < 3{
//            
//            rnd = genUniqRnd()
//                print("Test \(rnd)")
//                RndForOtherAns.append(rnd)
//                ct = ct + 1
//                track[rnd] = 1
//            
//              print("ct \(ct)")
//             // print(track)
//              print("RndForOtherAns \(RndForOtherAns)")
//            
//        }
        
    //    print("At last \(RndForOtherAns)")
        
        
        switch qRnd {
            
        case 0:
            myAns = InfoDataArray[cntryIndex].capital
            
            for i in 0...2{
                
//                while InfoDataArray[RndForOtherAns[i]].capital == ""{
//                    
//                    rnd = genUniqRnd()
//                    RndForOtherAns.append(rnd)
//                    track[rnd] = 1
//                }
          //      otherAns.append(InfoDataArray[RndForOtherAns[i]].capital)

                
                rnd = genUniqRnd(len: optionCapital.count)
                while optionCapital[rnd] == myAns{
                  
                     rnd = genUniqRnd(len: optionCapital.count)
                    
                }
                
                RndForOtherAns.append(rnd)
                track[rnd] = 1
                otherAns.append(optionCapital[RndForOtherAns[i]])
                
                print("\(i) \(track)")
                print(RndForOtherAns)
                print(otherAns)


            }
            
            print(" \(track)")
            print(RndForOtherAns)
            print(otherAns)
            
        case 1:
            myAns = regionInfoArray[cntryIndex].regName
            
            for i in 0...2{
                
                
                 //To collect options from InfoDataArray bcz some are blanks
                
//                while InfoDataArray[RndForOtherAns[i]].continent == ""{
//                    
//                    rnd = genUniqRnd(len: optionCapital.count)
//                    RndForOtherAns.append(rnd)
//                    track[rnd] = 1
//                }
      //          otherAns.append(InfoDataArray[RndForOtherAns[i]].continent)
                
                rnd = genUniqRnd(len: optionContinent.count)
                
                while optionContinent[rnd] == myAns{
                    
                    rnd = genUniqRnd(len: optionContinent.count)
                    
                }
                
                RndForOtherAns.append(rnd)
                track[rnd] = 1
                otherAns.append(optionContinent[RndForOtherAns[i]])
                
                print("\(i) \(track)")
                print(RndForOtherAns)
                print(otherAns)
                
                
            }
            
            print(" \(track)")
            print(RndForOtherAns)
            print(otherAns)
            
           
            
        case 2:
            myAns = langNCurrArray[cntryIndex].languages[0]
           
            for i in 0...2{
                
//                while langNCurrArray[RndForOtherAns[i]].languages[0] == ""{
//                    
//                    rnd = genUniqRnd()
//                    RndForOtherAns.append(rnd)
//                    track[rnd] = 1
//                }
//                otherAns.append(langNCurrArray[RndForOtherAns[i]].languages[0])
                
                rnd = genUniqRnd(len: optionLanguage.count)
                
                while optionLanguage[rnd] == myAns{
                    
                   rnd = genUniqRnd(len: optionLanguage.count)
                    
                }
                
                RndForOtherAns.append(rnd)
                track[rnd] = 1
                otherAns.append(optionLanguage[RndForOtherAns[i]])
                
                print("\(i) \(track)")
                print(RndForOtherAns)
                print(otherAns)

            }
            
            print(" \(track)")
            print(RndForOtherAns)
            print(otherAns)

            
        case 3:
            myAns = langNCurrArray[cntryIndex].currencies[0]
            for i in 0...2{
                 print("\(i) \(track)")
                
//                while langNCurrArray[RndForOtherAns[i]].currencies[0] == ""{
//                    
//                    rnd = genUniqRnd()
//                    RndForOtherAns.append(rnd)
//                    track[rnd] = 1
//                }
//                otherAns.append(langNCurrArray[RndForOtherAns[i]].currencies[0])
                
                rnd = genUniqRnd(len: optionCurrency.count)
                while optionCurrency[rnd] == myAns{
                    
                    rnd = genUniqRnd(len: optionCurrency.count)
                    
                }
                
                RndForOtherAns.append(rnd)
                track[rnd] = 1
                otherAns.append(optionCurrency[RndForOtherAns[i]])
                
                print("\(i) \(track)")
                print(RndForOtherAns)
                print(otherAns)

            }
            print(" \(track)")
            print(RndForOtherAns)
            print(otherAns)
            
        default:
            break
            
        }
        
        
        print("myAns \(myAns)")
        print("otherAns \(otherAns)")
        
        
        
    }
    
    
    func createButton(i: Int, xVal: Int, yVal: Int, rightPos: Int, k: Int){
        
        let btn = UIButton(type: UIButtonType.custom) as UIButton
        btn.backgroundColor = UIColor(red: 0.75, green: 0.7, blue: 0.8, alpha: 1)
        btn.frame = CGRect(x: xVal, y: yVal, width: 200, height: 30)
        btn.setTitleColor(UIColor(red: 0.9, green: 0.4, blue: 0.7, alpha: 1), for: UIControlState.normal)
        btn.tag = i
        
        
        
        if btn.tag == rightPos{
            
            btn.setTitle(myAns, for: UIControlState.normal)
            buttonFlag = true
        }
        else{
            
            //   if k != pos{
            //     btn.setTitle(ans[qRnd][k], for: UIControlState.normal)
            //       k = k+1
            //
            //           }
            //    else{
            //
            //        k = k+1
            //        btn.setTitle(ans[qRnd][k], for: UIControlState.normal)
            //        k = k+1
            //           }
            
            btn.setTitle(otherAns[k], for: .normal)
            print("Option \(k) is \(otherAns[k])")
            
        }
        
        btn.addTarget(self,action:#selector(buttonClicked),for:.touchUpInside)
        optionButtons.append(btn)
        self.view.addSubview(btn)
        
        
    }
    
    func buttonClicked(sender:UIButton)
    {
        for btn in optionButtons{
           
            btn.isEnabled = false

        }
               //let ansLabel = UILabel()
        var nextbutton = UIButton()
        ansLabel.isHidden = false
        //declaring variable of label type
        ansLabel.frame = CGRect(x: 100, y: 400, width: 200, height: 30)   //setting frame
        ansLabel.backgroundColor = UIColor(red: 0.5, green: 0.8, blue: 0.8, alpha: 1)//setting backgroundColor
        ansLabel.textColor = UIColor.black      //setting text color
        ansLabel.textAlignment = NSTextAlignment.center//setting alignment of text to left in label
        
        
        if sender.tag == rightPos{
            ansLabel.text = "Your Answer is Right."   //writing text on the label
            self.view.addSubview(ansLabel)
            testScore = testScore + 1
        }else{
            ansLabel.text = "Your Answer is Wrong."   //writing text on the label
            self.view.addSubview(ansLabel)
        }
        
        if cntQ >= setTask{
            
            
            msgLabel = createMsgLbl()
            self.view.addSubview(msgLabel)
            
            
        }else{
            nextbtn.isHidden = false
            nextbutton = createNextButton()
            self.view.addSubview(nextbtn)
        }
        
        
    }
    
    
    
    func createNextButton()-> UIButton{
        
        nextbtn.backgroundColor = UIColor(red: 0.75, green: 0.7, blue: 0.8, alpha: 1)
        nextbtn.frame = CGRect(x: 100, y: 500, width: 200, height: 30)
        nextbtn.setTitleColor(UIColor(red: 0.9, green: 0.4, blue: 0.7, alpha: 1), for: UIControlState.normal)
        nextbtn.tag = 100
        nextbtn.setTitle("Next Question", for: UIControlState.normal)
        nextbtn.addTarget(self,action:#selector(newQues),for:.touchUpInside)
        
        return nextbtn
        
    }
    
    
    
    
    func newQues(){
        
        print("CALLED")
        
        if cntQ == 0{
            
           var j = 1    // To avoid duplicate ques with same country
             for i in 0...totalQ - 1{
                  qTrackArray.append(qTrack(quesTrack: j, cntryTrack: [], flagTrack: 0))
                  j = j + 1
            
             }
        }
        
        print(qTrackArray)
        
        track.removeAll()
        var k = 0         //To avoid duplicate options
      
            while k < trackLen{
                
                track.append(0)
                k = k + 1
                
            }
        
        print("track \(track)")
        
        buttonFlag = false
        
        cntQ = cntQ + 1
        print("CntQ \(cntQ)")
        
        qLabel.text = ""
        ansLabel.isHidden = true
        nextbtn.isHidden = true
        
        //        if cnt > setTask{
        //
        //            msgLabel = createMsgLbl()
        //            self.view.addSubview(msgLabel)
        //
        //
        //        }else{
        
        
        headerLabel = createHeaderLbl()
        self.view.addSubview(headerLabel)
        
        createRnd()
        
     //   track[cntryRnd] = 1
        print("In newQues \(track)")
        
        createQ()
        print(myQ)
        
        qLabel = createQuesLbl()
        self.view.addSubview(qLabel)
        
        
        
        
        
        
        print("RndForOthers \(RndForOtherAns)")
        print("otherAns \(otherAns)")
        print("qRnd \(qRnd)")
        print("cntryRnd \(cntryRnd)")
        print("rightPos \(rightPos)")
        
        
        
        setAnswers()
        
        //Creating Option Buttons
        
        var xVal:Int = 100
        var yVal:Int = 200
        k = 0
        var pos = qRnd % 4
        
        
        for i in 0...3{
            
            buttonFlag = false
            createButton(i: i, xVal: xVal, yVal: yVal, rightPos: rightPos, k: k)
            if buttonFlag == false{
                k = k + 1
                
            }
            xVal = 100
            yVal = yVal + 50
            
        } //for
        
        
        
        //}
        
        
        
        
    }
    


    @IBAction func backButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "backToHome", sender: nil)
    }
    
  
    
    
    
      }

