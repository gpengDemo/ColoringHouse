import UIKit


let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height


let isiPhoneX = screenHeight >= 812.0


let safeAreaTopHeight:CGFloat = (screenHeight >= 812) ? 44:24
let safeAreaBottomHeight:CGFloat = (screenHeight >= 812.0 && UIDevice.current.model == "iPhone"  ? 30 : 0)

let navigationBarAddTopSafeAreaHeight : CGFloat = (screenHeight >= 812.0) ? 88 : 64


let contentHeight = screenHeight - safeAreaBottomHeight - navigationBarAddTopSafeAreaHeight - 25 - 54.5 - 36 
let contentWidth = screenWidth -  13.5 - 12 - 14 



let detailWidth = screenWidth - 16.5 - 17.5
let detailHeight = (screenHeight - safeAreaTopHeight - safeAreaBottomHeight - 44 - 26.5 - 69) - ((screenHeight - safeAreaTopHeight - safeAreaBottomHeight - 44 - 26.5 - 69) * (146 / 337.5))


extension UIColor {

    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
          
        let newRed = red / 255
        let newGreen = green / 255
        let newBlue = blue / 255
        
        return .init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    
}
