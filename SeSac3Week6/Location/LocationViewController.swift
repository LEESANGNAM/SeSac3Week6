//
//  LocationViewController.swift
//  SeSac3Week6
//
//  Created by 이상남 on 2023/08/22.
//

import UIKit
import CoreLocation //1. 위치 임포트
import MapKit
import SnapKit

class LocationViewController: UIViewController {
    
    //2. 위치 매니저생성: 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    
    
    let cinemaList: [Cinema] = CinemaList().mapAnnotations
    
    let annotationList: [MKPointAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(50)
        }
       
        view.backgroundColor = .white
        //3. 위치 프로토콜 연결
        locationManager.delegate = self
        //info.plist << 얼럿
//        locationManager.requestWhenInUseAuthorization()
//        let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
        checkDeviceLocationAuthorization()
//        setRegionAndAnnotation(center: center)
        setAnnotation(type: "전체보기")
    }
    
    func setNavigationBar(){
        //네비게이션바
        navigationItem.title = "네비바"
        navigationController?.navigationBar.barTintColor = .gray
        navigationController?.navigationBar.tintColor = .black
        
        //버튼
        let button = UIBarButtonItem(title: "fileter", style: .plain, target: self, action: #selector(filterButtonTapped))
        navigationItem.rightBarButtonItem = button
        
    }
    
    @objc func filterButtonTapped(){
        // 얼럿 필터
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let allAction = UIAlertAction(title: "전체보기", style: .default){ action in
            self.setAnnotation(type: action.title)
            
        }
        let cgvAction = UIAlertAction(title: "CGV", style: .default){ action in
            self.setAnnotation(type: action.title)
        }
        let lotteAction = UIAlertAction(title: "롯데시네마", style: .default){ action in
            self.setAnnotation(type: action.title)
        }
        let magaAction = UIAlertAction(title: "메가박스", style: .default){ action in
            self.setAnnotation(type: action.title)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        actionSheet.addAction(cancel)
        actionSheet.addAction(magaAction)
        actionSheet.addAction(lotteAction)
        actionSheet.addAction(cgvAction)
        actionSheet.addAction(allAction)
        
        present(actionSheet, animated: true)
        
        
    }
    
    
    func setAnnotation(type: String?){
        guard let type, !type.isEmpty else { return }
        
        let anntation1 = MKPointAnnotation()
        anntation1.coordinate = CLLocationCoordinate2D(latitude: cinemaList[0].latitude, longitude: cinemaList[0].longitude)
        anntation1.title = cinemaList[0].location
        let anntation2 = MKPointAnnotation()
        anntation2.coordinate = CLLocationCoordinate2D(latitude: cinemaList[1].latitude, longitude: cinemaList[1].longitude)
        anntation2.title = cinemaList[1].location
        let anntation3 = MKPointAnnotation()
        anntation3.coordinate = CLLocationCoordinate2D(latitude: cinemaList[2].latitude, longitude: cinemaList[2].longitude)
        anntation3.title = cinemaList[2].location
        let anntation4 = MKPointAnnotation()
        anntation4.coordinate = CLLocationCoordinate2D(latitude: cinemaList[3].latitude, longitude: cinemaList[3].longitude)
        anntation4.title = cinemaList[3].location
        let anntation5 = MKPointAnnotation()
        anntation5.coordinate = CLLocationCoordinate2D(latitude: cinemaList[4].latitude, longitude: cinemaList[4].longitude)
        anntation5.title = cinemaList[4].location
        let anntation6 = MKPointAnnotation()
        anntation6.coordinate = CLLocationCoordinate2D(latitude: cinemaList[5].latitude, longitude: cinemaList[5].longitude)
        anntation6.title = cinemaList[5].location
        
        
        if type == "전체보기"{// viewdidload
            mapView.addAnnotations([anntation1,anntation2,anntation3,anntation4,anntation5,anntation6])
        }else if type == "롯데시네마" {
            removeAnnotationsExceptTitle(title:type)
            mapView.addAnnotations([anntation1,anntation2])
        }else if type == "메가박스"{
            removeAnnotationsExceptTitle(title:type)
            mapView.addAnnotations([anntation3,anntation4])
        }else if type == "CGV"{
            removeAnnotationsExceptTitle(title:type)
            mapView.addAnnotations([anntation5,anntation6])
        }else{
            print("타입없음")
        }
    }
    func removeAnnotationsExceptTitle(title: String) {
        let annotationsToRemove = mapView.annotations.filter { annotation in
            return annotation.title != title
        }
        mapView.removeAnnotations(annotationsToRemove)
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D,title: String){
        //지도 중심 범위 설정
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapView.setRegion(region, animated: true)
        
        // 지도에 어노테이션(핀)추가
        let annotation = MKPointAnnotation()
        annotation.title = "현재위치 : \(title)" //37.531050, 126.928294
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
    }
    
    /*
     Location Authorization Custom Alert
     */
    func showLocationSettingAlert(){
        let alert = UIAlertController(title:"위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설장 > 개인정보보호'에서 위치 서비스를 켜주세요", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            // 설정에서 직접적으로 앱 설정 화면에 들어간적이 없다면
            // 한번도 설정 앱에 들어가지 않았거나, 막 다운받은 앱이라서
            // 설정 페이지로 넘어갈지, 설정 상세 페이지 결정 x
            if let appSetting = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(appSetting)
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel){ _ in
            let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
            self.setRegionAndAnnotation(center: center,title: "새싹영등포캠퍼스")
        }
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    
    
    func checkDeviceLocationAuthorization(){
        // iOS 위치 서비스 활성화 체크
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled(){
                // 현재 사용자의 위치 권한 상태를 가지고옴
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *){
                    authorization = self.locationManager.authorizationStatus
                }else{
                    authorization = CLLocationManager.authorizationStatus()
                }
                print(authorization)
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
            }else{
                print("위치서비스가 꺼져 있어서 위치 권한 요청을 못합니다.")
            }
        }
    }
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus){
        print("check",status)
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도 설정
            locationManager.requestWhenInUseAuthorization() // 얼럿, infoplist
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            showLocationSettingAlert()
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            // didUpdateLocations
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        @unknown default:
            print("default") // 나중에 추가 될 가능성을 대비
        }
    }
    
}
// 4. 프로토콜 선언
extension LocationViewController: CLLocationManagerDelegate{

    //5. 사용자의 위치를 성공적으로 가지고 온 경우
    // 한번만 실행되지 않는다. ios 위치 업데이트가 필요한 시점에 알아서 여러번 호출
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let cordinate = locations.last?.coordinate{ // 37.518052, 126.957236
            print(cordinate)
            setRegionAndAnnotation(center: cordinate,title: "노들섬")
        }
        
        
//        locationManager.stopUpdatingLocation() //한번만 실행하고 싶으면 stopUpdate를 호출해야한다.
    }
    // 사용자의 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    // 사용자의 권한 상태가 바뀔 때를 알려줌
    // 거부했다가 설정에서 변경을 했거나, 혹은 nodetermined상태에서 허용을 했거나.
    // 허용해서 위치를 가지고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아올 때 등
    //iOS14이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization()
    }
    // 사용자의 권한 상태가 바뀔 때를 알려줌
    //iOS14미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
    
}


extension LocationViewController: MKMapViewDelegate{
    // 움직이면?
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
    // 어노테이션 누르면?
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        print(#function)
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        <#code#>
//    }
    
}
