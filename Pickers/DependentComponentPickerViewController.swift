//
//  DependentComponentPickerViewController.swift
//  Pickers
//
//  Created by Ronald Porch on 2015/07/14.
//  Copyright (c) 2015年 Ronald Porch. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    private let stateComponent = 0
    private let zipComponent = 1
    private var stateZips:[String:[String]]!
    private var states:[String]!
    private var zips:[String]!

    @IBOutlet weak var dependentPicker: UIPickerView!
    
    @IBAction func buttonPressed(sender: UIButton) {
        let stateRow = dependentPicker.selectedRowInComponent(stateComponent)
        let zipRow = dependentPicker.selectedRowInComponent(zipComponent)
        
        let state = states[stateRow]
        let zip = zips[zipRow]
        
        let title = "You selected zip code \(zip)"
        let message = "\(zip) is in \(state)"
        
        let alert = UIAlertController(
            title:  title,
            message: message,
            preferredStyle: .Alert
        )
        
        let action = UIAlertAction(
            title: "OK",
            style: .Default,
            handler: nil
        )
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bundle = NSBundle.mainBundle()
        let plistURL = bundle.URLForResource("statedictionary", withExtension: "plist")
        stateZips = NSDictionary(contentsOfURL: plistURL!) as! [String:[String]]
        let allStates = stateZips.keys
        states = sorted(allStates)
        
        let selectedState = states[0]
        zips = stateZips[selectedState]
        // Do any additional setup after loading the view.
    }
    
    //MARK:-
    //MARK: Picker Data Source Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (component == stateComponent) ? states.count : zips.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return (component == stateComponent) ? states[row] : zips[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == stateComponent {
            let selectedState = states[row]
            zips = stateZips[selectedState]
            dependentPicker.reloadComponent(zipComponent)
            dependentPicker.selectRow(0, inComponent: zipComponent, animated: true)
        }
    }
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let pickerWidth = pickerView.bounds.size.width
        return (component == zipComponent) ? pickerWidth/3 : 2 * pickerWidth/3
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
