//
//  ViewController.swift
//  MagicPills
//
//  Created by Pedro Pereirinha on 06/08/16.
//  Copyright © 2016 EpicDory. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	
	@IBOutlet weak var StatePicker: UIPickerView!
	
	@IBOutlet weak var statePickerBtn: UIButton!
	
	@IBOutlet weak var zipCodeLbl: UILabel!
	
	@IBOutlet weak var zipCodeTextFld: UITextField!
	
	@IBOutlet weak var buyNowBtn: UIButton!
	
	let states = ["Portugal", "Spain", "France", "Italy", "Germany", "Holland"].sorted()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		StatePicker.dataSource = self
		StatePicker.delegate = self
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func stateBtnPressed(_ sender: AnyObject) {
		toggleStatePicker()
	}
	
	@IBAction func buyNowBtnPressed(_ sender: AnyObject) {
	}
	
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		// Defines the number of columns in the PickerView
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		// Defines the number of rows in the PickerView
		return states.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return states[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		statePickerBtn.setTitle(states[row], for: UIControlState.normal)
		toggleStatePicker()
	}
	
	// View's visibility controls
	
	func toggleStatePicker() {
		if StatePicker.isHidden {
			StatePicker.isHidden = false
			zipCodeLbl.isHidden = true
			zipCodeTextFld.isHidden = true
			buyNowBtn.isHidden = true
		} else {
			StatePicker.isHidden = true
			zipCodeLbl.isHidden = false
			zipCodeTextFld.isHidden = false
			buyNowBtn.isHidden = false
		}
	}
	
}

