//
//  Note.m
//  MyNotes
//
//  Created by Obiet Panggrahito on 22/03/2017.
//  Copyright © 2017 Obiet Panggrahito. All rights reserved.
//

#import "Note.h"

@implementation Note

-(id) initWithTitle : (NSString *) title withDesc : (NSString *) desc withImage : (UIImage *) image {
    
    self = [super init];
    if (self) {
        
        self.title = title;
        self.desc = desc;
        self.image = image;
        
    }
    return self;
}



@end

