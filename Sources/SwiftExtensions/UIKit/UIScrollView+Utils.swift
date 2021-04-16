//
//  File.swift
//  
//
//  Created by Crystalwing Bakaboe on 4/16/21.
//

import UIKit

//MARK: - EmptyCells
public class EmptyTableViewCell : UITableViewCell {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonSetup()
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonSetup()
    }
    
    func commonSetup() {
        self.isUserInteractionEnabled = false
        self.set(backgrounColor: .clear)
    }
    func set(backgrounColor : UIColor) {
        self.backgroundColor = backgroundColor
        self.contentView.backgroundColor = backgroundColor
    }
}
public class EmptyCollectionViewCell : UICollectionViewCell {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonSetup()
    }
    
    func commonSetup() {
        self.isUserInteractionEnabled = false
        self.set(backgrounColor: .clear)
    }
    func set(backgrounColor : UIColor) {
        self.backgroundColor = backgroundColor
        self.contentView.backgroundColor = backgroundColor
    }
}

//MARK: - UITableView
public extension UITableView {
    func safeScrollToRow(at indexPath : IndexPath, at position : UITableView.ScrollPosition, animated : Bool) {
        guard indexPath.section >= 0, indexPath.section < self.numberOfSections,
            indexPath.row < self.numberOfRows(inSection: indexPath.section) else {
                if indexPath.section == 0, indexPath.row == 0 { self.setContentOffset(.zero, animated: animated) }
                return
        }
        self.scrollToRow(at: indexPath, at: position, animated: animated)
    }
    func registerCell<T : UIView>(_ type : T.Type) {
        self.register(T.nib, forCellReuseIdentifier: T.identifier)
    }
    func dequeueReusableCell<T: UIView>(_ type : T.Type) -> T {
        return self.dequeueReusableCell(withIdentifier: T.identifier) as! T
    }
    func registerEmptyCell() {
        self.register(EmptyTableViewCell.self, forCellReuseIdentifier: EmptyTableViewCell.identifier)
    }
    func dequeueEmptyCell(bg : UIColor = .clear) -> UITableViewCell {
        let cell = self.dequeueReusableCell(EmptyTableViewCell.self)
        cell.set(backgrounColor: bg)
        return cell
    }
    func registerHeaderFooterCell<T : UIView>(_ type : T.Type) {
        self.register(T.nib, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
    func dequeueHeaderFooterView<T : UITableViewHeaderFooterView>(_ type : T.Type) -> T {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as! T
    }
    
}

//MARK: - UICollectionView
public extension UICollectionView {
    
    func safeScrollToItem(at indexPath : IndexPath, at position : UICollectionView.ScrollPosition, animated : Bool) {
        guard indexPath.section >= 0, indexPath.section < self.numberOfSections, indexPath.row < self.numberOfItems(inSection: indexPath.section) else {
            if indexPath.section == 0, indexPath.row == 0 { self.setContentOffset(.zero, animated: animated) }
            return
        }
        self.scrollToItem(at: indexPath, at: position, animated: animated)
    }
    
    func registerEmptyCell() {
        self.register(EmptyCollectionViewCell.self, forCellWithReuseIdentifier: EmptyCollectionViewCell.identifier)
    }
    func registerCell<T: UIView>(_ type : T.Type) {
        self.register(T.nib, forCellWithReuseIdentifier: T.identifier)
    }
    func dequeueEmptyCell(indexPath : IndexPath, bg : UIColor = .clear) -> UICollectionViewCell {
        let cell = self.dequeueCell(EmptyCollectionViewCell.self, for: indexPath)
        cell.set(backgrounColor: bg)
        return cell
    }
    func dequeueCell<T: UICollectionViewCell>(_ type : T.Type, for indexPath : IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
    
}
