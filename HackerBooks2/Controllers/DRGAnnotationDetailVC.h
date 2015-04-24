//
//  DRGAnnotationVC.h
//  HackerBooks2
//
//  Created by David Regatos on 20/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DRGBook;
@class DRGAnnotation;

@interface DRGAnnotationDetailVC : UIViewController

// IBOutles
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UIView *textAndPhotoContainer;
@property (weak, nonatomic) IBOutlet UITextView *textInput;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *photoActivityIndicator;
// Autolayout
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomContainerConstrain;

/** To review/edit an existing one */
- (instancetype)initAnnotation:(DRGAnnotation *)annotation forBook:(DRGBook *)aBook;

@end
