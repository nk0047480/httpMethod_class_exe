
import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let formList = ["台北", "高雄", "台南", "屏東"]
    let toList = ["台北", "高雄", "台南", "屏東"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return formList.count
        }
        
        else if component == 1 {
            return toList.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return formList[row]
        }
            
        else if component == 1 {
            return toList[row]
        }
        
        return nil
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

   
}
