import UIKit

final class likeControl : UIControl {
    var imageView = UIImageView ()
    var likeCountLabel = UILabel()
    var likeCount = 999
    var  isLike : Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    func setView() {
        self.addSubview(imageView)
        self.addTarget(self, action: #selector(tapControl), for: .touchUpInside)
        imageView.tintColor = .systemGray
        imageView.image = UIImage(systemName: "heart.fill")
        
    }
    
    func setLike(count: Int) {
        likeCount = count
        setLikeCountLabel()
    }
    
    func setLikeCountLabel () {
        addSubview(likeCountLabel)
        let likeString : String?
        
        switch likeCount {
        case 0:
            likeString = ""
        case 1..<1000:
            likeString = String(self.likeCount)
        case 1000..<1_000_000:
            likeString = String(self.likeCount/1000) + "K"
        default:
            likeString = ""
        }
        UIView.transition(with: likeCountLabel,
                          duration: 0.3,
                          options: .transitionFlipFromTop,
                          animations: {[unowned self] in self.likeCountLabel.text = String(likeString!)}
                        )
        likeCountLabel.textColor = .blue
        likeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        likeCountLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5).isActive = true
        likeCountLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
    }
    
    @objc func tapControl () {
        //меняет занчение переменной bool на противоположенное текущемуззззз
        isLike.toggle()
        if isLike {
            imageView.image = UIImage(systemName: "heart.fill")
            imageView.tintColor = .red
            likeCount += 1
            setLikeCountLabel()
        } else {
            imageView.image = UIImage(systemName: "heart.fill")
            imageView.tintColor = .systemGray
            likeCount -= 1
            setLikeCountLabel()
        }
        
        sendActions(for: .valueChanged)
        print("like")
        
    }

}
