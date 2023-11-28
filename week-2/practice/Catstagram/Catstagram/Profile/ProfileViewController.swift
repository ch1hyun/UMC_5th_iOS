//
//  ProfileViewController.swift
//  Catstagram
//
//  Created by Oh Chi Hyun on 2023/11/20.
//

import UIKit

class ProfileViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    // MARK: - Actions
    
            
    // MARK: - Helpers
    private func setupCollectionView() {
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        profileCollectionView.register(
            UINib(nibName: "ProfileCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier
        )
        
        profileCollectionView.register(
            UINib(nibName: "PostCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: PostCollectionViewCell.identifier
        )
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // 섹션 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // 셀의 개수
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        print("cell count >> ", section)
        switch section {
        case 0:
            return 1
        default:
            return 24
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        print(section)
        
        switch section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else {
                //return UICollectionViewCell()
                fatalError("셀 타입 캐스팅 실패...")
            }
            print(cell)
            
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else {
                //return UICollectionViewCell()
                fatalError("셀 타입 캐스팅 실패...")
            }
            
            return cell
        }
    }
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        print("size determinant >> ", section)
        
        switch section {
        case 0:
            print(collectionView.frame.width)
            print(CGFloat(159))
            print(CGSize(
                width: collectionView.frame.width,
                height: CGFloat(159)
            ))
            return CGSize(
                width: collectionView.frame.width,
                height: CGFloat(159)
            )
        default:
            let side = CGFloat((collectionView.frame.width / 3) - (4/3))
            return CGSize(
                width: side, height: side
            )
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        print("inter item spacing", section)
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        print("line spacing", section)
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
}
