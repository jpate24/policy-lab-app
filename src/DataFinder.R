total_pop <- 0

getTotalPop <- function() {
  for (row in 1:nrow(population_by_blockgroup)) {
    if (population_by_blockgroup[row, 5] == "PROVIDENCE"){
      total_pop <<- total_pop + population_by_blockgroup[row, 7]
    }
  }
}
getTotalPop()

total_pop

from1 <- which(colnames(population_by_blockgroup) == "B01001_020E")
from2 <- which(colnames(population_by_blockgroup) == "B01001_025E")
to1 <- which(colnames(population_by_blockgroup) == "B01001_044E")
to2 <- which(colnames(population_by_blockgroup) == "B01001_049E")

GEOID10 <- list()

olderPop <- 0

ageDistToSchool <- function() {
  for (row in 1:nrow(distance_from_school_to_blockgroup_in_miles)) {
    if (distance_from_school_to_blockgroup_in_miles[row, 2] == "CLASSICAL"
        && distance_from_school_to_blockgroup_in_miles[row, 3] < 1) {
      GEOID10 <<- append(GEOID10, distance_from_school_to_blockgroup_in_miles[row, 1])
    }
  }
  for (row in 1:nrow(population_by_blockgroup)){
    if (population_by_blockgroup[row, "city"] == "PROVIDENCE"
        && population_by_blockgroup[row, "GEOID10"] %in% GEOID10) {
      print("cp")
      for (col in from1:from2) {
        olderPop <<- olderPop + population_by_blockgroup[row, col]
      }
      for (col in to1:to2) {
        olderPop <<- olderPop + population_by_blockgroup[row, col]
      }
    }
  }
}

ageDistToSchool()
print(olderPop)


GEOID10 <<- list()

meanDist <- funcition() {
  for (row in 1:nrow(distance_from_school_to_blockgroup_in_miles)) {
    if (distance_from_school_to_blockgroup_in_miles[row, 3] < 1) {
      GEOID10 <<- append(GEOID10, distance_from_school_to_blockgroup_in_miles[row, 1])
    }
  }
  for (row in 1:nrow(population_by_blockgroup)){
    if (population_by_blockgroup[row, "city"] == "PROVIDENCE"
        && population_by_blockgroup[row, "GEOID10"] %in% GEOID10) {
      print("cp")
      for (col in from1:from2) {
        olderPop <<- olderPop + population_by_blockgroup[row, col]
      }
      for (col in to1:to2) {
        olderPop <<- olderPop + population_by_blockgroup[row, col]
      }
    }
  }
}



