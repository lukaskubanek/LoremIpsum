//
//  DetailViewController.h
//  Lorem Ipsum iOS Example
//
//  Created by Lukas Kubanek on 24.05.2013.
//  Copyright (c) 2013 Lukas Kubanek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
