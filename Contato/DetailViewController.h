//
//  DetailViewController.h
//  Contato
//
//  Created by Helton Shinhei Uema on 25/08/16.
//  Copyright © 2016 Helton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

