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

@interface DRGBookListVC ()

@end

@implementation DRGBookListVC

#pragma mark - View events

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

#pragma mark - UITableView DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Load data for indexPath
    DRGTag *tag = [self.fetchedResultsController objectAtIndexPath:indexPath];
    DRGBook *book = tag.book;
    DRGLabel *label = tag.label;

    // Crear una celda
    static NSString *cellID = @"bookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    // Configurarla (sincronizar libreta -> celda)
    cell.textLabel.text = book.title;
    
    return cell;
}

@end
