//
//  DetailViewController.swift
//  ABProject
//
//  Created by Eddson on 30.01.2019.
//  Copyright © 2019 Eddson. All rights reserved.
//

import UIKit
import MapKit
import GLKit


class DetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var loader: UILoadingView!
    
    var presenter: DetailPresenter!
    
    var city: String?

    var datasource: [List] = []
    
    let indifier = "collectionCell"
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        presenter.loadWeather(city: city!)
        presenter.getLocationByCityName(city: city!)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension DetailViewController : DetailView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    
    func showLocationOnMap(location: CLLocationCoordinate2D) {
        showMarker(location: location)
        print("get location ->  \(location.latitude) - \(location.longitude)")
    }
    
    func showErrorLocation(value: String) {
        
        let actionSheet  = UIAlertController(title: "Ошибка определения локации", message: "Ну удалось найти координаты \(city!)", preferredStyle: .actionSheet)
        
            actionSheet.addAction(UIAlertAction(title: "Ok" , style: .cancel, handler: {_ in
                self.navigationController?.popViewController(animated: true)
            }))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.size.width, height:CGFloat(collectionView.bounds.size.height))
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indifier , for: indexPath) as! UIWeatherCellCollectionViewCell
            cell.createCell(item: datasource[indexPath.row])
            return cell
    }
    
    
    func showErrorScreen(error: String) {
        loader.showError(value: error)
        collectionView.isHidden = true
        map?.isHidden = true
    }
    
    
    func showNoContentScreen() {
        loader.showEmptyView()
        collectionView.isHidden = true
        map?.isHidden = true
    }
    
    
    func showLoading() {
        loader.showLoading()
        collectionView.isHidden = true
        map?.isHidden = true
    }
    
    func showResultScreen(result: [List]) {
        loader.isHidden = true
        datasource = result
        collectionView.reloadData()
        collectionView.isHidden = false
        map?.isHidden = false
    }
    
    
    func showMarker(location: CLLocationCoordinate2D){

        let annotations = self.map?.annotations
        self.map?.removeAnnotations(annotations!)
        

        //anotation (pin)
        let annotation = MKPointAnnotation()
            annotation.title = city!
            annotation.subtitle = "Вы искали \(city!)"
            annotation.coordinate = location
        
        
        self.map?.addAnnotation(annotation)
        
        
        //zooming
        let span = MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
        let region = MKCoordinateRegion(center: location,span: span)
        
        self.map?.setRegion(region, animated: true)
    }
    
}
