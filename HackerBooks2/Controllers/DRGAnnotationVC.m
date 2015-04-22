//
//  DRGAnnotationVC.m
//  HackerBooks2
//
//  Created by David Regatos on 20/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "DRGAnnotationVC.h"
#import "DRGBook.h"
#import "DRGAnnotation.h"
#import "ErrorDomains.h"
#import "NSString+Validation.h"

#define VERTICAL_SPACE  8

@interface DRGAnnotationVC () <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) DRGBook *book;

@end

@implementation DRGAnnotationVC

#pragma mark - Init

- (instancetype)initAnnotationForBook:(DRGBook *)aBook {
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _book = aBook;
    }
    
    return self;
}


#pragma mark - View events

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"New Annotation";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Delegates
    self.titleInput.delegate = self;
    self.textInput.delegate = self;
    
    // Notifications **********************
    [self registerForNotifications];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.navigationItem) {
         // save btn
        UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveBtnPressed:)];
        self.navigationItem.rightBarButtonItem = saveBtn;
        // cancel btn
        UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelBtnPressed:)];
        self.navigationItem.leftBarButtonItem = cancelBtn;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self unregisterForNotifications];   //optionally we can unregister a notification when the view disappears
}

#pragma mark - NSNotification

- (void)dealloc {
    [self unregisterForNotifications];
}

- (void)registerForNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notifyKeyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notifyKeyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
}

- (void)unregisterForNotifications {
    // Clear out _all_ observations that this object was making
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// UIKeyboardWillShowNotification
- (void)notifyKeyboardWillShow:(NSNotification *)notification {
    
    // Get Keyboard frame
    NSDictionary *kbInfo = notification.userInfo;
    NSValue *wrappedFrame = [kbInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect kbFrame = [wrappedFrame CGRectValue];
    
    // Animation
    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    float distance = (CGRectGetMaxY(self.textInput.frame) - (self.view.bounds.size.height-kbFrame.size.height)) + VERTICAL_SPACE;
    [self.view setNeedsLayout];
    [UIView animateWithDuration:duration animations:^{
        self.bottomPhotoConstrain.constant += distance;
        [self.view layoutIfNeeded];
    }];
}

// UIKeyboardWillHideNotification
- (void)notifyKeyboardWillHide:(NSNotification *)notification {
    
    // Get Keyboard frame
    // Animation
    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [self.view setNeedsLayout];
    [UIView animateWithDuration:duration animations:^{
        self.bottomPhotoConstrain.constant = VERTICAL_SPACE;
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - IBActions

- (IBAction)hideKeyboard:(UIControl *)sender {
    [self.view endEditing:YES];
}

- (IBAction)cameraBtnPressed:(UIBarButtonItem *)sender {
    
}

- (IBAction)cancelBtnPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveBtnPressed:(UIBarButtonItem *)sender {
    
    if ([NSString isEmpty:self.titleInput.text]) {
        NSLog(@"Annotation must have a title");
        
    } else if ([NSString isEmpty:self.textInput.text] && !self.photo.image) {
        NSLog(@"Annotation must have a text OR a photo");
    } else {
        [self hideKeyboard:nil];
        [self saveAnnotationWithCompletion:^(BOOL success, NSError *error) {
            if (success) {
                [self dismissViewControllerAnimated:YES completion:nil];
            } else {
                NSLog(@"Error: %@", error.userInfo);
            }
        }];
    }
}

#pragma mark - Helpers

- (void)saveAnnotationWithCompletion:(void(^)(BOOL success, NSError *error))completionBlock {
    DRGAnnotation *annotation = [DRGAnnotation annotationOnBook:self.book
                                                         titled:self.titleInput.text
                                                       withText:self.textInput.text
                                                          photo:nil
                                                       latitude:0
                                                      longitude:0
                                                    withContext:self.book.managedObjectContext];
    if (annotation) {
        // Add annotation into context
        [self.book addAnnotationsObject:annotation];
        NSLog(@"New Book annotation count: %lu", [self.book.annotations count]);
        completionBlock(YES,nil);
    } else {
        NSLog(@"Annotation creation failed!!");
        NSDictionary *userInfo = @{
                                   NSLocalizedDescriptionKey: NSLocalizedString(@"Annotation creation failed!!", nil),
                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"The new annotation couldn't be created", nil),
                                   NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Please, check that all the parameters are valid and try again.", nil)
                                   };
        NSError *err = [NSError errorWithDomain:ERROR_DOMAIN_HACKERBOOKS_ANNOTATION
                                           code:ERROR_CODE_ANNOTATION_CREATION_FAIL
                                       userInfo:userInfo];
        completionBlock(NO,err);
    }
    
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [textView resignFirstResponder];
}

#pragma mark - Others

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
