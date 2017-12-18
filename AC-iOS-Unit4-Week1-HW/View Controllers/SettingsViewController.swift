//
//  ViewController.swift
//  AC-iOS-Unit4-Week1-HW
//
//  Created by C4Q  on 12/14/17.
//  Copyright © 2017 C4Q . All rights reserved.
//


//Google books is the same as assessment
/*TO-DO:
 - Change color of tab bar items for when selected and non select
 */
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var genrePicker: UIPickerView!
    var categories = [Category]() {
        didSet {
            genrePicker.reloadAllComponents()
        }
    }
    
    
//    var savedCategory = ["savedCategory": "Travel" ]

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genrePicker.delegate  = self
        genrePicker.dataSource = self
        setUpNavigationUI()
        loadCategories()
    }
    
    func setUpNavigationUI() {
    let navigation = self.navigationController?.navigationBar
    navigation?.backgroundColor = UIColor.black
    let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    navigation?.titleTextAttributes = textAttributes
    }
    
    
    func loadCategories() {
        let urlStr = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=a1537c9d3c784066a9406d61ebcb9de0"
        guard let strAsUrl = URL(string: urlStr) else { return }
        let urlRequest = URLRequest(url: strAsUrl)
        let completion: ([Category]) -> Void = { (onlineCategories: [Category])  in
            self.categories = onlineCategories
            print(self.categories)
        }
        let errorHandler: (Error) -> Void = {(error: Error) in
            print(error)
        }
        CategoryAPIClient.manager.getCategories(from: urlRequest, completionHandler: completion, errorHandler: errorHandler)
    }
    
}

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let genre = categories[row].list_name
        return genre
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let userChangesGenre = categories[row].list_name
        UserDefaults.standard.setValue(userChangesGenre, forKey: "savedCategory")
    }
}

