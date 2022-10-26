//
//  ViewController.swift
//  LearningTask-5.4
//
//  Created by rafael.rollo on 09/03/2022.
//

import UIKit

class AutorFormViewController: UIViewController {
    
    typealias MensagemDeErro = String

    @IBOutlet weak var fotoTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var tecnologiasTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func botaoSalvarPressionado(_ sender: UIButton) {
        switch validaFormulario(){
        case (false, let mensagem):
            apresentaAlerta(titulo: "Erro", mensagem: mensagem)
            
        case (true, _):
            
            // tem maneira melhor de inicializar essa dependencia?
            let autor = Autor(
                fotoURI: fotoTextField.text!,
                nomeCompleto: nomeTextField.text!,
                bio: bioTextField.text!,
                tecnologias: fotoTextField.text!)
            
            AutorRepository.salva(autor)
            
            apresentaAlerta(titulo: "Tudo Certo", mensagem: "Seus dados estão sendo enviados para o banco de dados")
        }
    }
    
    func nomeDeAutorValido(_ nome: String) -> Bool {
        let pattern = #"^[a-zA-Z-]+ ?.* [a-zA-Z-]+$"#
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: nome)
    }
    
//    // foi passado para Autor como funcao estatica
//    func formata(nomeDeAutor: String) -> (String, String) {
//        let separador = " "
//        let nomeCompleto = nomeDeAutor.components(separatedBy: separador)
//        return (nomeCompleto.first!, nomeCompleto.dropFirst().joined(separator: separador))
//    }
    
    func validaFormulario() -> (Bool, MensagemDeErro?) {
        if let fotoUrl = fotoTextField.text, fotoUrl.isEmpty {
            return (false, "A URL para foto não pode estar em branco.")
        }
        
        if let nome = nomeTextField.text {
            if nome.isEmpty {
                return (false, "O nome não pode estar em branco")
            }
            guard nomeDeAutorValido(nome) else {
                return (false, "O nome é invalido.")
            }
        }
        
        if let bio = bioTextField.text, bio.isEmpty {
            return (false, "A bio não pode estar em branco.")
        }
        
        if let tecnologias = tecnologiasTextField.text, tecnologias.isEmpty {
            return (false, "Tecnologias não pode estar em branco.")
        }
        return (true, nil)
    }
    
    func apresentaAlerta(titulo: String, mensagem: String?) {
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
