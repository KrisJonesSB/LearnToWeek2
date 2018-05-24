//
//  ViewController.swift
//  LearnToiOS
//
//  Created by Kris Jones on 19/05/2018.
//  Copyright © 2018 SecureBroadcast. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: Outlets
  @IBOutlet weak var passwordTextBox: UITextField!
  @IBOutlet weak var emailTextBox: UITextField!
  @IBOutlet weak var nameTextBox: UITextField!
  @IBOutlet weak var dobDay: UILabel!
  @IBOutlet weak var dobYear: UILabel!
  @IBOutlet weak var dobMonth: UILabel!
  @IBOutlet weak var dayStepper: UIStepper!
  @IBOutlet weak var favouriteLanguageSegmentControl: UISegmentedControl!
  @IBOutlet weak var emailNotificationToggle: UISwitch!
  @IBOutlet weak var yearStepper: UIStepper!
  @IBOutlet weak var monthStepper: UIStepper!
  
  var dobDayValue: Double = 1
  var dobMonthValue: Double = 1
  var dobYearValue: Double = 1992
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    yearStepper.value = dobYearValue
    yearStepper.minimumValue = 1900
    yearStepper.maximumValue = 2018
    monthStepper.value = dobMonthValue
    monthStepper.minimumValue = 1
    monthStepper.maximumValue = 12
    dayStepper.value = dobDayValue
    dayStepper.minimumValue = 1
    dayStepper.maximumValue = 31
    updateDobValues()

    passwordTextBox.keyboardType = .default
    passwordTextBox.isSecureTextEntry = true
    
    nameTextBox.autocapitalizationType = .words
    emailTextBox.keyboardType = .emailAddress
    
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
    view.addGestureRecognizer(tap)

  }
  
  func dismissKeyboard() {
   self.view.endEditing(true)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func updateDobValues() {
    dobDay.text = "\(Int(dobDayValue))"
    dobMonth.text = "\(Int(dobMonthValue))"
    dobYear.text = "\(Int(dobYearValue))"
  }
  
  // MARK: IBActions
  @IBAction func dayStepperChanged(_ sender: Any) {
    dobDayValue = dayStepper.value
    updateDobValues()
  }
  
  @IBAction func monthStepperChanged(_ sender: Any) {
    dobMonthValue = monthStepper.value
    updateDobValues()
  }
  
  @IBAction func yearStepperChanged(_ sender: Any) {
    dobYearValue = yearStepper.value
    updateDobValues()
  }
  
  @IBAction func saveButtonTap(_ sender: Any) {
    // TODO: Add Validation
    
    // As a text box string value is optional, we must provide a default here if we do not want to unwrap
    // in Swift the syntax ?? "" provies the default value "" if a text box string has a nil value
    print("Name: \(nameTextBox.text ?? "")")
    print("Email: \(emailTextBox.text ?? "")")
    print("Password: \(passwordTextBox.text ?? "")")
    print("Password: \(passwordTextBox.text ?? "")")
    
    // Casting stepper values to Int as a UIStepper returns a double as its value
    print("DOB: \(Int(dobDayValue)) / \(Int(dobMonthValue)) / \(Int(dobYearValue))")
    
    print("Should recieve email notifications? \(emailNotificationToggle.isOn ? "YES" : "NO")")
    print("Favourite Language: Swift")
  }
  
}

