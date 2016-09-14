//
//  UIViewController+CoreData.h
//  Contato
//
//  Created by Helton Shinhei Uema on 08/09/16.
//  Copyright © 2016 Helton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CoreData)

@property (readonly) NSManagedObjectContext *  managedObjectContext;

@end
