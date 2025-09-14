//
//  CompanyTVCell.swift
//  testApp
//
//  Created by Esakki - iOS on 14/09/25.
//

import UIKit

class CompanyTVCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var locLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var phoneNumLbl: UILabel!
    @IBOutlet weak var mailLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        self.bgView.cornerRadius(12)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(company: Client){
        debugPrint(company.clientName)
        nameLbl.text = company.clientName
        locLbl.text = company.clientLoc?.location
        userNameLbl.text = company.contactPersonName
        phoneNumLbl.text = "☏\(company.mobile)"
        mailLbl.text = "@\(company.email)"
    }
    
}
