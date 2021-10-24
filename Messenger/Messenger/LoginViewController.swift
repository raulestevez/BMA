//
//  ViewController.swift
//  Messenger
//
//  Created by raul on 22.10.21.
//

import UIKit
import SendBirdSDK
import SendBirdUIKit

class LoginViewController: UIViewController, UITextFieldDelegate, UIWindowSceneDelegate {
    
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userIdTextField.delegate = self
        nicknameTextField.delegate = self
    }

    @IBAction func didTapConnectButton(_ sender: Any) {
        // The USER_ID below should be unique to your Sendbird application.
        let userId = userIdTextField.text
        let nickname = nicknameTextField.text
        
        guard userId != "", nickname != "" else {
            self.showAlert(title: "Missing information", message: "Please enter a user Id and nickname.")
            return
        }
        
        SBDMain.connect(withUserId: userId ?? "", completionHandler: { (user, error) in
            guard error == nil else {
                // Handle error.
                return
            }
            
            // The user is connected to Sendbird server.
            
            self.showAlert(title: "Success!", message: "User \(userId ?? "") has been connected successfully.")
            
        })
    }
        
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }
        ))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
