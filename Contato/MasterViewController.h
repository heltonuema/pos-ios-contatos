//
//  MasterViewController.h
//  Contato
//
//  Created by Helton Shinhei Uema on 25/08/16.
//  Copyright © 2016 Helton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class DetailViewController;
@class NewViewController;


@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

-(IBAction)unwindToMaster:(UIStoryboardSegue *) segue;

@end

