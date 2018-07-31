import UIKit
import Foundation

@IBDesignable public class WeekSlider: UIView, UITextFieldDelegate {
    private var accessibilityIdentifierCounter = 0
    public var dayConfig: [DayConfigModel]?
    
    let firstDateLabel = UIButton()
    let secondDateLabel = UIButton()
    let thirdDateLabel = UIButton()
    let fourthDateLabel = UIButton()
    let fifthDateLabel = UIButton()
    let sixthDateLabel = UIButton()
    let seventhDateLabel = UIButton()
    
    let firstDayLabel = UILabel()
    let secondDayLabel = UILabel()
    let thirdDayLabel = UILabel()
    let fourthDayLabel = UILabel()
    let fifthDayLabel = UILabel()
    let sixthDayLabel = UILabel()
    let seventhDayLabel = UILabel()
    
    var firstDayOnClick: (() -> ())?
    var secondDayOnClick: (() -> ())?
    var thirdDayOnClick: (() -> ())?
    var fourthDayOnClick: (() -> ())?
    var fifthDayOnClick: (() -> ())?
    var sixthDayOnClick: (() -> ())?
    var seventhDayOnClick: (() -> ())?
    
    public  var scrollViewColor: UIColor! = UIColor.blue
    public var textColor: UIColor! = UIColor.white
    public var highlightColor: UIColor! = UIColor.yellow
    
    @objc public var onClick: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    
    private func commonInit() {
        setupCells()
        self.backgroundColor = UIColor.clear
    }
    
    private func setupScrollView(_ scrollView: UIScrollView) {
        //scrollView.shouldIgnoreScrollingAdjustment = true
        scrollView.layer.cornerRadius = 5
        scrollView.backgroundColor = scrollViewColor
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        //Date setup
        let dateStackView = UIStackView(arrangedSubviews: [firstDateLabel, secondDateLabel, thirdDateLabel, fourthDateLabel, fifthDateLabel, sixthDateLabel, seventhDateLabel])
        
        scrollView.addSubview(dateStackView)
        scrollView.bounces = false
        
        dateStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: dateStackView.trailingAnchor, constant: 10).isActive = true
        dateStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        
        let dateStackViewCenterConstraint = dateStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        dateStackViewCenterConstraint.priority = .defaultLow
        dateStackViewCenterConstraint.isActive = true

        dateStackView.axis = .horizontal
        dateStackView.distribution = .equalSpacing
        dateStackView.alignment = .center
        dateStackView.spacing = 5.0
        dateStackView.translatesAutoresizingMaskIntoConstraints = false
        
        setupDateLabel(button: firstDateLabel, index: 0)
        
        setupDateLabel(button: secondDateLabel, index: 1)
        
        setupDateLabel(button: thirdDateLabel, index: 2)
        
        setupDateLabel(button: fourthDateLabel, index: 3)
        
        setupDateLabel(button: fifthDateLabel, index: 4)
        
        setupDateLabel(button: sixthDateLabel, index: 5)
        
        setupDateLabel(button: seventhDateLabel, index: 6)
        
        // Day of week labels
        
        let dayStackView = UIStackView(arrangedSubviews: [firstDayLabel, secondDayLabel, thirdDayLabel, fourthDayLabel, fifthDayLabel, sixthDayLabel, seventhDayLabel])
        
        scrollView.addSubview(dayStackView)
        
        dayStackView.leadingAnchor.constraint(equalTo: dateStackView.leadingAnchor).isActive = true
        dayStackView.trailingAnchor.constraint(equalTo: dateStackView.trailingAnchor).isActive = true
        
        dayStackView.bottomAnchor.constraint(equalTo: dateStackView.topAnchor, constant: 0).isActive = true
        dayStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        
        let dayStackViewCenterConstraint = dayStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        dayStackViewCenterConstraint.priority = .defaultLow
        dayStackViewCenterConstraint.isActive = true
        
        dayStackView.axis = .horizontal
        dayStackView.distribution = .equalSpacing
        dayStackView.alignment = .center
        dayStackView.spacing = 5.0
        dayStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //Config for what day to show first
        setupDayOfWeekLabel(label: firstDayLabel, index: 0)
        
        setupDayOfWeekLabel(label: secondDayLabel, index: 1)
        
        setupDayOfWeekLabel(label: thirdDayLabel, index: 2)
        
        setupDayOfWeekLabel(label: fourthDayLabel, index: 3)
        
        setupDayOfWeekLabel(label: fifthDayLabel, index: 4)
        
        setupDayOfWeekLabel(label: sixthDayLabel, index: 5)
        
