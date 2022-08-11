//
//  ViewController.swift
//  BackDataPassingCollectionView
//
//  Created by Prince's Mac on 06/07/22.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var fvcCollectionView : UICollectionView!
    var employee : [EmployeeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fvcCollectionView.dataSource = self
        fvcCollectionView.delegate = self
        
        let uiNib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        self.fvcCollectionView.register(uiNib, forCellWithReuseIdentifier: "CustomCollectionViewCell")
    }
    @IBAction func addEmp(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
// MARK  assign delegate property of second VC to instance of FVC
        secondViewController.delegateSVC = self
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
//MARK conform the protocol
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return employee.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let employeeCell = self.fvcCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
          
        let eachEmployees = employee[indexPath.row]
        employeeCell.nameLabel.text = eachEmployees.EmployeeName
        employeeCell.IdLabel.text = String(eachEmployees.EmployeeId)
        employeeCell.cityLabel.text = eachEmployees.EmployeeCity
        employeeCell.mobileNumber.text = String(eachEmployees.EmployeeMobileNumber)
          
          return employeeCell
    }
}
extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
extension ViewController : EmployeeDataPassingProtocol {
    func passEmployeeData(myemployee: EmployeeModel) {
        let myemployee = EmployeeModel(EmployeeName: myemployee.EmployeeName, EmployeeId: myemployee.EmployeeMobileNumber, EmployeeCity: myemployee.EmployeeCity, EmployeeMobileNumber: myemployee.EmployeeMobileNumber)
            
        employee.append(myemployee)
        fvcCollectionView.reloadData()
    }
}
extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        return CGSize (width: collectionWidth/2, height: collectionWidth/2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
