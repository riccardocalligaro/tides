//
//  UIView+TinyConstraints.swift
//  VeniceTides
//
//  Created by Riccardo on 05/12/20.
//
import Foundation
import TinyConstraints

public extension View {
    @discardableResult
    private func safeLayoutGuide(for superview: View?) -> Constrainable {
        guard let superview = superview else {
            fatalError("Unable to create this constraint to it's superview, because it has no superview.")
        }
        prepareForLayout()
        return superview.layoutMarginsGuide
    }
    @discardableResult
    func leftToMargin(_ anchor: NSLayoutXAxisAnchor? = nil, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return left(to: safeLayoutGuide(for: superview), anchor, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    func rightToMargin(_ anchor: NSLayoutXAxisAnchor? = nil, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return right(to: safeLayoutGuide(for: superview), anchor, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    func leadingToMargin(_ anchor: NSLayoutXAxisAnchor? = nil, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return leading(to: safeLayoutGuide(for: superview), anchor, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    func trailingToMargin(_ anchor: NSLayoutXAxisAnchor? = nil, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return trailing(to: safeLayoutGuide(for: superview), anchor, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    func topToMargin(_ anchor: NSLayoutYAxisAnchor? = nil, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return top(to: safeLayoutGuide(for: superview), anchor, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    func bottomToMargin(_ anchor: NSLayoutYAxisAnchor? = nil, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraint {
        return bottom(to: safeLayoutGuide(for: superview), anchor, relation: relation, priority: priority, isActive: isActive)
    }

    @discardableResult
    func horizontalToMargin(_ anchor: NSLayoutXAxisAnchor? = nil, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> [Constraint] {
        var constraints = Constraints()
        constraints.append(leadingToMargin(anchor, relation: relation, priority: priority, isActive: isActive))
        constraints.append(trailingToMargin(anchor, relation: relation, priority: priority, isActive: isActive))
        return constraints
    }

    @discardableResult
    func verticalToMargin(_ anchor: NSLayoutYAxisAnchor? = nil, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> [Constraint] {
        var constraints = Constraints()
        constraints.append(topToMargin(anchor, relation: relation, priority: priority, isActive: isActive))
        constraints.append(bottomToMargin(anchor, relation: relation, priority: priority, isActive: isActive))
        return constraints
    }

    @discardableResult
    func edgesToMargin(excluding excludedEdge: LayoutEdge = .none, relation: ConstraintRelation = .equal, priority: LayoutPriority = .required, isActive: Bool = true) -> Constraints {
        var constraints = Constraints()

        if !excludedEdge.contains(.top) {
            constraints.append(topToMargin(relation: relation, priority: priority, isActive: isActive))
        }

        if effectiveUserInterfaceLayoutDirection == .leftToRight {
            if !(excludedEdge.contains(.leading) || excludedEdge.contains(.left)) {
                constraints.append(leadingToMargin(relation: relation, priority: priority, isActive: isActive))
            }

            if !(excludedEdge.contains(.trailing) || excludedEdge.contains(.right)) {
                constraints.append(trailingToMargin(relation: relation, priority: priority, isActive: isActive))
            }
        } else {
            if !(excludedEdge.contains(.leading) || excludedEdge.contains(.right)) {
                constraints.append(leadingToMargin(relation: relation, priority: priority, isActive: isActive))
            }
            if !(excludedEdge.contains(.trailing) || excludedEdge.contains(.left)) {
                constraints.append(trailingToMargin(relation: relation, priority: priority, isActive: isActive))
            }
        }

        if !excludedEdge.contains(.bottom) {
            constraints.append(bottomToMargin(relation: relation, priority: priority, isActive: isActive))
        }

        return constraints
    }
}
