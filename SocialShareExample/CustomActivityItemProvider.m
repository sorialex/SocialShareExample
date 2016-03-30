//
//  CustomActivityItemProvider.m
//  SocialShareExample
//
//  Created by Alex S on 30/3/16.
//  Copyright © 2016 SoriAlex. All rights reserved.
//

#import "CustomActivityItemProvider.h"

@interface CustomActivityItemProvider ()

@property (nonatomic, strong) id content;

@end

@implementation CustomActivityItemProvider

- (id)initWithValue:(id)value
{
    return [self initWithValue:value placeholder:@"Placeholder"];
}

- (id)initWithValue:(id)value placeholder:(id)placeholder
{
    if (self = [super initWithPlaceholderItem:placeholder]) {
        self.content = value;
    }
    
    return self;
}

- (id)activityViewController:(UIActivityViewController *)activityViewController itemForActivityType:(NSString *)activityType
{
    return self.content;
}

@end
