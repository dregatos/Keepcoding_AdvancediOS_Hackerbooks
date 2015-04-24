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

#pragma mark - View events

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

#pragma mark - UITableView DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Load data for indexPath
    DRGBook *book = [self bookAtIndexPath:indexPath];
    
    // Create the cell
    static NSString *cellID = @"bookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    // Configure cell
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [[book authorList] componentsJoinedByString:@" ,"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - UITableView Delegate

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55.;
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
