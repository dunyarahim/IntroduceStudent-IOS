import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        morePetsStepper.minimumValue = 0
        morePetsStepper.maximumValue = 10
        morePetsStepper.stepValue = 1
        numberOfPetsLabel.text = "\(Int(morePetsStepper.value))"

        if yearSegmentedControl.selectedSegmentIndex == UISegmentedControl.noSegment,
           yearSegmentedControl.numberOfSegments > 0 {
            yearSegmentedControl.selectedSegmentIndex = 0
        }
    }

    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }

    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        view.endEditing(true)

        let first  = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let last   = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let school = schoolNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let year   = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex) ?? ""

        let pets = Int(morePetsStepper.value)
        let petWord = pets == 1 ? "dog" : "dogs"
        let morePetsText = morePetsSwitch.isOn ? "I want more pets." : "I'm good with my current pets."

        let introduction = """
        My name is \(first) \(last) and I attend \(school).
        I am currently in my \(year) year and I own \(pets) \(petWord).
        \(morePetsText)
        """

        let alert = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Nice to meet you!", style: .default))
        present(alert, animated: true)
    }
}

