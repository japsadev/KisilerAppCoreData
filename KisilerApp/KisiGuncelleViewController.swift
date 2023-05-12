//
//  KisiGuncelleViewController.swift
//  KisilerApp
//
//  Created by Salih Yusuf Göktaş on 11.05.2023.
//

import UIKit

class KisiGuncelleViewController: UIViewController {
	
	let context = appDelegate.persistentContainer.viewContext

	@IBOutlet weak var guncelleButtonSekil: UIButton!
	@IBOutlet weak var kisiAdTextField: UITextField!
	@IBOutlet weak var kisiTelTextField: UITextField!
	
	var kisi:Kisiler?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		if let k = kisi {
			kisiAdTextField.text = k.kisi_ad
			kisiTelTextField.text = k.kisi_tel
		}
		
		//Klavye kapatma
		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector (closeTheKeyboard))
		view.addGestureRecognizer (gestureRecognizer)

		//keyboardı number pad gibi göstermek için
		kisiTelTextField.keyboardType = UIKeyboardType.numberPad
		
		//guncelle butonunun şeklini değiştirmek için yazdık
		guncelleButtonSekil.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
		guncelleButtonSekil.layer.cornerRadius = 25.0
		guncelleButtonSekil.tintColor = UIColor.white
		
		//guncelle butonuna shadow atadık
		guncelleButtonSekil.layer.shadowColor = UIColor.darkGray.cgColor
		guncelleButtonSekil.layer.shadowRadius = 4
		guncelleButtonSekil.layer.shadowOpacity = 0.5
		guncelleButtonSekil.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
	@objc func closeTheKeyboard () {
		
		view.endEditing(true)
		
	}
	
	@IBAction func guncelle(_ sender: Any) {
		if let k = kisi, let ad = kisiAdTextField.text, let tel = kisiTelTextField.text {
			
			k.kisi_ad = ad
			k.kisi_tel = tel
			
			appDelegate.saveContext()
			
		}
	}
	
}
