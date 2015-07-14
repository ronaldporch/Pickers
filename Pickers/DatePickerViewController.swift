//
//  DatePickerViewController.swift
//  Pickers
//
//  Created by Ronald Porch on 2015/07/14.
//  Copyright (c) 2015年 Ronald Porch. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func buttonPressed(sender: AnyObject) {
        let date = datePicker.date
        let message = "The date and time you select is \(date)"
        let alert = UIAlertController(
            title: "Date and Time Selected",
            message: message,
            preferredStyle: .Alert
        )
        let action = UIAlertAction(
            title: "That's so true!",
            style: .Default,
            handler: nil
        )
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let date = NSDate()
        datePicker.setDate(date, animated: false)
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
