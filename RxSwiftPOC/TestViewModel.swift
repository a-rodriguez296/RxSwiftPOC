//
//  TestViewModel.swift
//  RxSwiftPOC
//
//  Created by Alejandro Rodriguez on 1/28/16.
//  Copyright © 2016 Alejandro Rodriguez. All rights reserved.
//

import RxSwift


class TestViewModel {
    
    //    let validatedSignal: Observable<Bool>
    let validatedUsername: Observable<String>
    let validatedPassword: Observable<String>
    
    let pressButton : Observable<Bool>
    
    var input:Observable<String>
    
    var pass1:Observable<String>
    var pass2:Observable<String>
    
    var btn:Observable<Void>
    
    
    
    init(input:Observable<String>,tPass1:Observable<String>, tPass2:Observable<String>, output:Observable<Void>){
        self.input = input
        self.btn = output
        
        pass1 = tPass1
        pass2 = tPass2
        
        
        validatedUsername = self.input
            .filter({
                return $0.characters.count>2})
            .map({ username -> String in
                return username.containsString("asdf") ? "Valid username" : "invalid username"
            })
        
        validatedPassword = Observable.combineLatest(pass1, pass2, resultSelector: {
            return ($0,$1)
        }).map{
            print("\($0)  \($1)" )
            return $0 == $1 ? "Passwords iguales" : "Passwords diferentes"
        }
        
        
        pressButton = self.btn
            .map({
                return false
            })
        
        
    }
    
    
    
    
    
    
}
