//
//  AddPhotoViewController.swift
//  PhotoCollection
//
//  Created by Uptiie on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol PhotoPickerDelegate {
    func photoWasChosen(_ photo: UIImagePickerControllerDelegate)
}

class AddPhotoViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var imageTextField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var delegate: PhotoPickerDelegate?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = imageTextField.text, let imageData = photoImageView.image?.pngData() else {return}
        
        if let photo = photo {
            
            updateViews()
            navigationController?.popViewController(animated: true)
            
        } else {
            
            let newerPhoto = Photo(imageData: imageData, title: title)
            photoController?.createPhoto(photo: newerPhoto)
            navigationController?.popViewController(animated: true)
        }
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else {return}
        
        if theme == "Dark" {
            view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        } else {
            view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
        
        
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo, let imageTitle = imageTextField.text else { return}
        photoImageView.image = UIImage(data: photo.imageData)
        imageTextField.text = imageTitle
    }

}

extension AddPhotoViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let imageURL = info[.imageURL] as? URL else {return}
        
        guard let data = try? Data.init(contentsOf: imageURL) else {return}
        photoImageView.image = UIImage(data: data)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension AddPhotoViewController: UINavigationControllerDelegate{}
