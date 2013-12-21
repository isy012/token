//
//  myAnnotation.h
//  WindowMap
//
//  Created by Isabelle Park on 12/6/13.
//  Copyright (c) 2013 izzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

//3.1 add a custom MKAnnotation protocol. Stores data associated with our pins.
@interface myAnnotation : NSObject
//give it a Title and 2D coordinates
@property (strong, nonatomic) NSString *title;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
//initialization method
-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title;

@end
