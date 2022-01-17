//
//  CustomTabelView.swift
//  SravniRu
//
//  Created by Marcus on 01.12.2021.
//

import Foundation
import UIKit

/// Кастомная таблица для рассчета ОСАГО
final class CustomTableView: UITableView {
    
    /// Словарь ячеек типа номер секции : массив ячеек
    var cells: [Int: [UITableViewCell]] = [:]
    private var insertCellsCount = 0
    
    init() {
        super.init(frame: .zero, style: .grouped)
        setupTableViewSettings()
        separatorStyle = .none
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Установить ячейки
    /// - Parameters:
    ///   - settingCells: ячейки, которые необходимо добавить в таблицу
    ///   - section: номер секции для ячеек
    func setCells(settingCells: [UITableViewCell], section: Int) {
        cells[section] = settingCells
    }
    
    /// Обновить секцию
    /// - Parameters:
    ///   - section: номер секции
    ///   - settingCells: ячейки для секции
    func updateSection(section: Int, settingCells: [UITableViewCell]) {
        cells[section] = settingCells
       // beginUpdates()
        reloadSections(IndexSet(integer: section), with: .none)
       // endUpdates()
    }
    
    /// Обновление ячейки
    /// - Parameters:
    ///   - settingCells: настройка ячейки
    ///   - section: номер секции
    ///   - isOpen: открыта ли ячейка
    func collapseCellUpdate(settingCells: [UITableViewCell], section: Int, isOpen: Bool) {
        var indexesPath: [IndexPath] = []
        if isOpen {
            insertCellsCount = settingCells.count
            cells[section]?.removeLast()
            let cellsCount = cells[section]?.count ?? 0
            for element in 1...settingCells.count {
                indexesPath.append(IndexPath(row: cellsCount - 1 + element, section: section))
            }
            beginUpdates()
            deleteRows(at: [IndexPath(row: cells.count, section: section)], with: .fade)
            cells[section]?.append(contentsOf: settingCells)
            insertRows(at: indexesPath, with: .fade)
        } else {
            var cellsCount = cells[section]?.count ?? 0
            for element in 0..<insertCellsCount {
                indexesPath.append(IndexPath(row: cellsCount - 1 - element, section: section))
                cells[section]?.removeLast()
            }
            beginUpdates()
            deleteRows(at: indexesPath, with: .fade)
            cells[section]?.append(RoundedCornerCell(isTopCornerRound: false))
            cellsCount = cells[section]?.count ?? 0
            insertRows(at: [IndexPath(row: cellsCount - 1, section: section)], with: .fade)
        }
        endUpdates()
    }

    private func setupTableViewSettings() {
        backgroundColor = ColorsConstants.mainBackgroundColor
    }
    
    enum Constants {
        /// Высота для хедера
        static let sectionHeaderHeight: CGFloat = 24
    }
}

extension CustomTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells[section]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionItems = cells[indexPath.section]  ?? []
        return sectionItems[indexPath.item]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.sectionHeaderHeight
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        " "
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        cells.keys.count
    }
}

