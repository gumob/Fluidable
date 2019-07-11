//
//  MainSpec+Transition.swift
//  Fluidable
//
//  Created by kojirof on 2019/07/09.
//  Copyright © 2019 Gumob. All rights reserved.
//

import Quick
import Nimble
import AutoMate

@testable import Fluidable

extension MainSpec {
    func finishAnimatedPresent(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) {
        /* NOTE: Wait until collection view is ready */
        let collectionView: XCUIElement = app.collectionViews.element(matching: .collectionView, identifier: "rootCollectionView")
        expect(collectionView.exists).toEventually(beTrue(), timeout: 10)
        /* NOTE: Scroll until the collection targetView is found */
        var collectionCell: XCUIElement!
        while (true) {
            collectionCell = collectionView.cells.element(matching: .cell, identifier: model.rootCellAccessibilityIdentifier)
            if collectionCell.isVisible {
                collectionCell.tap()
                break
            } else {
                collectionView.swipeUp()
            }
        }
        usleep(sec: 2.0)
    }

    func cancelAnimatedPresent(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) {
        /* NOTE: Wait until collection view is ready */
        let collectionView: XCUIElement = app.collectionViews.element(matching: .collectionView, identifier: "rootCollectionView")
        expect(collectionView.exists).toEventually(beTrue(), timeout: 10)
        /* NOTE: Scroll until the collection targetView is found */
        var collectionCell: XCUIElement!
        while (true) {
            collectionCell = collectionView.cells.element(matching: .cell, identifier: model.rootCellAccessibilityIdentifier)
            if collectionCell.isVisible {
                collectionCell.tap()
                break
            } else {
                collectionView.swipeUp()
            }
        }
        usleep(sec: 2.0)
    }

    func finishInteractivePresent(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) {
        /* NOTE: Wait until collection view is ready */
        let collectionView: XCUIElement = app.collectionViews.element(matching: .collectionView, identifier: "rootCollectionView")
        expect(collectionView.exists).toEventually(beTrue(), timeout: 10)
        /* NOTE: Scroll until the collection targetView is found */
        var collectionCell: XCUIElement!
        while (true) {
            collectionCell = collectionView.cells.element(matching: .cell, identifier: model.rootCellAccessibilityIdentifier)
            if collectionCell.isVisible {
                collectionCell.tap()
                break
            } else {
                collectionView.swipeUp()
            }
        }
        usleep(sec: 2.0)
    }

    func cancelInteractivePresent(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) {
        /* NOTE: Wait until collection view is ready */
        let collectionView: XCUIElement = app.collectionViews.element(matching: .collectionView, identifier: "rootCollectionView")
        expect(collectionView.exists).toEventually(beTrue(), timeout: 10)
        /* NOTE: Scroll until the collection targetView is found */
        var collectionCell: XCUIElement!
        while (true) {
            collectionCell = collectionView.cells.element(matching: .cell, identifier: model.rootCellAccessibilityIdentifier)
            if collectionCell.isVisible {
                collectionCell.tap()
                break
            } else {
                collectionView.swipeUp()
            }
        }
        usleep(sec: 2.0)
    }

    func finishAnimatedDismissByTappingCloseButton(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) {
        let button: XCUIElement = app.buttons.element(matching: .button, identifier: model.overlayCloseButtonAccessibilityIdentifier)
        expect(button.isVisible).toEventually(beTrue(), timeout: 10)
        button.tap()
        usleep(sec: 2.0)
        /* NOTE: Check whether the view controller already disappears */
        let visibleView: XCUIElement = app.otherElements.element(matching: .other, identifier: model.visibleControllerViewAccessibilityIdentifier)
        expect(visibleView.exists).toNotEventually(beTrue(), timeout: 10)
    }

