//
//  ViewController.swift
//  calc_300921136
//
//  Created by Sajid gangat on 2017-01-28.
//  student ID : 300921136
//  Copyright © 2017 Sajid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelscreen: UILabel!
    //variables used in the development of the calc
    var numberscreen  : Double = 0;
    var performingOpertaions = false;
    var previousNumber : Double = 0;
    var operatortask = 0;
    var counter = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //labelscreen.text="";
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // this function is used to display the number on the screen and display it accordingly
    @IBAction func numbers(_ sender: UIButton) {
        if counter == 0
        {
            if performingOpertaions == true
            {
                //labelscreen.text="";
                labelscreen.text = String(sender.tag - 1)
                numberscreen=Double(labelscreen.text!)!
                performingOpertaions=false
            }
            else
            {
                //   labelscreen.text="";
                labelscreen.text=labelscreen.text! + String(sender.tag - 1)
                numberscreen=Double(labelscreen.text!)!
                
                
            }
        }
        else
        {
            labelscreen.text="0";
            counter = 0;
        }
        
       
        
        
    }
    //this is used to calculate the numbers according to the respected operations that have been performed
    @IBAction func operators (_ sender: UIButton)
    {
        if labelscreen.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(labelscreen.text!)!;
            
            if sender.tag == 12  // Division
            {
                
                 labelscreen.text = "/";
            }
            else if sender.tag == 13 // Multiplication
            {
                 labelscreen.text = "*";
            }
            else if sender.tag == 14 //Addition
            {
                labelscreen.text = "+";
            }
            else if sender.tag == 15//Subtraction
            {
                 labelscreen.text = "-";
                
            }
            else if sender.tag == 17 //square root
            {
            labelscreen.text = String(sqrt(Double(previousNumber)))
            }
            else if sender.tag == 18 // percentage
            {
                labelscreen.text = String(previousNumber / 100)
            }
            else if sender.tag == 19//used to display the binnary of ay number
            {
                
                let h4 = labelscreen.text
                let b4 = String(Int(h4!, radix: 16)!, radix: 2)
                labelscreen.text=b4
            }
            else if sender.tag == 20 //  used to display the square of the given number
            {
                labelscreen.text = String(previousNumber * previousNumber)
            }


            performingOpertaions=true;
            operatortask=sender.tag;
            
        }
        else if sender.tag == 16 // = operation
        {
            if operatortask == 12
            {
                if numberscreen == 0 // validating the divition. the operator cannot divide anything with 0
                {
                    labelscreen.text="Can not / by 0"
                    counter = 1;
                }
                else
                {
                    labelscreen.text = String(previousNumber / numberscreen)

                }
                           }
            else if operatortask == 13 //multiply
            {
                labelscreen.text = String(previousNumber * numberscreen)
            }
            else if operatortask == 14 // addition
            {
                labelscreen.text = String(previousNumber + numberscreen)
            }
            else if operatortask == 15 // subtartction
            {
                labelscreen.text = String(previousNumber - numberscreen)
            }
            
        }
        else if sender.tag == 11 //clear  the screen
        {
            labelscreen.text = "0";
            previousNumber = 0;
            numberscreen = 0;
            operatortask = 0;
        }
    }

    
}

