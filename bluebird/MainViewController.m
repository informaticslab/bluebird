//
//  MainViewController.m
//  bluebird
//
//  Created by jtq6 on 8/27/13.
//  Copyright (c) 2013 Informatics Research and Development Lab. All rights reserved.
//

#import "MainViewController.h"
#import "QuestionDetailVC.h"
#import <Social/Social.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _survey = [[Survey alloc] initWithStaticData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
    else if([segue.identifier isEqualToString:@"showQuestionDetailSegue"])
    {
        QuestionDetailVC *questionDetailVC = segue.destinationViewController;
        NSIndexPath *path = [self.tvSurveyQuestions indexPathForSelectedRow];
        _selectedQuestion = [_survey questionAtIndex:path.row];
        questionDetailVC.surveyQuestion = _selectedQuestion;

    }

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_survey numberOfQuestions];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Flu Survey";
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListQuestionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"Question %d", indexPath.row +1];
    cell.detailTextLabel.text = [_survey questionTextAtIndex:indexPath.row];
    cell.detailTextLabel.numberOfLines = 0;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ListQuestionCell";
    static NSMutableDictionary *heightCache;
    if (!heightCache)
        heightCache = [[NSMutableDictionary alloc] init];
    NSNumber *cachedHeight = heightCache[cellIdentifier];
    if (cachedHeight)
        return cachedHeight.floatValue;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    CGFloat height = cell.bounds.size.height;
    heightCache[cellIdentifier] = @(height);
    return height;

}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    _selectedQuestion = [_survey questionAtIndex:indexPath.row];
    
}


- (IBAction)tweetTapped:(id)sender {

    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:[_survey getResultsTweet]];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}
@end