    func finishAnimatedDismissByTappingContainer(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) {
        /* NOTE: Perform dismiss */
        let containerView: XCUIElement = app.otherElements.element(matching: .other, identifier: model.containerViewAccessibilityIdentifier)
        expect(containerView.exists).toEventually(beTrue(), timeout: 10)
        switch model {
        case .navigationFluidModal, .transitionFluidModal,
             .navigationDrawerTop, .transitionDrawerTop:
            containerView.coordinate(withNormalizedOffset: CGVector(dx: 0.1, dy: 0.9)).tap()
        case .navigationDrawerBottom, .transitionDrawerBottom:
            containerView.coordinate(withNormalizedOffset: CGVector(dx: 0.1, dy: 0.1)).tap()
        case .navigationDrawerLeft, .transitionDrawerLeft:
            containerView.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.1)).tap()
        case .navigationDrawerRight, .transitionDrawerRight:
            containerView.coordinate(withNormalizedOffset: CGVector(dx: 0.1, dy: 0.1)).tap()
        case .navigationFluidFullScreen, .transitionFluidFullScreen,
             .navigationSlideTop, .transitionSlideTop,
             .navigationSlideBottom, .transitionSlideBottom,
             .navigationSlideLeft, .transitionSlideLeft,
             .navigationSlideRight, .transitionSlideRight:
            let button: XCUIElement = app.buttons.element(matching: .button, identifier: model.overlayCloseButtonAccessibilityIdentifier)
            expect(button.isVisible).toEventually(beTrue(), timeout: 10)
            button.tap()
        }
        usleep(sec: 2.0)
        /* NOTE: Check whether the view controller already disappears */
        let visibleView: XCUIElement = app.otherElements.element(matching: .other, identifier: model.visibleControllerViewAccessibilityIdentifier)
        expect(visibleView.exists).toNotEventually(beTrue(), timeout: 10)
    }

    func pushViewController(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) {
        switch model.className {
        case "NavigationCollectionViewController":
            let collectionView: XCUIElement = app.collectionViews.element(matching: .collectionView, identifier: model.parentCollectionViewAccessibilityIdentifier)
            let cell: XCUIElement = collectionView.cells.element(boundBy: 0)
            expect(cell.isVisible).toEventually(beTrue(), timeout: 10)
            cell.tap()
            usleep(sec: 2.0)

        case "NavigationMultiCollectionViewController":
            let collectionView: XCUIElement = app.collectionViews.element(matching: .collectionView, identifier: model.childFirstCollectionViewAccessibilityIdentifier)
            let cell: XCUIElement = collectionView.cells.element(boundBy: 0)
            expect(cell.isVisible).toEventually(beTrue(), timeout: 10)
            cell.tap()
            usleep(sec: 2.0)

        case "NavigationScrollViewController":
            let button: XCUIElement = app.buttons.element(matching: .button, identifier: model.rootNextButtonAccessibilityIdentifier)
//            let button: XCUIElement = app.buttons.element(matching: .button, identifier: model.childNextButtonAccessibilityIdentifier)
            expect(button.isVisible).toEventually(beTrue(), timeout: 10)
            button.tap()
            usleep(sec: 2.0)

        case "NavigationTableViewController":
            let tableView: XCUIElement = app.tables.element(matching: .table, identifier: model.parentTableViewAccessibilityIdentifier)
            let cell: XCUIElement = tableView.cells.element(boundBy: 0)
            expect(cell.isVisible).toEventually(beTrue(), timeout: 10)
            cell.tap()
            usleep(sec: 2.0)

        case "TransitionCollectionViewController",
             "TransitionMultiCollectionViewController",
             "TransitionScrollViewController",
             "TransitionTableViewController":
            break
        default: break
        }
    }

    func popViewControllerByTappingBackButton(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) {
        switch model.className {
        case "NavigationCollectionViewController",
             "NavigationMultiCollectionViewController",
             "NavigationScrollViewController",
             "NavigationTableViewController":
            let navigationBar: XCUIElement = app.navigationBars.element(matching: .navigationBar, identifier: model.navigationBarAccessibilityIdentifier)
            let button: XCUIElement = navigationBar.buttons.element(boundBy: 0)
            expect(button.isVisible).toEventually(beTrue(), timeout: 10)
            button.tap()
            usleep(sec: 2.0)

        case "TransitionCollectionViewController",
             "TransitionMultiCollectionViewController",
             "TransitionScrollViewController",
             "TransitionTableViewController":
            break
        default: break
        }
    }

    func scrollToDismissiblePosition(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) {
        let option: InteractiveDismissOption = self.getInteractiveDismissOption(app: app, orientation: orientation, model: model)
        /* NOTE: Check whether the views exist */
        guard let interactView: XCUIElement = option.interact,
              let targetView: XCUIElement = option.target else { return }
        expect(interactView.exists).toEventually(beTrue(), timeout: 10)
        expect(targetView.exists).toEventually(beTrue(), timeout: 10)
        /* NOTE: Scroll until scroll view reaches to bottom */
        Logger()?.log("🧪", [
            "target".lpad() + String(describing: targetView.exists),
        ])
//        interactView.swipe(to: option.direction.inverted(), until: targetView.isVisible && interactView.frame.contains(targetView.frame))
//        interactView.swipe(to: option.direction.inverted(), until: targetView.isVisible)
        let vector: InteractiveDismissVector = self.getReducedInteractiveDismissVector(app: app, orientation: orientation, model: model)
        while (!targetView.isVisible) {
            interactView.swipe(from: vector.start, to: vector.finish)
        }
        usleep(sec: 2.0)
    }

    func finishInteractiveDismiss(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) {
        let option: InteractiveDismissOption = self.getInteractiveDismissOption(app: app, orientation: orientation, model: model)
        defer {
            /* NOTE: Check whether the view controller already disappears */
            let visibleView: XCUIElement = app.otherElements.element(matching: .other, identifier: model.visibleControllerViewAccessibilityIdentifier)
            expect(visibleView.exists).toNotEventually(beTrue(), timeout: 10)
        }
        /* NOTE: Check whether the view exists */
        guard let interactView: XCUIElement = option.interact else { return }
        expect(interactView.exists).toEventually(beTrue(), timeout: 10)
        /* NOTE: Perform dismiss interaction */
        let vectors: InteractiveDismissVector = self.getInteractiveDismissVector(app: app, orientation: orientation, model: model)
        interactView.swipe(from: vectors.start, to: vectors.finish)
    }

    func cancelInteractiveDismiss(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) {
//        print(app.debugDescription)
        let option: InteractiveDismissOption = self.getInteractiveDismissOption(app: app, orientation: orientation, model: model)
        /* NOTE: Check whether the view exists */
        guard let interactView: XCUIElement = option.interact else { return }
        expect(interactView.exists).toEventually(beTrue(), timeout: 10)
        /* NOTE: Perform cancel dismissal interaction */
        let vectors: InteractiveDismissVector = self.getInteractiveDismissVector(app: app, orientation: orientation, model: model)
        let start: XCUICoordinate = interactView.coordinate(withNormalizedOffset: vectors.start)
        let finish: XCUICoordinate = interactView.coordinate(withNormalizedOffset: vectors.finish)
        start.press(forDuration: 0.5, thenDragTo: finish)
        finish.press(forDuration: 0.5, thenDragTo: start)
        usleep(sec: 2.0)
    }

    func rotateAndRevertDevice(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) {
        XCUIDevice.shared.orientation = XCUIDevice.shared.orientation.isPortrait ? .landscapeLeft : .portrait
        usleep(sec: 2.0)
        XCUIDevice.shared.orientation = XCUIDevice.shared.orientation.isPortrait ? .landscapeLeft : .portrait
        usleep(sec: 2.0)
    }
}

