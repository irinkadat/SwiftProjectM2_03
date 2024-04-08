//
//  LoginViewController.swift
//  SwiftProjectM2_03
//
//  Created by Irinka Datoshvili on 07.04.24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let logoImageView = UIImageView(image: UIImage(named: "lock"))
    let authenticationText = UILabel()
    let inputStackView = UIStackView()
    let authLabelSV = UIStackView()
    let textStackView = UIStackView()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = .white
        
        logoStackView()
        addStackView()
        textStackV()
        addAuthenticationText()
        addInputStackView()
        addSubButton()
        addLinesSeparator()
        addButtonsStackView()
        
    }
    
    func addStackView() {
        self.view.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    func logoStackView() {
        
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImageView.widthAnchor.constraint(equalToConstant: 90),
            logoImageView.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    
    func textStackV() {
        
        textStackView.axis = .vertical
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.spacing = 8
        textStackView.distribution = .fillProportionally
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let greetingText = UILabel()
        greetingText.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "მოგესალმებით!"
        label.font = UIFont.systemFont(ofSize: 24)
        greetingText.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია."
        greetingText.font = UIFont.systemFont(ofSize: 14)
        greetingText.numberOfLines = 0
        textStackView.addArrangedSubview(label)
        textStackView.addArrangedSubview(greetingText)
        mainStackView.addArrangedSubview(textStackView)
        
        NSLayoutConstraint.activate([
            textStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            textStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
        ])
        
    }
    
    func addAuthenticationText() {
        authLabelSV.translatesAutoresizingMaskIntoConstraints = false
        authLabelSV.axis = .vertical
        authLabelSV.distribution = .fill
        authLabelSV.spacing = 10
        
        authenticationText.text = "ავტორიზაცია"
        view.addSubview(authenticationText)
        authenticationText.font = UIFont.systemFont(ofSize: 14)
        authenticationText.textAlignment = .center
        authenticationText.translatesAutoresizingMaskIntoConstraints = false
        authLabelSV.addArrangedSubview(authenticationText)
        
        let line = UIView()
        line.backgroundColor = UIColor(red: 51/255, green: 165/255, blue: 229/255, alpha: 1.0)
        line.heightAnchor.constraint(equalToConstant: 2).isActive = true
        authLabelSV.addArrangedSubview(line)
        
        mainStackView.addArrangedSubview(authLabelSV)
        
    }
    
    func addInputStackView() {
        inputStackView.axis = .vertical
        inputStackView.spacing = 8
        inputStackView.distribution = .fillEqually
        inputStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let createInputFieldStack = { (labelText: String, placeholder: String) -> UIStackView in
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.spacing = 4
            
            let label = UILabel()
            label.text = labelText
            label.font = UIFont.systemFont(ofSize: 14)
            label.setContentHuggingPriority(.required, for: .vertical)
            
            
            let textField = UITextField()
            textField.placeholder = placeholder
            textField.font = UIFont.systemFont(ofSize: 12)
            textField.layer.borderWidth = 1.0
            textField.layer.cornerRadius = 4.0
            textField.layer.masksToBounds = true
            
            let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 1))
            
            textField.leftView = leftPaddingView
            textField.leftViewMode = .always
                    
            stackView.addArrangedSubview(label)
            stackView.addArrangedSubview(textField)
            
            return stackView
        }
        
        let nameInputStack = createInputFieldStack("სრული სახელი", "მაგ: ქეთინო ფერი")
        let emailInputStack = createInputFieldStack("ელ. ფოსტა", "მაგ: kusuna@mail.ru")
        let passwordInputStack = createInputFieldStack("პაროლი", "მაგ: busuna123, jajanaIsMyKumiri2010")
        
        inputStackView.addArrangedSubview(nameInputStack)
        inputStackView.addArrangedSubview(emailInputStack)
        inputStackView.addArrangedSubview(passwordInputStack)
        
        mainStackView.addArrangedSubview(inputStackView)
        
        NSLayoutConstraint.activate([
            inputStackView.topAnchor.constraint(equalTo: authLabelSV.bottomAnchor, constant: 20),
            
        ])
    }
    func addSubButton() {
        let submitButtonSV = UIStackView()
        submitButtonSV.translatesAutoresizingMaskIntoConstraints = false
        submitButtonSV.distribution = .fill
        let submitButton = UIButton(type: .system)
        submitButton.setTitle("შესვლა", for: .normal)
        submitButton.setTitleColor(.white, for: .normal)
        
        submitButton.backgroundColor = UIColor(red: 51/255, green: 165/255, blue: 229/255, alpha: 1.0)
        
        submitButton.layer.cornerRadius = 12.0
        submitButton.layer.masksToBounds = true
        
        submitButtonSV.addArrangedSubview(submitButton)
        mainStackView.addArrangedSubview(submitButtonSV)
        
        submitButtonSV.topAnchor.constraint(equalTo: inputStackView.bottomAnchor, constant: 20).isActive = true
    }
    
    
    func addLinesSeparator() {
        let separatorStackView = UIStackView()
        separatorStackView.axis = .horizontal
        separatorStackView.spacing = 18
        separatorStackView.distribution = .fill
        separatorStackView.alignment = .center
        separatorStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let orLabel = UILabel()
        orLabel.text = "ან"
        orLabel.font = UIFont.systemFont(ofSize: 14)
        orLabel.setContentHuggingPriority(.required, for: .horizontal)
        orLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        let leftLine = UIView()
        leftLine.backgroundColor = .lightGray
        leftLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let rightLine = UIView()
        rightLine.backgroundColor = .lightGray
        rightLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        separatorStackView.addArrangedSubview(leftLine)
        separatorStackView.addArrangedSubview(orLabel)
        separatorStackView.addArrangedSubview(rightLine)
        
        separatorStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftLine.widthAnchor.constraint(equalTo: rightLine.widthAnchor),
        ])
        
        mainStackView.addArrangedSubview(separatorStackView)
        
    }
    
    func addButtonsStackView() {
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = 12
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.distribution = .fillEqually
        
        let googleButton = createButton(text: "გამოიყენეთ გული", image: "g.circle")
        let facebookButton = createButton(text: "გამოიყენეთ ფეიზბურგი", image: "f.circle")
        
        buttonsStackView.addArrangedSubview(googleButton)
        buttonsStackView.addArrangedSubview(facebookButton)
        
        mainStackView.addArrangedSubview(buttonsStackView)
        
        buttonsStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor).isActive = true
        
        let totalButtonHeight = googleButton.intrinsicContentSize.height + facebookButton.intrinsicContentSize.height + CGFloat(buttonsStackView.spacing)
        buttonsStackView.heightAnchor.constraint(equalToConstant: totalButtonHeight).isActive = true
    }
    
    func createButton(text: String, image: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        button.layer.cornerRadius = 12.0
        
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 8
        buttonStackView.distribution = .fill
        buttonStackView.alignment = .center
        
        let buttonImageView = UIImageView(image: UIImage(named: image))
        buttonImageView.contentMode = .scaleAspectFit
        buttonImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        let buttonLabel = UILabel()
        buttonLabel.text = text
        buttonLabel.font = UIFont.systemFont(ofSize: 14)
        
        buttonStackView.addArrangedSubview(buttonImageView)
        buttonStackView.addArrangedSubview(buttonLabel)
        
        button.addSubview(buttonStackView)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            buttonStackView.leadingAnchor.constraint(greaterThanOrEqualTo: button.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(lessThanOrEqualTo: button.trailingAnchor)
        ])
        
        return button
    }
}
#Preview {
    LoginViewController()
}
