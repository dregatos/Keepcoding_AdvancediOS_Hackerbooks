//
//  DRGSimplePDFVC.m
//  MyHackerBooks_v2
//
//  Created by David Regatos on 27/03/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "DRGSimplePDFVC.h"
#import "DRGAnnotationDetailVC.h"
// Models
#import "DRGBook.h"
#import "DRGPdf.h"
// Others
#import "NotificationKeys.h"
#import "UIViewController+Navigation.h"

@interface DRGSimplePDFVC ()

@property (nonatomic, readwrite) DRGBook *book;

@end

@implementation DRGSimplePDFVC

#pragma mark - Init

- (id)initWithBook:(DRGBook *)aBook {
    if (self = [super init]) {
        _book = aBook;
        self.title = aBook.title;
    }
    
    return self;
}

#pragma mark - Notification

- (void)dealloc {
    [self unregisterForNotifications];
}

- (void)registerForNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notifySelectedBookDidChange:)
                                                 name:DID_SELECT_BOOK_NOTIFICATION
                                               object:nil];
}

- (void)unregisterForNotifications {
    // Clear out _all_ observations that this object was making
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// BOOK_WAS_SELECTED_NOTIFICATION_NAME
- (void)notifySelectedBookDidChange:(NSNotification *)notification {
    
    // Get updated book
    DRGBook *newBook = notification.userInfo[BOOK_KEY];
    // Update model
    self.book = newBook;
    // Update content view
    [self updateViewContent];
}

#pragma mark - View events

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                            target:self
                                                                            action:@selector(addAnnotationToBook:)];
    self.navigationItem.rightBarButtonItem = addBtn;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Assign delegates
    self.webView.delegate = self;
    
    [self updateViewContent];
    
    // Notifications **********************
    [self registerForNotifications];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self unregisterForNotifications];   //optionally we can unregister a notification when the view disappears
}

#pragma mark - IBActions

- (void)addAnnotationToBook:(id)sender {
    DRGAnnotationDetailVC *annVC = [[DRGAnnotationDetailVC alloc] initAnnotation:nil forBook:self.book];
    [self presentViewController:[annVC wrappedInNavigationController] animated:YES completion:nil];
}

#pragma mark - Helpers

- (void)updateViewContent {
    
    self.title = self.book.title;
    
    [self.activityView startAnimating];
    [self.book.pdf fetchPDFDataWithCompletion:^(NSData *pdfData) {
        NSLog(@"PDF file is ready");
        // Start loading PDF
        if (pdfData) {
            [self.webView loadData:pdfData MIMEType:@"application/pdf" textEncodingName:@"UTF-8" baseURL:nil];
        } else {
            NSLog(@"We couldn't fetch the pdf file");
        }
    }];
}


#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
                                                 navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"Start loading");
    [self.activityView startAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Ups! Houston, we had a problem");
    [self.activityView stopAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Loading did finish");
    [self.activityView stopAnimating];
}

#pragma mark - Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
