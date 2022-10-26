//
//  AutorRepository.swift
//  LearningTask-5.4
//
//  Created by rafael.rollo on 09/03/2022.
//

import Foundation

class AutorRepository {
    
    static func salva(_ autor: Autor) {
        let tempoDeProcessamento = 1.2 // segundos
        DispatchQueue.main.asyncAfter(deadline: .now() + tempoDeProcessamento) {
            // código que envia o request com o autor para o backend aqui
            print(autor)
        }
    }
    
}
