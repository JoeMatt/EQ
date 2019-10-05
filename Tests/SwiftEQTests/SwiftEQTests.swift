import XCTest
@testable import SwiftEQ

final class SwiftEQTests: XCTestCase {
    func testModel () {
        let model = FormViewModel()
        XCTAssertFalse(model.isCurrentEmployer.value)
        model.isCurrentEmployer.value = true
        XCTAssertTrue(model.isCurrentEmployer.value)
    }
    
    #if compiler(>=5.1)
    func testWrappedModel () {
        var model = FormViewModelWrapped()
        
        XCTAssertFalse(model.isCurrentEmployer)
        
        model.isCurrentEmployer = true
        XCTAssertTrue(model.isCurrentEmployer)
        
//        let obs: Observable<Bool> = model.isCurrentEmployer.asObserver()
    }
    #endif
    
    static var allTests = [
        ("testModel", testModel),
        ("testWrappedModel", testWrappedModel),
    ]
}
