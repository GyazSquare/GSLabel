//
//  GSLabelTests.swift
//  GSLabelTests
//

import UIKit
import XCTest

import GSLabelExample

class GSLabelTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNSCoding() {
        // default contentInsets
        do {
            let label = GSLabel(frame: CGRect.zero)
            XCTAssert(UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsets.zero, label.contentInsets))
            let data = NSKeyedArchiver.archivedData(withRootObject: label)
            let object = NSKeyedUnarchiver.unarchiveObject(with: data)
            XCTAssert(UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsets.zero, (object as! GSLabel).contentInsets))
        }
        // custom contentInsets
        do {
            let label = GSLabel(frame: CGRect.zero)
            let contentInsets = UIEdgeInsetsMake(1, 2, 3, 4)
            label.contentInsets = contentInsets
            let data = NSKeyedArchiver.archivedData(withRootObject: label)
            let object = NSKeyedUnarchiver.unarchiveObject(with: data)
            XCTAssert(UIEdgeInsetsEqualToEdgeInsets(contentInsets, (object as! GSLabel).contentInsets))
        }
    }
}
