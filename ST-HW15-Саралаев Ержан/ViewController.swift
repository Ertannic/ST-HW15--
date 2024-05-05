//
//  ViewController.swift
//  ST-HW15-Саралаев Ержан
//
//  Created by Ertannic Saralay on 05.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(urlRequest: "https://cat-fact.herokuapp.com/facts")
    }
 
    func getData(urlRequest: String) {
        let urlRequest = URL(string: urlRequest)
        guard let url = urlRequest else {
            print("Ошибка: Неккоректная ссылка")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Ошибка: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Ошибка: Некорректный ответ сервера")
                return
            }
            
            print("Код ответа от сервера: \(httpResponse.statusCode)")
            
            guard let data = data else {
                print("Ошибка: Отсутствуют данные")
                return
            }
            
            if let dataAsString = String(data: data, encoding: .utf8) {
                print("Данные, пришедшие с сервера: \(dataAsString)")
            } else {
                print("Ошибка: не удалось преоброзовать данные в строку")
            }
            
        }.resume()
    }
    
}
