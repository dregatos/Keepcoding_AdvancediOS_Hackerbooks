//
//  DRGBookListVC.m
//  HackerBooks2
//
//  Created by David Regatos on 14/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "DRGBookListVC.h"
#import "DRGBook.h"
#import "DRGTag.h"
#import "DRGLabel.h"
#import "Settings.h"
#import "NotificationKeys.h"

@interface DRGBookListVC ()

@end

@implementation DRGBookListVC

#pragma mark - View events

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Library";
}

#pragma mark - UITableView DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Load data for indexPath
    DRGBook *book = [self bookAtIndexPath:indexPath];

    // Create the cell
    static NSString *cellID = @"bookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    // Configure cell
    cell.textLabel.text = book.title;
    
    return cell;
}


#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Get data for indexPath
    DRGBook *book = [self bookAtIndexPath:indexPath];
    
    // Notify BOOK was selected - ONLY FOR iPad VERSION
    NSDictionary *dict = @{BOOK_KEY:book};
    [[NSNotificationCenter defaultCenter] postNotificationName:DID_SELECT_BOOK_NOTIFICATION object:self userInfo:dict];
    
    // Remember last selected book
    NSData *uri = [book archiveURIRepresentation];
    [[NSUserDefaults standardUserDefaults] setObject:uri forKey:LAST_SELECTED_BOOK];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - DRGBookDetailVCDelegate

- (void)bookDetailVC:(DRGBookDetailVC *)bookDetailVC didMarkBookAsFavorite:(DRGBook *)book {
    [self favoriteBook:book];
}

- (void)favoriteBook:(DRGBook *)book {
    if ([book isFavorite]) {
        DRGTag *tag = [DRGTag favoriteTagForBook:book];
        [self.fetchedResultsController.managedObjectContext deleteObject:tag];
    } else {
        [DRGTag tagNamed:FAVORITE_LABEL ofBook:book withContext:self.fetchedResultsController.managedObjectContext];
    }
}

#pragma mark - Utils

- (DRGTag *)tagAtIndex:(NSIndexPath *)indexPath {
    DRGTag *tag = [self.fetchedResultsController objectAtIndexPath:indexPath];
    return tag;
}

- (DRGBook *)bookAtIndexPath:(NSIndexPath *)indexPath {
    DRGTag *tag = [self tagAtIndex:indexPath];
    DRGBook *book = tag.book;
    return book;
}

@end
