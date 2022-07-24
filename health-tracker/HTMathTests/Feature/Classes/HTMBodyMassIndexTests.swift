import XCTest
@testable import HTMath

final class HTMBodyMassIndexTests: XCTestCase {
    
    func test_calculate_with_only_weight_is_zero_values_on_model_are_zero_should_be_nil() {
        let sut = HTMBodyMassIndex()
        let model = HTMPeopleModel(age: 22, wight: 0, height: 168)
        XCTAssertNil(sut.calculate(model: model))
    }
    
    func test_calculate_with_only_height_is_zero_values_on_model_are_zero_should_be_nil() {
        let sut = HTMBodyMassIndex()
        let model = HTMPeopleModel(age: 22, wight: 80, height: 0)
        XCTAssertNil(sut.calculate(model: model))
    }
    
    func test_calculate_with_all_input_model_is_zero_values_on_model_are_zero_should_be_nil() {
        let sut = HTMBodyMassIndex()
        let model = HTMPeopleModel(age: 0, wight: 0, height: 0)
        XCTAssertNil(sut.calculate(model: model))
    }
    
    func test_calculate_if_input_correct_values_should_be_return_correct_calc() {
        let sut = HTMBodyMassIndex()
        let model = HTMPeopleModel(age: 22, wight: 80, height: 168)
        let result = sut.calculate(model: model)
        XCTAssertEqual(result, 28.345)
    }
    
    func test_calculate_if_input_correct_values_should_be_return_correct_calc_v2() {
        let sut = HTMBodyMassIndex()
        let model = HTMPeopleModel(age: 20, wight: 58, height: 158)
        let result = sut.calculate(model: model)
        XCTAssertEqual(result, 23.233)
    }
    
    func test_() {
        let sut = HTMBodyMassIndex()
        let model = HTMPeopleModel(age: 20, wight: 58, height: 158)
        let stage = sut.stage(sut.calculate(model: model)!)
        XCTAssertEqual(stage, .nomalWeight)
    }
    
    func test_2() {
        let sut = HTMBodyMassIndex()
        let model = HTMPeopleModel(age: 22, wight: 80, height: 168)
        let stage = sut.stage(sut.calculate(model: model)!)
        XCTAssertEqual(stage, .overWeight)
    }
}
