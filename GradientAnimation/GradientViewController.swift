import UIKit

class GradientViewController: UIViewController {

    var gradient: GradientProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gradient = GradientProgressView(frame: view.frame)
        view.addSubview(gradient)
    }

    override func viewDidAppear(animated: Bool) {
        gradient.performAnimation()
    }
}
