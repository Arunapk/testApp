import UIKit

final class DashboardCurvedView: UIView {
    public let contentView = UIView()
    public var curveDepth: CGFloat = 200

    private let shapeLayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        layer.insertSublayer(shapeLayer, at: 0)

        // Add container for child UI
        contentView.backgroundColor = .clear
        addSubview(contentView)

        layer.masksToBounds = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let maxDepth = bounds.width * 0.45
        let depth = min(max(curveDepth, 30), maxDepth)

        contentView.frame = bounds

        let w = bounds.width
        let h = bounds.height
        let curveX = w - depth
        let midY = h * 1

        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: curveX, y: 0))

        // Curve only top → midY
        path.addCurve(
            to: CGPoint(x: w, y: midY),
            controlPoint1: CGPoint(x: w, y: h * 0.05),
            controlPoint2: CGPoint(x: w + depth * 0.5, y: midY * 0.8)
        )

        // Straight line down to bottom-right
        path.addLine(to: CGPoint(x: w, y: h))
        path.addLine(to: CGPoint(x: 0, y: h))
        path.close()

        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor

        // Optional shadow
        layer.shadowPath = path.cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.12
        layer.shadowRadius = 12
        layer.shadowOffset = CGSize(width: 0, height: 6)
    }
}
