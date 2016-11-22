//
//  Address.h
//  Contato
//
//  Created by Helton Shinhei Uema on 29/09/16.
//  Copyright © 2016 Helton. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface Address : NSObject <MKAnnotation>

-(nonnull instancetype) initWithPlacemark:
    (nonnull CLPlacemark*) placemark withTitle:(nonnull NSString *)title
                           andWithSubtitle:(nonnull NSString*) subtitle;

@property (nullable,copy) CLPlacemark * placemark;
@property (nonatomic, readonly, copy, nullable) NSString * title;
@property (nonatomic, readonly, copy, nullable) NSString * subtitle;

@end
