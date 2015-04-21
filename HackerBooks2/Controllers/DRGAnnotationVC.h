//
//  DRGAnnotationVC.h
//  HackerBooks2
//
//  Created by David Regatos on 20/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DRGBook;

@interface DRGAnnotationVC : UIViewController

// IBOutles
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UITextView *textInput;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
// Autolayout
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomPhotoConstrain;


- (instancetype)initAnnotationForBook:(DRGBook *)aBook;

@end
