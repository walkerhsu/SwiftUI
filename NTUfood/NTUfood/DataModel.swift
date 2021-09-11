//
//  DataModel.swift
//  NTUfood
//
//  Created by walker on 2021/9/8.
//
// read database
//  0: store (餐廳名字)
//  1: place (區域, 公館、118、學餐、溫州街...)
//  2: address (詳細地址)
//  3: price (價位: 平均數)
//  4: budget(預算, $:0-100 $$:101-200 $$$:201-300 $$$$:301-500 $$$$$:501+)
//  5: type (菜色類別: 中式、日式、韓式...)
//  6: staple (主食, 飯、麵、水餃)
//  7: dishes (菜色： 米食、麵食、鍋物、排餐、輕食...)
//  8: meat (葷/有提供素食/全素)
//  9: seat (有無內用座位: 有/無)
// 10: capacity (可容納人數數字，很多的話就寫10+))
// 11: time (營業時間)
// 12: image (示意圖檔)
// 13: suggestion (天氣冷熱)
struct StoreInfo: Identifiable {
    var id = UUID()
    var store: String
    var place: String
    var address: String
    var price: String
    var budget: String
    var type: String
    var staple: String
    var dishes: String
    var meat: String
    var seat: String
    var capacity: String
    var time: String
    var image: String
    var suggestion: String
}

import Foundation

class NTUDatabase {
    var records: [StoreInfo] = []
    
    init (fileName: String, fileType: String) {
        parseCSV(fileName:fileName, fileType:fileType)
    }
    
    func openCSV(fileName:String, fileType: String)-> String!{
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
            else {
                return nil
        }
        do {
            let contents = try String(contentsOfFile: filepath, encoding: .utf8)

            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }

    func parseCSV(fileName:String, fileType: String){
        let dataString: String! = openCSV(fileName: fileName, fileType: fileType)
        let lines: [String] = dataString.components(separatedBy: NSCharacterSet.newlines) as [String]

        for line in lines {
            var values: [String] = []
            if line != "" {
                if line.range(of: "\"") != nil {
                    var textToScan:String = line
                    var value:String?
                    var textScanner:Scanner = Scanner(string: textToScan)
                    while !textScanner.isAtEnd {
                        if (textScanner.string as NSString).substring(to: 1) == "\"" {
                            textScanner.currentIndex = textScanner.string.index(after:  textScanner.currentIndex)
                           value = textScanner.scanUpToString("\"")
                           textScanner.currentIndex = textScanner.string.index(after: textScanner.currentIndex)
                        } else {
                            value = textScanner.scanUpToString(",")
                        }
                        if value == nil {
                            value = ""
                        }
                        values.append(value! as String)

                        if !textScanner.isAtEnd{
                            let indexPlusOne = textScanner.string.index(after: textScanner.currentIndex)
                            textToScan = String(textScanner.string[indexPlusOne...])
                        } else {
                            textToScan = ""
                        }
                        textScanner = Scanner(string: textToScan)
                    }
                } else {
                   // For a line without double quotes, we can simply separate the string
                   // by using the delimiter (e.g. comma)
                   values = line.components(separatedBy: ",")
               }
            // Put the values into the tuple and add it to the items array
            let storeInfo = convert2StoreInfo(data: values)
            records.append(storeInfo)
            }
        }
    }
    func convert2StoreInfo(data: [String]) -> StoreInfo {
        let fileName =  data[12].components(separatedBy: ".")[0]    // remove file extesion
        return StoreInfo(store: data[0],
                         place: data[1],
                         address: data[2],
                         price: data[3],
                         budget: data[4],
                         type: data[5],
                         staple: data[6],
                         dishes: data[7],
                         meat: data[8],
                         seat: data[9],
                         capacity: data[10],
                         time: data[11],
                         image: fileName,
                         suggestion: data[13])
    }
}
