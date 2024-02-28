# 0x06. Regular expression

## Table of Contents

1. [Background Context](#background-context)
2. [Resources](#resources)
3. [Introduction](#introduction)
4. [Prerequisites](#prerequisites)
5. [Usage](#usage)
6. [File Descriptions](#file-descriptions)
    - [0-simply_match_school.rb](0-simply_match_schoolrb)
    - [1-repetition_token_0.rb](1-repetition_token_0rb)
    - [100-textme.rb](100-textmerb)
    - [2-repetition_token_1.rb](2-repetition_token_1rb)
    - [3-repetition_token_2.rb](3-repetition_token_2rb)
    - [4-repetition_token_3.rb](4-repetition_token_3rb)
    - [5-beginning_and_end.rb](5-beginning_and_endrb)
    - [6-phone_number.rb](6-phone_numberrb)
    - [7-OMG_WHY_ARE_YOU_SHOUTING.rb](7-omg_why_are_you_shoutingrb)
7. [Author](#author)

## Background Context

For this project, you have to build your regular expression using Oniguruma, a regular expression library that which is used by Ruby by default. Note that other regular expression libraries sometimes have different properties.

Because the focus of this exercise is to play with regular expressions (regex), here is the Ruby code that you should use, just replace the regexp part, meaning the code in between the `//`:

```
sylvain@ubuntu$ cat example.rb
#!/usr/bin/env ruby
puts ARGV[0].scan(/127.0.0.[0-9]/).join
sylvain@ubuntu$
sylvain@ubuntu$ ./example.rb 127.0.0.2
127.0.0.2
sylvain@ubuntu$ ./example.rb 127.0.0.1
127.0.0.1
sylvain@ubuntu$ ./example.rb 127.0.0.a
```

## Resources

**Read or watch:**

* [Regular expressions - basics](https://www.slideshare.net/neha_jain/introducing-regular-expressions)
* [Regular expressions - advanced](https://www.slideshare.net/neha_jain/advanced-regular-expressions-80296518)
* [Rubular is your best friend](https://rubular.com/)
* [Use a regular expression against a problem: now you have 2 problems](https://blog.codinghorror.com/regular-expressions-now-you-have-two-problems/)
* [Learn Regular Expressions with simple, interactive exercises](https://regexone.com/)

## Introduction

Regular expressions are powerful tools for pattern matching in strings. This project contains Ruby scripts that demonstrate the use of regular expressions to match specific patterns in text. Each script addresses a particular task related to regular expressions.

## Prerequisites

* Allowed editors: `vi`, `vim`, `emacs`
* All your files will be interpreted on Ubuntu 20.04 LTS
* All your files should end with a new line
* A `README.md` file, at the root of the folder of the project
* All Bash script files must be executable
* The first line of all Bash scripts should be exactly `#!/usr/bin/env ruby`
* Ruby (`version X.X.X or higher`) installed on your system with the Oniguruma library.
* Regular expressions (regex) must be built for the `Oniguruma` library

## Usage

To run any of the scripts, use the following command:

```
./script_name.rb "input_string"
```

Replace script_name.rb with the name of the script you want to execute and "input_string" with the text you want to analyze.

## File Descriptions

Here's a brief overview of each script in this project:

### 0-simply_match_school.rb

- Description: This script matches the word "School" in a given string using a regular expression.
- Usage: `./0-simply_match_school.rb "your_string"`

### 1-repetition_token_0.rb

- Description: This script matches a specific pattern in a given string using a regular expression.
- Usage: `./1-repetition_token_0.rb "your_string"`

### 100-textme.rb

- Description: This script extracts specific information from a text message using a regular expression.
- Usage: `./100-textme.rb "your_text_message"`

### 2-repetition_token_1.rb

- Description: This script matches a specific pattern in a given string using a regular expression.
- Usage: `./2-repetition_token_1.rb "your_string"`

### 3-repetition_token_2.rb

- Description: This script matches a specific pattern in a given string using a regular expression.
- Usage: `./3-repetition_token_2.rb "your_string"`

### 4-repetition_token_3.rb

- Description: This script matches a specific pattern in a given string using a regular expression.
- Usage: `./4-repetition_token_3.rb "your_string"`

### 5-beginning_and_end.rb

- Description: This script matches strings that start with 'h', end with 'n', and have any single character in between using a regular expression.
- Usage: `./5-beginning_and_end.rb "your_string"`

### 6-phone_number.rb

- Description: This script matches 10-digit phone numbers using a regular expression.
- Usage: `./6-phone_number.rb "your_string"`

### 7-OMG_WHY_ARE_YOU_SHOUTING.rb

- Description: This script matches only capital letters in a given string using a regular expression.
- Usage: `./7-OMG_WHY_ARE_YOU_SHOUTING.rb "your_string"`

## Author

[Peter Opoku-Mensah](https://github.com/deezyfg)