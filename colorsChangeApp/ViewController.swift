import UIKit

class ViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var mainColorView: UIView!
    
    @IBOutlet var nameFirstColorLabel: UILabel!
    @IBOutlet var currentValueFirstColorLabel: UILabel!
    @IBOutlet var nameSecondColorLabel: UILabel!
    @IBOutlet var currentValueSecondColorLabel: UILabel!
    @IBOutlet var nameThirdColorLabel: UILabel!
    @IBOutlet var currentValueThirdColorLabel: UILabel!
    
    @IBOutlet var secondColorSlider: UISlider!
    @IBOutlet var firstColorSlider: UISlider!
    @IBOutlet var thirdColorSlider: UISlider!
    
    //MARK: - Private Properties
    private var colorRed: CGFloat = 0.00
    private var colorGreen: CGFloat = 0.00
    private var colorBlue: CGFloat = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorLabels(labelName: nameFirstColorLabel,
                    labelValue: currentValueFirstColorLabel,
                    slider: firstColorSlider,
                    text: "Red:", color: .red)
        colorLabels(labelName: nameSecondColorLabel,
                    labelValue: currentValueSecondColorLabel,
                    slider: secondColorSlider,
                    text: "Green:", color: .green)
        colorLabels(labelName: nameThirdColorLabel,
                    labelValue: currentValueThirdColorLabel,
                    slider: thirdColorSlider,
                    text: "Blue:", color: .blue)
        
        mainColorView.layer.cornerRadius = 10
    }
    
    // MARK: - IB Actions
    @IBAction func firstColorSliderAction() {
        setColor(valueLabel: currentValueFirstColorLabel,
                 slider: firstColorSlider,
                 color: .red)
    }
    
    @IBAction func secondColorSliderAction() {
        setColor(valueLabel: currentValueSecondColorLabel,
                 slider: secondColorSlider,
                 color: .green)
    }
    
    @IBAction func thirdColorSliderAction() {
        setColor(valueLabel: currentValueThirdColorLabel,
                 slider: thirdColorSlider,
                 color: .blue)
    }
    
    // MARK: — Private methods for UI
    private func colorLabels(labelName: UILabel,
                             labelValue: UILabel,
                             slider: UISlider,
                             text: String,
                             color: UIColor) {
        labelName.text = text
        labelValue.text = "0.00"
        slider.minimumTrackTintColor = color
        slider.value = 0
    }
    
    private func setColor(valueLabel: UILabel,
                          slider: UISlider,
                          color: UIColor) {
        let currentValueForLabel = String(format: "%.2f", slider.value)
        valueLabel.text = currentValueForLabel
        
        switch color {
        case .red:
            colorRed = CGFloat(slider.value)
        case .green:
            colorGreen = CGFloat(slider.value)
        case .blue:
            colorBlue = CGFloat(slider.value)
        default:
            break
        }
        
        let currentColor = UIColor(red: colorRed,
                                   green: colorGreen,
                                   blue: colorBlue,
                                   alpha: 1)
        
        mainColorView.backgroundColor = currentColor
    }
}
