//
//  UIViewController+CoreData.m
//  Contato
//
//  Created by Helton Shinhei Uema on 08/09/16.
//  Copyright © 2016 Helton. All rights reserved.
//

#import "UIViewController+CoreData.h"
#import "AppDelegate.h"

@implementation UIViewController (CoreData)

-(NSManagedObjectContext *)managedObjectContext{
    AppDelegate * delegate = [[UIApplication sharedApplication] delegate];
    return delegate.managedObjectContext;
}

@end
