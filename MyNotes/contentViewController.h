//
//  contentViewController.h
//  MyNotes
//
//  Created by Obiet Panggrahito on 22/03/2017.
//  Copyright © 2017 Obiet Panggrahito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface contentViewController : UIViewController

@property (strong, nonatomic) Note* selectedNote; 
@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *content;

@end
