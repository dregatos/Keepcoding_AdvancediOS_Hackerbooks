//
//  DRGBaseTableVC.m
//  HackerBooks2
//
//  Created by David Regatos on 17/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "DRGBaseTableVC.h"
#import "DRGBook.h"
#import "DRGTag.h"

@implementation DRGBaseTableVC


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

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return nil;
}

#pragma mark - Utils

- (DRGTag *)tagAtIndex:(NSIndexPath *)indexPath {
    DRGTag *tag = [self.fetchedResultsController objectAtIndexPath:indexPath];
    return tag;
}

- (DRGBook *)bookAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *entityName = self.fetchedResultsController.fetchRequest.entityName;
    DRGBook *book;
    if ([entityName isEqualToString:[DRGTag entityName]]) {
        DRGTag *tag = [self tagAtIndex:indexPath];
        book = tag.book;
    } else if ([entityName isEqualToString:[DRGBook entityName]]) {
        book = [self.fetchedResultsController objectAtIndexPath:indexPath];
    }
    return book;
}

@end
