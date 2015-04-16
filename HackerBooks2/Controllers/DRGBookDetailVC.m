//
//  DRGBookDetailVC.m
//  HackerBooks2
//
//  Created by David Regatos on 15/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "DRGBookDetailVC.h"
#import "NotificationKeys.h"
#import "DRGBook.h"
#import "DRGWriter.h"
#import "DRGCover.h"
#import "DRGPdf.h"

@interface DRGBookDetailVC ()

@property (nonatomic, readwrite) DRGBook *book;

@end

@implementation DRGBookDetailVC

#pragma mark - Init

- (instancetype)initWithBook:(DRGBook *)aBook {
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _book = aBook;
    }
    
    return self;
}

#pragma mark - View events

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Hacker Books 2.0";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self updateViewContent];

    // Notifications **********************
    [self registerForNotifications];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self unregisterForNotifications];
}

#pragma mark -

- (void)updateViewContent {
    
    self.titleLbl.text = self.book.title;
    self.authorsLbl.text = [[self.book authorList] componentsJoinedByString:@", "];
    self.tagsLbl.text = [[self.book tagList] componentsJoinedByString:@", "];
    self.readBtn.selected = self.book.pdf.data ? YES : NO;
    
    [self loadCoverImage];
}

#pragma mark - NSNotification

- (void)dealloc {
    [self unregisterForNotifications];
}

- (void)registerForNotifications {
    // Add your notification observer here
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notifyNewBookWasSelected:)
                                                 name:DID_SELECT_BOOK_NOTIFICATION
                                               object:nil];
}

- (void)unregisterForNotifications {
    // Clear out _all_ observations that this object was making
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)notifyNewBookWasSelected:(NSNotification *)notification {
    
    DRGBook *book = [notification.userInfo objectForKey:BOOK_KEY];
    self.book = book;

    [self updateViewContent];
}

#pragma mark - IBActions

- (IBAction)favoriteBtnPressed:(UIButton *)sender {
    
    // Talk with the delegate, if it implements the method
    if ([self.delegate respondsToSelector:@selector(bookDetailVC:didMarkBookAsFavorite:)]) {
        [self.delegate bookDetailVC:self didMarkBookAsFavorite:self.book];
    }
}

- (IBAction)readBtnPressed:(UIButton *)sender {
    
    if (!sender.selected) {
        // Download pdf file
        NSLog(@"Download PDF file");
        [self loadPDFFile];
    }
    
    // Show pdf file
}

#pragma mark - Utils

- (void)loadCoverImage {
    self.coverImView.image = nil;
    if (!self.book.cover.data) {
        [self.coverActivityIndicator startAnimating];
    }
    [self.book.cover fetchCoverImageWithCompletion:^(UIImage *image) {
        [self.coverActivityIndicator stopAnimating];
        self.coverImView.image = image;
    }];
}

- (void)loadPDFFile {
    [self.book.pdf fetchPDFDataWithCompletion:^(NSData *pdfData) {
        NSLog(@"PDF file is ready");
        self.readBtn.selected = self.book.pdf.data ? YES : NO;
    }];
}

#pragma mark - UISplitViewControllerDelegate

- (void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode {
    
    // Is splitVC's table visible?
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
        // NOTE: BarBtn item is provided by the splitVC
    } else {
        self.navigationItem.leftBarButtonItem = nil;
    }
}


@end
