Futurewhiz PingPong
===========================

This repo has been forked from [elovation/elovation](https://github.com/elovation/elovation) and tweaked to support our needs at [Futurewhiz](https://www.futurewhiz.com/)!


Quick Start with Heroku
---------------------------

The fastest way to get started with Elovation is to click the deploy to [Heroku](http://www.heroku.com) button below. Elovation can be run on the free tier, so all you will require is a Heroku account to get started with no running costs.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/prabaMuruges/elovation)

If you would like to add a level of authentication security to your app on Heroku, on the setup screen set the "BASIC_AUTH" to "true", and set a username and password in their respective fields. When you try to access your app in future, you will be prompted for your credentials.

You can set the branding on Elovation by defining the "ELOVATION_TITLE" variable in Heroku with your desired name.

The click to deploy button will automatically migrate your database.

Game Options
------------
There are two types of "Games" that Elovation allows for: [Trueskill](https://en.wikipedia.org/wiki/TrueSkill) & [Elo](https://en.wikipedia.org/wiki/Elo_rating_system)

#### Trueskill
Trueskill allows for teams of multiple players, to play other teams - yet still calculate each individual player's ranking.

When creating a new game you may set the maximum numbers of teams in a result, and the maximum number of players per team in a result. You can record a result in any combination up to the maximum.  

The default is set to 2 players per team, and 2 teams per result (like playing a game of doubles Table Tennis / Foosball). The minimum allowed players per team is 1, and the minimum allowed teams per result is 2.

If you increase the allowed number of teams per result, this will allow scenarios where a team can defeat multiple other teams in a single match at the same time. A possible example of this is a Paint Ball / Nerf War with multiple teams that is "last team standing" - All other teams are the losers and the remaining team is the winner.

Suitable for:
- Table Tennis
- Foosball
- Paint Ball / Nerf Wars

#### Elo
Elo is a simpler method devised for Player versus player games only and does not support teams. It also increments and decrements by a set value which makes a win/loss amount more predictable.

Suitable for:
- Chess
- Table Tennis
- Foosball

Caution
-------
If you intend to use this software commercially, you must remove the Trueskill implementation as it is patented by Microsoft.
