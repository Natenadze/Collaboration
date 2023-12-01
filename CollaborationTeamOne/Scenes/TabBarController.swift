//
//  TabBarController.swift
//  CollaborationTeamOne
//
//  Created by Davit Natenadze on 29.11.23.
//

import Foundation

import UIKit

final class TabBarController: UITabBarController {
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        let navBarAppearance = UINavigationBarAppearance()
        //        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.configureWithTransparentBackground() // to hide Navigation Bar Line
        navBarAppearance.backgroundColor = .systemBackground
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = .systemGray2
    }
    
    // MARK: - Methods
    
    private func setupTabs() {
        
        let air = createNavigation("Air", UIImage(systemName: "house"), controller: AirQualityController())
        let weather = createNavigation("Weather", UIImage(systemName: "person"), controller: WeatherController())
        let specie = createNavigation("Specie", UIImage(systemName: "pencil"), controller: SpecieController())
        let solar = createNavigation("Solar", UIImage(systemName: "lasso"), controller: SolarResourceController())
        let population = createNavigation("Population", UIImage(systemName: "paperplane"), controller: PopulationController())
        
        setViewControllers([air, weather, specie, solar, population], animated: true)
    }
    
    
    private func createNavigation(_ title: String, _ image: UIImage?, controller: UIViewController) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: controller)
        
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        navController.navigationItem.title = "nav title"
        navController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.red], for: .selected)
        
        navController.viewControllers.first?.navigationItem.title = title + "Controller"
        
        return navController
    }
    
}
