# Healthlocker [![Build Status](https://travis-ci.org/healthlocker/healthlocker.svg?branch=master)](https://travis-ci.org/healthlocker/healthlocker) [![Deps Status](https://beta.hexfaktor.org/badge/all/github/healthlocker/healthlocker.svg)](https://beta.hexfaktor.org/github/healthlocker/healthlocker)

## _Why_?

Healthlocker's mission is to enable people to

## What?

Healthlocker is a Mobile-focussed Web Application designed to help
people improve their wellbeing.

> TODO: @MollieCourtenay please update copy for "What is Healthlocker"
so people reading the repository have a clear picture with context. thanks!


## How?

## Getting started

### Install the following:
* [Elixir](https://github.com/dwyl/learn-elixir#how)
* [Postgresql](https://github.com/dwyl/learn-postgresql) (and ensure you create a user)
* [Node.js](https://nodejs.org/en/)

### Once everything is installed:
* Enter `brew link autoconf automake` into your terminal
* Open Postgresql (if you can see the elephant symbol in your menu bar you know that it's running)
* Get dependencies (including if they are out of date) with `mix deps.get`
* Create and migrate your database with `mix ecto.create && mix ecto.migrate`
* There is seed data which can be inserted into your dev database by running
`mix run priv/repo/seeds.exs`. Note: you can see this data in
[the seeds.exs file](priv/repo/seeds.exs).
* If prompted by the following message, enter `y`:

` Could not find "rebar3", which is needed to build dependency :fs
I can install a local copy which is just used by Mix
Shall I install rebar3? (if running non-interactively, use: "mix local.rebar --force") [Yn] `
* Install Node.js dependencies with `npm install`
* Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser and checkout the [styleguide](http://localhost:4000/components).

Ready to run in production? Please [check the deployment guides](http://www.phoenixframework.org/docs/deployment).

### Testing

We use [`ExUnit`](http://elixir-lang.org/docs/stable/ex_unit/) and [`wallaby`](https://github.com/keathley/wallaby) for testing. Wallaby has a dependency on phantomjs, you can follow their [instructions](https://github.com/keathley/wallaby#phantomjs) to install it.

After that you should be able to run `mix test` and see lots of green!

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


### Updating select input options

The options for `hours_slept`, `wake_count` and `security_questions` can be
updated by editing the corresponding `.txt` file. Go to the file(s) that you
want to edit for  
[hours_slept](web/static/assets/hours_slept.txt),
[wake_count](web/static/assets/wake_count.txt), or
[security_questions](web/static/assets/security_questions.txt) and follow
through the instructions below.

Click on the pencil in the top right corner of the file.
![edit-file](https://cloud.githubusercontent.com/assets/1287388/24212494/74f767d0-0f27-11e7-95b8-2b3bff21cbc5.png)

Make any changes you wish to the file. Delete questions, change the wording,
or add new ones. The only thing to keep in mind for this is to put each question
in the file on it's own line. Do not use commas or anything besides a new line
to separate questions.

```
Option 1
Option 2
Option 3
```

After you are done making changes, you can find a box underneath the file that
says `Commit changes`.

![commit-changes](https://cloud.githubusercontent.com/assets/1287388/24213604/fb238f2a-0f2a-11e7-8a60-251e40e3251c.png)

In here, you can write a short message in the box that says `Update` describing
the change e.g. Add new option, Reword security question, etc.

Ensure the bottom option ("*Create a new branch for this commit and start a
pull request.*") is ticked as in the image above.

Click on `Propose file change`.

You will be taken to a new page where you can create a pull request. You can
leave the default text as the title, and reference any related issues in the
comment box.

Click `Create pull request` in the bottom right.

![create-pr](https://cloud.githubusercontent.com/assets/1287388/24213909/e2c6164a-0f2b-11e7-8ccf-d3f206108488.png)

If you are happy with the changes, change the label to `awaiting-review`:

![awaiting-review](https://cloud.githubusercontent.com/assets/1287388/24214001/21fe0ac0-0f2c-11e7-96a5-8f58110637c5.png)

Then add a `Reviewer` and `Assignee` of your choice.

The options for `hours_slept` and `wake_count` can be updated in the same way.
Go to the files for [hours_slept](web/static/assets/hours_slept.txt) or
[wake_count](web/static/assets/wake_count.txt), and follow through the
instructions above.

### Writing tips & stories

The stories and tips can be written using markdown. This will allow you to
style the text as you write it.

You can find a
[guide to common things you may want to do with markdown](markdown-syntax.md)
in this repository.

In addition to formatting the text with markdown, be sure to include `#story`
or `#tip` (with an additional *category* tag) so the story or tip displays on
the page.

### Current features

![style-guide](https://cloud.githubusercontent.com/assets/25007700/24720714/f1c77f70-1a35-11e7-808c-b1f1596ea0ae.png)

* Tips can be added in, and can be viewed either in full or filtered by tag
* Story content can be input by users, and are displayed in cards with a
story preview
* Stories can be expanded to view the full individual story
* Support page is available in full
* Three-step sign up process
* Login
* Users can only post content when logged in
* Users can create, view, update and delete coping strategies they have made
* Users can create, view, update, and delete goals they have made
* Goals can be marked as important and are displayed at the top of the goals page
* Users can visit their account page where they can update their name, email,
or phone number
* Users can update their consent for sharing data with researchers in their account
* Users can update their password and security Q&A in their account
* Terms of service can be accessed from the footer and is linked in sign up
* Privacy statement can be accessed from the footer and is linked in sign up
* Feedback can be sent about the site from a form. This is done
[using Bamboo and Amazon SES](https://github.com/dwyl/learn-phoenix-framework/blob/master/sending-emails.md)
* Logged in users can track their sleep over time using the sleep tracker in toolkit
* Users who have tracked sleep can view:
  * hours slept each night over the past week
  * average number of hours slept over the past week
  * times they woke up each night for the past week
  * notes they made about their sleep from the past week
* Users can view the previous 7 days sleep data, or go forward once they've gone back.
* [Styleguide](https://www.healthlocker.uk/components)


## DevOps

### Application Architecture

The Healthlocker App is deployed to "Production" in the following configuration:

![healthlocker-architecture-diagram-2](https://cloud.githubusercontent.com/assets/194400/26106766/e62c9316-3a3e-11e7-830e-96df89c4f5d7.jpg)
> To edit this diagram, open:<br />
https://docs.google.com/drawings/d/1VwpBVKzqSX0q81KsKSKAOS7wtYcqZqARKAFTKJUaowg

The cluster of Web Servers is two or more Linux VMs behind a load balancer.

#### Infrastructure Details

There are 4 pieces to the puzzle

+ Azure **Load Balancer**:
https://azure.microsoft.com/en-gb/services/load-balancer -
All web traffic is handled through the load balancer which performs
_continous_ health checks on the application server(s) and routes
requests in a "round-robin" to balance load.
+ **Linux Virtual Machines** (VMs):
https://azure.microsoft.com/en-gb/services/virtual-machines - these run our
Phoenix Web Application. The Application is _compiled_ as an _executable_
which runs on "BEAM" (_the Erlang Virtual Machine_).
The VMs are _actively_ monitored and can be scaled up dynamically
dependent on request volume.
+ Azure **PostgreSQL Database-as-a-Service**:
https://azure.microsoft.com/en-us/services/postgresql - all application data
is stored in an Azure Database instance which is encrypted at rest,
scales dynamically/transparently ("_built-in high availability_")
and backed up transparently. Data is _Only_ accessible from the Production VMs
+ Azure **SQL Server** (_Database-as-a-Service_):
https://azure.microsoft.com/en-gb/services/sql-database - Stores a _read-only_
_snapshot_ of the "Care Notes" (ePJS) Database. This contains the patients
personal health information and is controlled by the "SLaM" IT team.
Access is restricted to the Production Healthlocker VMs and patient (_personal_)
data is only viewable by the patient and authorized healthcare professionals.

### Continuous Integration/Testing and Deployment Pipeline




### Deployment Guide

In the interest of _reproducibility_ we have produced a
***step-by-step guide*** to deploying a Phoenix Web Application to
Microsoft Azure: <br />
https://github.com/dwyl/learn-microsoft-azure
