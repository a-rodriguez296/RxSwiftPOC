//
//  TestViewController.swift
//  RxSwiftPOC
//
//  Created by Alejandro Rodriguez on 1/28/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import UIKit
import Foundation
import RxCocoa
import RxSwift






class TestViewController: UIViewController {
    
    @IBOutlet weak var txtInput: UITextField!
    
    @IBOutlet weak var txtPass1: UITextField!
    @IBOutlet weak var txtPass2: UITextField!
    @IBOutlet weak var outputValidatedPassword: UILabel!
    
    @IBOutlet weak var outputLbl: UILabel!
    
    @IBOutlet weak var btnTest: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        
        
        
        //Initialize ViewModel
                let viewModel = TestViewModel(password: txtPass1.rx_text.asDriver(), repeatedPassword: txtPass2.rx_text.asDriver())
        //        viewModel.validatedUsername.bindTo(outputLbl.rx_text).addDisposableTo(disposeBag)
                viewModel.validatedPassword.drive(outputValidatedPassword.rx_text).addDisposableTo(disposeBag)
        //        viewModel.pressButton.bindTo(btnTest.rx_enabled).addDisposableTo(disposeBag)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
