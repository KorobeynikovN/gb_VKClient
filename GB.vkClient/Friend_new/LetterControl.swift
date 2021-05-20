//
//  LetterControl.swift
//  GB.vkClient
//
//  Created by Николай Коробейников on 19.05.2021.
//

import UIKit

class LetterControl: UIControl {
    
    var selectLetter : String? = nil {
        didSet{
            self.updateSelectLetter()
            self.sendActions(for: .valueChanged)
        }
    }

    var letters = [String] ()
    private var buttons: [UIButton] = []
    private var stackViewLetters: UIStackView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }

    func setupView() {
        for letter in letters {
            let button = UIButton(type: .system)
            button.setTitle(letter, for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectLetter(_ :)), for: .touchUpInside)
            self.buttons.append(button)
        }

        stackViewLetters = UIStackView(arrangedSubviews: self.buttons)

        self.addSubview(stackViewLetters)

        stackViewLetters.spacing = 0
        stackViewLetters.axis = .vertical
        stackViewLetters.alignment = .center
        stackViewLetters.distribution = .fillEqually
    }

    private func updateSelectLetter() {
        for (index, button) in self.buttons.enumerated() {
            let letter = letters[index]
            button.isSelected = letter == self.selectLetter
        }
    }

    @objc private func selectLetter(_ sender : UIButton) {
        guard let index = self.buttons.firstIndex(of: sender) else {return}
        let letter = letters[index]
        self.selectLetter = letter
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.stackViewLetters.frame = bounds
    }

}
