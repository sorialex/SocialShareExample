//
//  ViewController.m
//  SocialShareExample
//
//  Created by Alex S on 30/3/16.
//  Copyright © 2016 SoriAlex. All rights reserved.
//

#import "ViewController.h"

#import "CustomActivityItemProvider.h"

@implementation ViewController

#pragma mark - Actions

- (IBAction)shareAction:(id)sender
{
    NSMutableArray *sharingItems = [NSMutableArray new];
    
    // We can populate share array with multiple type of items:
    
    // UIActivityItemProvider subclass
    [sharingItems addObject:[[CustomActivityItemProvider alloc] initWithValue:@"ShareTitle"]];
    
    // value
    [sharingItems addObject:[UIImage imageNamed:@"Penguin.jpg"]];

    
    // UIActivityItemSource protocol object conforming
    //      using view controller because it's an example
    [sharingItems addObject:self];
    
    // which options will appear available to share through is dependant on data type we are sending in ActivityItems
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems
                                                                                     applicationActivities:nil];
    // we can exclude some services
    activityController.excludedActivityTypes = @[UIActivityTypeAssignToContact];

    // iPad sourceview
    activityController.popoverPresentationController.sourceView = sender;

    [self presentViewController:activityController animated:YES completion:nil];
}


#pragma mark - UIActivityItemSource

- (id)activityViewControllerPlaceholderItem:(UIActivityViewController *)activityViewController
{
    return @"Placeholder";
}

- (id)activityViewController:(UIActivityViewController *)activityViewController
         itemForActivityType:(NSString *)activityType
{
    if ([activityType isEqualToString:UIActivityTypePostToTwitter]) {
        return @"Twitter specific text";
    }
    
    return nil;
}

- (NSString *)activityViewController:(UIActivityViewController *)activityViewController
              subjectForActivityType:(NSString *)activityType
{
    return @"ShareSubject";
}

- (UIImage *)activityViewController:(UIActivityViewController *)activityViewController
      thumbnailImageForActivityType:(NSString *)activityType
                      suggestedSize:(CGSize)size
{
    return [UIImage imageNamed:@"Penguin.jpg"];
}

@end
