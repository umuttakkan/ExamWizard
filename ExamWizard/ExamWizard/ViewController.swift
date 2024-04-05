import UIKit
class ViewController: UIViewController {

    var name = "";
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btngiris(_ sender: Any) {
        name = tf1.text!
        performSegue(withIdentifier: "Kullanici Adi Gonderme", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Kullanici Adi Gonderme" {
            if let viewController2 = segue.destination as? ViewController2 {
                viewController2.name = name
            }
        }
    }
}
