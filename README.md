## The Social Grapher

This optional assignment merges your algorithmic obsessions from several units past with the current power of self-joins and associations. This will demonstrate some of the power of what you can now build using all your previous skills together.


### Getting Started

Fork [the assignment repo](https://github.com/vikingeducation/assignment_social_graphing), clone it and create a new Rails app in the folder.

### Building the Model

1. Create a data model for a social media app, with `User`s who have 144-character `Post`s, and who can `follow` one another (one way, non-reciprocal relationship).
2. Seed this up, and scale it as large as you can get away with. Make sure that not everybody follows everybody else.


### Adding In Trees

1. Create a PORO in your models, `FriendCrawler`, which initializes by taking one user as parameter
2. `FriendCrawler` should build a tree (two-way, with parents and children. of everyone that person follows (and everyone THOSE people follow), to a specified `degrees_of_separation`, which can default to 3. Make sure to skip any friend you've already added, so there are no duplicates in the tree and you only save the shortest path to each person
3. create a method `distance_to` on FriendCrawler that takes a User as input and  will search your tree for that person and return the number of steps between you and them
4. create a method `path_to` that returns the full chain of Users from the start user to the target user, as an array of Users.
5. add an option on initialize to search backwards to your followers instead of forwards to the people you follow. The tree is built with the inverse association, and all searches proceed through that association instead
6. create a custom `AnalyticsController` with some custom actions that allow you to select two users from dropdown collections, click **submit**, and see the path between them. 


### Advanced: Social Graphing

**1)** Build a SocialGrapher PORO class that loads in the entire set of Users with all their following connections, then efficiently builds a directed graph out of an adjacency list using UserIDs (remember adjacency lists? they can roughly look like this:

```language-ruby
# this means that user_id #1 follows 4 people
# while user with id 3 follows 2 people
@ graph = { 1: [3, 5, 6, 7],
            2: [6, 7, 9, 99], 
            3: [1, 2] }
```

**2)** Using this graph, build `distance_between` and `path_between` methods that take two Users as parameters and use this graph to do the same thing as in the Tree part of the assignment. *Remember:* Since you are DFS or BFS searching on a graph instead of a tree now, you need to be careful to mark users as **visited** in some way, possibly using an array, in order to avoid infinite loops.

**3)** Build a `longest_path` method that goes through all users and finds the two who have the largest number of degrees of separation of any two users in your list. In other words, the two people who are the furthest apart. It should return the whole `path_between` array of Users from one to the other.

**4)** Have your AnalyticsController and form set up to work with this class instead of your original tree.


## Wrapping Up

Commit and push to GitHub.
