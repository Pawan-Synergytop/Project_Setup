//
//  SubCategoryViewController.swift
//  FZAccordionTableViewExample
//
//  Created by Krisjanis Gaidis on 10/5/15.
//  Copyright © 2015 Fuzz. All rights reserved.
//

import UIKit

class SubCategoryViewController: BaseClassViewController {
    @IBOutlet fileprivate weak var tableView: FZAccordionTableView!
    @IBOutlet var viewTblBg: UIView!
    var resourceList = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
        tableView.register(UINib(nibName: "CategoryHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "CategoryHeaderView")
        self.resourceList = self.loadJson(filename: "responce")!
    }
    
    func addShadow(){
        viewTblBg.layer.shadowColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        viewTblBg.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        viewTblBg.layer.shadowOpacity = 0.6
        viewTblBg.layer.shadowRadius = 2.0
        viewTblBg.layer.cornerRadius = 10
        viewTblBg.layer.masksToBounds = true
    }
    
    func loadJson(filename fileName: String) -> NSMutableArray? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? NSDictionary {
                    let primaryCriteriaArray = dictionary.value(forKey: "primary_criteria") as! NSArray
                    let secondaryCriteriaArray = dictionary.value(forKey: "secondary_criteria") as! NSArray
                    let resourceListArray = dictionary.value(forKey: "resource_list") as! NSMutableArray
                    
                    for i in 0..<resourceListArray.count{
                        let objResource = resourceListArray[i] as! NSDictionary
                        let valuesArray = objResource.value(forKey: "values") as! NSArray
                        
                        let seniorityRanking = objResource.value(forKey: "seniority_ranking") as! String
                        let totalRanking = objResource.value(forKey: "total_ranking") as! String
                        
                        let subArray = NSMutableArray()
                        let subDic = NSMutableDictionary()
                        subDic.setValue("Seniority Ranking", forKey: "title")
                        subDic.setValue(seniorityRanking, forKey: "value")
                        subDic.setValue(false, forKey: "isEditable")
                        subDic.setValue("seniorityRanking", forKey: "type")
                        
                        subArray.add(subDic)
                        
                        for pIndex in 0..<primaryCriteriaArray.count{
                            let objPrimaryCriteria = primaryCriteriaArray[pIndex] as! NSMutableDictionary
                            let primaryId = objPrimaryCriteria.value(forKey: "id") as! Int
                            
                            for v in 0..<valuesArray.count{
                                let objVal = valuesArray[v] as! NSMutableDictionary
                                let valId = objVal.value(forKey: "criteria_id") as! Int
                                let valValue = objVal.value(forKey: "criteria_value") as! Int
                                
                                if valId == primaryId{
                                    objPrimaryCriteria.setValue(valValue, forKey: "value")
                                    break
                                }
                            }
                            
                            objPrimaryCriteria.setValue(true, forKey: "isEditable")
                            objPrimaryCriteria.setValue("primary_criteria", forKey: "type")
                            
                            subArray.add(objPrimaryCriteria)
                        }
                        
                        
                        
                        for sIndex in 0..<secondaryCriteriaArray.count{
                            let objSecondaryCriteria = secondaryCriteriaArray[sIndex] as! NSMutableDictionary
                            let secondaryId = objSecondaryCriteria.value(forKey: "id") as! Int
                            
                            for v in 0..<valuesArray.count{
                                let objVal = valuesArray[v] as! NSMutableDictionary
                                let valId = objVal.value(forKey: "criteria_id") as! Int
                                let valValue = objVal.value(forKey: "criteria_value") as! Int
                                
                                if valId == secondaryId{
                                    objSecondaryCriteria.setValue(valValue, forKey: "value")
                                    break
                                }
                            }
                            
                            objSecondaryCriteria.setValue(true, forKey: "isEditable")
                            objSecondaryCriteria.setValue("secondary_criteria", forKey: "type")
                            
                            subArray.add(objSecondaryCriteria)
                        }
                        
                        let subDic1 = NSMutableDictionary()
                        subDic1.setValue("Notification Score/Ranking", forKey: "title")
                        subDic1.setValue(totalRanking, forKey: "value")
                        subDic1.setValue(false, forKey: "isEditable")
                        subDic1.setValue("total_ranking", forKey: "type")
                        subArray.add(subDic1)
                        
                        objResource.setValue(subArray, forKey: "subArray")
                    }
                    
                    return resourceListArray
                }
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
        return nil
    }
    
}

    // MARK: - <UITableViewDataSource> / <UITableViewDelegate> -
//    extension SubCategoryViewController : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.resourceList.value(forKey: "")
//    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return self.resourceList.count
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 44.0
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 80.0
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return self.tableView(tableView, heightForRowAt: indexPath)
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        return self.tableView(tableView, heightForHeaderInSection:section)
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: SubCategoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryTableViewCell", for: indexPath) as! SubCategoryTableViewCell
//        let objSubCat = self.categoriesArray[indexPath.section].childcat?[indexPath.row]
//        cell.lblSubCatName.text = (objSubCat?.childcatTitle ?? "").uppercased()
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView: CategoryHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CategoryHeaderView") as! CategoryHeaderView
//        let objSubCat = self.categoriesArray[section]
//        let imgPath = objSubCat.icon?.icon ?? ""
//        headerView.imgCat.imageFromURL(urlString: imgPath)
//        headerView.lblItemName.text = objSubCat.title?.uppercased()
//
//        if (self.tableView.isSectionOpen(section) == true) {
//            headerView.imgErro.tintColor = .black
//        } else {
//            headerView.imgErro.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        }
//        return headerView
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        let objChildcat = self.categoriesArray[indexPath.section].childcat//?[indexPath.row]
////        let subCat = storyBoard.Home.instantiateViewController(withIdentifier: "ChildCategoryViewController") as! ChildCategoryViewController
////        subCat.childcatArray = objChildcat!//?.subcatId ?? ""
////        subCat.selectedIndex = indexPath.row
////        subCat.filterType = filterType
////        self.navigationController?.pushViewController(subCat, animated: true)
//    }
//}

// MARK: - <FZAccordionTableViewDelegate> -

extension SubCategoryViewController : FZAccordionTableViewDelegate {

    func tableView(_ tableView: FZAccordionTableView, willOpenSection section: Int, withHeader header: UITableViewHeaderFooterView?) {
        
    }
    
    func tableView(_ tableView: FZAccordionTableView, didOpenSection section: Int, withHeader header: UITableViewHeaderFooterView?) {
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: FZAccordionTableView, willCloseSection section: Int, withHeader header: UITableViewHeaderFooterView?) {
        
    }
    
    func tableView(_ tableView: FZAccordionTableView, didCloseSection section: Int, withHeader header: UITableViewHeaderFooterView?) {
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: FZAccordionTableView, canInteractWithHeaderAtSection section: Int) -> Bool {
        return true
    }
}

