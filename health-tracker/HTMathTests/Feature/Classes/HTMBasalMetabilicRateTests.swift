import XCTest
@testable import HTMath

final class HTMBasalMetabilicRateTests: XCTestCase {
    
    func test_calculate_was_called_but_not_pass_any_info_should_return_zero() {
        let result = makeSUT()
        XCTAssertNil(result)
    }
    
    func test_calculate_when_info_is_for_a_man_should_result_correctly() {
        let sut = HTMBasalMetabilicRate()
        let peopleInfo = HTMBasalMetabilicRateModel(gender: .male, age: 22, wight: 80.0, height: 168.0)
        let result = sut.calculate(model: peopleInfo)
        XCTAssertEqual(result, 1_860.4)
    }
    
    func test_calculate_when_info_is_for_a_man_should_result_correctly_for_another_values() {
        let result = makeSUT(with: .init(gender: .male, age: 70, wight: 98, height: 180.0))
        XCTAssertEqual(result, 1_842.4)
    }
    
    func test_calculate_when_info_is_for_a_female_should_result_correctly() {
        let result = makeSUT(with: .init(gender: .female, age: 20, wight: 55, height: 158))
        XCTAssertEqual(result, 1_389.2)
    }
    
    func test_calculate_when_info_is_for_a_female_should_result_correctly_for_another_values() {
        let result = makeSUT(with: .init(gender: .female, age: 70, wight: 98, height: 180.0))
        XCTAssertEqual(result, 1608.8)
    }

    func test_calulate_compare_diferent_genrers_with_same_values_should_be_return_diferent_results() {
        let resultForMale = makeSUT(with: .init(gender: .male, age: 70, wight: 98, height: 180.0))
        let resultForFemale = makeSUT(with: .init(gender: .female, age: 70, wight: 98, height: 180.0))
        XCTAssertNotEqual(resultForMale!, resultForFemale!)
    }
    
    func test_calulate_result_for_same_values_in_different_genrers_male_must_be_bigger_then_female() {
        let resultForMale = makeSUT(with: .init(gender: .male, age: 70, wight: 98, height: 180.0))
        let resultForFemale = makeSUT(with: .init(gender: .female, age: 70, wight: 98, height: 180.0))
        XCTAssertTrue(resultForMale! > resultForFemale!)
    }
    
    private func makeSUT(with model: HTMBasalMetabilicRateModel = .init()) -> Double? {
        let sut = HTMBasalMetabilicRate()
        return sut.calculate(model: model)
    }
}
