//
//  NewViewController.h
//  Contato
//
//  Created by Helton Shinhei Uema on 08/09/16.
//  Copyright © 2016 Helton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface NewViewController : UIViewController

-(void)setContatoManagedObject:(NSManagedObject *)managedObject;
-(void)setManagedObjectContext:(NSManagedObjectContext *)context andEntityDescription:(NSEntityDescription *)entityDescription;

@end
