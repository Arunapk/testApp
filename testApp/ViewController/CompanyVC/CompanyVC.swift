//
//  CompanyVC.swift
//  testApp
//
//  Created by HTS-676 on 13/09/25.
//

import UIKit

class CompanyVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTF: UITextField!
    
    @IBOutlet weak var searchViewHConst: NSLayoutConstraint!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchBGView: UIView!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel = CompanyViewModel()
    var _clientResponse: ClientResponse?
    
    var clientData: [Client] = []
    var filteredData: [Client] = []
    
    var isHeaderCollapsed = false
    var isSearchActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Init TableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CompanyTVCell", bundle: nil), forCellReuseIdentifier: "CompanyTVCell")
        
        searchTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        searchBtn.addTarget(self, action: #selector(searchButtonTapped(_:)), for: .touchUpInside)
        searchBtn.alpha = 0
        
        //setUpCombineListener
        setupListener()
        
        //API Call
        showLoader()
        viewModel.fetchData(user_id: "USR5021", page_size: 1000, current_page: 1, enabled_status: 1)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.searchBGView.cornerRadius(12)
    }
    
    func showLoader() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
            self.view.isUserInteractionEnabled = false
        }
    }

    func hideLoader() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.view.isUserInteractionEnabled = true
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        filterSearchResults(query: textField.text ?? "")
    }
    
    private func setupListener(){
        viewModel.$clientResponse.sink(receiveValue: { [weak self] (receiveValue) in
            guard let self = self else{ return }
            DispatchQueue.main.async(execute: updateUI)
        })
        .store(in: &viewModel.cancelable)
    }
    
    private func updateUI() {
        _clientResponse = viewModel.clientResponse
//        debugPrint("_clientResponse\(_clientResponse)")
        if _clientResponse?.success == true {
            hideLoader()
            clientData = viewModel.clientResponse?.result ?? []
            filteredData = clientData
            self.tableView.reloadData()
        }
    }
    
    func filterSearchResults(query: String) {
        if query.isEmpty {
            filteredData = clientData // back to normal paginated array
        } else {
            filteredData = clientData.filter { client in
                client.clientName.lowercased().contains(query.lowercased())
            }
        }
        tableView.reloadData()
    }
    
    func collapseHeader() {
        isHeaderCollapsed = true
        UIView.animate(withDuration: 0.3) {
            self.searchViewHConst.constant = 0
            self.searchBtn.alpha = 1
            self.view.layoutIfNeeded()
        }
    }

    func expandHeader() {
        isHeaderCollapsed = false
        UIView.animate(withDuration: 0.3) {
            self.searchViewHConst.constant = 50
            self.searchBtn.alpha = 0
            self.view.layoutIfNeeded()
        }
    }

    @objc func searchButtonTapped(_ sender: UIButton) {
        isSearchActive = true
        UIView.animate(withDuration: 0.3) {
            self.searchViewHConst.constant = 50
            self.searchBtn.alpha = 0
            self.view.layoutIfNeeded()
        }
        searchTF.becomeFirstResponder()
    }
    
    //MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyTVCell", for: indexPath) as? CompanyTVCell else {
            return UITableViewCell()
        }
        let client = filteredData[indexPath.row]
        cell.configureCell(company: client)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard !isSearchActive else { return }
        guard let text = searchTF.text, text.isEmpty else { return } 
        let offsetY = scrollView.contentOffset.y
        if offsetY > 50, !isHeaderCollapsed {
            collapseHeader()
        } else if offsetY < 0, isHeaderCollapsed {
            expandHeader()
        }
    }


}
