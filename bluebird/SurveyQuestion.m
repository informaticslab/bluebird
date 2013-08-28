//
//  SurveyQuestion.m
//  bluebird
//
//  Created by jtq6 on 8/28/13.
//  Copyright (c) 2013 Informatics Research and Development Lab. All rights reserved.
//

#import "SurveyQuestion.h"
#import "SurveyAnswer.h"

@implementation SurveyQuestion

-(id)initWithText:(NSString *)newText hashtag:(NSString *)newHashtag
{
    
    self = [super initWithText:newText hashtag:newHashtag];
    _answers = [[NSMutableArray alloc] init];
    
    return self;
}

-(void) addAnswerWithText:(NSString *)newText hashtag:(NSString *)newHashtag
{
    SurveyAnswer *newAnswer = [[SurveyAnswer alloc] initWithText:newText hashtag:newHashtag];
    [_answers addObject:newAnswer];
    
}

@end