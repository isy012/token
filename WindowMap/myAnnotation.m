//
//  myAnnotation.m
//  WindowMap
//
//  Created by Isabelle Park on 12/6/13.
//  Copyright (c) 2013 izzy. All rights reserved.
//

#import "myAnnotation.h"

@implementation myAnnotation

//3.2 Override default initialization method
-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title {
    //if superclass is instantiated
    if ((self = [super init])) {
        //set properties with parameters passed in
        self.coordinate = coordinate;
        self.title = title;
    }
    return self;
}

@end
