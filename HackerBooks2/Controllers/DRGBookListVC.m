//
//  DRGBookListVC.m
//  HackerBooks2
//
//  Created by David Regatos on 14/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "DRGBookListVC.h"
#import "DRGSearchResultsVC.h"
#import "DRGBook.h"
#import "DRGTag.h"
#import "DRGLabel.h"
#import "NSString+Validation.h"

@interface DRGBookListVC ()

@property (nonatomic, strong) DRGSearchResultsVC *srVC;

@end

@implementation DRGBookListVC

#pragma mark - View events

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Hacker Books 2.0";
    
    // Search Results Controller
    [self configureSearchController];
}

#pragma mark - DRGBookDetailVCDelegate

- (void)bookDetailVC:(DRGBookDetailVC *)bookDetailVC didMarkBookAsFavorite:(DRGBook *)book {
    [self favoriteBook:book];
}

- (void)favoriteBook:(DRGBook *)book {
    if ([book isFavoriteBook]) {
        DRGTag *tag = [DRGTag favoriteTagForBook:book];
        [self.fetchedResultsController.managedObjectContext deleteObject:tag];
    } else {
        [DRGTag tagNamed:FAVORITE_LABEL ofBook:book withContext:self.fetchedResultsController.managedObjectContext];
    }
}

#pragma mark - Search Result Controller

- (void)configureSearchController {
    
    NSFetchedResultsController *frController = [self searchFRControllerWithRequest:[self searchFetchRequest]];
    self.srVC = [[DRGSearchResultsVC alloc ]initWithFetchedResultsController:frController
                                                                       style:UITableViewStyleGrouped];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.srVC];
    self.searchController.searchResultsUpdater = self;
    [self.searchController.searchBar sizeToFit];
    self.searchController.searchBar.placeholder = @"Title, Author or Tag";
    self.tableView.tableHeaderView = self.searchController.searchBar;
}

- (NSFetchRequest *)searchFetchRequest {
    // Request
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[DRGBook entityName]];
    NSSortDescriptor *sortTitle = [NSSortDescriptor sortDescriptorWithKey:@"title"
                                                                ascending:YES
                                                                 selector:@selector(caseInsensitiveCompare:)];
    req.sortDescriptors = @[sortTitle];
    req.fetchBatchSize = 20;
    
    return req;
}

- (NSFetchedResultsController *)searchFRControllerWithRequest:(NSFetchRequest *)request {
    
    return [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                               managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                 sectionNameKeyPath:nil
                                                          cacheName:nil];
}

#pragma mark - UISearchControllerDelegate & UISearchResultsDelegate

// Called when the search bar becomes first responder
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    // Set searchString equal to what's typed into the searchbar
    NSString *searchString = self.searchController.searchBar.text;
    
    NSFetchRequest *req = [self searchFetchRequest];
    if (![NSString isEmpty:searchString]) {
        // Add Filter
        NSPredicate *titleOrAuthorOrTag = [NSPredicate predicateWithFormat:@"(title CONTAINS[cd] %@) OR (authors.writer.name CONTAINS[cd] %@) OR (tags.label.name CONTAINS[cd] %@)", searchString, searchString,searchString];

        req.predicate = titleOrAuthorOrTag;
    }
    
    NSFetchedResultsController *frController = [self searchFRControllerWithRequest:req];
    self.srVC.fetchedResultsController = frController;
}

@end
