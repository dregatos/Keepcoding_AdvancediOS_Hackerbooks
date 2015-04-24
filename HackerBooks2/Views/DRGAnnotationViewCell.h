//
//  DRGAnnotationViewCell.h
//  HackerBooks2
//
//  Created by David Regatos on 24/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DRGAnnotation;

@interface DRGAnnotationViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UITextView *textView;

- (void)configureForAnnotation:(DRGAnnotation *)annotation;

@end
