

import UIKit

class DayPicker: UIControl {
    var selectDay : Day? = nil {
        didSet {
            self.updateSelectedDay()
            self.sendActions(for: .valueChanged)
        }
    }
    
    private var buttons = [UIButton] ()
    private var stackView : UIStackView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
    }
    
    private func setViews() {
        
        for day in Day.allDays {
            let button = UIButton (type: .system)
            button.setTitle(day.title, for: .normal)
            button.setTitleColor(.systemGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectDay(_:)), for: .touchUpInside)
            self.buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: buttons)
         
        self.addSubview(stackView)
        
        //ручное создание констрейнтов
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: self.topAnchor),
//            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
//            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
//        ])
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    @objc func selectDay (_ button : UIButton) {
        guard
            let index = self.buttons.firstIndex(of: button),
            let day = Day(rawValue: index)
        else {
            return
        }
        self.selectDay = day
    }
    
    private func updateSelectedDay() {
        for (index, button) in self.buttons.enumerated() {
            guard let day = Day(rawValue: index) else {
                continue
            }
            button.isSelected = day == self.selectDay
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
}
