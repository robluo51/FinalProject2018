//
//  MatchReviewController.swift
//  FinalProject2018
//
//  Created by User02 on 2018/6/30.
//  Copyright © 2018年 User02. All rights reserved.
//


import UIKit

class MatchReviewController:UIViewController{
    
    var reviewData:ReviewData?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var reviewTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let reviewData = reviewData{
            titleTextField.text = reviewData.title
            reviewTextField.text = reviewData.review
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any){
        if titleTextField.text?.count == 0{}
        let alertController = UIAlertController(title: "Please key in your title", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated:  true, completion: nil)
        return
    }
    
//    performSegue(withIdentifier: "goBackToCollectionTableWithSegue", sender: nil)


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if reviewData == nil{
            reviewData = ReviewData(title: titleTextField.text!, review: reviewTextField.text!)
        }
        else{
            reviewData?.title = titleTextField.text!
            reviewData?.review = reviewTextField.text!
        }
    }
}
