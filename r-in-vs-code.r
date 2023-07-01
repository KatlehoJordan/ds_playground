# Intro ####

# This file is meant to be used to show some of features for R in VS Code:
# More info on the VS Code REditorSupport page

# Send to radian ####

# Start by trying to run a command from the editor with ctrl + enter
# which should automatically create a radian shell
library(dplyr)

# Workspace ####

# Click on the R icon in the left-hand side of VS Code, found the same place
# you find the Explorer menu, Extensions, etc. Expand the 'Attached' and
# 'Loaded Namespaces' sections.
# As you load more packages, you should see it populate
library(magrittr)
library(glue)

# As you create objects, you should see them also appear

object_to_appear_in_workspace <- "but I don't want comfort"

# Help window ####

# As you explore an item, a new window should appear for help
?starwars

# View window ####

# A view window should pop open when viewing objects
View(starwars)

# Run block of code ####

# Based on the settings in your .vscode/settings.json, you can run a block
# of code with ctrl + enter also
starwars %>%
    group_by(species, sex) %>%
    select(height, mass) %>%
    summarise(
        height = mean(height, na.rm = TRUE),
        mass = mean(mass, na.rm = TRUE)
    )

# Basic features from the Language Server Pack (LSP): ####

# Outlining if you use the four hash syntax
# Hover to get help
# Autocompletion
# Signature preview
# Hover to get help
# Linting
# Formatting on paste, type, and save
# F2 for renaming objects for fast refactoring
# Symbol highlighting to help show where other instances exist
# Document selection (shift + alt + right arrow) to expand your selection

observations <- 100
x <- rnorm(100, mean = 10, sd = 1)
y <- 2 * x + rnorm(observations)

# Advanced features from the Language Server Pack (LSP): ####

## Scope-based Autocompletion ####

fun <- function(variable_1, variable_2) {
    if (variable_1 > variable_2) {
        variable_3 <- variable_1 + variable_2
        for (variable_4 in 1:10) {
            variable_1 + variable_2 + variable_3 + variable_4
        }
    } else {
        variable_1 - y
    }
}

## Context aware auto-completion ####

my_data <- read.csv(file = "data/context-aware-intellisense.csv", sep = "\t")

my_data %>%
    select(tidy_variable_1, second_variable)

## ctrl+click or shift+alt+h to see where a function is used ####

func1 <- function() "hello"

func1()

func2 <- function(x, y) {
    if (x == y) func1() else "goodbye"
}

func2(1, 1)
func2(1, 2)

func3 <- function(x, y) {
    if (x < y) func1() else func2(x, y)
}

func3(1, 1)
func3(1, 2)
func3(2, 1)

## Document and workspace symbols ####

my_new_var <- "Find me with @ in the search bar"

## ctrl+click or shift+F12 to find all occurrences ####

my_new_var

## Document links: ctrl+click to jump to a document ####

source("main.r")