# AD(H)D prototype

This prototype is designed to assist individuals with AD(H)S in structuring their day effectively.
It
allows users to manage multiple task backlogs for various life aspects, such as work, personal life,
and club activities. The prototype features customizable daily planning based on user-selected time
management methods, like the Pomodoro Technique, and integrates with ChatGPT for optimized task
scheduling within designated working hours. A user-friendly interface, coupled with a rewards system
including achievement badges, aims to enhance motivation and productivity. Additionally, a
comprehensive dashboard provides an overview of tasks, progress, and personal analytics to support
users in maintaining focus and achieving their daily goals.

## Requirements

### R1 Comprehensive Dashboard

As a user with AD(H)S,
I want a comprehensive dashboard that provides a multi-backlog view, daily overview, calendar
integration, progress bars, a notification center, and personalization options,
so that I can have a central place to overview and manage my tasks, progress, and schedule
efficiently.

#### Multi-Backlog View

Scenario: User views multiple backlogs on the dashboard
Given the user has multiple backlogs named "Work", "Personal", and "Club Activities"
When the user navigates to the dashboard
Then the user should see a section for each backlog
And each section should display a summary of the tasks in the corresponding backlog

#### Daily Overview

Scenario: User views the daily overview
Given the user is on the dashboard
When the user navigates to the "Daily Overview" section
Then the user should see a list of tasks for the current day
And the list should include tasks from all backlogs

