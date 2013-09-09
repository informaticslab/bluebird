//
//  QuestionDetailVC.m
//  bluebird
//
//  Created by jtq6 on 9/4/13.
//  Copyright (c) 2013 Informatics Research and Development Lab. All rights reserved.
//

#import "QuestionDetailVC.h"
#import "SurveyAnswer.h"

@interface QuestionDetailVC ()

@end

@implementation QuestionDetailVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _surveyQuestion.text;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_surveyQuestion countOfAnswers];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"PossibleAnswerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
//    cell.textLabel.text = [NSString stringWithFormat:@"%d. )", indexPath.row];
    cell.textLabel.text = ((SurveyAnswer *)_surveyQuestion.answers[indexPath.row]).text;
//    cell.detailTextLabel.text = ((SurveyAnswer *)_surveyQuestion.answers[indexPath.row]).text;
    
    if ((_surveyQuestion.selectedAnswerIndex == indexPath.row) && (_surveyQuestion.selectedAnswer != nil)) 
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;

}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    _surveyQuestion.selectedAnswer = [_surveyQuestion answerAtIndex:indexPath.row];
    _surveyQuestion.selectedAnswerIndex = indexPath.row;
    
    [self.tableView reloadData];
    
}

@end
