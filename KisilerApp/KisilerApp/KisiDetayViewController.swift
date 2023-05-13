//
//  KisiDetayViewController.swift
//  KisilerApp
//
//  Created by Salih Yusuf Göktaş on 11.05.2023.
//

import UIKit

class KisiDetayViewController: UIViewController {
	
	@IBOutlet weak var kisiAdLabel: UILabel!
	@IBOutlet weak var kisiTelLabel: UILabel!

	var kisi:Kisiler?
	
	override func viewDidLoad() {
        super.viewDidLoad()

		if let k = kisi {
			kisiAdLabel.text = k.kisi_ad
			kisiTelLabel.text = k.kisi_tel
		}
       
    }
    
}
