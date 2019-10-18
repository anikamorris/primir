# Primir
<p float='left'>
<img width="400" alt="Screen Shot 2019-10-18 at 2 01 37 PM" src="https://user-images.githubusercontent.com/29615757/67128428-77ebf000-f1b0-11e9-9ee6-f004e3e77929.png">
<img width="400" alt="Screen Shot 2019-10-18 at 2 03 17 PM" src="https://user-images.githubusercontent.com/29615757/67128550-d913c380-f1b0-11e9-8561-f1e52ddafed2.png">
 </p>

## Project Motivation
I've always been interested in makeup, and have spent a long time curating a pretty large makeup collection.
However, I've found that a lot of my collection goes unused, and it turns out I'm not alone. According to a 2015 survey of over 4,000 women
commissioned by Stowaway Cosmetics and Posh Inc., the average woman has 40 makeup products and only uses 5 of them on a daily basis.
This inspired me to build an app that helps the user organize their makeup products with the ability to jot down their thoughts
on each product.

## Design
I went through several iterations of wireframes before I settled on the absolute simplest one for this skateboard. It's only two
screens, one that displays all products and another that allows the user to both add new products and view product notes. I wanted
to ensure that I wasn't trying to add too much functionality, since this is my first iteration of this app.

## Code Structure
I have two view controller files, one for each of my view controllers. ListProductsTableViewController sets up the table view and
reads from Core Data through my CoreDataHelper file to populate the table view cells. DisplayProductsViewController utilizes CoreDataHelper to either save the 
new product created by the user or retrieve the data of the cell selected by the user. I also have a few UI extensions, one to load
the table view with an animation, and another that sets the color of the text view "placeholder" text as the correct shade of light gray.
I set up the entity Product and its attributes 'name', 'brand', 'price', and 'content' in my Core Data Model Editor. 

## Download Instructions
Clone this repo and open 'primir.xcodeproj' in XCode. Press command+r to run in Simulator. 

