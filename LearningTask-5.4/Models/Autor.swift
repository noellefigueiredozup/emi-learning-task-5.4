//
//  Autor.swift
//  LearningTask-5.4
//
//  Created by Noelle Figueiredo on 26/10/22.
//

import Foundation

struct Autor {
    let fotoURI: String
    let nome: String
    let sobrenome: String
    let bio: String
    let tecnologias: String
    
//    let nomeCompleto: String // porque?
    
    init(fotoURI: String, nomeCompleto: String, bio: String, tecnologias: String) {
        self.fotoURI = fotoURI
        self.bio = bio
        self.tecnologias = tecnologias
        (self.nome, self.sobrenome) = Autor.formataNome(nomeDeAutor: nomeCompleto)
    }
    
    private static func formataNome(nomeDeAutor: String) -> (String, String) {
        let separador = " "
        let nomeCompleto = nomeDeAutor.components(separatedBy: separador)
        return (nomeCompleto.first!, nomeCompleto.dropFirst().joined(separator: separador))
    }
}
