//
//  DRGBookDetailVC.h
//  HackerBooks2
//
//  Created by David Regatos on 15/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DRGBook;

@interface DRGBookDetailVC : UIViewController <UISplitViewControllerDelegate>

- (instancetype)initWithBook:(DRGBook *)aBook;

@end
