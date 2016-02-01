//
//  TestViewModel.swift
//  RxSwiftPOC
//
//  Created by Alejandro Rodriguez on 1/28/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import RxSwift
import RxCocoa


class TestViewModel {
    

    let validatedPassword: Driver<String>
    

    
    
    init(password: Driver<String>, repeatedPassword: Driver<String>){
        
        validatedPassword = Driver
            .combineLatest(password, repeatedPassword, resultSelector: {
                return ($0, $1)
            })
            .filter{
                return $0.characters.count > 0 && $1.characters.count > 0
            }
            .map{
                print("\($0) \($1)")
                return $0 == $1 ? "Passwords iguales" : "Passwords diferentes"
        }

        
    }
    

    
    
    
    
    
    
}
