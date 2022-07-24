import XCTest

final class HTMBasalMetabilicRateTests: XCTestCase {
    
    func test_calculate_was_called_but_not_pass_any_info_should_return_zero() {
        let sut = HTMBasalMetabilicRate()
        let result = sut.calculate()
        XCTAssertEqual(result, -1)
    }
    
    func test_calculate_when_info_is_for_a_man_should_result_correctly() {
        let sut = HTMBasalMetabilicRate()
        let peopleInfo = HTMBasalMetabilicRateModel(gender: .male, age: 22, wight: 80.0, height: 168.0)
        let result = sut.calculate(info: peopleInfo)
        XCTAssertEqual(result, 1_860.4)
    }
    
    func test_calculate_when_info_is_for_a_man_should_result_correctly_for_another_values() {
        let sut = HTMBasalMetabilicRate()
        let peopleInfo = HTMBasalMetabilicRateModel(gender: .male, age: 70, wight: 98, height: 180.0)
        let result = sut.calculate(info: peopleInfo)
        XCTAssertEqual(result, 1_842.4)
    }
    
    func test_calculate_when_info_is_for_a_female_should_result_correctly() {
        let sut = HTMBasalMetabilicRate()
        let peopleInfo = HTMBasalMetabilicRateModel(gender: .female, age: 20, wight: 55, height: 158)
        let result = sut.calculate(info: peopleInfo)
        XCTAssertEqual(result, 1_389.2)
    }
    
    func test_calculate_when_info_is_for_a_female_should_result_correctly_for_another_values() {
        let sut = HTMBasalMetabilicRate()
        let peopleInfo = HTMBasalMetabilicRateModel(gender: .female, age: 70, wight: 98, height: 180.0)
        let result = sut.calculate(info: peopleInfo)
        XCTAssertEqual(result, 1608.8)
    }

    func test_calulate_compare_diferent_genrers_with_same_values_should_be_return_diferent_results() {
        let sut = HTMBasalMetabilicRate()
        
        let maleInfo = HTMBasalMetabilicRateModel(gender: .male, age: 70, wight: 98, height: 180.0)
        let resultForMale = sut.calculate(info: maleInfo)
        
        let famaleInfo = HTMBasalMetabilicRateModel(gender: .female, age: 70, wight: 98, height: 180.0)
        let resultForFemale = sut.calculate(info: famaleInfo)
        XCTAssertNotEqual(resultForMale, resultForFemale)
    }
    
    func test_calulate_result_for_same_values_in_different_genrers_male_must_be_bigger_then_female() {
        let sut = HTMBasalMetabilicRate()
        
        let maleInfo = HTMBasalMetabilicRateModel(gender: .male, age: 70, wight: 98, height: 180.0)
        let resultForMale = sut.calculate(info: maleInfo)
        
        let famaleInfo = HTMBasalMetabilicRateModel(gender: .female, age: 70, wight: 98, height: 180.0)
        let resultForFemale = sut.calculate(info: famaleInfo)
        XCTAssertTrue(resultForMale > resultForFemale)
    }
}


final class HTMBasalMetabilicRate {

    func calculate(
        info: HTMBasalMetabilicRateModel = .init(age: 0, wight: 0, height: 0)
    ) -> Double {
        let weightIsNotZero = info.wight > 0
        let ageIsNotZero = info.age > 0
        let heightIsNotZero = info.height > 0
        guard weightIsNotZero, ageIsNotZero, heightIsNotZero else { return -1 }
        
        switch info.gender {
        case .male:
            return (66 + (13.8 * info.wight) + (5.0 * info.height) - (6.8 * info.age))
        case .female:
            return (655 + (9.6 * info.wight) + (1.9 * info.height) - (4.7 * info.age))
        }
    }
}


struct HTMBasalMetabilicRateModel {
    let gender: Gender
    let age: Double
    let wight: Double
    let height: Double
    
    init(gender: Gender = .male, age: Int, wight: Double, height: Double) {
        self.gender = gender
        self.age = Double(age)
        self.wight = wight
        self.height = height
    }
}

enum Gender {
    case `male`
    case female
}
