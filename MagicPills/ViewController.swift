//
//  ViewController.swift
//  MagicPills
//
//  Created by Pedro Pereirinha on 06/08/16.
//  Copyright © 2016 EpicDory. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
	
	@IBOutlet weak var magicPillsImg: UIImageView!
	@IBOutlet weak var magicPillsLbl: UILabel!
	@IBOutlet weak var priceLbl: UILabel!
	@IBOutlet weak var dividerView: UIView!
	@IBOutlet weak var nameLbl: UILabel!
	@IBOutlet weak var nameTxtFld: UITextField!
	@IBOutlet weak var adressLbl: UILabel!
	@IBOutlet weak var adressTxtFld: UITextField!
	@IBOutlet weak var cityLbl: UILabel!
	@IBOutlet weak var cityTxtFld: UITextField!
	@IBOutlet weak var stateLbl: UILabel!
	@IBOutlet weak var StatePicker: UIPickerView!
	@IBOutlet weak var statePickerBtn: UIButton!
	@IBOutlet weak var zipCodeLbl: UILabel!
	@IBOutlet weak var zipCodeTextFld: UITextField!
	@IBOutlet weak var buyNowBtn: UIButton!
	@IBOutlet weak var sucessImg: UIImageView!
	
	let states = ["Portugal", "Spain", "France", "Italy", "Germany", "Holland"].sorted()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		StatePicker.dataSource = self
		StatePicker.delegate = self
		nameTxtFld.delegate = self
		adressTxtFld.delegate = self
		cityTxtFld.delegate = self
		zipCodeTextFld.delegate = self
		
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
		view.addGestureRecognizer(tap)
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func stateBtnPressed(_ sender: AnyObject) {
		toggleStatePicker()
	}
	
	@IBAction func buyNowBtnPressed(_ sender: AnyObject) {
		toggleBuyNow()
	}
	
	// PickerView Settings
	
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
	
	// UITextViewDelegate Options
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		dismissKeyboard()
		return false
	}
	
	func dismissKeyboard() {
		view.endEditing(true)
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
	
	func toggleBuyNow() {
		if !buyNowBtn.isHidden {
			magicPillsImg.isHidden = true
			magicPillsLbl.isHidden = true
			priceLbl.isHidden = true
			dividerView.isHidden = true
			nameLbl.isHidden = true
			nameTxtFld.isHidden = true
			adressLbl.isHidden = true
			adressTxtFld.isHidden = true
			cityLbl.isHidden = true
			cityTxtFld.isHidden = true
			stateLbl.isHidden = true
			statePickerBtn.isHidden = true
			zipCodeLbl.isHidden = true
			zipCodeTextFld.isHidden = true
			buyNowBtn.isHidden = true
			sucessImg.isHidden = false
		} else {
			magicPillsImg.isHidden = false
			magicPillsLbl.isHidden = false
			priceLbl.isHidden = false
			dividerView.isHidden = false
			nameLbl.isHidden = false
			nameTxtFld.isHidden = false
			adressLbl.isHidden = false
			adressTxtFld.isHidden = false
			cityLbl.isHidden = false
			cityTxtFld.isHidden = false
			stateLbl.isHidden = false
			statePickerBtn.isHidden = false
			zipCodeLbl.isHidden = false
			zipCodeTextFld.isHidden = false
			buyNowBtn.isHidden = false
			sucessImg.isHidden = true
		}
	}
	
}

