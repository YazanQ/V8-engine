//
//  File.swift
//  
//
//  Created by Yazan Qaisi on 05/06/2024.
//

import UIKit

public final class SectionTableViewDataSource: NSObject {

    public private(set) var dataSources: [UITableViewDataSource]

    public init(dataSources: [UITableViewDataSource] = []) {
        self.dataSources = dataSources
    }

    public func setDataSources(_ dataSources: [UITableViewDataSource]) {
        self.dataSources = dataSources
    }

    public func removeDataSource(_ dataSource: UITableViewDataSource) {
        self.dataSources.removeAll { $0 === dataSource }
    }
}

extension SectionTableViewDataSource: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        dataSources.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dataSource = dataSources[section]
        return dataSource.tableView(tableView, numberOfRowsInSection: section)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataSource = dataSources[indexPath.section]
        return dataSource.tableView(tableView, cellForRowAt: indexPath)
    }
}
