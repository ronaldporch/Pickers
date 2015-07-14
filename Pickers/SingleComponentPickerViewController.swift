//
//  SingleComponentPickerViewController.swift
//  Pickers
//
//  Created by Ronald Porch on 2015/07/14.
//  Copyright (c) 2015年 Ronald Porch. All rights reserved.
//

import UIKit

class SingleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var singlePicker: UIPickerView!
    let characterNames = ["Luke", "Leia", "Han", "Chewbacca", "Artoo", "Threepio", "Lando"]
    @IBAction func buttonPressed(sender: AnyObject) {
        let row = singlePicker.selectedRowInComponent(0)
        let selected = characterNames[row]
        let title = "You selected \(selected)"
        
        let alert = UIAlertController(
            title: title,
            message: "Thank you for choosing",
            preferredStyle: .Alert
        )
        let action = UIAlertAction(
            title: "You're Welcome",
            style: .Default,
            handler: nil
        )
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    // MARK:-
    // MARK: Picker Data Source Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return characterNames.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        println(component)
        println(row)
        return characterNames[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
