# README

Language recognition based on an algorithm using Markov chains.

All the hard work of thinking had been made by Dat Tran and Dharmendra Sharma at the University of Canberra. You can read the paper I used there : http://staff.estem-uc.edu.au/html/DTran/Publications/P51479.pdf

## Code status

[![Build Status](https://travis-ci.org/sallesma/language-recognition.svg?branch=master)](https://travis-ci.org/sallesma/language-recognition)
[![Code Climate](https://codeclimate.com/github/sallesma/language-recognition/badges/gpa.svg)](https://codeclimate.com/github/sallesma/language-recognition)
[![Coverage Status](https://coveralls.io/repos/github/sallesma/language-recognition/badge.svg?branch=master)](https://coveralls.io/github/sallesma/language-recognition?branch=master)
[![Dependency Status](https://gemnasium.com/badges/github.com/sallesma/language-recognition.svg)](https://gemnasium.com/github.com/sallesma/language-recognition)

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
