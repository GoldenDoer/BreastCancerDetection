//
//  jDetectTests.swift
//  jDetectTests
//
//  Created by frestie ngongo on 08/04/2019.
//  Copyright © 2019 frestie ngongo. All rights reserved.
//

import XCTest
@testable import jDetect

class jDetectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your
        //tests produce the correct results.
       
        
    }
   
    func testEMAiLValidati(){
        let loginvc = LoginViewController()
    
        
        loginvc.login(user: "frestie@idetect.com",pass: "123456")
        
        print("login succcess")
       //XCTAssertFalse(vc.errorLabel!.isHidden)
       //XCTAssertEqual("Please enter a password")
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
