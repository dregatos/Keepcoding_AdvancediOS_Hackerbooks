//
//  DRGBookDetailVC.h
//  HackerBooks2
//
//  Created by David Regatos on 15/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

@import UIKit;

@class DRGBook;
@class DRGBookDetailVCDelegate;

#import "DRGBookDetailVCDelegate.h"

@interface DRGBookDetailVC : UIViewController <UISplitViewControllerDelegate>

@property (nonatomic, weak) id<DRGBookDetailVCDelegate> delegate;
@property (nonatomic, readonly) DRGBook *book;

#pragma mark - IBOutles
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *authorsLbl;
@property (weak, nonatomic) IBOutlet UILabel *tagsLbl;
@property (weak, nonatomic) IBOutlet UIImageView *coverImView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *coverActivityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *favoriteBtn;
@property (weak, nonatomic) IBOutlet UIButton *readBtn;


- (instancetype)initWithBook:(DRGBook *)aBook;

@end
