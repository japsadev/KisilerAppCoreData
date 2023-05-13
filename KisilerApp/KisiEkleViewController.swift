//
//  KisiEkleViewController.swift
//  KisilerApp
//
//  Created by Salih Yusuf Göktaş on 11.05.2023.
//

import UIKit

class KisiEkleViewController: UIViewController {

	let context = appDelegate.persistentContainer.viewContext
	
	@IBOutlet weak var ekleButtonSekil: UIButton!
	@IBOutlet weak var kisiAdTextField: UITextField!
	@IBOutlet weak var kisiTelTextField: UITextField!

	override func viewDidLoad() {
        super.viewDidLoad()
		
		//Klavye kapatma
		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector (closeTheKeyboard))
		view.addGestureRecognizer (gestureRecognizer)

		//keyboardı number pad gibi göstermek için
		kisiTelTextField.keyboardType = UIKeyboardType.numberPad
		
		//ekle butonunun şeklini değiştirmek için yazdık
		ekleButtonSekil.backgroundColor = UIColor.init(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
		ekleButtonSekil.layer.cornerRadius = 25.0
		ekleButtonSekil.tintColor = UIColor.white
		
		//ekle butonuna shadow atadık
		ekleButtonSekil.layer.shadowColor = UIColor.darkGray.cgColor
		ekleButtonSekil.layer.shadowRadius = 4
		ekleButtonSekil.layer.shadowOpacity = 0.5
		ekleButtonSekil.layer.shadowOffset = CGSize(width: 0, height: 0)
		
    }
	
	@objc func closeTheKeyboard () {
		
		view.endEditing(true)
		
	}
    
	@IBAction func ekle(_ sender: Any) {
		
		if let ad = kisiAdTextField.text, let tel = kisiTelTextField.text {
			
			let kisi = Kisiler(context: context)
			kisi.kisi_ad = ad
			kisi.kisi_tel = tel
			
			appDelegate.saveContext()
		}
		
	}
}
