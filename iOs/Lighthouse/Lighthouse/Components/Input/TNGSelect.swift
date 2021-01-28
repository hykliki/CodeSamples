//
//  TNGSelect.swift
//  Lighthouse
//
//  Created by Dmitry on 2021-01-26.
//  Copyright © 2021 Dmitry. All rights reserved.
//

import Foundation
import UIKit

import RxCocoa
import RxSwift

import MaterialComponents.MaterialBottomSheet
import MaterialComponents.MaterialShapeScheme


class TNGSelect: TNGTextInput {


    override func setupRx() {
        super.setupRx()
        let tapGesture = UITapGestureRecognizer()
        addGestureRecognizer(tapGesture)

        tapGesture.rx.event.bind(onNext: { recognizer in
            self.presentSelection()
            print("touches: \(recognizer.numberOfTouches)")
        }).disposed(by: disposeBag)
    }
    override func getNibName() -> String {
        return "TNGTextInput"
    }

    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }

    func presentSelection() {
        let viewController: UIViewController = AccountSelectionViewController()
        //viewController.view.roundCorners([.topLeft, .topRight], radius: 15)

        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: viewController)
        let shapeGenerator = roundCorners()
        bottomSheet.setShapeGenerator(shapeGenerator, for: .preferred)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .extended)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .closed)
        bottomSheet.title = "MyTitle"




        //bottomSheet.contentViewController.roundCorners([.topLeft, .topRight], radius: 15)

        if let pvc = parentViewController {
            pvc.present(bottomSheet, animated: true, completion: nil)
        }


    }

    func roundCorners() -> MDCShapeGenerating {
        let shapeGenerator = MDCRectangleShapeGenerator()
        let cornerTreatment = MDCRoundedCornerTreatment(radius: 15)
        shapeGenerator.topLeftCorner = cornerTreatment
        shapeGenerator.topRightCorner = cornerTreatment

        return shapeGenerator
    }

}
