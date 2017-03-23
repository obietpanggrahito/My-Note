//
//  Note.h
//  MyNotes
//
//  Created by Obiet Panggrahito on 22/03/2017.
//  Copyright © 2017 Obiet Panggrahito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Note : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *desc;
@property (strong,nonatomic) UIImage *image;

-(id) initWithTitle : (NSString *) title withDesc : (NSString *) desc withImage : (UIImage *) image;

@end
