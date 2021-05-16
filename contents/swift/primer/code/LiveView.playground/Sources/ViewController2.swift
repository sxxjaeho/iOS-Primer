import Foundation
import UIKit

public class ViewController2:UIViewController{
    public override func viewDidLoad() {
        super.viewDidLoad()
        let label:UILabel = UILabel()
        label.text = "页面2"
        label.frame = CGRect(x: 0, y: 200, width: 300, height: 50)
        label.textColor = .white
        label.backgroundColor = .red
        view.addSubview(label)
    }
}
