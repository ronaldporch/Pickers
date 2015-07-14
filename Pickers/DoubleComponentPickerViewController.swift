//
//  DoubleComponentPickerViewController.swift
//  Pickers
//
//  Created by Ronald Porch on 2015/07/14.
//  Copyright (c) 2015年 Ronald Porch. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var doublePicker: UIPickerView!
    private let fillingComponent = 0
    private let breadComponent = 1
    
    private let fillingTypes = [
        "Ham", "Turkey", "Peanut Butter", "Tuna Salad", "Roast Beef", "Vegemite"
    ]
    
    private let breadTypes = [
        "White", "Whote Wheat", "Rye", "Sourdough", "Seven Grain"
    ]
    
    @IBAction func buttonPressed(sender: AnyObject) {
        let fillingRow = doublePicker.selectedRowInComponent(fillingComponent)
        let breadRow = doublePicker.selectedRowInComponent(breadComponent)
        
        let filling = fillingTypes[fillingRow]
        let bread = breadTypes[breadRow]
        let message = "Your \(filling) on \(bread) will be right up."
        
        let alert = UIAlertController(
            title: "Thank you for your order",
            message: message,
            preferredStyle: .Alert
        )
        let action = UIAlertAction(
            title: "Great", style: .Default, handler: nil
        )
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK:-
    //MARK: Picker Data Source Methods

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (component == breadComponent) ? breadTypes.count : fillingTypes.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return (component == breadComponent) ?
        breadTypes[row] : fillingTypes[row]
    }
    override func viewWillAppear(animated: Bool) {
        println("Hello")
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
