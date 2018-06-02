//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor.clear
        btn.frame = CGRect(x: 100, y: 100, width: 20, height: 20)
        btn.addTarget(self, action: #selector(animate), for: .touchUpInside)
        
        self.view.addSubview(btn)

        let checkBoxPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 20, height: 20), cornerRadius: 5.0)
        let checkBoxLayer = CAShapeLayer()
        checkBoxLayer.fillColor = UIColor.clear.cgColor
        checkBoxLayer.strokeColor = UIColor.darkGray.cgColor
        checkBoxLayer.lineWidth = 2
        checkBoxLayer.path = checkBoxPath.cgPath
        btn.layer.addSublayer(checkBoxLayer)
    }
    
    var checkBoxLayer: CAShapeLayer!
    var tickMarkLayer: CAShapeLayer!
    @objc func animate(_ sender: Any) {
        let btn = sender as! UIButton
        
        btn.isSelected = !btn.isSelected
        
        let animationDuration: CFTimeInterval = 0.3
        
        let checkBoxPathBig = UIBezierPath(roundedRect: CGRect(x: -3, y: -3, width: 26, height: 26), cornerRadius: 5.0)
        let checkBoxPathSmall = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 20, height: 20), cornerRadius: 5.0)
        
        // Create layers if not available
        if(self.checkBoxLayer == nil) {
            checkBoxLayer = CAShapeLayer()
            checkBoxLayer.fillColor = UIColor.blue.cgColor
            checkBoxLayer.path = checkBoxPathSmall.cgPath
            btn.layer.addSublayer(checkBoxLayer)
        }
        
        if(self.tickMarkLayer == nil) {
            self.tickMarkLayer = CAShapeLayer()
            self.tickMarkLayer.frame = btn.bounds
            self.tickMarkLayer.strokeColor = UIColor.white.cgColor
            self.tickMarkLayer.fillColor = nil
            self.tickMarkLayer.lineWidth = 1.5
            self.tickMarkLayer.lineJoin = kCALineJoinBevel
        }
        
        // Rounded rect animation
        let selectAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
        if(btn.isSelected) {
            selectAnimation.fromValue = checkBoxPathBig.cgPath
            selectAnimation.toValue = checkBoxPathSmall.cgPath
        } else {
            selectAnimation.fromValue = checkBoxPathSmall.cgPath
            selectAnimation.toValue = checkBoxPathBig.cgPath
        }
        selectAnimation.fillMode = kCAFillModeBoth
        selectAnimation.isRemovedOnCompletion = false
        
        // Layer fade animation
        let fadeAnim: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        if(btn.isSelected) {
            fadeAnim.fromValue = 0.0
            fadeAnim.toValue = 1.0
        } else {
            fadeAnim.fromValue = 1.0
            fadeAnim.toValue = 0.0
        }
        
        // Tick mark
        let startPoint: CGPoint = CGPoint(x: 3, y: 12)
        let midPoint: CGPoint = CGPoint(x: 8, y: 16)
        let endPoint: CGPoint = CGPoint(x: 16, y: 5)
        
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: midPoint)
        path.addLine(to: endPoint)
        self.tickMarkLayer.path = path.cgPath

        let pathAnimation = CABasicAnimation(keyPath:"strokeEnd")
        pathAnimation.duration = 0.1
        pathAnimation.fromValue = 0
        pathAnimation.toValue = 1
        
        // Create a group for all the animations
        let groupAnim: CAAnimationGroup = CAAnimationGroup()
        groupAnim.duration = animationDuration
        groupAnim.repeatCount = 1
        groupAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        groupAnim.animations = [selectAnimation, fadeAnim]
        
        CATransaction.setCompletionBlock { [unowned self] in
            if(!btn.isSelected) {
                // Remove layer when not needed
                self.checkBoxLayer.removeFromSuperlayer()
                self.checkBoxLayer = nil
                
                self.tickMarkLayer.removeFromSuperlayer()
                self.tickMarkLayer = nil
            } else {
                btn.layer.addSublayer(self.tickMarkLayer)
                self.tickMarkLayer.add(pathAnimation, forKey: nil)
            }
        }
        CATransaction.begin()
        checkBoxLayer.add(groupAnim, forKey: nil)
        CATransaction.commit()
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
