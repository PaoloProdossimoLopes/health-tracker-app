import XCTest
@testable import HTMath

final class HTMDailySpendTests: XCTestCase {

    func test_sut_calculate_verify_if_method_pass_correct_to_basal_rate() {
        let basalSpy = HTMBasalMetabilicRateSpy()
        _ = executeSUTCalculate(activity: .light, basal: basalSpy)
        XCTAssertEqual(basalSpy.modelSpy!.gender, .male)
        XCTAssertTrue(basalSpy.modelSpy!.people.isValid)
        XCTAssertEqual(basalSpy.modelSpy!.people.age, 22)
        XCTAssertEqual(basalSpy.modelSpy!.people.wight, 80)
        XCTAssertEqual(basalSpy.modelSpy!.people.height, 168)
    }
    
    func test_sut_calculate_when_pass_invalid_infos_result_in_nil_return() {
        let basalStub = HTMBasalMetabilicRateStub()
        let result = executeSUTCalculate(activity: .extreme, basal: basalStub)
        XCTAssertNil(result)
    }
    
    func test_sut_calculate_when_pass_valid_infos_with_sedentary_activity_multipy_correct() {
        let basalStub = HTMBasalMetabilicRateStub()
        basalStub.calculateExpected = 1
        let result = executeSUTCalculate(activity: .sedentary, basal: basalStub)
        XCTAssertEqual(result, 1.2)
    }
    
    func test_sut_calculate_when_pass_valid_infos_with_light_activity_multipy_correct() {
        let basalStub = HTMBasalMetabilicRateStub()
        basalStub.calculateExpected = 1
        let result = executeSUTCalculate(activity: .light, basal: basalStub)
        XCTAssertEqual(result, 1.375)
    }
    
    func test_sut_calculate_when_pass_valid_infos_with_moderate_activity_multipy_correct() {
        let basalStub = HTMBasalMetabilicRateStub()
        basalStub.calculateExpected = 1
        let result = executeSUTCalculate(activity: .moderate, basal: basalStub)
        XCTAssertEqual(result, 1.55)
    }
    
    func test_sut_calculate_when_pass_valid_infos_with_height_activity_multipy_correct() {
        let basalStub = HTMBasalMetabilicRateStub()
        basalStub.calculateExpected = 1
        let result = executeSUTCalculate(activity: .hight, basal: basalStub)
        XCTAssertEqual(result, 1.725)
    }
    
    func test_sut_calculate_when_pass_valid_infos_with_extreme_activity_multipy_correct() {
        let basalStub = HTMBasalMetabilicRateStub()
        basalStub.calculateExpected = 1
        let result = executeSUTCalculate(activity: .extreme, basal: basalStub)
        XCTAssertEqual(result, 1.9)
    }
    
}

//MARK: - Helpers
private extension HTMDailySpendTests {
    
    func executeSUTCalculate(
        activity: HTActivity,
        basal: HTMBasalMetabilicRateProtocol = HTMBasalMetabilicRate()
    ) -> Double? {
        let sut = HTMDailySpend(basal: basal)
        let model = makeSpendModel(activity: activity)
        return sut.calculate(model: model)
    }
    
    func makeSpendModel(
        activity: HTActivity = .sedentary,
        genrer: HTGender = .male,
        age: Int = 22, weight: Double = 80, height: Double = 168
    ) -> HTMDailySpendModel {
        return HTMDailySpendModel(
            activity: activity, gender: .male,
            age: age, wight: weight, height: height
        )
    }
}
