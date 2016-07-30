# README

Language recognition based on an algorithm using Markov chains.

All the hard work of thinking had been made by Dat Tran and Dharmendra Sharma at the University of Canberra. You can read the paper I used there : http://staff.estem-uc.edu.au/html/DTran/Publications/P51479.pdf

## Code status

[![Build Status](https://travis-ci.org/sallesma/markov-language.svg?branch=master)](https://travis-ci.org/sallesma/markov-language)


## Usage

### Train

Sending a GET request:
```
http://localhost:3000/training.json?text=<text>&locale=<locale>
```
or using a task to fetch random articles on wikipedia:
```
rake auto_train_from_wikipedia en 3
```
where en is the locale and 3 the number or articles to fetch from wikipedia


### Identify

Sending a GET request:
```
http://localhost:3000/identify.json?text=<text>
```
The server will answer with the locale
