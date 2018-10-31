//
//  ARPicker.swift
//  ARPicker
//
//  Created by AbdulRehman Warraich on 10/31/18.
//

import UIKit

open class ARPickerVC: UIViewController {
    
    //MARK: - Properties
    public typealias ARPickerCompletionHandler = (_ selectedOption :String, _ selectedIndex :Int) -> ()
    var doneCompletionBlock :ARPickerCompletionHandler?
    var optionsArray : [String] = []
    var selectedOption : String = ""
    public var doneButtonTitle : String = "DONE"
    public var cancelButtonTitle : String = "CANCEL"
    
    //MARK: - IBOutlet
    
    var myContentView: UIView = UIView()
    var buttonContentView: UIView = UIView()
    var sepratorView: UIView = UIView()
    
    var doneButton: UIButton = UIButton()
    var cancelButton: UIButton = UIButton()
    
    var pickerView: UIPickerView = UIPickerView()
    
    //MARK: - View Controllers Methods
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        
        view.addSubview(myContentView)
        myContentView.layer.cornerRadius = 8
        myContentView.clipsToBounds = true
        myContentView.backgroundColor = UIColor.white
        myContentView.translatesAutoresizingMaskIntoConstraints = false
        
        myContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        myContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        myContentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        myContentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45).isActive = true
        
        
        myContentView.addSubview(buttonContentView)
        //buttonContentView.layer.cornerRadius = 8
        buttonContentView.backgroundColor = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
        buttonContentView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonContentView.topAnchor.constraint(equalTo: myContentView.topAnchor, constant: 0).isActive = true
        buttonContentView.leadingAnchor.constraint(equalTo: myContentView.leadingAnchor, constant: 0).isActive = true
        buttonContentView.trailingAnchor.constraint(equalTo: myContentView.trailingAnchor, constant: 0).isActive = true
        buttonContentView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        
        buttonContentView.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.topAnchor.constraint(equalTo: buttonContentView.topAnchor, constant: 0).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: buttonContentView.bottomAnchor, constant: 0).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: buttonContentView.trailingAnchor, constant: -8).isActive = true
        doneButton.addTarget(self, action: #selector(donePressed(_:)), for: .touchUpInside)
        
        buttonContentView.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: buttonContentView.topAnchor, constant: 0).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: buttonContentView.bottomAnchor, constant: 0).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: buttonContentView.leadingAnchor, constant: 8).isActive = true
        cancelButton.addTarget(self, action: #selector(cancelPressed(_:)), for: .touchUpInside)
        
        buttonContentView.addSubview(sepratorView)
        sepratorView.backgroundColor = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1)
        sepratorView.translatesAutoresizingMaskIntoConstraints = false
        
        sepratorView.bottomAnchor.constraint(equalTo: buttonContentView.bottomAnchor, constant: 0).isActive = true
        sepratorView.leadingAnchor.constraint(equalTo: buttonContentView.leadingAnchor, constant: 0).isActive = true
        sepratorView.trailingAnchor.constraint(equalTo: buttonContentView.trailingAnchor, constant: 0).isActive = true
        sepratorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        myContentView.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.backgroundColor = UIColor.clear
        
        pickerView.topAnchor.constraint(equalTo: buttonContentView.bottomAnchor, constant: 0).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: myContentView.leadingAnchor, constant: 0).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: myContentView.trailingAnchor, constant: 0).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: myContentView.bottomAnchor, constant: -8).isActive = true
        
        self.view.layoutIfNeeded()
        
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        doneButton.setTitle(doneButtonTitle, for: .normal)
        doneButton.setTitleColor(UIColor(red: 0.01, green: 0.2, blue: 1, alpha: 1), for: .normal)
        
        cancelButton.setTitle(cancelButtonTitle, for: .normal)
        cancelButton.setTitleColor(UIColor(red: 0.01, green: 0.2, blue: 1, alpha: 1), for: .normal)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.pickerView.selectRow(self.optionsArray.index(of: self.selectedOption) ?? 0, inComponent: 0, animated: true)
        
    }
    
    //MARK: - Functions
    func setPickerView(options: [String], selectedOption :String?, doneTitleText :String = "DONE", cancelTitleText :String = "CANCEL", didSelectDateBlock : @escaping ARPickerCompletionHandler) {
        self.optionsArray = options
        self.selectedOption = selectedOption ?? ""
        self.doneButtonTitle = doneTitleText
        self.cancelButtonTitle = cancelTitleText
        
        doneCompletionBlock = didSelectDateBlock
        
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == self.view {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    //MARK: - IBAction
    @IBAction func donePressed(_ sender: UIButton) {
        doneCompletionBlock?(optionsArray[pickerView.selectedRow(inComponent: 0)], pickerView.selectedRow(inComponent: 0))
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension ARPickerVC : UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return  1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return optionsArray.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return optionsArray[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedOption = optionsArray[row]
    }
    
}


extension UIViewController {
    //MARK: -  Functions
    
    /**
     Presents ViewController with animation.
     
     - parameter viewControllerToPresent: ViewController to present.
     - parameter animated: With animation or not.
     - parameter modalTransitionStyle: Presentation style. Bydefault its 'coverVertical'.
     
     - returns: void.
     */
    open func presentPOPUP(_ viewControllerToPresent: UIViewController, animated flag: Bool, modalTransitionStyle:UIModalTransitionStyle = .coverVertical, completion: (() -> Swift.Void)? = nil) {
        viewControllerToPresent.modalPresentationStyle = .overCurrentContext
        viewControllerToPresent.modalTransitionStyle = modalTransitionStyle
        
        self.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    /**
     Show options picker as popup.
     
     - parameter options: Picker View options.
     
     - returns: didSelectDate(Selected date).
     */
    open func showPickerView(options : [String],selectedOption :String?, doneTitleText :String = "DONE", cancelTitleText :String = "CANCEL", didSelectDate : @escaping ARPickerVC.ARPickerCompletionHandler) {
        let datePickerVC : ARPickerVC = ARPickerVC()
        datePickerVC.setPickerView(options: options, selectedOption: selectedOption, doneTitleText: doneTitleText, cancelTitleText: cancelTitleText,didSelectDateBlock: didSelectDate)
        self.presentPOPUP(datePickerVC, animated: true)
        
    }
}
