//
//  AppViewModal.swift
//  ShoeX
//
//  Created by David Opoku on 10/06/2023.
//

import Foundation

struct CountryData: Hashable {
    var name: String;
    var code: String;
    var flag: String;
}

struct TrendingToday: Identifiable {
    let id: UUID = .init()
    var name: String
    var price: Int
    var numberOfItemsSold: Int
}

struct NewRelease: Identifiable {
    let id: UUID = .init()
    var name: String
    var date: String
}

struct Recommended: Identifiable {
    let id: UUID = .init()
    var name: String
    var price: Int
    var lastPrice: Int
}


class AppViewModel: ObservableObject {
    @Published var countries: [CountryData] = [];
    @Published var country: CountryData? = nil;
    @Published var trendingItems: [TrendingToday] = []
    @Published var newReleases: [NewRelease] = []
    @Published var recommended: [Recommended] = []
    
    init() {
        country = nil
        countries = getCountries();
        trendingItems = [
            .init(name: "Nike Free Terra Vista Next Nature", price: 110, numberOfItemsSold: 5123),
            .init(name: "Nike ACG Mountain Fly Low SE", price: 170, numberOfItemsSold: 1357),
            .init(name: "Nike Air Force 1 '07 ESS", price: 210, numberOfItemsSold: 4357),
            .init(name: "Nike Air Max Dawn SE", price: 90, numberOfItemsSold: 325),
            .init(name: "Nike Wearallday", price: 300, numberOfItemsSold: 425),
        ]
        newReleases = [
            .init(name: "Nike Air Max Dawn SEe", date: "Tomorrow"),
            .init(name: "Nike Air Force 1 '07 ESS", date: "dec 12"),
            .init(name: "Nike Wearallday", date: "dec 14"),
            .init(name: "Nike Free Terra Vista Next Nature", date: "dec 24"),
        ]
        recommended = [
            .init(name: "Nike Free Terra Vista Next Nature", price: 120, lastPrice: 100),
            .init(name: "Nike ACG Mountain Fly Low SE", price: 140, lastPrice: 120),
            .init(name: "Nike Air Force 1 '07 ES", price: 200, lastPrice: 190),
            .init(name: "Nike Air Max Dawn SE", price: 270, lastPrice: 260),
        ]
    }
    
    func getCountries() -> [CountryData] {
        var data: [CountryData] = []
        for code in NSLocale.isoCountryCodes  {
            
            let flag = String.emojiFlag(for: code)
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])

            if let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) {
                data.append(CountryData(name: name, code: code, flag: flag!))
                if code == Locale.current.language.region?.identifier {
                    country = CountryData(name: name, code: code, flag: flag!)
                }
            }
            
        }
        return data
    }
    
    func setCountry(data: CountryData) {
        country = data
    }
}

extension String {
    static func emojiFlag(for countryCode: String) -> String! {
        func isLowercaseASCIIScalar(_ scalar: Unicode.Scalar) -> Bool {
            return scalar.value >= 0x61 && scalar.value <= 0x7A
        }
        func regionalIndicatorSymbol(for scalar: Unicode.Scalar) -> Unicode.Scalar {
            precondition(isLowercaseASCIIScalar(scalar))
            // 0x1F1E6 marks the start of the Regional Indicator Symbol range and corresponds to 'A'
            // 0x61 marks the start of the lowercase ASCII alphabet: 'a'
            return Unicode.Scalar(scalar.value + (0x1F1E6 - 0x61))!
        }
        let lowercasedCode = countryCode.lowercased()
        guard lowercasedCode.count == 2 else { return nil }
        guard lowercasedCode.unicodeScalars.reduce(true, { accum, scalar in accum && isLowercaseASCIIScalar(scalar) }) else { return nil }

        let indicatorSymbols = lowercasedCode.unicodeScalars.map({ regionalIndicatorSymbol(for: $0) })
        return String(indicatorSymbols.map({ Character($0) }))
    }
}