        setupDayOfWeekLabel(label: seventhDayLabel, index: 6)
        
    }
    
    public func setupCells(_ removeSubViews: Bool = true) {
        if removeSubViews {
            for view in self.subviews {
                view.removeFromSuperview()
            }
        }
        
        self.clipsToBounds = true
        
        //Scrollview setup
        let scrollView = UIScrollView()
        self.addSubview(scrollView)

        self.setupScrollView(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
    }
    
    @objc func buttonClicked(_ sender: AnyObject?) {
        if(sender!.tag == 0 && firstDayOnClick != nil){
            firstDayOnClick!()
        } else if(sender!.tag == 1 && secondDayOnClick != nil) {
            secondDayOnClick!()
        } else if(sender!.tag == 2 && thirdDayOnClick != nil) {
            thirdDayOnClick!()
        } else if(sender!.tag == 3 && fourthDayOnClick != nil) {
            fourthDayOnClick!()
        } else if(sender!.tag == 4 && fifthDayOnClick != nil) {
            fifthDayOnClick!()
        } else if(sender!.tag == 5 && sixthDayOnClick != nil) {
            sixthDayOnClick!()
        } else if(sender!.tag == 6 && seventhDayOnClick != nil) {
            seventhDayOnClick!()
        }
    }
    
    private func setupDateLabel(button: UIButton, index: Int) {
        button.setTitleColor(textColor, for: .normal)
        button.contentHorizontalAlignment = .center
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        if let day = dayConfig?[safe: index] {
            var cal = Calendar.current
            cal.timeZone = TimeZone(abbreviation:"UTC")!
            button.setTitle( NumberConstants.OrdinalNumberFormatter.string(from: NSNumber(value:   cal.ordinality(of: .day, in: .month, for: day.date) ?? 1)), for: .normal)
            
            button.tag = index
            
            if(button.tag == 0){
                firstDayOnClick = day.onClick
            } else if(button.tag == 1) {
                secondDayOnClick = day.onClick
            } else if(button.tag == 2) {
                thirdDayOnClick = day.onClick
            } else if(button.tag == 3) {
                fourthDayOnClick = day.onClick
            } else if(button.tag == 4) {
                fifthDayOnClick = day.onClick
            } else if(button.tag == 5) {
                sixthDayOnClick = day.onClick
            } else if(button.tag == 6) {
                seventhDayOnClick = day.onClick
            }
            
            if(day.highlighted) {
                button.backgroundColor = self.highlightColor
            }
            
            button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        }
    }
    
    private func setupDayOfWeekLabel(label: UILabel, index: Int) {
        label.textColor = textColor
        label.textAlignment = .center
        
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        label.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        label.font = UIFont.systemFont(ofSize: 14)
        
        if let day = dayConfig?[safe: index] {
            label.text = DateConstants.UTCDayOfWeekFormatter.string(from: day.date)
        }
    }
    
    
    private func bindDayOfWeekLabels() {
        let setDayOfWeek: (UILabel, Int) -> Void = { (label, index) in
            if let day = self.dayConfig?[safe: index] {
                label.text = DateConstants.UTCDayOfWeekFormatter.string(from: day.date)
            }
        }
        setDayOfWeek(self.firstDayLabel, 0)
        setDayOfWeek(self.secondDayLabel, 1)
        setDayOfWeek(self.thirdDayLabel, 2)
        setDayOfWeek(self.fourthDayLabel, 3)
        setDayOfWeek(self.fifthDayLabel, 4)
        setDayOfWeek(self.sixthDayLabel, 5)
        setDayOfWeek(self.seventhDayLabel, 6)
    }
    
    private func bindDateLabels() {
        let setDateOfWeek: (UIButton, Int) -> Void = { (button, index) in
            if let day = self.dayConfig?[safe: index] {
                var cal = Calendar.current
                cal.timeZone = TimeZone(abbreviation:"UTC")!
                button.setTitle(NumberConstants.OrdinalNumberFormatter.string(from: NSNumber(value:   cal.ordinality(of: .day, in: .month, for: day.date) ?? 1)), for: .normal)
            }
        }
        setDateOfWeek(self.firstDateLabel, 0)
        setDateOfWeek(self.secondDateLabel, 1)
        setDateOfWeek(self.thirdDateLabel, 2)
        setDateOfWeek(self.fourthDateLabel, 3)
        setDateOfWeek(self.fifthDateLabel, 4)
        setDateOfWeek(self.sixthDateLabel, 5)
        setDateOfWeek(self.seventhDateLabel, 6)
    }


    func bindData() {
        self.bindDayOfWeekLabels()
        self.bindDateLabels()
    }
 
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
}
