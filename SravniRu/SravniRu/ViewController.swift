//
//  ViewController.swift
//  SravniRu
//
//  Created by Marcus on 29.11.2021.
//

import UIKit

/// Протокол ViewController-а
protocol ViewControllerProtocol : AnyObject {

    /// Установить ячейку для секции расчета итоговой стоимости
    /// - Parameter cell: ячейка расчета итоговой стоимости
    func setupFinalPriceCell(cell: [UITableViewCell])
    
    /// Установить ячейки в секцию расчета
    /// - Parameter cells: обновление ячейки расчета итоговой стоимости
    func setupCalculateDataCells(cells: [UITableViewCell])
    
    /// Обновление секции расчета итоговой стоимости
    /// - Parameters :
    /// - cells: обновление ячейки расчета итоговой стоимости
    /// - isOpen: проверка раскрыта ли ячейка
    func updateFinalPriceSection(cells: [UITableViewCell], isOpen: Bool)
    
    /// Обновление секции расчета коэффициентов
    /// - Parameter cells: обновление ячейки секции расчета коэффициентов
    func updateCalculateSection(cells: [UITableViewCell])
    
    /// Обновить секцию
    /// - Parameters:
    ///   - cells: ячейки
    ///   - section: номер секции
    func updateSection(cells: [UITableViewCell], section: Int)
    
    /// Завершение загрузки данных
    func endDataLoading()
    
    /// Невозможность загрузки данных
    func unableData()
}

/// ViewController экрана "Калькулятор ОСАГО"
final class ViewController: UIViewController, ViewControllerProtocol {
    
    /// Презентер для экрана "Калькулятор ОСАГО"
    var presenter: PresenterOutputProtocol?
    private let tableView = CustomTableView()
    private var firstScreenPresentation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.start()
        view.backgroundColor = ColorsConstants.mainBackgroundColor
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title =  TextConstants.screenTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if firstScreenPresentation {
            firstScreenPresentation = false
        } else {
            presenter?.needUpdateCalculateData()
            presenter?.needUpdateSubtitle()
        }
    }

    func unableData() {
        let alert = UIAlertController(title: "",
                                      message: "Данные не были получены",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func endDataLoading() {
        setupTableView()
        setupConstraints()
    }

    func updateFinalPriceSection(cells: [UITableViewCell], isOpen: Bool) {
        var cell = cells
        cell.removeFirst()
        tableView.collapseCellUpdate(settingCells: cell, section: 0, isOpen: isOpen)
    }
    
    func setupFinalPriceCell(cell: [UITableViewCell]) {
        tableView.setCells(settingCells: cell, section: 0)
    }
    
    func setupCalculateDataCells(cells: [UITableViewCell]) {
        tableView.setCells(settingCells: cells, section: 1)
    }
    
    func updateCalculateSection(cells: [UITableViewCell]) {
        tableView.updateSection(section: 1, settingCells: cells)
    }
    
    func updateSection(cells: [UITableViewCell], section: Int) {
        tableView.updateSection(section: section, settingCells: cells)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

