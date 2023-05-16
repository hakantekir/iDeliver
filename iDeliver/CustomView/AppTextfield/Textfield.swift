
import UIKit


class CustomTextField: UITextField {

    // Aşağıdaki metin, textfield etrafındaki üstteki metindir.
    var topText: String? {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        // Üstteki metni yazdırın.
        if let text = topText {
            let style = NSMutableParagraphStyle()
            style.alignment = .center

            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 12),
                .paragraphStyle: style,
                .foregroundColor: UIColor.gray
            ]

            let topTextRect = CGRect(x: 0, y: 0, width: rect.width, height: 20)
            let topTextString = NSAttributedString(string: text, attributes: attributes)
            topTextString.draw(in: topTextRect)
        }
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        // TextField'in boyutunu ayarla ve altındaki metin gösterilir.
        return CGRect(x: 0, y: 20, width: bounds.width, height: bounds.height - 20)
    }
}

