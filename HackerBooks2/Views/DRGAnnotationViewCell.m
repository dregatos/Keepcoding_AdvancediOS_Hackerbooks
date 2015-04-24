//
//  DRGAnnotationViewCell.m
//  HackerBooks2
//
//  Created by David Regatos on 24/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "DRGAnnotationViewCell.h"
#import "DRGAnnotation.h"
#import "DRGPhoto.h"

@implementation DRGAnnotationViewCell

- (void)awakeFromNib {
    // Initialization code
    self.photo.clipsToBounds = YES;
}

- (void)configureForAnnotation:(DRGAnnotation *)annotation {
    
    self.titleLbl.text = annotation.title;
    if (annotation.photo.photoData) {
        self.photo.image = [UIImage imageWithData:annotation.photo.photoData];
    } else {
        self.photo.hidden = YES;
        self.textView.text = annotation.text;
    }
}

- (void)prepareForReuse {
    self.photo.hidden = NO;
    self.textView.text = nil;
    self.titleLbl.text = nil;
}


@end