extension MainSpec {
    typealias InteractiveDismissOption = (interact: XCUIElement?, target: XCUIElement?, direction: SwipeDirection)
    func getInteractiveDismissOption(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) -> InteractiveDismissOption {
        Logger()?.log("🧪", [
            "model".lpad() + String(describing: model),
            "model.className".lpad() + String(describing: model.className),
        ])
        return {
            switch model {
            case .navigationFluidModal, .transitionFluidModal, .navigationFluidFullScreen, .transitionFluidFullScreen,
                 .navigationDrawerBottom, .transitionDrawerBottom, .navigationSlideBottom, .transitionSlideBottom:

                let direction: SwipeDirection = .down

                switch model.className {

                case "NavigationCollectionViewController", "TransitionCollectionViewController":
                    let interactView: XCUIElement = app.collectionViews.element(matching: .collectionView, identifier: model.parentCollectionViewAccessibilityIdentifier)
                    let targetView: XCUIElement = interactView.cells.element(boundBy: 0)
                    return (interact: interactView, target: targetView, direction: direction)

                case "NavigationMultiCollectionViewController", "TransitionMultiCollectionViewController":
                    let interactView: XCUIElement = app.scrollViews.element(matching: .scrollView, identifier: model.parentScrollViewAccessibilityIdentifier)
                    let targetView: XCUIElement = app.otherElements.element(matching: .other, identifier: model.parentScrollTopViewAccessibilityIdentifier)
                    return (interact: interactView, target: targetView, direction: direction)

                case "NavigationScrollViewController", "TransitionScrollViewController":
                    let interactView: XCUIElement = app.scrollViews.element(matching: .scrollView, identifier: model.parentScrollViewAccessibilityIdentifier)
                    let targetView: XCUIElement = app.otherElements.element(matching: .other, identifier: model.parentScrollTopViewAccessibilityIdentifier)
                    return (interact: interactView, target: targetView, direction: direction)

                case "NavigationTableViewController", "TransitionTableViewController":
                    let interactView: XCUIElement = app.tables.element(matching: .table, identifier: model.parentTableViewAccessibilityIdentifier)
                    let targetView: XCUIElement = interactView.cells.element(boundBy: 0)
                    return (interact: interactView, target: targetView, direction: direction)

                default: break
                }

                let interactView: XCUIElement = app.otherElements.element(matching: .other, identifier: model.visibleControllerViewAccessibilityIdentifier)
                return (interact: interactView, target: nil, direction: direction)

            case .navigationDrawerTop, .transitionDrawerTop, .navigationSlideTop, .transitionSlideTop:

                let direction: SwipeDirection = .up

                switch model.className {

                case "NavigationCollectionViewController", "TransitionCollectionViewController":
                    let interactView: XCUIElement = app.collectionViews.element(matching: .collectionView, identifier: model.parentCollectionViewAccessibilityIdentifier)
                    let targetView: XCUIElement = interactView.cells.element(boundBy: interactView.cells.count - 1)
                    return (interact: interactView, target: targetView, direction: direction)

                case "NavigationMultiCollectionViewController", "TransitionMultiCollectionViewController":
                    let interactView: XCUIElement = app.scrollViews.element(matching: .scrollView, identifier: model.parentScrollViewAccessibilityIdentifier)
                    let targetView: XCUIElement = app.otherElements.element(matching: .other, identifier: model.parentScrollBottomViewAccessibilityIdentifier)
                    return (interact: interactView, target: targetView, direction: direction)

                case "NavigationScrollViewController", "TransitionScrollViewController":
                    let interactView: XCUIElement = app.scrollViews.element(matching: .scrollView, identifier: model.parentScrollViewAccessibilityIdentifier)
                    let targetView: XCUIElement = app.otherElements.element(matching: .other, identifier: model.parentScrollBottomViewAccessibilityIdentifier)
                    return (interact: interactView, target: targetView, direction: direction)

                case "NavigationTableViewController", "TransitionTableViewController":
                    let interactView: XCUIElement = app.tables.element(matching: .table, identifier: model.parentTableViewAccessibilityIdentifier)
                    guard let targetView: XCUIElement = interactView.cells.allElementsBoundByIndex.last else { return (interact: interactView, target: nil, direction: direction) }
                    return (interact: interactView, target: targetView, direction: direction)

                default: break
                }

                let interactView: XCUIElement = app.otherElements.element(matching: .other, identifier: model.visibleControllerViewAccessibilityIdentifier)
                return (interact: interactView, target: nil, direction: direction)

            case .navigationDrawerLeft, .transitionDrawerLeft, .navigationSlideLeft, .transitionSlideLeft:

                let direction: SwipeDirection = .left

                switch model.className {

                case "NavigationCollectionViewController", "TransitionCollectionViewController":
                    let interactView: XCUIElement = app.collectionViews.element(matching: .collectionView, identifier: model.parentCollectionViewAccessibilityIdentifier)
                    return (interact: interactView, target: nil, direction: direction)

                case "NavigationMultiCollectionViewController", "TransitionMultiCollectionViewController":
                    let interactView: XCUIElement = app.collectionViews.element(matching: .collectionView, identifier: model.childFirstCollectionViewAccessibilityIdentifier)
                    let targetView: XCUIElement = interactView.cells.element(boundBy: interactView.cells.count - 1)
                    return (interact: interactView, target: targetView, direction: direction)

                case "NavigationScrollViewController", "TransitionScrollViewController":
                    let interactView: XCUIElement = app.scrollViews.element(matching: .scrollView, identifier: model.parentScrollViewAccessibilityIdentifier)
                    return (interact: interactView, target: nil, direction: direction)

                case "NavigationTableViewController", "TransitionTableViewController":
                    let interactView: XCUIElement = app.tables.element(matching: .table, identifier: model.parentTableViewAccessibilityIdentifier)
                    return (interact: interactView, target: nil, direction: direction)

                default: break
                }

                let interactView: XCUIElement = app.otherElements.element(matching: .other, identifier: model.visibleControllerViewAccessibilityIdentifier)
                return (interact: interactView, target: nil, direction: direction)

            case .navigationDrawerRight, .transitionDrawerRight, .navigationSlideRight, .transitionSlideRight:

                let direction: SwipeDirection = .right

                switch model.className {

                case "NavigationCollectionViewController", "TransitionCollectionViewController":
                    let interactView: XCUIElement = app.collectionViews.element(matching: .collectionView, identifier: model.parentCollectionViewAccessibilityIdentifier)
                    return (interact: interactView, target: nil, direction: direction)

                case "NavigationMultiCollectionViewController", "TransitionMultiCollectionViewController":
                    let interactView: XCUIElement = app.collectionViews.element(matching: .collectionView, identifier: model.childSecondCollectionViewAccessibilityIdentifier)
                    let targetView: XCUIElement = interactView.cells.element(boundBy: 0)
                    return (interact: interactView, target: targetView, direction: direction)

                case "NavigationScrollViewController", "TransitionScrollViewController":
                    let interactView: XCUIElement = app.scrollViews.element(matching: .scrollView, identifier: model.parentScrollViewAccessibilityIdentifier)
                    return (interact: interactView, target: nil, direction: direction)

                case "NavigationTableViewController", "TransitionTableViewController":
                    let interactView: XCUIElement = app.tables.element(matching: .table, identifier: model.parentTableViewAccessibilityIdentifier)
                    return (interact: interactView, target: nil, direction: direction)

                default: break
                }

                let interactView: XCUIElement = app.otherElements.element(matching: .other, identifier: model.visibleControllerViewAccessibilityIdentifier)
                return (interact: interactView, target: nil, direction: direction)
            }
        }()
    }

