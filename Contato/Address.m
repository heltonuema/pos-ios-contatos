//
//  Address.m
//  Contato
//
//  Created by Helton Shinhei Uema on 29/09/16.
//  Copyright © 2016 Helton. All rights reserved.
//

#import "Address.h"

@implementation Address

-(instancetype)initWithPlacemark:(CLPlacemark *)placemark withTitle:(NSString *)title andWithSubtitle:(NSString *)subtitle{
    self = [super init];
    if(self){
        _placemark = placemark;
        _title = title;
        _subtitle = subtitle;
    }
    return self;
}

-(CLLocationCoordinate2D) coordinate{
    return [[_placemark location]coordinate];
}

@end
