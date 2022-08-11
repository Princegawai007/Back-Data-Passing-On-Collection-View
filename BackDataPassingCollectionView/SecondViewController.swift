//
//  SecondViewController.swift
//  BackDataPassingCollectionView
//
//  Created by Prince's Mac on 06/07/22.
//

import UIKit

//MARK create a protocol with some mandatory function to pass the data
protocol employeeDataPassingProtocol {
func passEmployeeData(textToPass : String?)
}
class SecondViewController: UIViewController {
//MARK Creating a property of delegate to link the protocol with second vc
    var delegateSVC : EmployeeDataPassingProtocol?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//MARK call the method / func (mandatory) of that protocol when you want to pass the data
    @IBAction func saveData(_ sender: Any) {
        guard let delegate = delegateSVC else {
            return
        }
        if self.nameTextField.text!.isEmpty || self.idTextField.text!.isEmpty ||
            self.cityTextField.text!.isEmpty || self.mobileNumberTextField.text!.isEmpty{
            
            let dataAlertController = UIAlertController(title: "Employee Data", message: "Please Enter Data", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            let cancleAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            dataAlertController.addAction(actionOk)
            dataAlertController.addAction(cancleAction)
            self.present(dataAlertController,animated: true, completion: nil)
    }
    else {
        let employeeName = self.nameTextField.text ?? "Name"
        let employeeId = self.idTextField.text ?? "0"
        let employeeCity = self.cityTextField.text ?? " City"
        let employeeMobileNumber = self.mobileNumberTextField.text ?? "0"
        
        let objectToPass = EmployeeModel(EmployeeName: employeeName, EmployeeId: Int(employeeId) ?? 0, EmployeeCity: employeeCity,EmployeeMobileNumber: Int(employeeMobileNumber) ?? 123456789)
        
        let saveAlertController = UIAlertController(title: "Save Data", message: "Data Saved Successfully", preferredStyle: .alert)
        let defaultActionOk = UIAlertAction(title: "Ok", style: .default){ (next) in
            delegate.passEmployeeData(myemployee: objectToPass)
            self.navigationController?.popViewController(animated: true)
        }
        saveAlertController.addAction(defaultActionOk)
        self.present(saveAlertController, animated: true, completion: nil)
    }
   }
}