    typealias InteractiveDismissVector = (start: CGVector, finish: CGVector)
    func getInteractiveDismissVector(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) -> InteractiveDismissVector {
        let presentationStyle: FluidPresentationStyle = FluidPresentationStyle(fromTransition: model.transitionStyle)
        switch presentationStyle.dismissAxis() {
        case .positiveX: return (start: CGVector(dx: 0.2, dy: 0.5), finish: CGVector(dx: 0.8, dy: 0.5))
        case .negativeX: return (start: CGVector(dx: 0.8, dy: 0.5), finish: CGVector(dx: 0.2, dy: 0.5))
        case .positiveY: return (start: CGVector(dx: 0.5, dy: 0.2), finish: CGVector(dx: 0.5, dy: 0.8))
        case .negativeY: return (start: CGVector(dx: 0.5, dy: 0.8), finish: CGVector(dx: 0.5, dy: 0.2))
        default: return (start: .zero, finish: .zero)
        }
    }

    func getReducedInteractiveDismissVector(app: XCUIApplication, orientation: UIDeviceOrientation, model: RootModel) -> InteractiveDismissVector {
        let presentationStyle: FluidPresentationStyle = FluidPresentationStyle(fromTransition: model.transitionStyle)
        switch presentationStyle.dismissAxis() {
        case .positiveX: return (start: CGVector(dx: 0.4, dy: 0.5), finish: CGVector(dx: 0.6, dy: 0.5))
        case .negativeX: return (start: CGVector(dx: 0.6, dy: 0.5), finish: CGVector(dx: 0.4, dy: 0.5))
        case .positiveY: return (start: CGVector(dx: 0.5, dy: 0.4), finish: CGVector(dx: 0.5, dy: 0.6))
        case .negativeY: return (start: CGVector(dx: 0.5, dy: 0.6), finish: CGVector(dx: 0.5, dy: 0.4))
        default: return (start: .zero, finish: .zero)
        }
    }
}
