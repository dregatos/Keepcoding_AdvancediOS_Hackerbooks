//
//  AppDelegate.m
//  HackerBooks2
//
//  Created by David Regatos on 13/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "AppDelegate.h"
#import "Settings.h"

#import "AGTCoreDataStack.h"
#import "DRGDownloadManager.h"
#import "UIViewController+Navigation.h"

#import "DRGBook.h"
#import "DRGTag.h"
#import "DRGBookListVC.h"
#import "DRGBookDetailVC.h"

NSString * const WAS_LAUNCHED_BEFORE = @"WAS_LAUNCHED_BEFORE";

@interface AppDelegate ()

@property (nonatomic, strong) AGTCoreDataStack *stack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Create the stack
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Library"];

//    if (DEBUG) {
//        [self.stack zapAllData];
//        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:WAS_LAUNCHED_BEFORE];
//    }
    
    // Download the library ONLY during the first launch ***
    NSMutableArray *library = [[NSMutableArray alloc] init];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:WAS_LAUNCHED_BEFORE] == NO) {
        NSLog(@"Downloading library...");
        NSArray *bookList = [DRGDownloadManager downloadBookList];
        // Create library (= insert books on context)
        for (NSDictionary *dic in bookList) {
            DRGBook *book = [DRGBook bookFromDictionary:dic withContext:self.stack.context];
            if (book) { [library addObject:book]; }
        }
        // Update 'WAS_LAUNCHED_BEFORE' flag value
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:WAS_LAUNCHED_BEFORE];
        
        NSLog(@"Library count: %lu", [library count]);
        if (![library count]) {
            NSLog(@"Ups! We couldn't fetch any book from the server.");
        }
        
        [self.stack saveWithErrorBlock:^(NSError *error) {
            NSLog(@"Saving error: %@", error.userInfo);
        }];
    }
    
    /** Phone or tablet ? */
    UIViewController *rootVC = nil;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        rootVC = [self rootViewControllerForPad];
    } else {
        rootVC = [self rootViewControllerForPhone];
    }
    
    // Assign the root
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Saving error: %@", error.userInfo);
    }];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Saving error: %@", error.userInfo);
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Device configuration

- (UIViewController *)rootViewControllerForPhone {
    
    // View controllers
    DRGBookListVC *bookListVC = [[DRGBookListVC alloc] initWithFetchedResultsController:[self libraryController]
                                                                                  style:UITableViewStyleGrouped];
    
    //Delegates
    
    return [bookListVC wrappedInNavigationController];
}

- (UIViewController *)rootViewControllerForPad {
    
    // Last selected book
    DRGBook *selectedBook = [self lastSelectedBook];
    
    // View controllers
    DRGBookListVC *bookListVC = [[DRGBookListVC alloc] initWithFetchedResultsController:[self libraryController]
                                                                                  style:UITableViewStyleGrouped];
    DRGBookDetailVC *bookVC = [[DRGBookDetailVC alloc] initWithBook:selectedBook];
    
    // Create the splitView
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    splitVC.viewControllers = @[[bookListVC wrappedInNavigationController], [bookVC wrappedInNavigationController]];
    
    // Assign delegates
    splitVC.delegate = bookVC;
    bookVC.delegate = bookListVC;
    
    return splitVC;
}

#pragma mark - Utils

- (NSFetchRequest *)libraryFetchRequest {
    // Request
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DRGTag entityName]];
    NSSortDescriptor *sortLabel = [NSSortDescriptor sortDescriptorWithKey:@"label.name"
                                                                ascending:YES
                                                                 selector:@selector(caseInsensitiveCompare:)];
    NSSortDescriptor *sortTitle = [NSSortDescriptor sortDescriptorWithKey:@"book.title"
                                                                ascending:YES
                                                                 selector:@selector(caseInsensitiveCompare:)];
    req.sortDescriptors = @[sortLabel, sortTitle];
    req.fetchBatchSize = 20;
    
    return req;
}

- (NSFetchedResultsController *)libraryController {
    return [[NSFetchedResultsController alloc] initWithFetchRequest:[self libraryFetchRequest]
                                               managedObjectContext:self.stack.context
                                                 sectionNameKeyPath:@"label.name"
                                                          cacheName:nil];
}

#pragma mark - Selected Book

- (DRGBook *)lastSelectedBook {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    NSData *uri = [settings objectForKey:LAST_SELECTED_BOOK];
    DRGBook *lastSelectedBook = [DRGBook unarchiveObjectWithURIRepresentation:uri context:self.stack.context];
    if (lastSelectedBook == nil) {
        lastSelectedBook = [self firstBookOfLibrary];
    }
    return lastSelectedBook;
}

- (DRGBook *)firstBookOfLibrary {
    
    NSFetchRequest *req = [self libraryFetchRequest];
    
    // Search
    NSArray *results = [self.stack executeFetchRequest:req errorBlock:^(NSError *error) {
        NSLog(@"Execute fetch request failed! - %@", error);
    }];
    
    DRGTag *firstTag = [results firstObject];
    return firstTag.book;
}


@end
