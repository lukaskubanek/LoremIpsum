//
//  MasterViewController.h
//  Lorem Ipsum iOS Example
//
//  Created by Lukas Kubanek on 24.05.2013.
//  Copyright (c) 2013 Lukas Kubanek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