[//]: # (#### Calendar Integration)

[//]: # (Scenario: User interacts with the integrated calendar)

[//]: # (Given the user is on the dashboard)

[//]: # (When the user navigates to the "Calendar" section)

[//]: # (Then the user should see their tasks and events displayed on the calendar)

[//]: # (And the user should be able to add, remove, or edit tasks and events directly from the calendar)

#### Progress Bars

Scenario: User views progress bars for each backlog
Given the user is on the dashboard
When the user looks at the section for each backlog
Then the user should see a progress bar indicating the completion rate of tasks in each backlog

#### Notification Center

Scenario: User checks the notification center
Given the user is on the dashboard
When the user navigates to the "Notification Center" section
Then the user should see notifications for upcoming tasks, reminders, and messages

[//]: # (#### Personalization Options)

[//]: # (Scenario: User personalizes the dashboard)

[//]: # (Given the user is on the dashboard)

[//]: # (When the user accesses the "Settings" to personalize their dashboard)

[//]: # (Then the user should be able to choose themes, arrange sections, and set preferences for how information is displayed)

### R2 Multiple Backlogs Support

As a user with AD(H)S
In order to manage tasks in an organized manner
I want to maintain separate backlogs for different life aspects

#### Create Backlog

Scenario: User creates a new backlog
Given the user is on the "Create New Backlog" page
When the user enters "Work" as the backlog name
And the user clicks the "Create Backlog" button
Then a new backlog named "Work" should be created
And the user should be redirected to the "Work" backlog page

#### View Backlogs

Scenario: User views all backlogs
Given the user has created multiple backlogs named "Work", "Personal", and "Club Activities"
When the user navigates to the "My Backlogs" page
Then the user should see a list of backlogs
And the list should include "Work", "Personal", and "Club Activities"

#### Add Task to Specific Backlog

Scenario: User adds a task to a specific backlog
Given the user is viewing the "Work" backlog
When the user adds a task named "Finish report"
And the user clicks the "Add Task" button
Then the task "Finish report" should be added to the "Work" backlog
And the task should not appear in other backlogs like "Personal" or "Club Activities"

#### Delete Backlog

Scenario: User deletes a backlog
Given the user has a backlog named "Club Activities"
When the user clicks the "Delete" button on the "Club Activities" backlog
Then the "Club Activities" backlog should be removed
And the user should not see "Club Activities" on the "My Backlogs" page

### R3 Automated Daily Planning

As a user with AD(H)S,
I want the app to automatically plan my day based on the tasks in my backlog,
so that I can efficiently manage my time by aligning my tasks with my personalized working hours and
break times.

#### Setting Work and Break Times

Scenario: User sets personalized work and break times
Given the user is on the "Settings" page
When the user sets their work hours from "8 AM to 5 PM" for a specific backlog
And the user sets their break time from "12 PM to 1 PM" for a specific backlog
Then these working hours and break time should be saved in the specific backlog settings

#### Generating Daily Plan

Scenario: App generates a daily plan based on the backlog and set times
Given the user has tasks in their backlog
And the user has set their work and break times
When the app generates the daily plan
Then the app should schedule tasks from the backlog within the user's set work hours
And the app should not schedule any tasks during the user's break time

#### Adjusting the Plan for Task Duration

Scenario: App adjusts the daily plan based on task duration and priority
Given the user's daily plan has been generated
When the app recognizes a task with a longer duration or higher priority
Then the app should allocate appropriate time blocks for that task
And the app should adjust other tasks accordingly to fit within the work hours

#### Review and Edit the Daily Plan

Scenario: User reviews and edits the daily plan
Given the user's daily plan has been generated
When the user reviews their plan for the day
Then the user should be able to manually adjust the time for any task
And the user should be able to add, remove, or reorder tasks in the daily plan

#### Reflecting Changes in Backlog

Scenario: Changes in daily plan reflect in the backlog
Given the user has adjusted their daily plan
When the user moves a task to a different day or marks it as complete
Then these changes should be reflected in the backlog
And the backlog should update to show the current status of all tasks

### R4 Customizable Panning Methods

As a user with AD(H)S,
I want to be able to choose from different time management methods for planning my day,
so that I can use the technique that best fits my work style and helps me be more productive.

#### Viewing Available Time Management Methods

Scenario: User views the list of available time management methods
Given the user is on the "Planning Methods" settings page
When the user navigates to the list of methods
Then the user should see "Pomodoro Technique", "Time Blocking", "Eisenhower Matrix", "Getting Things
Done", and "The 1-3-5 Rule" as options

#### Choosing a Time Management Method

Scenario Outline: User selects a time management method
Given the user is on the "Planning Methods" settings page
When the user selects "<method>" from the list of methods
Then "<method>" should be set as the user's current planning method

    Examples:
      | Pomodoro Technique  |
      | Time Blocking       |
      | Eisenhower Matrix   |
      | Getting Things Done |
      | The 1-3-5 Rule      |

#### Applying the Chosen Method to Task Planning

Scenario Outline: App applies the chosen time management method to tasks
Given the user has chosen "<method>"
When the app generates the daily plan
Then the app should organize the tasks according to the rules of "<method>"

    Examples:
      | Pomodoro Technique  |
      | Time Blocking       |
      | Eisenhower Matrix   |
      | Getting Things Done |
      | The 1-3-5 Rule      |

#### Customizing Method-Specific Settings

Scenario Outline: User customizes settings for the chosen planning method
Given the user has selected "<method>"
When the user navigates to the settings for "<method>"
Then the user should see customizable options specific to "<method>"
And the user should be able to adjust these settings according to their preference

    Examples:
      | Pomodoro Technique  |
      | Time Blocking       |
      | Eisenhower Matrix   |
      | Getting Things Done |
      | The 1-3-5 Rule      |

#### Reflecting Method in Daily Plan

Scenario Outline: Daily plan reflects the chosen time management method
Given the user has selected "<method>" and customized the settings
When the user views their daily plan
Then the plan should be structured according to the rules of "<method>"
And the plan should include any custom intervals or breaks set by the user

    Examples:
      | Pomodoro Technique  |
      | Time Blocking       |
      | Eisenhower Matrix   |
      | Getting Things Done |
      | The 1-3-5 Rule      |

### R5 ChatGPT Integration

As a user with AD(H)S,
I want to utilize ChatGPT to optimize my daily planning and task breakdown,
so that I can have a more efficient and tailored schedule based on intelligent suggestions and
insights.

#### Generating Task Breakdowns with ChatGPT

Scenario: User requests ChatGPT for task breakdown
Given the user has a list of tasks for the day
When the user requests a task breakdown from ChatGPT
Then ChatGPT should analyze the tasks
And provide a detailed breakdown of steps for each task
And suggest an estimated duration for each step

[//]: # (#### Optimizing Daily Schedule with ChatGPT Suggestions)

[//]: # ()
[//]: # (Scenario: User optimizes the daily schedule with ChatGPT)

[//]: # (Given the user has a preliminary daily schedule)

[//]: # (And the user requests schedule optimization from ChatGPT)

[//]: # (When ChatGPT analyzes the user's schedule, tasks, and time preferences)

[//]: # (Then ChatGPT should suggest an optimized schedule)

[//]: # (And provide reasoning for the suggested changes)

[//]: # (And offer options to accept or modify the suggestions)

[//]: # (#### Interactive Planning Session with ChatGPT)

[//]: # ()
[//]: # (Scenario: User engages in an interactive planning session with ChatGPT)

[//]: # (Given the user wants to plan their day interactively)

[//]: # (When the user starts an interactive session with ChatGPT)

[//]: # (Then ChatGPT should ask questions about the user's priorities, tasks, and time constraints)

[//]: # (And suggest a plan based on the user's responses)

[//]: # (And allow the user to make real-time adjustments during the session)

[//]: # (#### Receiving and Implementing ChatGPT Advice)

[//]: # ()
[//]: # (Scenario: User receives and implements advice from ChatGPT)

[//]: # (Given the user has received task breakdowns and schedule suggestions from ChatGPT)

[//]: # (When the user reviews the advice and suggestions)

[//]: # (Then the user should be able to implement the suggestions directly into their daily plan)

[//]: # (And the app should update the user's schedule and tasks accordingly)

[//]: # (#### Continuous Learning and Improvement)

[//]: # ()
[//]: # (Scenario: ChatGPT learns from user feedback for continuous improvement)

[//]: # (Given the user has been using ChatGPT integration for a while)

[//]: # (When the user provides feedback on the task breakdowns and schedule suggestions)

[//]: # (Then ChatGPT should learn from the feedback)

[//]: # (And improve future suggestions based on the user's preferences and feedback)

### R6 Reminder Functionality

As a user with AD(H)S
In order to stay informed about upcoming tasks
I want to receive reminders that help me manage my day

#### Setting a Reminder for a Task
Scenario: User sets a reminder for a task
Given the user is adding or editing a task
When the user sets a reminder time and date for the task
And the user saves the task
Then the reminder should be set for that specific time and date
And the user should receive a notification at the set reminder time

#### Receiving Reminder Notifications
Scenario: User receives a reminder notification
Given the user has set a reminder for a task
When the reminder time is reached
Then the user should receive a notification
And the notification should include the task details and the due time

#### Managing Multiple Reminders
Scenario: User manages multiple reminders
Given the user has set multiple reminders for different tasks
When the reminder times are reached
Then the user should receive notifications for each task
And each notification should include the specific details for that task

### R7 Flexibility in Planning

As a user with AD(H)S
In order to adapt to changes and unforeseen tasks
I want the flexibility to adjust my daily plan

#### Adjusting the Daily Plan
Scenario: User modifies the daily plan
Given the user has a set daily plan
When the user adds, removes, or changes the time of a task
Then the daily plan should update to reflect these changes
And the app should rearrange other tasks accordingly

#### Responding to Unforeseen Tasks
Scenario: User adds unforeseen tasks to the plan
Given the user is presented with an unforeseen task
When the user adds the unforeseen task to their daily plan
Then the app should incorporate this task into the existing plan
And adjust the schedule to accommodate the new task without overlapping with existing tasks

#### Prioritizing Urgent Tasks
Scenario: User prioritizes an urgent task
Given the user has an urgent task that was not initially in the daily plan
When the user marks the task as urgent
And adds it to the daily plan
Then the app should prioritize this task
And adjust the schedule to ensure the urgent task is completed in a timely manner

# (### R8 Feedback and Adjustment)

[//]: # ()
[//]: # (As a user with AD&#40;H&#41;S)

[//]: # (In order to fine-tune the app according to user needs)

[//]: # (I want to provide feedback and make adjustments to the planning)

[//]: # ()
[//]: # (# Providing Feedback)

[//]: # (Scenario: User provides feedback on the planning)

[//]: # (Given the user has used the planning feature)

[//]: # (When the user provides feedback through the feedback form in the app)

[//]: # (Then the feedback should be recorded)

[//]: # (And considered for future app updates and improvements)
[//]: # ()
[//]: # (# Making Adjustments Based on Feedback)

[//]: # (Scenario: App incorporates user feedback)

[//]: # (Given the user has provided feedback on the planning feature)

[//]: # (When the app development team reviews the feedback)

[//]: # (Then the team should implement changes where feasible)

[//]: # (And the app should update to reflect these adjustments)

### R9 Rewards and Motivation

Feature: Reward System
In order to motivate and engage users
As a user with AD(H)S
I want a reward system that acknowledges my progress and efforts

#### Earning Points
Scenario: User earns points for completing tasks
Given the user completes a task
When the task is marked as completed
Then the user should earn points

#### Receiving Badges
Scenario: User receives badges for milestones
Given the user reaches a milestone in task completion or other activities
When the milestone is achieved
Then the user should receive a badge representing the achievement

#### Visualizing Progress
Scenario: User views visualized progress
Given the user is using the app
When the user navigates to the "Progress" section
Then the user should see visual representations of their progress

#### Badge Categories and Examples:
##### Streak Badges - Rewarding consistency:

Starter Streak: Earned after completing tasks for 3 consecutive days.
Weekly Warrior: Earned after completing tasks for 7 consecutive days.
Month Master: Earned after completing tasks for 30 consecutive days.

##### Productivity Badges - Rewarding task completion:

Task Tackler: Earned after completing 25 tasks.
Productivity Pro: Earned after completing 50 tasks.
Task Titan: Earned after completing 100 tasks.

##### Focus Badges - Rewarding focused work sessions:

Focused Finch: Earned after 10 focused work sessions.
Concentration Condor: Earned after 50 focused work sessions.
Dedication Eagle: Earned after 100 focused work sessions.

##### Challenge Badges - Rewarding completion of challenging tasks or projects:

Challenge Conqueror: Earned after completing a significant project or task.
Overachiever Owl: Earned after exceeding daily goals for a week.
Milestone Maverick: Earned after reaching significant milestones in long-term projects.

[//]: # (##### Social Badges - Rewarding community participation and support:)

[//]: # ()
[//]: # (Helpful Hawk: Earned after helping another user in the community.)

[//]: # (Community Champion: Earned after active participation in the community for a month.)

[//]: # (Inspirational Influencer: Earned after sharing tips or experiences that significantly help others.)