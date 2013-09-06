//
//  MainViewController.h
//  bluebird
//
//  Created by jtq6 on 8/27/13.
//  Copyright (c) 2013 Informatics Research and Development Lab. All rights reserved.
//

#import "FlipsideViewController.h"
#import "Survey.h"
#import "SurveyQuestion.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tvSurveyQuestions;
@property (nonatomic, strong) Survey *survey;
@property (nonatomic, strong) SurveyQuestion *selectedQuestion;

- (IBAction)tweetTapped:(id)sender;

@end
