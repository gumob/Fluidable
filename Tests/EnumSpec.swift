//
//  EnumSpec.swift
//  FluidableTests
//
//  Created by kojirof on 2019/06/29.
//  Copyright © 2019 Gumob. All rights reserved.
//

import Quick
import Nimble
@testable import Fluidable

class EnumSpec: QuickSpec {

    override func spec() {
        describe("Enumeration") {
            describe("FluidAnimationType") {
                let present: FluidAnimationType = FluidAnimationType.present
                let dismiss: FluidAnimationType = FluidAnimationType.dismiss
                let rotate: FluidAnimationType = FluidAnimationType.rotate
                it("Equatable") {
                    expect(present).to(equal(FluidAnimationType.present))
                    expect(present).notTo(equal(FluidAnimationType.dismiss))
                    expect(present).notTo(equal(FluidAnimationType.rotate))
                    expect(dismiss).notTo(equal(FluidAnimationType.present))
                    expect(dismiss).to(equal(FluidAnimationType.dismiss))
                    expect(dismiss).notTo(equal(FluidAnimationType.rotate))
                    expect(rotate).notTo(equal(FluidAnimationType.present))
                    expect(rotate).notTo(equal(FluidAnimationType.dismiss))
                    expect(rotate).to(equal(FluidAnimationType.rotate))
                }
                it("Condition") {
                    expect(present.isPresent).to(equal(true))
                    expect(present.isDismiss).to(equal(false))
                    expect(present.isRotate).to(equal(false))
                    expect(dismiss.isPresent).to(equal(false))
                    expect(dismiss.isDismiss).to(equal(true))
                    expect(dismiss.isRotate).to(equal(false))
                    expect(rotate.isPresent).to(equal(false))
                    expect(rotate.isDismiss).to(equal(false))
                    expect(rotate.isRotate).to(equal(true))
                }
                it("Description") {
                    expect(String(describing: present)).to(match("present"))
                    expect(String(describing: dismiss)).to(match("dismiss"))
                    expect(String(describing: rotate)).to(match("rotate"))
                }
            }
            describe("FluidBackgroundStyle") {
                let blurStyleLeft: FluidBackgroundStyle = .blur(radius: 8.0, color: .clear, alpha: 1.0)
                let dimStyleLeft: FluidBackgroundStyle = .dim(color: UIColor.black.withAlphaComponent(0.8))
                let noneStyleLeft: FluidBackgroundStyle = .none
                it("Equatable") {
                    let blurStyleRight: FluidBackgroundStyle = .blur(radius: 8.0, color: .clear, alpha: 1.0)
                    let dimStyleRight: FluidBackgroundStyle = .dim(color: UIColor.black.withAlphaComponent(0.8))
                    let noneStyleRight: FluidBackgroundStyle = .none
                    expect(blurStyleLeft).to(equal(blurStyleRight))
                    expect(dimStyleLeft).to(equal(dimStyleRight))
                    expect(noneStyleLeft).to(equal(noneStyleRight))
                }
                it("Description") {
                    expect(String(describing: blurStyleLeft)).to(beginWith("blur"))
                    expect(String(describing: dimStyleLeft)).to(beginWith("dim"))
                    expect(String(describing: noneStyleLeft)).to(beginWith("none"))
                }
            }
            describe("FluidDriverType") {
                let present: FluidDriverType = FluidDriverType.present
                let dismiss: FluidDriverType = FluidDriverType.dismiss
                it("Condition") {
                    expect(present.isPresent).to(equal(true))
                    expect(present.isDismiss).to(equal(false))
                    expect(dismiss.isPresent).to(equal(false))
                    expect(dismiss.isDismiss).to(equal(true))
                }
                it("Description") {
                    expect(String(describing: present)).to(beginWith("present"))
                    expect(String(describing: dismiss)).to(beginWith("dismiss"))
                }
            }
            describe("FluidDriverInteractionType") {
                let normalDefault: FluidDriverInteractionType = .normal
                let fluidDefault: FluidDriverInteractionType = .fluid
                let slideRightPresent: FluidDriverInteractionType = .init(for: .slide(direction: .fromRight), with: .present)
                let slideLeftPresent: FluidDriverInteractionType = .init(for: .slide(direction: .fromLeft), with: .present)
                let slideTopPresent: FluidDriverInteractionType = .init(for: .slide(direction: .fromTop), with: .present)
                let slideBottomPresent: FluidDriverInteractionType = .init(for: .slide(direction: .fromBottom), with: .present)
                let slideRightDismiss: FluidDriverInteractionType = .init(for: .slide(direction: .fromRight), with: .dismiss)
                let slideLeftDismiss: FluidDriverInteractionType = .init(for: .slide(direction: .fromLeft), with: .dismiss)
                let slideTopDismiss: FluidDriverInteractionType = .init(for: .slide(direction: .fromTop), with: .dismiss)
                let slideBottomDismiss: FluidDriverInteractionType = .init(for: .slide(direction: .fromBottom), with: .dismiss)
                let slideRightRotate: FluidDriverInteractionType = .init(for: .slide(direction: .fromRight), with: .rotate)
                let slideLeftRotate: FluidDriverInteractionType = .init(for: .slide(direction: .fromLeft), with: .rotate)
                let slideTopRotate: FluidDriverInteractionType = .init(for: .slide(direction: .fromTop), with: .rotate)
                let slideBottomRotate: FluidDriverInteractionType = .init(for: .slide(direction: .fromBottom), with: .rotate)
                let drawerLeftPresent: FluidDriverInteractionType = .init(for: .drawer(position: .left), with: .present)
                let drawerRightPresent: FluidDriverInteractionType = .init(for: .drawer(position: .right), with: .present)
                let drawerTopPresent: FluidDriverInteractionType = .init(for: .drawer(position: .top), with: .present)
                let drawerBottomPresent: FluidDriverInteractionType = .init(for: .drawer(position: .bottom), with: .present)
                let drawerLeftDismiss: FluidDriverInteractionType = .init(for: .drawer(position: .left), with: .dismiss)
                let drawerRightDismiss: FluidDriverInteractionType = .init(for: .drawer(position: .right), with: .dismiss)
                let drawerTopDismiss: FluidDriverInteractionType = .init(for: .drawer(position: .top), with: .dismiss)
                let drawerBottomDismiss: FluidDriverInteractionType = .init(for: .drawer(position: .bottom), with: .dismiss)
                let drawerLeftRotate: FluidDriverInteractionType = .init(for: .drawer(position: .left), with: .rotate)
                let drawerRightRotate: FluidDriverInteractionType = .init(for: .drawer(position: .right), with: .rotate)
                let drawerTopRotate: FluidDriverInteractionType = .init(for: .drawer(position: .top), with: .rotate)
                let drawerBottomRotate: FluidDriverInteractionType = .init(for: .drawer(position: .bottom), with: .rotate)
                let fluidAllPresent: FluidDriverInteractionType = .init(for: .fluid(behavior: .all), with: .present)
                let fluidAllDismiss: FluidDriverInteractionType = .init(for: .fluid(behavior: .all), with: .dismiss)
                let fluidAllRotate: FluidDriverInteractionType = .init(for: .fluid(behavior: .all), with: .rotate)
                let none: FluidDriverInteractionType = .none
                it("Equatable") {
                    expect(normalDefault.isNormal).to(equal(true))
                    expect(normalDefault.isFluid).to(equal(false))
                    expect(normalDefault.isNone).to(equal(false))
                    expect(fluidDefault.isNormal).to(equal(false))
                    expect(fluidDefault.isFluid).to(equal(true))
                    expect(fluidDefault.isNone).to(equal(false))
                    expect(slideRightPresent.isNormal).to(equal(true))
                    expect(slideRightPresent.isFluid).to(equal(false))
                    expect(slideRightPresent.isNone).to(equal(false))
                    expect(slideLeftPresent.isNormal).to(equal(true))
                    expect(slideLeftPresent.isFluid).to(equal(false))
                    expect(slideLeftPresent.isNone).to(equal(false))
                    expect(slideTopPresent.isNormal).to(equal(true))
                    expect(slideTopPresent.isFluid).to(equal(false))
                    expect(slideTopPresent.isNone).to(equal(false))
                    expect(slideRightDismiss.isNormal).to(equal(true))
                    expect(slideRightDismiss.isFluid).to(equal(false))
                    expect(slideRightDismiss.isNone).to(equal(false))
                    expect(slideLeftDismiss.isNormal).to(equal(true))
                    expect(slideLeftDismiss.isFluid).to(equal(false))
                    expect(slideLeftDismiss.isNone).to(equal(false))
                    expect(slideTopDismiss.isNormal).to(equal(true))
                    expect(slideTopDismiss.isFluid).to(equal(false))
                    expect(slideTopDismiss.isNone).to(equal(false))
                    expect(slideBottomDismiss.isNormal).to(equal(true))
                    expect(slideBottomDismiss.isFluid).to(equal(false))
                    expect(slideBottomDismiss.isNone).to(equal(false))
                    expect(slideBottomPresent.isNormal).to(equal(true))
                    expect(slideBottomPresent.isFluid).to(equal(false))
                    expect(slideBottomPresent.isNone).to(equal(false))
                    expect(slideRightRotate.isNormal).to(equal(true))
                    expect(slideRightRotate.isFluid).to(equal(false))
                    expect(slideRightRotate.isNone).to(equal(false))
                    expect(slideLeftRotate.isNormal).to(equal(true))
                    expect(slideLeftRotate.isFluid).to(equal(false))
                    expect(slideLeftRotate.isNone).to(equal(false))
                    expect(slideTopRotate.isNormal).to(equal(true))
                    expect(slideTopRotate.isFluid).to(equal(false))
                    expect(slideTopRotate.isNone).to(equal(false))
                    expect(slideBottomRotate.isNormal).to(equal(true))
                    expect(slideBottomRotate.isFluid).to(equal(false))
                    expect(slideBottomRotate.isNone).to(equal(false))
                    expect(drawerRightPresent.isNormal).to(equal(true))
                    expect(drawerRightPresent.isFluid).to(equal(false))
                    expect(drawerRightPresent.isNone).to(equal(false))
                    expect(drawerLeftPresent.isNormal).to(equal(true))
                    expect(drawerLeftPresent.isFluid).to(equal(false))
                    expect(drawerLeftPresent.isNone).to(equal(false))
                    expect(drawerTopPresent.isNormal).to(equal(true))
                    expect(drawerTopPresent.isFluid).to(equal(false))
                    expect(drawerTopPresent.isNone).to(equal(false))
                    expect(drawerBottomPresent.isNormal).to(equal(true))
                    expect(drawerBottomPresent.isFluid).to(equal(false))
                    expect(drawerBottomPresent.isNone).to(equal(false))
                    expect(drawerRightDismiss.isNormal).to(equal(true))
                    expect(drawerRightDismiss.isFluid).to(equal(false))
                    expect(drawerRightDismiss.isNone).to(equal(false))
                    expect(drawerLeftDismiss.isNormal).to(equal(true))
                    expect(drawerLeftDismiss.isFluid).to(equal(false))
                    expect(drawerLeftDismiss.isNone).to(equal(false))
                    expect(drawerTopDismiss.isNormal).to(equal(true))
                    expect(drawerTopDismiss.isFluid).to(equal(false))
                    expect(drawerTopDismiss.isNone).to(equal(false))
                    expect(drawerBottomDismiss.isNormal).to(equal(true))
                    expect(drawerBottomDismiss.isFluid).to(equal(false))
                    expect(drawerBottomDismiss.isNone).to(equal(false))
                    expect(drawerRightRotate.isNormal).to(equal(true))
                    expect(drawerRightRotate.isFluid).to(equal(false))
                    expect(drawerRightRotate.isNone).to(equal(false))
                    expect(drawerLeftRotate.isNormal).to(equal(true))
                    expect(drawerLeftRotate.isFluid).to(equal(false))
                    expect(drawerLeftRotate.isNone).to(equal(false))
                    expect(drawerTopRotate.isNormal).to(equal(true))
                    expect(drawerTopRotate.isFluid).to(equal(false))
                    expect(drawerTopRotate.isNone).to(equal(false))
                    expect(drawerBottomRotate.isNormal).to(equal(true))
                    expect(drawerBottomRotate.isFluid).to(equal(false))
                    expect(drawerBottomRotate.isNone).to(equal(false))
                    expect(fluidAllPresent.isNormal).to(equal(false))
                    expect(fluidAllPresent.isFluid).to(equal(true))
                    expect(fluidAllPresent.isNone).to(equal(false))
                    expect(fluidAllDismiss.isNormal).to(equal(false))
                    expect(fluidAllDismiss.isFluid).to(equal(true))
                    expect(fluidAllDismiss.isNone).to(equal(false))
                    expect(fluidAllRotate.isNormal).to(equal(false))
                    expect(fluidAllRotate.isFluid).to(equal(true))
                    expect(fluidAllRotate.isNone).to(equal(false))
                    expect(none.isNormal).to(equal(false))
                    expect(none.isFluid).to(equal(false))
                    expect(none.isNone).to(equal(true))
                }
                it("UIRectEdge") {
                    expect(normalDefault.edges).to(equal(UIRectEdge(arrayLiteral: [])))
                    expect(fluidDefault.edges).to(equal(UIRectEdge(arrayLiteral: [])))
                    expect(slideRightPresent.edges).to(equal(UIRectEdge.left))
                    expect(slideLeftPresent.edges).to(equal(UIRectEdge.right))
                    expect(slideTopPresent.edges).to(equal(UIRectEdge.bottom))
                    expect(slideBottomPresent.edges).to(equal(UIRectEdge.top))
                    expect(slideRightDismiss.edges).to(equal(UIRectEdge.left))
                    expect(slideLeftDismiss.edges).to(equal(UIRectEdge.right))
                    expect(slideTopDismiss.edges).to(equal(UIRectEdge.bottom))
                    expect(slideBottomDismiss.edges).to(equal(UIRectEdge.top))
                    expect(drawerRightPresent.edges).to(equal(UIRectEdge(arrayLiteral: [])))
                    expect(drawerLeftPresent.edges).to(equal(UIRectEdge(arrayLiteral: [])))
                    expect(drawerTopPresent.edges).to(equal(UIRectEdge(arrayLiteral: [])))
                    expect(drawerBottomPresent.edges).to(equal(UIRectEdge(arrayLiteral: [])))
                    expect(drawerRightDismiss.edges).to(equal(UIRectEdge(arrayLiteral: [])))
                    expect(drawerLeftDismiss.edges).to(equal(UIRectEdge(arrayLiteral: [])))
                    expect(drawerTopDismiss.edges).to(equal(UIRectEdge(arrayLiteral: [])))
                    expect(drawerBottomDismiss.edges).to(equal(UIRectEdge(arrayLiteral: [])))
                    expect(fluidAllPresent.edges).to(equal(UIRectEdge.left))
                    expect(fluidAllDismiss.edges).to(equal(UIRectEdge.left))
                    expect(none.edges).to(equal(UIRectEdge(arrayLiteral: [])))
                }
                it("Condition") {
                    expect(normalDefault.isEdgePanEnabled).to(equal(false))
                    expect(fluidDefault.isEdgePanEnabled).to(equal(false))
                    expect(slideRightPresent.isEdgePanEnabled).to(equal(true))
                    expect(slideLeftPresent.isEdgePanEnabled).to(equal(true))
                    expect(slideTopPresent.isEdgePanEnabled).to(equal(true))
                    expect(slideBottomPresent.isEdgePanEnabled).to(equal(true))
                    expect(slideRightDismiss.isEdgePanEnabled).to(equal(true))
                    expect(slideLeftDismiss.isEdgePanEnabled).to(equal(true))
                    expect(slideTopDismiss.isEdgePanEnabled).to(equal(true))
                    expect(slideBottomDismiss.isEdgePanEnabled).to(equal(true))
                    expect(drawerRightPresent.isEdgePanEnabled).to(equal(false))
                    expect(drawerLeftPresent.isEdgePanEnabled).to(equal(false))
                    expect(drawerTopPresent.isEdgePanEnabled).to(equal(false))
                    expect(drawerBottomPresent.isEdgePanEnabled).to(equal(false))
                    expect(drawerRightDismiss.isEdgePanEnabled).to(equal(false))
                    expect(drawerLeftDismiss.isEdgePanEnabled).to(equal(false))
                    expect(drawerTopDismiss.isEdgePanEnabled).to(equal(false))
                    expect(drawerBottomDismiss.isEdgePanEnabled).to(equal(false))
                    expect(fluidAllPresent.isEdgePanEnabled).to(equal(true))
                    expect(fluidAllDismiss.isEdgePanEnabled).to(equal(true))
                    expect(none.isEdgePanEnabled).to(equal(false))
                }
                it("Description") {
                    expect(String(describing: normalDefault)).to(beginWith("normal"))
                    expect(String(describing: fluidDefault)).to(beginWith("fluid"))
                    expect(String(describing: slideRightPresent)).to(beginWith("normal"))
                    expect(String(describing: slideLeftPresent)).to(beginWith("normal"))
                    expect(String(describing: slideTopPresent)).to(beginWith("normal"))
                    expect(String(describing: slideBottomPresent)).to(beginWith("normal"))
                    expect(String(describing: slideRightDismiss)).to(beginWith("normal"))
                    expect(String(describing: slideLeftDismiss)).to(beginWith("normal"))
                    expect(String(describing: slideTopDismiss)).to(beginWith("normal"))
                    expect(String(describing: slideBottomDismiss)).to(beginWith("normal"))
                    expect(String(describing: slideRightRotate)).to(beginWith("normal"))
                    expect(String(describing: slideLeftRotate)).to(beginWith("normal"))
                    expect(String(describing: slideTopRotate)).to(beginWith("normal"))
                    expect(String(describing: slideBottomRotate)).to(beginWith("normal"))
                    expect(String(describing: drawerRightPresent)).to(beginWith("normal"))
                    expect(String(describing: drawerLeftPresent)).to(beginWith("normal"))
                    expect(String(describing: drawerTopPresent)).to(beginWith("normal"))
                    expect(String(describing: drawerBottomPresent)).to(beginWith("normal"))
                    expect(String(describing: drawerRightDismiss)).to(beginWith("normal"))
                    expect(String(describing: drawerLeftDismiss)).to(beginWith("normal"))
                    expect(String(describing: drawerTopDismiss)).to(beginWith("normal"))
                    expect(String(describing: drawerBottomDismiss)).to(beginWith("normal"))
                    expect(String(describing: drawerRightRotate)).to(beginWith("normal"))
                    expect(String(describing: drawerLeftRotate)).to(beginWith("normal"))
                    expect(String(describing: drawerTopRotate)).to(beginWith("normal"))
                    expect(String(describing: drawerBottomRotate)).to(beginWith("normal"))
                    expect(String(describing: fluidAllPresent)).to(beginWith("fluid"))
                    expect(String(describing: fluidAllDismiss)).to(beginWith("fluid"))
                    expect(String(describing: fluidAllRotate)).to(beginWith("fluid"))
                    expect(String(describing: none)).to(beginWith("notInteracting"))
                }
            }
            describe("FluidDriverInteractionState") {
                let presenting: FluidDriverInteractionState = .presenting
                let dismissing: FluidDriverInteractionState = .dismissing
                let resizing: FluidDriverInteractionState = .resizing
                let none: FluidDriverInteractionState = .none
                it("Description") {
                    expect(String(describing: presenting)).to(beginWith("presenting"))
                    expect(String(describing: dismissing)).to(beginWith("dismissing"))
                    expect(String(describing: resizing)).to(beginWith("resizing"))
                    expect(String(describing: none)).to(beginWith("none"))
                }
            }
            describe("FluidNavigationStyle") {
                let fade: FluidNavigationStyle = .fade
                let scale: FluidNavigationStyle = .scale
                let slideRight: FluidNavigationStyle = .slide(direction: .fromRight)
                let slideLeft: FluidNavigationStyle = .slide(direction: .fromLeft)
                let slideTop: FluidNavigationStyle = .slide(direction: .fromTop)
                let slideBottom: FluidNavigationStyle = .slide(direction: .fromBottom)
//                let drawerRight: FluidNavigationStyle = .drawer(position: .right)
//                let drawerLeft: FluidNavigationStyle = .drawer(position: .left)
//                let drawerTop: FluidNavigationStyle = .drawer(position: .top)
//                let drawerBottom: FluidNavigationStyle = .drawer(position: .bottom)
                it("Equatable") {
                    expect(fade).notTo(equal(.slide(direction: .fromRight)))
                    expect(fade).notTo(equal(.slide(direction: .fromLeft)))
                    expect(fade).notTo(equal(.slide(direction: .fromTop)))
                    expect(fade).notTo(equal(.slide(direction: .fromBottom)))
                    expect(fade).to(equal(.fade))
                    expect(fade).notTo(equal(.scale))
                    expect(scale).notTo(equal(.slide(direction: .fromRight)))
                    expect(scale).notTo(equal(.slide(direction: .fromLeft)))
                    expect(scale).notTo(equal(.slide(direction: .fromTop)))
                    expect(scale).notTo(equal(.slide(direction: .fromBottom)))
                    expect(scale).notTo(equal(.fade))
                    expect(scale).to(equal(.scale))
                    expect(slideRight).to(equal(.slide(direction: .fromRight)))
                    expect(slideRight).notTo(equal(.slide(direction: .fromLeft)))
                    expect(slideRight).notTo(equal(.slide(direction: .fromTop)))
                    expect(slideRight).notTo(equal(.slide(direction: .fromBottom)))
                    expect(slideRight).notTo(equal(.fade))
                    expect(slideRight).notTo(equal(.scale))
                    expect(slideLeft).notTo(equal(.slide(direction: .fromRight)))
                    expect(slideLeft).to(equal(.slide(direction: .fromLeft)))
                    expect(slideLeft).notTo(equal(.slide(direction: .fromTop)))
                    expect(slideLeft).notTo(equal(.slide(direction: .fromBottom)))
                    expect(slideLeft).notTo(equal(.fade))
                    expect(slideLeft).notTo(equal(.scale))
                    expect(slideTop).notTo(equal(.slide(direction: .fromRight)))
                    expect(slideTop).notTo(equal(.slide(direction: .fromLeft)))
                    expect(slideTop).to(equal(.slide(direction: .fromTop)))
                    expect(slideTop).notTo(equal(.slide(direction: .fromBottom)))
                    expect(slideTop).notTo(equal(.fade))
                    expect(slideTop).notTo(equal(.scale))
                    expect(slideBottom).notTo(equal(.slide(direction: .fromRight)))
                    expect(slideBottom).notTo(equal(.slide(direction: .fromLeft)))
                    expect(slideBottom).notTo(equal(.slide(direction: .fromTop)))
                    expect(slideBottom).to(equal(.slide(direction: .fromBottom)))
                    expect(slideBottom).notTo(equal(.fade))
                    expect(slideBottom).notTo(equal(.scale))
//                    expect(drawerRight).to(equal(.drawer(position: .right)))
//                    expect(drawerRight).notTo(equal(.drawer(position: .left)))
//                    expect(drawerRight).notTo(equal(.drawer(position: .top)))
//                    expect(drawerRight).notTo(equal(.drawer(position: .bottom)))
//                    expect(drawerRight).notTo(equal(.fade))
//                    expect(drawerRight).notTo(equal(.scale))
//                    expect(drawerLeft).notTo(equal(.drawer(position: .right)))
//                    expect(drawerLeft).to(equal(.drawer(position: .left)))
//                    expect(drawerLeft).notTo(equal(.drawer(position: .top)))
//                    expect(drawerLeft).notTo(equal(.drawer(position: .bottom)))
//                    expect(drawerLeft).notTo(equal(.fade))
//                    expect(drawerLeft).notTo(equal(.scale))
//                    expect(drawerTop).notTo(equal(.drawer(position: .right)))
//                    expect(drawerTop).notTo(equal(.drawer(position: .left)))
//                    expect(drawerTop).to(equal(.drawer(position: .top)))
//                    expect(drawerTop).notTo(equal(.drawer(position: .bottom)))
//                    expect(drawerTop).notTo(equal(.fade))
//                    expect(drawerTop).notTo(equal(.scale))
//                    expect(drawerBottom).notTo(equal(.drawer(position: .right)))
//                    expect(drawerBottom).notTo(equal(.drawer(position: .left)))
//                    expect(drawerBottom).notTo(equal(.drawer(position: .top)))
//                    expect(drawerBottom).to(equal(.drawer(position: .bottom)))
//                    expect(drawerBottom).notTo(equal(.fade))
//                    expect(drawerBottom).notTo(equal(.scale))
                }
                it("Description") {
                    expect(String(describing: fade)).to(beginWith("fade"))
                    expect(String(describing: scale)).to(beginWith("scale"))
                    expect(String(describing: slideRight)).to(beginWith("slide"))
                    expect(String(describing: slideLeft)).to(beginWith("slide"))
                    expect(String(describing: slideTop)).to(beginWith("slide"))
                    expect(String(describing: slideBottom)).to(beginWith("slide"))
                }
            }
            describe("FluidTransitionStyle") {
                let fluid: FluidTransitionStyle = .fluid(behavior: .all)
                let scale: FluidTransitionStyle = .scale
                let slideRight: FluidTransitionStyle = .slide(direction: .fromRight)
                let slideLeft: FluidTransitionStyle = .slide(direction: .fromLeft)
                let slideTop: FluidTransitionStyle = .slide(direction: .fromTop)
                let slideBottom: FluidTransitionStyle = .slide(direction: .fromBottom)
                let drawerRight: FluidTransitionStyle = .drawer(position: .right)
                let drawerLeft: FluidTransitionStyle = .drawer(position: .left)
                let drawerTop: FluidTransitionStyle = .drawer(position: .top)
                let drawerBottom: FluidTransitionStyle = .drawer(position: .bottom)
                it("Initialization") {
                    expect(FluidTransitionStyle(index: 0)).to(equal(.fluid(behavior: .all)))
                    expect(FluidTransitionStyle(index: 1)).to(equal(.scale))
                    expect(FluidTransitionStyle(index: 2)).to(equal(.slide(direction: .fromRight)))
                    expect(FluidTransitionStyle(index: 3)).to(equal(.drawer(position: .bottom)))
                    expect(FluidTransitionStyle(index: 4)).to(beNil())
                }
                it("Equatable") {
                    expect(fluid).notTo(equal(.slide(direction: .fromRight)))
                    expect(fluid).notTo(equal(.slide(direction: .fromLeft)))
                    expect(fluid).notTo(equal(.slide(direction: .fromTop)))
                    expect(fluid).notTo(equal(.slide(direction: .fromBottom)))
                    expect(fluid).to(equal(.fluid(behavior: .all)))
                    expect(fluid).notTo(equal(.scale))
                    expect(scale).notTo(equal(.slide(direction: .fromRight)))
                    expect(scale).notTo(equal(.slide(direction: .fromLeft)))
                    expect(scale).notTo(equal(.slide(direction: .fromTop)))
                    expect(scale).notTo(equal(.slide(direction: .fromBottom)))
                    expect(scale).notTo(equal(.fluid(behavior: .all)))
                    expect(scale).to(equal(.scale))
                    expect(slideRight).to(equal(.slide(direction: .fromRight)))
                    expect(slideRight).notTo(equal(.slide(direction: .fromLeft)))
                    expect(slideRight).notTo(equal(.slide(direction: .fromTop)))
                    expect(slideRight).notTo(equal(.slide(direction: .fromBottom)))
                    expect(slideRight).notTo(equal(.fluid(behavior: .all)))
                    expect(slideRight).notTo(equal(.scale))
                    expect(slideLeft).notTo(equal(.slide(direction: .fromRight)))
                    expect(slideLeft).to(equal(.slide(direction: .fromLeft)))
                    expect(slideLeft).notTo(equal(.slide(direction: .fromTop)))
                    expect(slideLeft).notTo(equal(.slide(direction: .fromBottom)))
                    expect(slideLeft).notTo(equal(.fluid(behavior: .all)))
                    expect(slideLeft).notTo(equal(.scale))
                    expect(slideTop).notTo(equal(.slide(direction: .fromRight)))
                    expect(slideTop).notTo(equal(.slide(direction: .fromLeft)))
                    expect(slideTop).to(equal(.slide(direction: .fromTop)))
                    expect(slideTop).notTo(equal(.slide(direction: .fromBottom)))
                    expect(slideTop).notTo(equal(.fluid(behavior: .all)))
                    expect(slideTop).notTo(equal(.scale))
                    expect(slideBottom).notTo(equal(.slide(direction: .fromRight)))
                    expect(slideBottom).notTo(equal(.slide(direction: .fromLeft)))
                    expect(slideBottom).notTo(equal(.slide(direction: .fromTop)))
                    expect(slideBottom).to(equal(.slide(direction: .fromBottom)))
                    expect(slideBottom).notTo(equal(.fluid(behavior: .all)))
                    expect(slideBottom).notTo(equal(.scale))
                    expect(drawerRight).to(equal(.drawer(position: .right)))
                    expect(drawerRight).notTo(equal(.drawer(position: .left)))
                    expect(drawerRight).notTo(equal(.drawer(position: .top)))
                    expect(drawerRight).notTo(equal(.drawer(position: .bottom)))
                    expect(drawerRight).notTo(equal(.fluid(behavior: .all)))
                    expect(drawerRight).notTo(equal(.scale))
                    expect(drawerLeft).notTo(equal(.drawer(position: .right)))
                    expect(drawerLeft).to(equal(.drawer(position: .left)))
                    expect(drawerLeft).notTo(equal(.drawer(position: .top)))
                    expect(drawerLeft).notTo(equal(.drawer(position: .bottom)))
                    expect(drawerLeft).notTo(equal(.fluid(behavior: .all)))
                    expect(drawerLeft).notTo(equal(.scale))
                    expect(drawerTop).notTo(equal(.drawer(position: .right)))
                    expect(drawerTop).notTo(equal(.drawer(position: .left)))
                    expect(drawerTop).to(equal(.drawer(position: .top)))
                    expect(drawerTop).notTo(equal(.drawer(position: .bottom)))
                    expect(drawerTop).notTo(equal(.fluid(behavior: .all)))
                    expect(drawerTop).notTo(equal(.scale))
                    expect(drawerBottom).notTo(equal(.drawer(position: .right)))
                    expect(drawerBottom).notTo(equal(.drawer(position: .left)))
                    expect(drawerBottom).notTo(equal(.drawer(position: .top)))
                    expect(drawerBottom).to(equal(.drawer(position: .bottom)))
                    expect(drawerBottom).notTo(equal(.fluid(behavior: .all)))
                    expect(drawerBottom).notTo(equal(.scale))
                }
                it("Condition") {
                    expect(fluid.isFluid).to(equal(true))
                    expect(fluid.isScale).to(equal(false))
                    expect(fluid.isSlide).to(equal(false))
                    expect(fluid.isDrawer).to(equal(false))

                    expect(scale.isFluid).to(equal(false))
                    expect(scale.isScale).to(equal(true))
                    expect(scale.isSlide).to(equal(false))
                    expect(scale.isDrawer).to(equal(false))

                    expect(slideRight.isFluid).to(equal(false))
                    expect(slideRight.isScale).to(equal(false))
                    expect(slideRight.isSlide).to(equal(true))
                    expect(slideRight.isDrawer).to(equal(false))

                    expect(slideLeft.isFluid).to(equal(false))
                    expect(slideLeft.isScale).to(equal(false))
                    expect(slideLeft.isSlide).to(equal(true))
                    expect(slideLeft.isDrawer).to(equal(false))

                    expect(slideTop.isFluid).to(equal(false))
                    expect(slideTop.isScale).to(equal(false))
                    expect(slideTop.isSlide).to(equal(true))
                    expect(slideTop.isDrawer).to(equal(false))

                    expect(slideBottom.isFluid).to(equal(false))
                    expect(slideBottom.isScale).to(equal(false))
                    expect(slideBottom.isSlide).to(equal(true))
                    expect(slideBottom.isDrawer).to(equal(false))

                    expect(drawerRight.isFluid).to(equal(false))
                    expect(drawerRight.isScale).to(equal(false))
                    expect(drawerRight.isSlide).to(equal(false))
                    expect(drawerRight.isDrawer).to(equal(true))

                    expect(drawerLeft.isFluid).to(equal(false))
                    expect(drawerLeft.isScale).to(equal(false))
                    expect(drawerLeft.isSlide).to(equal(false))
                    expect(drawerLeft.isDrawer).to(equal(true))

                    expect(drawerTop.isFluid).to(equal(false))
                    expect(drawerTop.isScale).to(equal(false))
                    expect(drawerTop.isSlide).to(equal(false))
                    expect(drawerTop.isDrawer).to(equal(true))

                    expect(drawerBottom.isFluid).to(equal(false))
                    expect(drawerBottom.isScale).to(equal(false))
                    expect(drawerBottom.isSlide).to(equal(false))
                    expect(drawerBottom.isDrawer).to(equal(true))
                }
                it("Description") {
                    expect(String(describing: fluid)).to(beginWith("fluid"))
                    expect(String(describing: scale)).to(beginWith("scale"))
                    expect(String(describing: slideRight)).to(beginWith("slide"))
                    expect(String(describing: slideLeft)).to(beginWith("slide"))
                    expect(String(describing: slideTop)).to(beginWith("slide"))
                    expect(String(describing: slideBottom)).to(beginWith("slide"))
                }
            }
            describe("FluidCoreAnimatorTransitionType") {
                let fade: FluidCoreAnimatorTransitionType = .fade
                let moveIn: FluidCoreAnimatorTransitionType = .moveIn
                let push: FluidCoreAnimatorTransitionType = .push
                let reveal: FluidCoreAnimatorTransitionType = .reveal
                it("RawValue") {
                    expect(fade.rawValue).to(equal(CATransitionType.fade))
                    expect(moveIn.rawValue).to(equal(CATransitionType.moveIn))
                    expect(push.rawValue).to(equal(CATransitionType.push))
                    expect(reveal.rawValue).to(equal(CATransitionType.reveal))
                }
            }
            describe("FluidCoreAnimatorTransitionSubtype") {
                let top: FluidCoreAnimatorTransitionSubtype = .top
                let right: FluidCoreAnimatorTransitionSubtype = .right
                let bottom: FluidCoreAnimatorTransitionSubtype = .bottom
                let left: FluidCoreAnimatorTransitionSubtype = .left
                it("RawValue") {
                    expect(top.rawValue).to(equal(CATransitionSubtype.fromTop))
                    expect(right.rawValue).to(equal(CATransitionSubtype.fromRight))
                    expect(bottom.rawValue).to(equal(CATransitionSubtype.fromBottom))
                    expect(left.rawValue).to(equal(CATransitionSubtype.fromLeft))
                }
            }
            describe("FluidPresentationStyle") {
                let fluid: FluidPresentationStyle = .fluid(behavior: .all)
                let scale: FluidPresentationStyle = .scale
                let slideRight: FluidPresentationStyle = .slide(direction: .fromRight)
                let slideLeft: FluidPresentationStyle = .slide(direction: .fromLeft)
                let slideTop: FluidPresentationStyle = .slide(direction: .fromTop)
                let slideBottom: FluidPresentationStyle = .slide(direction: .fromBottom)
                let drawerRight: FluidPresentationStyle = .drawer(position: .right)
                let drawerLeft: FluidPresentationStyle = .drawer(position: .left)
                let drawerTop: FluidPresentationStyle = .drawer(position: .top)
                let drawerBottom: FluidPresentationStyle = .drawer(position: .bottom)
                it("Initialization") {
                    expect(FluidPresentationStyle(index: 0)?.isFluid).to(beTrue())
                    expect(FluidPresentationStyle(index: 1)?.isScale).to(beTrue())
                    expect(FluidPresentationStyle(index: 2)?.isSlide).to(beTrue())
                    expect(FluidPresentationStyle(index: 3)?.isDrawer).to(beTrue())
                    expect(FluidPresentationStyle(fromNavigation: .scale).isFluid).to(beFalse())
                    expect(FluidPresentationStyle(fromNavigation: .fade).isFluid).to(beFalse())
                    expect(FluidPresentationStyle(fromNavigation: .slide(direction: .fromTop)).isSlide).to(beTrue())
                    expect(FluidPresentationStyle(fromTransition: .fluid(behavior: .all)).isFluid).to(beTrue())
                    expect(FluidPresentationStyle(fromTransition: .scale).isScale).to(beTrue())
                    expect(FluidPresentationStyle(fromTransition: .slide(direction: .fromBottom)).isSlide).to(beTrue())
                    expect(FluidPresentationStyle(fromTransition: .drawer(position: .bottom)).isDrawer).to(beTrue())
                }
                it("Equatable") {
                    expect(fluid).notTo(equal(.slide(direction: .fromRight)))
                    expect(fluid).notTo(equal(.slide(direction: .fromLeft)))
                    expect(fluid).notTo(equal(.slide(direction: .fromTop)))
                    expect(fluid).notTo(equal(.slide(direction: .fromBottom)))
                    expect(fluid).to(equal(.fluid(behavior: .all)))
                    expect(fluid).notTo(equal(.scale))
                    expect(scale).notTo(equal(.slide(direction: .fromRight)))
                    expect(scale).notTo(equal(.slide(direction: .fromLeft)))
                    expect(scale).notTo(equal(.slide(direction: .fromTop)))
                    expect(scale).notTo(equal(.slide(direction: .fromBottom)))
                    expect(scale).notTo(equal(.fluid(behavior: .all)))
                    expect(scale).to(equal(.scale))
                    expect(slideRight).to(equal(.slide(direction: .fromRight)))
                    expect(slideRight).notTo(equal(.slide(direction: .fromLeft)))
                    expect(slideRight).notTo(equal(.slide(direction: .fromTop)))
                    expect(slideRight).notTo(equal(.slide(direction: .fromBottom)))
                    expect(slideRight).notTo(equal(.fluid(behavior: .all)))
                    expect(slideRight).notTo(equal(.scale))
                    expect(slideLeft).notTo(equal(.slide(direction: .fromRight)))
                    expect(slideLeft).to(equal(.slide(direction: .fromLeft)))
                    expect(slideLeft).notTo(equal(.slide(direction: .fromTop)))
                    expect(slideLeft).notTo(equal(.slide(direction: .fromBottom)))
                    expect(slideLeft).notTo(equal(.fluid(behavior: .all)))
                    expect(slideLeft).notTo(equal(.scale))
                    expect(slideTop).notTo(equal(.slide(direction: .fromRight)))
                    expect(slideTop).notTo(equal(.slide(direction: .fromLeft)))
                    expect(slideTop).to(equal(.slide(direction: .fromTop)))
                    expect(slideTop).notTo(equal(.slide(direction: .fromBottom)))
                    expect(slideTop).notTo(equal(.fluid(behavior: .all)))
                    expect(slideTop).notTo(equal(.scale))
                    expect(slideBottom).notTo(equal(.slide(direction: .fromRight)))
                    expect(slideBottom).notTo(equal(.slide(direction: .fromLeft)))
                    expect(slideBottom).notTo(equal(.slide(direction: .fromTop)))
                    expect(slideBottom).to(equal(.slide(direction: .fromBottom)))
                    expect(slideBottom).notTo(equal(.fluid(behavior: .all)))
                    expect(slideBottom).notTo(equal(.scale))
                    expect(drawerRight).to(equal(.drawer(position: .right)))
                    expect(drawerRight).notTo(equal(.drawer(position: .left)))
                    expect(drawerRight).notTo(equal(.drawer(position: .top)))
                    expect(drawerRight).notTo(equal(.drawer(position: .bottom)))
                    expect(drawerRight).notTo(equal(.fluid(behavior: .all)))
                    expect(drawerRight).notTo(equal(.scale))
                    expect(drawerLeft).notTo(equal(.drawer(position: .right)))
                    expect(drawerLeft).to(equal(.drawer(position: .left)))
                    expect(drawerLeft).notTo(equal(.drawer(position: .top)))
                    expect(drawerLeft).notTo(equal(.drawer(position: .bottom)))
                    expect(drawerLeft).notTo(equal(.fluid(behavior: .all)))
                    expect(drawerLeft).notTo(equal(.scale))
                    expect(drawerTop).notTo(equal(.drawer(position: .right)))
                    expect(drawerTop).notTo(equal(.drawer(position: .left)))
                    expect(drawerTop).to(equal(.drawer(position: .top)))
                    expect(drawerTop).notTo(equal(.drawer(position: .bottom)))
                    expect(drawerTop).notTo(equal(.fluid(behavior: .all)))
                    expect(drawerTop).notTo(equal(.scale))
                    expect(drawerBottom).notTo(equal(.drawer(position: .right)))
                    expect(drawerBottom).notTo(equal(.drawer(position: .left)))
                    expect(drawerBottom).notTo(equal(.drawer(position: .top)))
                    expect(drawerBottom).to(equal(.drawer(position: .bottom)))
                    expect(drawerBottom).notTo(equal(.fluid(behavior: .all)))
                    expect(drawerBottom).notTo(equal(.scale))
                }
                it("Conversion") {
                    expect(fluid.toNavigationStyle()).to(equal(FluidNavigationStyle.scale))
                    expect(scale.toNavigationStyle()).to(equal(FluidNavigationStyle.scale))
                    expect(slideRight.toNavigationStyle()).to(equal(FluidNavigationStyle.slide(direction: .fromRight)))
                    expect(slideLeft.toNavigationStyle()).to(equal(FluidNavigationStyle.slide(direction: .fromLeft)))
                    expect(slideTop.toNavigationStyle()).to(equal(FluidNavigationStyle.slide(direction: .fromTop)))
                    expect(slideBottom.toNavigationStyle()).to(equal(FluidNavigationStyle.slide(direction: .fromBottom)))
                    expect(drawerRight.toNavigationStyle()).to(equal(FluidNavigationStyle.slide(direction: .fromRight)))
                    expect(drawerLeft.toNavigationStyle()).to(equal(FluidNavigationStyle.slide(direction: .fromLeft)))
                    expect(drawerTop.toNavigationStyle()).to(equal(FluidNavigationStyle.slide(direction: .fromTop)))
                    expect(drawerBottom.toNavigationStyle()).to(equal(FluidNavigationStyle.slide(direction: .fromBottom)))
                    expect(fluid.toTransitionStyle()).to(equal(FluidTransitionStyle.fluid(behavior: .all)))
                    expect(scale.toTransitionStyle()).to(equal(FluidTransitionStyle.scale))
                    expect(slideRight.toTransitionStyle()).to(equal(FluidTransitionStyle.slide(direction: .fromRight)))
                    expect(slideLeft.toTransitionStyle()).to(equal(FluidTransitionStyle.slide(direction: .fromLeft)))
                    expect(slideTop.toTransitionStyle()).to(equal(FluidTransitionStyle.slide(direction: .fromTop)))
                    expect(slideBottom.toTransitionStyle()).to(equal(FluidTransitionStyle.slide(direction: .fromBottom)))
                    expect(drawerRight.toTransitionStyle()).to(equal(FluidTransitionStyle.drawer(position: .right)))
                    expect(drawerLeft.toTransitionStyle()).to(equal(FluidTransitionStyle.drawer(position: .left)))
                    expect(drawerTop.toTransitionStyle()).to(equal(FluidTransitionStyle.drawer(position: .top)))
                    expect(drawerBottom.toTransitionStyle()).to(equal(FluidTransitionStyle.drawer(position: .bottom)))
                }
                it("Condition") {
                    expect(fluid.isFluid).to(equal(true))
                    expect(fluid.isScale).to(equal(false))
                    expect(fluid.isSlide).to(equal(false))
                    expect(fluid.isVerticalSlide).to(equal(false))
                    expect(fluid.isTopSlide).to(equal(false))
                    expect(fluid.isBottomSlide).to(equal(false))
                    expect(fluid.isDrawer).to(equal(false))
                    expect(fluid.isVerticalDrawer).to(equal(false))
                    expect(fluid.isTopDrawer).to(equal(false))
                    expect(fluid.isBottomDrawer).to(equal(false))

                    expect(scale.isFluid).to(equal(false))
                    expect(scale.isScale).to(equal(true))
                    expect(scale.isSlide).to(equal(false))
                    expect(scale.isVerticalSlide).to(equal(false))
                    expect(scale.isTopSlide).to(equal(false))
                    expect(scale.isBottomSlide).to(equal(false))
                    expect(scale.isDrawer).to(equal(false))
                    expect(scale.isVerticalDrawer).to(equal(false))
                    expect(scale.isTopDrawer).to(equal(false))
                    expect(scale.isBottomDrawer).to(equal(false))

                    expect(slideRight.isFluid).to(equal(false))
                    expect(slideRight.isScale).to(equal(false))
                    expect(slideRight.isSlide).to(equal(true))
                    expect(slideRight.isVerticalSlide).to(equal(false))
                    expect(slideRight.isTopSlide).to(equal(false))
                    expect(slideRight.isBottomSlide).to(equal(false))
                    expect(slideRight.isDrawer).to(equal(false))
                    expect(slideRight.isVerticalDrawer).to(equal(false))
                    expect(slideRight.isTopDrawer).to(equal(false))
                    expect(slideRight.isBottomDrawer).to(equal(false))

                    expect(slideLeft.isFluid).to(equal(false))
                    expect(slideLeft.isScale).to(equal(false))
                    expect(slideLeft.isSlide).to(equal(true))
                    expect(slideLeft.isVerticalSlide).to(equal(false))
                    expect(slideLeft.isTopSlide).to(equal(false))
                    expect(slideLeft.isBottomSlide).to(equal(false))
                    expect(slideLeft.isDrawer).to(equal(false))
                    expect(slideLeft.isVerticalDrawer).to(equal(false))
                    expect(slideLeft.isTopDrawer).to(equal(false))
                    expect(slideLeft.isBottomDrawer).to(equal(false))

                    expect(slideTop.isFluid).to(equal(false))
                    expect(slideTop.isScale).to(equal(false))
                    expect(slideTop.isSlide).to(equal(true))
                    expect(slideTop.isVerticalSlide).to(equal(true))
                    expect(slideTop.isTopSlide).to(equal(true))
                    expect(slideTop.isBottomSlide).to(equal(false))
                    expect(slideTop.isDrawer).to(equal(false))
                    expect(slideTop.isVerticalDrawer).to(equal(false))
                    expect(slideTop.isTopDrawer).to(equal(false))
                    expect(slideTop.isBottomDrawer).to(equal(false))

                    expect(slideBottom.isFluid).to(equal(false))
                    expect(slideBottom.isScale).to(equal(false))
                    expect(slideBottom.isSlide).to(equal(true))
                    expect(slideBottom.isVerticalSlide).to(equal(true))
                    expect(slideBottom.isTopSlide).to(equal(false))
                    expect(slideBottom.isBottomSlide).to(equal(true))
                    expect(slideBottom.isDrawer).to(equal(false))
                    expect(slideBottom.isVerticalDrawer).to(equal(false))
                    expect(slideBottom.isTopDrawer).to(equal(false))
                    expect(slideBottom.isBottomDrawer).to(equal(false))

                    expect(drawerRight.isFluid).to(equal(false))
                    expect(drawerRight.isScale).to(equal(false))
                    expect(drawerRight.isSlide).to(equal(false))
                    expect(drawerRight.isVerticalSlide).to(equal(false))
                    expect(drawerRight.isTopSlide).to(equal(false))
                    expect(drawerRight.isBottomSlide).to(equal(false))
                    expect(drawerRight.isDrawer).to(equal(true))
                    expect(drawerRight.isVerticalDrawer).to(equal(false))
                    expect(drawerRight.isTopDrawer).to(equal(false))
                    expect(drawerRight.isBottomDrawer).to(equal(false))

                    expect(drawerLeft.isFluid).to(equal(false))
                    expect(drawerLeft.isScale).to(equal(false))
                    expect(drawerLeft.isSlide).to(equal(false))
                    expect(drawerLeft.isVerticalSlide).to(equal(false))
                    expect(drawerLeft.isTopSlide).to(equal(false))
                    expect(drawerLeft.isBottomSlide).to(equal(false))
                    expect(drawerLeft.isDrawer).to(equal(true))
                    expect(drawerLeft.isVerticalDrawer).to(equal(false))
                    expect(drawerLeft.isTopDrawer).to(equal(false))
                    expect(drawerLeft.isBottomDrawer).to(equal(false))

                    expect(drawerTop.isFluid).to(equal(false))
                    expect(drawerTop.isScale).to(equal(false))
                    expect(drawerTop.isSlide).to(equal(false))
                    expect(drawerTop.isVerticalSlide).to(equal(false))
                    expect(drawerTop.isTopSlide).to(equal(false))
                    expect(drawerTop.isBottomSlide).to(equal(false))
                    expect(drawerTop.isDrawer).to(equal(true))
                    expect(drawerTop.isVerticalDrawer).to(equal(true))
                    expect(drawerTop.isTopDrawer).to(equal(true))
                    expect(drawerTop.isBottomDrawer).to(equal(false))

                    expect(drawerBottom.isFluid).to(equal(false))
                    expect(drawerBottom.isScale).to(equal(false))
                    expect(drawerBottom.isSlide).to(equal(false))
                    expect(drawerBottom.isVerticalSlide).to(equal(false))
                    expect(drawerBottom.isTopSlide).to(equal(false))
                    expect(drawerBottom.isBottomSlide).to(equal(false))
                    expect(drawerBottom.isDrawer).to(equal(true))
                    expect(drawerBottom.isVerticalDrawer).to(equal(true))
                    expect(drawerBottom.isTopDrawer).to(equal(false))
                    expect(drawerBottom.isBottomDrawer).to(equal(true))
                }
                it("Property") {
                    expect(fluid.interactionBehavior).to(equal(FluidInteractionBehavior.all))
                    expect(scale.interactionBehavior).to(equal(FluidInteractionBehavior.none))
                    expect(slideRight.interactionBehavior).to(equal(FluidInteractionBehavior.none))
                    expect(slideLeft.interactionBehavior).to(equal(FluidInteractionBehavior.none))
                    expect(slideTop.interactionBehavior).to(equal(FluidInteractionBehavior.none))
                    expect(slideBottom.interactionBehavior).to(equal(FluidInteractionBehavior.none))
                    expect(drawerRight.interactionBehavior).to(equal(FluidInteractionBehavior.none))
                    expect(drawerLeft.interactionBehavior).to(equal(FluidInteractionBehavior.none))
                    expect(drawerTop.interactionBehavior).to(equal(FluidInteractionBehavior.none))
                    expect(drawerBottom.interactionBehavior).to(equal(FluidInteractionBehavior.none))

                    expect(fluid.interactionBehavior.isScale).to(equal(true))
                    expect(fluid.interactionBehavior.isVertical).to(equal(false))
                    expect(fluid.interactionBehavior.isBidirectional).to(equal(true))

                    expect(scale.interactionBehavior.isScale).to(equal(false))
                    expect(scale.interactionBehavior.isVertical).to(equal(false))
                    expect(scale.interactionBehavior.isBidirectional).to(equal(false))

                    expect(slideRight.interactionBehavior.isScale).to(equal(false))
                    expect(slideRight.interactionBehavior.isVertical).to(equal(false))
                    expect(slideRight.interactionBehavior.isBidirectional).to(equal(false))

                    expect(drawerRight.interactionBehavior.isScale).to(equal(false))
                    expect(drawerRight.interactionBehavior.isVertical).to(equal(false))
                    expect(drawerRight.interactionBehavior.isBidirectional).to(equal(false))

                    if FluidConst.isNewerSystemVersion {
                        expect(fluid.defaultPresentEasing).to(equal(FluidAnimatorEasing.spring(dampingRatio: FluidConst.springDampingRatio, frequencyResponse: FluidConst.springFrequencyResponse)))
                        expect(scale.defaultPresentEasing).to(equal(FluidAnimatorEasing.spring(dampingRatio: FluidConst.springDampingRatio, frequencyResponse: FluidConst.springFrequencyResponse)))
                    } else {
                        expect(fluid.defaultPresentEasing).to(equal(FluidAnimatorEasing.easeInQuad))
                        expect(scale.defaultPresentEasing).to(equal(FluidAnimatorEasing.easeInQuad))
                    }
                    expect(slideRight.defaultPresentEasing).to(equal(FluidAnimatorEasing.easeOutCubic))
                    expect(slideLeft.defaultPresentEasing).to(equal(FluidAnimatorEasing.easeOutCubic))
                    expect(slideTop.defaultPresentEasing).to(equal(FluidAnimatorEasing.easeOutCubic))
                    expect(slideBottom.defaultPresentEasing).to(equal(FluidAnimatorEasing.easeOutCubic))
                    expect(drawerRight.defaultPresentEasing).to(equal(FluidAnimatorEasing.easeOutCubic))
                    expect(drawerLeft.defaultPresentEasing).to(equal(FluidAnimatorEasing.easeOutCubic))
                    expect(drawerTop.defaultPresentEasing).to(equal(FluidAnimatorEasing.easeOutCubic))
                    expect(drawerBottom.defaultPresentEasing).to(equal(FluidAnimatorEasing.easeOutCubic))

                    if FluidConst.isNewerSystemVersion {
                        expect(fluid.defaultDismissEasing).to(equal(FluidAnimatorEasing.spring(dampingRatio: FluidConst.springDampingRatio, frequencyResponse: FluidConst.springFrequencyResponse)))
                        expect(scale.defaultDismissEasing).to(equal(FluidAnimatorEasing.spring(dampingRatio: FluidConst.springDampingRatio, frequencyResponse: FluidConst.springFrequencyResponse)))
                    } else {
                        expect(fluid.defaultDismissEasing).to(equal(FluidAnimatorEasing.easeInOutQuad))
                        expect(scale.defaultDismissEasing).to(equal(FluidAnimatorEasing.easeInOutQuad))
                    }
                    expect(slideRight.defaultDismissEasing).to(equal(FluidAnimatorEasing.easeInOutSine))
                    expect(slideLeft.defaultDismissEasing).to(equal(FluidAnimatorEasing.easeInOutSine))
                    expect(slideTop.defaultDismissEasing).to(equal(FluidAnimatorEasing.easeInOutSine))
                    expect(slideBottom.defaultDismissEasing).to(equal(FluidAnimatorEasing.easeInOutSine))
                    expect(drawerRight.defaultDismissEasing).to(equal(FluidAnimatorEasing.easeInOutSine))
                    expect(drawerLeft.defaultDismissEasing).to(equal(FluidAnimatorEasing.easeInOutSine))
                    expect(drawerTop.defaultDismissEasing).to(equal(FluidAnimatorEasing.easeInOutSine))
                    expect(drawerBottom.defaultDismissEasing).to(equal(FluidAnimatorEasing.easeInOutSine))

                    expect(fluid.slideDirection).to(beNil())
                    expect(scale.slideDirection).to(beNil())
                    expect(slideLeft.slideDirection).to(equal(FluidSlideDirection.fromLeft))
                    expect(slideRight.slideDirection).to(equal(FluidSlideDirection.fromRight))
                    expect(slideTop.slideDirection).to(equal(FluidSlideDirection.fromTop))
                    expect(slideBottom.slideDirection).to(equal(FluidSlideDirection.fromBottom))
                    expect(drawerLeft.slideDirection).to(beNil())
                    expect(drawerRight.slideDirection).to(beNil())
                    expect(drawerTop.slideDirection).to(beNil())
                    expect(drawerBottom.slideDirection).to(beNil())

                    expect(slideLeft.slideDirection?.isFromTop).to(equal(false))
                    expect(slideLeft.slideDirection?.isFromBottom).to(equal(false))
                    expect(slideLeft.slideDirection?.isFromVertical).to(equal(false))
                    expect(slideLeft.slideDirection?.isFromLeft).to(equal(true))
                    expect(slideLeft.slideDirection?.isFromRight).to(equal(false))
                    expect(slideLeft.slideDirection?.isFromHorizontal).to(equal(true))
                    expect(slideRight.slideDirection?.isFromTop).to(equal(false))
                    expect(slideRight.slideDirection?.isFromBottom).to(equal(false))
                    expect(slideRight.slideDirection?.isFromVertical).to(equal(false))
                    expect(slideRight.slideDirection?.isFromLeft).to(equal(false))
                    expect(slideRight.slideDirection?.isFromRight).to(equal(true))
                    expect(slideRight.slideDirection?.isFromHorizontal).to(equal(true))
                    expect(slideTop.slideDirection?.isFromTop).to(equal(true))
                    expect(slideTop.slideDirection?.isFromBottom).to(equal(false))
                    expect(slideTop.slideDirection?.isFromVertical).to(equal(true))
                    expect(slideTop.slideDirection?.isFromLeft).to(equal(false))
                    expect(slideTop.slideDirection?.isFromRight).to(equal(false))
                    expect(slideTop.slideDirection?.isFromHorizontal).to(equal(false))
                    expect(slideBottom.slideDirection?.isFromTop).to(equal(false))
                    expect(slideBottom.slideDirection?.isFromBottom).to(equal(true))
                    expect(slideBottom.slideDirection?.isFromVertical).to(equal(true))
                    expect(slideBottom.slideDirection?.isFromLeft).to(equal(false))
                    expect(slideBottom.slideDirection?.isFromRight).to(equal(false))
                    expect(slideBottom.slideDirection?.isFromHorizontal).to(equal(false))

                    expect(fluid.drawerPosition).to(beNil())
                    expect(scale.drawerPosition).to(beNil())
                    expect(slideLeft.drawerPosition).to(beNil())
                    expect(slideRight.drawerPosition).to(beNil())
                    expect(slideTop.drawerPosition).to(beNil())
                    expect(slideBottom.drawerPosition).to(beNil())
                    expect(drawerLeft.drawerPosition).to(equal(FluidDrawerPosition.left))
                    expect(drawerRight.drawerPosition).to(equal(FluidDrawerPosition.right))
                    expect(drawerTop.drawerPosition).to(equal(FluidDrawerPosition.top))
                    expect(drawerBottom.drawerPosition).to(equal(FluidDrawerPosition.bottom))

                    expect(drawerLeft.drawerPosition?.isTop).to(equal(false))
                    expect(drawerLeft.drawerPosition?.isBottom).to(equal(false))
                    expect(drawerLeft.drawerPosition?.isVertical).to(equal(false))
                    expect(drawerLeft.drawerPosition?.isLeft).to(equal(true))
                    expect(drawerLeft.drawerPosition?.isRight).to(equal(false))
                    expect(drawerLeft.drawerPosition?.isHorizontal).to(equal(true))
                    expect(drawerRight.drawerPosition?.isTop).to(equal(false))
                    expect(drawerRight.drawerPosition?.isBottom).to(equal(false))
                    expect(drawerRight.drawerPosition?.isVertical).to(equal(false))
                    expect(drawerRight.drawerPosition?.isLeft).to(equal(false))
                    expect(drawerRight.drawerPosition?.isRight).to(equal(true))
                    expect(drawerRight.drawerPosition?.isHorizontal).to(equal(true))
                    expect(drawerTop.drawerPosition?.isTop).to(equal(true))
                    expect(drawerTop.drawerPosition?.isBottom).to(equal(false))
                    expect(drawerTop.drawerPosition?.isVertical).to(equal(true))
                    expect(drawerTop.drawerPosition?.isLeft).to(equal(false))
                    expect(drawerTop.drawerPosition?.isRight).to(equal(false))
                    expect(drawerTop.drawerPosition?.isHorizontal).to(equal(false))
                    expect(drawerBottom.drawerPosition?.isTop).to(equal(false))
                    expect(drawerBottom.drawerPosition?.isBottom).to(equal(true))
                    expect(drawerBottom.drawerPosition?.isVertical).to(equal(true))
                    expect(drawerBottom.drawerPosition?.isLeft).to(equal(false))
                    expect(drawerBottom.drawerPosition?.isRight).to(equal(false))
                    expect(drawerBottom.drawerPosition?.isHorizontal).to(equal(false))

                    expect(fluid.presentAxis()).to(equal(FluidGestureAxis.negativeY))
                    expect(scale.presentAxis()).to(equal(FluidGestureAxis.negativeY))
                    expect(slideLeft.presentAxis()).to(equal(FluidGestureAxis.positiveX))
                    expect(slideRight.presentAxis()).to(equal(FluidGestureAxis.negativeX))
                    expect(slideTop.presentAxis()).to(equal(FluidGestureAxis.positiveY))
                    expect(slideBottom.presentAxis()).to(equal(FluidGestureAxis.negativeY))
                    expect(drawerLeft.presentAxis()).to(equal(FluidGestureAxis.positiveX))
                    expect(drawerRight.presentAxis()).to(equal(FluidGestureAxis.negativeX))
                    expect(drawerTop.presentAxis()).to(equal(FluidGestureAxis.positiveY))
                    expect(drawerBottom.presentAxis()).to(equal(FluidGestureAxis.negativeY))

                    expect(fluid.dismissAxis()).to(equal(FluidGestureAxis.positiveY))
                    expect(scale.dismissAxis()).to(equal(FluidGestureAxis.positiveY))
                    expect(slideLeft.dismissAxis()).to(equal(FluidGestureAxis.negativeX))
                    expect(slideRight.dismissAxis()).to(equal(FluidGestureAxis.positiveX))
                    expect(slideTop.dismissAxis()).to(equal(FluidGestureAxis.negativeY))
                    expect(slideBottom.dismissAxis()).to(equal(FluidGestureAxis.positiveY))
                    expect(drawerLeft.dismissAxis()).to(equal(FluidGestureAxis.negativeX))
                    expect(drawerRight.dismissAxis()).to(equal(FluidGestureAxis.positiveX))
                    expect(drawerTop.dismissAxis()).to(equal(FluidGestureAxis.negativeY))
                    expect(drawerBottom.dismissAxis()).to(equal(FluidGestureAxis.positiveY))
                }
                it("Description") {
                    expect(String(describing: fluid)).to(beginWith("fluid"))
                    expect(String(describing: scale)).to(beginWith("scale"))
                    expect(String(describing: slideRight)).to(beginWith("slide"))
                    expect(String(describing: slideLeft)).to(beginWith("slide"))
                    expect(String(describing: slideTop)).to(beginWith("slide"))
                    expect(String(describing: slideBottom)).to(beginWith("slide"))
                    expect(String(describing: drawerLeft)).to(beginWith("drawer"))
                    expect(String(describing: drawerRight)).to(beginWith("drawer"))
                    expect(String(describing: drawerTop)).to(beginWith("drawer"))
                    expect(String(describing: drawerBottom)).to(beginWith("drawer"))
                }
            }
            describe("FluidProgressState") {
                let begin: FluidProgressState = .begin
                let update: FluidProgressState = .update
                let cancel: FluidProgressState = .cancel
                let end: FluidProgressState = .end
                it("Description") {
                    expect(String(describing: begin)).to(beginWith("begin"))
                    expect(String(describing: update)).to(beginWith("update"))
                    expect(String(describing: cancel)).to(beginWith("cancel"))
                    expect(String(describing: end)).to(beginWith("end"))
                }
            }
            describe("FluidRoundCornerStyle") {
                let top: FluidRoundCornerStyle = FluidRoundCornerStyle.top
                let right: FluidRoundCornerStyle = FluidRoundCornerStyle.right
                let bottom: FluidRoundCornerStyle = FluidRoundCornerStyle.bottom
                let left: FluidRoundCornerStyle = FluidRoundCornerStyle.left
                let all: FluidRoundCornerStyle = FluidRoundCornerStyle.all
                let none: FluidRoundCornerStyle = FluidRoundCornerStyle.none
                it("Initialization") {
                    expect(FluidRoundCornerStyle(rawValue: 1 << 0)).to(equal(top))
                    expect(FluidRoundCornerStyle(rawValue: 1 << 1)).to(equal(right))
                    expect(FluidRoundCornerStyle(rawValue: 1 << 2)).to(equal(bottom))
                    expect(FluidRoundCornerStyle(rawValue: 1 << 3)).to(equal(left))
                }
                it("UIRectCorner") {
                    expect(top.roundingCorners).to(equal([.topLeft, .topRight]))
                    expect(right.roundingCorners).to(equal([.topRight, .bottomRight]))
                    expect(bottom.roundingCorners).to(equal([.bottomLeft, .bottomRight]))
                    expect(left.roundingCorners).to(equal([.topLeft, .bottomLeft]))
                    expect(all.roundingCorners).to(equal(UIRectCorner.allCorners))
                    expect(none.roundingCorners).to(beNil())
                }
                if #available(iOS 11.0, *) {
                    it("CACornerMask") {
                        expect(top.maskedCorners).to(equal([.layerMinXMinYCorner, .layerMaxXMinYCorner]))
                        expect(right.maskedCorners).to(equal([.layerMaxXMinYCorner, .layerMaxXMaxYCorner]))
                        expect(bottom.maskedCorners).to(equal([.layerMinXMaxYCorner, .layerMaxXMaxYCorner]))
                        expect(left.maskedCorners).to(equal([.layerMinXMinYCorner, .layerMinXMaxYCorner]))
                        expect(all.maskedCorners).to(equal([.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]))
                        expect(none.maskedCorners).to(equal([]))
                    }
                }
                it("Description") {
                    expect(String(describing: top)).to(beginWith("top"))
                    expect(String(describing: right)).to(beginWith("right"))
                    expect(String(describing: bottom)).to(beginWith("bottom"))
                    expect(String(describing: left)).to(beginWith("left"))
                    expect(String(describing: all)).to(beginWith("top, right, left"))
                    expect(String(describing: none)).to(beginWith("none"))
                }
            }
            describe("FluidAnimatorEasing") {
                let linear: FluidAnimatorEasing = FluidAnimatorEasing.linear
                let easeIn: FluidAnimatorEasing = FluidAnimatorEasing.easeIn
                let easeOut: FluidAnimatorEasing = FluidAnimatorEasing.easeOut
                let easeInOut: FluidAnimatorEasing = FluidAnimatorEasing.easeInOut
                let easeInSine: FluidAnimatorEasing = FluidAnimatorEasing.easeInSine
                let easeOutSine: FluidAnimatorEasing = FluidAnimatorEasing.easeOutSine
                let easeInOutSine: FluidAnimatorEasing = FluidAnimatorEasing.easeInOutSine
                let easeInQuad: FluidAnimatorEasing = FluidAnimatorEasing.easeInQuad
                let easeOutQuad: FluidAnimatorEasing = FluidAnimatorEasing.easeOutQuad
                let easeInOutQuad: FluidAnimatorEasing = FluidAnimatorEasing.easeInOutQuad
                let easeInCubic: FluidAnimatorEasing = FluidAnimatorEasing.easeInCubic
                let easeOutCubic: FluidAnimatorEasing = FluidAnimatorEasing.easeOutCubic
                let easeInOutCubic: FluidAnimatorEasing = FluidAnimatorEasing.easeInOutCubic
                let easeInQuart: FluidAnimatorEasing = FluidAnimatorEasing.easeInQuart
                let easeOutQuart: FluidAnimatorEasing = FluidAnimatorEasing.easeOutQuart
                let easeInOutQuart: FluidAnimatorEasing = FluidAnimatorEasing.easeInOutQuart
                let easeInQuint: FluidAnimatorEasing = FluidAnimatorEasing.easeInQuint
                let easeOutQuint: FluidAnimatorEasing = FluidAnimatorEasing.easeOutQuint
                let easeInOutQuint: FluidAnimatorEasing = FluidAnimatorEasing.easeInOutQuint
                let easeInExpo: FluidAnimatorEasing = FluidAnimatorEasing.easeInExpo
                let easeOutExpo: FluidAnimatorEasing = FluidAnimatorEasing.easeOutExpo
                let easeInOutExpo: FluidAnimatorEasing = FluidAnimatorEasing.easeInOutExpo
                let easeInCirc: FluidAnimatorEasing = FluidAnimatorEasing.easeInCirc
                let easeOutCirc: FluidAnimatorEasing = FluidAnimatorEasing.easeOutCirc
                let easeInOutCirc: FluidAnimatorEasing = FluidAnimatorEasing.easeInOutCirc
                let easeInBack: FluidAnimatorEasing = FluidAnimatorEasing.easeInBack
                let easeOutBack: FluidAnimatorEasing = FluidAnimatorEasing.easeOutBack
                let easeInOutBack: FluidAnimatorEasing = FluidAnimatorEasing.easeInOutBack
                let cubicBezier: FluidAnimatorEasing = FluidAnimatorEasing.cubicBezier(c1x: 0.47, c1y: 0, c2x: 0.745, c2y: 0.715)
                let spring: FluidAnimatorEasing = FluidAnimatorEasing.spring
                it("Conversion") {
                    expect(linear.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeIn.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeOut.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInOut.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInSine.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeOutSine.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInOutSine.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInQuad.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeOutQuad.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInOutQuad.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInCubic.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeOutCubic.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInOutCubic.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInQuart.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeOutQuart.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInOutQuart.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInQuint.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeOutQuint.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInOutQuint.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInExpo.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeOutExpo.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInOutExpo.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInCirc.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeOutCirc.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInOutCirc.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInBack.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeOutBack.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(easeInOutBack.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(cubicBezier.timingParameters).to(beAnInstanceOf(UICubicTimingParameters.self))
                    expect(spring.timingParameters).to(beAnInstanceOf(UISpringTimingParameters.self))

                    expect(linear.timingFunction).notTo(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeIn.timingFunction).notTo(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeOut.timingFunction).notTo(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInOut.timingFunction).notTo(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInSine.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeOutSine.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInOutSine.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInQuad.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeOutQuad.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInOutQuad.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInCubic.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeOutCubic.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInOutCubic.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInQuart.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeOutQuart.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInOutQuart.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInQuint.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeOutQuint.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInOutQuint.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInExpo.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeOutExpo.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInOutExpo.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInCirc.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeOutCirc.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInOutCirc.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInBack.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeOutBack.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(easeInOutBack.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(cubicBezier.timingFunction).to(beAnInstanceOf(CAMediaTimingFunction.self))
                    expect(spring.timingFunction).to(beNil())

                    let fromFrame: CGRect = CGRect(x: -768, y: 0, width: 768, height: 1024)
                    let toFrame: CGRect = CGRect(x: 0, y: 0, width: 768, height: 1024)
                    expect(linear.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeIn.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeOut.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInOut.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInSine.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeOutSine.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInOutSine.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInQuad.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeOutQuad.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInOutQuad.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInCubic.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeOutCubic.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInOutCubic.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInQuart.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeOutQuart.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInOutQuart.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInQuint.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeOutQuint.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInOutQuint.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInExpo.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeOutExpo.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInOutExpo.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInCirc.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeOutCirc.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInOutCirc.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInBack.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeOutBack.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(easeInOutBack.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(cubicBezier.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))
                    expect(spring.defaultDuration(fromFrame, toFrame, isPresenting: true)).to(beGreaterThan(0))

//                    linear
//                    easeIn
//                    easeOut
//                    easeInOut
//                    easeInSine
//                    easeOutSine
//                    easeInOutSine
//                    easeInQuad
//                    easeOutQuad
//                    easeInOutQuad
//                    easeInCubic
//                    easeOutCubic
//                    easeInOutCubic
//                    easeInQuart
//                    easeOutQuart
//                    easeInOutQuart
//                    easeInQuint
//                    easeOutQuint
//                    easeInOutQuint
//                    easeInExpo
//                    easeOutExpo
//                    easeInOutExpo
//                    easeInCirc
//                    easeOutCirc
//                    easeInOutCirc
//                    easeInBack
//                    easeOutBack
//                    easeInOutBack
//                    cubicBezier
//                    spring
                }
                it("Condition") {
                    expect(linear.isSpring).to(beFalse())
                    expect(spring.isSpring).to(beTrue())

                    expect(linear.isAvailable).to(beTrue())
                    expect(easeIn.isAvailable).to(beTrue())
                    expect(easeOut.isAvailable).to(beTrue())
                    expect(easeInOut.isAvailable).to(beTrue())
                    expect(easeInSine.isAvailable).to(beTrue())
                    expect(easeOutSine.isAvailable).to(beTrue())
                    expect(easeInOutSine.isAvailable).to(beTrue())
                    expect(easeInQuad.isAvailable).to(beTrue())
                    expect(easeOutQuad.isAvailable).to(beTrue())
                    expect(easeInOutQuad.isAvailable).to(beTrue())
                    expect(easeInCubic.isAvailable).to(beTrue())
                    expect(easeOutCubic.isAvailable).to(beTrue())
                    expect(easeInOutCubic.isAvailable).to(beTrue())
                    expect(easeInQuart.isAvailable).to(beTrue())
                    expect(easeOutQuart.isAvailable).to(beTrue())
                    expect(easeInOutQuart.isAvailable).to(beTrue())
                    expect(easeInQuint.isAvailable).to(beTrue())
                    expect(easeOutQuint.isAvailable).to(beTrue())
                    expect(easeInOutQuint.isAvailable).to(beTrue())
                    expect(easeInExpo.isAvailable).to(beTrue())
                    expect(easeOutExpo.isAvailable).to(beTrue())
                    expect(easeInOutExpo.isAvailable).to(beTrue())
                    expect(easeInCirc.isAvailable).to(beTrue())
                    expect(easeOutCirc.isAvailable).to(beTrue())
                    expect(easeInOutCirc.isAvailable).to(beTrue())
                    if #available(iOS 11.0, *) {
                        expect(easeInBack.isAvailable).to(beTrue())
                        expect(easeOutBack.isAvailable).to(beTrue())
                        expect(easeInOutBack.isAvailable).to(beTrue())
                        expect(cubicBezier.isAvailable).to(beTrue())
                        expect(spring.isAvailable).to(beTrue())
                    } else {
                        expect(easeInBack.isAvailable).to(beFalse())
                        expect(easeOutBack.isAvailable).to(beFalse())
                        expect(easeInOutBack.isAvailable).to(beFalse())
                        expect(cubicBezier.isAvailable).to(beTrue())
                        expect(spring.isAvailable).to(beFalse())
                    }
                }
                it("Description") {
                    expect(String(describing: linear)).to(beginWith("linear"))
                    expect(String(describing: easeIn)).to(beginWith("easeIn"))
                    expect(String(describing: easeOut)).to(beginWith("easeOut"))
                    expect(String(describing: easeInOut)).to(beginWith("easeInOut"))
                    expect(String(describing: easeInSine)).to(beginWith("easeInSine"))
                    expect(String(describing: easeOutSine)).to(beginWith("easeOutSine"))
                    expect(String(describing: easeInOutSine)).to(beginWith("easeInOutSine"))
                    expect(String(describing: easeInQuad)).to(beginWith("easeInQuad"))
                    expect(String(describing: easeOutQuad)).to(beginWith("easeOutQuad"))
                    expect(String(describing: easeInOutQuad)).to(beginWith("easeInOutQuad"))
                    expect(String(describing: easeInCubic)).to(beginWith("easeInCubic"))
                    expect(String(describing: easeOutCubic)).to(beginWith("easeOutCubic"))
                    expect(String(describing: easeInOutCubic)).to(beginWith("easeInOutCubic"))
                    expect(String(describing: easeInQuart)).to(beginWith("easeInQuart"))
                    expect(String(describing: easeOutQuart)).to(beginWith("easeOutQuart"))
                    expect(String(describing: easeInOutQuart)).to(beginWith("easeInOutQuart"))
                    expect(String(describing: easeInQuint)).to(beginWith("easeInQuint"))
                    expect(String(describing: easeOutQuint)).to(beginWith("easeOutQuint"))
                    expect(String(describing: easeInOutQuint)).to(beginWith("easeInOutQuint"))
                    expect(String(describing: easeInExpo)).to(beginWith("easeInExpo"))
                    expect(String(describing: easeOutExpo)).to(beginWith("easeOutExpo"))
                    expect(String(describing: easeInOutExpo)).to(beginWith("easeInOutExpo"))
                    expect(String(describing: easeInCirc)).to(beginWith("easeInCirc"))
                    expect(String(describing: easeOutCirc)).to(beginWith("easeOutCirc"))
                    expect(String(describing: easeInOutCirc)).to(beginWith("easeInOutCirc"))
                    expect(String(describing: easeInBack)).to(beginWith("easeInBack"))
                    expect(String(describing: easeOutBack)).to(beginWith("easeOutBack"))
                    expect(String(describing: easeInOutBack)).to(beginWith("easeInOutBack"))
                    expect(String(describing: cubicBezier)).to(beginWith("custom"))
                    expect(String(describing: spring)).to(beginWith("spring"))
                    expect(String(describing: FluidAnimatorEasing.easingDescription)).notTo(beNil())
                }
            }
        }
    }
}
