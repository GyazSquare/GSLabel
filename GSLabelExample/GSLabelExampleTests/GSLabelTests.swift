//
//  GSLabelTests.swift
//  GSLabelTests
//

import GSLabelExample
import UIKit
import XCTest

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
            let label = GSLabel(frame: CGRectZero)
            XCTAssert(UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, label.contentInsets))
            let data = NSKeyedArchiver.archivedDataWithRootObject(label)
            let object = NSKeyedUnarchiver.unarchiveObjectWithData(data)
            XCTAssert(UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, (object as! GSLabel).contentInsets))
        }
        // custom contentInsets
        do {
            let label = GSLabel(frame: CGRectZero)
            let contentInsets = UIEdgeInsetsMake(1, 2, 3, 4)
            label.contentInsets = contentInsets
            let data = NSKeyedArchiver.archivedDataWithRootObject(label)
            let object = NSKeyedUnarchiver.unarchiveObjectWithData(data)
            XCTAssert(UIEdgeInsetsEqualToEdgeInsets(contentInsets, (object as! GSLabel).contentInsets))
        }
    }
}
