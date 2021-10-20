//
//  ViewController.swift
//  RevisaoCollectionView
//
//  Created by Rayana Prata Neves on 20/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    // duas imagens por linha
    // ocupa 1 terco da tela
    lazy var elephantCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 50.50, height: 50.0)
        
        // espaco mínimo entre elementos na mesma linha
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 40
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // é preciso falar que o delegate e o datasource é da nossa viewController
        // pra por ele aqui dentro tive que setar a var elephantCollectionView como lazy
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // tirar o indicador de scoll
        collectionView.showsHorizontalScrollIndicator = true
        
        return collectionView
    }()

    fileprivate func createCollection() {
        NSLayoutConstraint.activate([
            elephantCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0/3.0),
            elephantCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            elephantCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            elephantCollectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    fileprivate func createCustomCell() {
        let nibCell = UINib(nibName: CustomTableViewCell.id, bundle: nil)
        elephantCollectionView.register(nibCell, forCellWithReuseIdentifier: CustomTableViewCell.id)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adicionar collectionView na tela
        self.view.addSubview(elephantCollectionView)
        
        createCustomCell()
        createCollection()
    }

}

// nos avisa quando acontece algo com a collection ou table view
extension ViewController: UICollectionViewDelegate {
    
}

// passa informacoes para a collection ou table view
extension ViewController: UICollectionViewDataSource {
    
    // funcao que eu passo a quantidade de sessoes
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // funcao que eu passo o número de itens por sessao
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // qual celula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTableViewCell.id, for: indexPath)
        return cell
    }
    
}
