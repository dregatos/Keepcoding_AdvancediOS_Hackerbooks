//
//  DRGAnnotationsVC.m
//  HackerBooks2
//
//  Created by David Regatos on 24/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "DRGAnnotationsVC.h"
#import "DRGAnnotationViewCell.h"
#import "DRGBook.h"
#import "DRGAnnotation.h"
#import "NotificationKeys.h"

static NSString *cellId = @"AnnotationCellId";

@implementation DRGAnnotationsVC

#pragma mark -  View events

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self registerCell];
    
    self.title = @"Annotations";
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];

    // Notifications **********************
    [self registerForNotifications];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self unregisterForNotifications];
}

#pragma mark - NSNotification

- (void)dealloc {
    [self unregisterForNotifications];
    //    [self unregisterForKVOs];
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

// DID_SELECT_BOOK_NOTIFICATION
- (void)notifyNewBookWasSelected:(NSNotification *)notification {
    
    DRGBook *book = [notification.userInfo objectForKey:BOOK_KEY];
    
    // Fetch request
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DRGAnnotation entityName]];
    req.sortDescriptors = @[[NSSortDescriptor
                             sortDescriptorWithKey:@"date.creation"
                             ascending:NO],
                            [NSSortDescriptor
                             sortDescriptorWithKey:@"date.modification"
                             ascending:NO],
                            [NSSortDescriptor
                             sortDescriptorWithKey:DRGAnnotationAttributes.title
                             ascending:YES
                             selector:@selector(caseInsensitiveCompare:)]];
    req.fetchBatchSize = 20;
    req.predicate = [NSPredicate predicateWithFormat:@"book == %@", book];

    // Fetched Results Controller
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]
                                      initWithFetchRequest:req
                                      managedObjectContext:self.fetchedResultsController.managedObjectContext
                                      sectionNameKeyPath:nil //@"date.creation"
                                      cacheName:nil];
    self.fetchedResultsController = fc;
    
    // Reload data
    [self performFetch];
}

#pragma mark - cell registration

- (void)registerCell {
    
    UINib *nib = [UINib nibWithNibName:@"DRGAnnotationViewCell"
                                bundle:nil];
    [self.collectionView registerNib:nib
          forCellWithReuseIdentifier:cellId];
}

#pragma mark - Data Source

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DRGAnnotation *ann = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    DRGAnnotationViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId
                                                                            forIndexPath:indexPath];
    // Configure
    [cell configureForAnnotation:ann];
    
    return cell;
}

@end
