//
//  ViewController.m
//  WindowMap
//
//  Created by Isabelle Park on 12/6/13.
//  Copyright (c) 2013 izzy. All rights reserved.
//

#import "ViewController.h"
//import our location data class
#import "myAnnotation.h"

#define METERS_PER_MILE 1609.344 //constant for meters per mile

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a storyboard
    //4 set the mapView delegate to self(this class)?
    self.mapView.delegate = self;
    //5 set our title and cordinate pins
    //this is not the right way! temporary for now, as we usually grab this from some JSON
    //instantiate custom annotation class
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = 39.95350;
    coordinate1.longitude = -75.19664;
    //call init method
    myAnnotation *annotation = [[myAnnotation alloc] initWithCoordinate:coordinate1 title:@"Food Truck"];
    //add the annotation to our mapview outlet
    [self.mapView addAnnotation:annotation];
    
    CLLocationCoordinate2D coordinate2;
    coordinate2.latitude = 39.95043;
    coordinate2.longitude = -75.19660;
    myAnnotation *annotation2 = [[myAnnotation alloc] initWithCoordinate:coordinate2 title:@"Joe's Cafe"];
    [self.mapView addAnnotation:annotation2];
    
}

- (void)viewWillAppear:(BOOL)animated{
    // ?
    [super viewWillAppear:animated];
    
    //1 create coordinate to load for the first time
    CLLocationCoordinate2D zoomLocation;
    //Wharton School :)
    zoomLocation.latitude = 39.95038;
    zoomLocation.longitude = -75.19664;
    
    //2 specify the box to display. make a region around the user's location with location and height.
    //use half a mile centered around zoomLocation
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1.25*METERS_PER_MILE, 1.25*METERS_PER_MILE);
    
    //3 display the region
    [self.mapView setRegion:viewRegion animated: YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//6 Delegate method for mapView. returns the map view on the pin to be shown. we pass the annotation object that we created
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation {
    //7 if the object passed is kind of MKUserLocation class (the default annotation)
    if([annotation isKindOfClass:[MKUserLocation class]])
    //don't show the pin and return nil
       return nil;
       
       //8
       static NSString *identifier = @"myAnnotation";
        //create MKPinAnnotation instance.
        //resuse if available
       MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
       if (!annotationView)
       {
           //9 set the properties of our pin.
           annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
           annotationView.animatesDrop = YES;
           //image???
           //annotationView.image = [UIImage imageNamed:@"icon.png"];
           
           annotationView.canShowCallout = YES;
           
        }else {
            annotationView.annotation = annotation;
            }
        //set a button on the right?
       annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    //return the view
    return annotationView;
       
}

@end
