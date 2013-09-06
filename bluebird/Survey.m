//
//  Survey.m
//  bluebird
//
//  Created by jtq6 on 8/28/13.
//  Copyright (c) 2013 Informatics Research and Development Lab. All rights reserved.
//

#import "Survey.h"

@implementation Survey

-(id)initWithStaticData
{
    SurveyQuestion *newQuestion = nil;
    
    self = [super initWithText:@"Flu Survey" hashtag:@"FLU"];
    
    if (self) {
        
        _questions = [[NSMutableArray alloc] init];

        // add first question
        newQuestion = [[SurveyQuestion alloc] initWithText:@"Last month, were you ill with a fever?" hashtag:@"a1"];
        [newQuestion addAnswerWithText:@"Yes" hashtag:@"01"];
        [newQuestion addAnswerWithText:@"No" hashtag:@"02"];
        [newQuestion addAnswerWithText:@"Don't know" hashtag:@"07"];
        [newQuestion addAnswerWithText:@"Refuse to answer" hashtag:@"09"];
        [_questions addObject:newQuestion];
        
        // add second question
        newQuestion = [[SurveyQuestion alloc] initWithText:@"Did you also have a cough and/or sore throat?" hashtag:@"z7"];
        [newQuestion addAnswerWithText:@"Yes" hashtag:@"01"];
        [newQuestion addAnswerWithText:@"No" hashtag:@"02"];
        [newQuestion addAnswerWithText:@"Don't know" hashtag:@"07"];
        [newQuestion addAnswerWithText:@"Refuse to answer" hashtag:@"09"];
        [_questions addObject:newQuestion];
        
        
        // add third question
        newQuestion = [[SurveyQuestion alloc] initWithText:@"Did you visit a doctor, nurse, or other health professional for this illness?" hashtag:@"R8"];
        [newQuestion addAnswerWithText:@"Yes" hashtag:@"01"];
        [newQuestion addAnswerWithText:@"No" hashtag:@"02"];
        [newQuestion addAnswerWithText:@"Don't know" hashtag:@"07"];
        [newQuestion addAnswerWithText:@"Refuse to answer" hashtag:@"09"];
        [_questions addObject:newQuestion];
        
    }
    
    return self;

}

-(NSInteger)numberOfQuestions
{
    
    return [_questions count];

}

-(NSString *)questionTextAtIndex:(NSInteger)index
{
    SurveyQuestion *question = _questions[index];
    return question.text;
    
    
}

-(SurveyQuestion *)questionAtIndex:(NSInteger)index
{
    SurveyQuestion *question = _questions[index];
    return question;
    
    
}

-(NSString *)getResultsTweet
{
    
    NSString *tweetStart = @"I'm helping CDC crowd out the flu. @tellCDC ";
    NSString *tweetEnd = @". Here's how you can help: http:////www.cdc.gov/flu";
    
    NSString *results = tweetStart;
    for (SurveyQuestion *question in _questions) 
        results = [results stringByAppendingString:[question getHashTagResults]];
    
    results = [results stringByAppendingString:tweetEnd];
    
    return results;
    
}


@end
