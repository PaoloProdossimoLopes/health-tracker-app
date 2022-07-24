enum HTActivity {
    case `sedentary`
    case light
    case moderate
    case hight
    case extreme
    
    var coeficient: Double {
        switch self {
        case .sedentary: return 1.2
        case .light: return 1.375
        case .moderate: return 1.55
        case .hight: return 1.725
        case .extreme: return 1.9
        }
    }
}
