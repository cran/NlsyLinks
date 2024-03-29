# ------------------------------------------------------------
test_that("DFMethod1 -MathStandardized", {
  dsOutcomes <- ExtraOutcomes79
  dsOutcomes$SubjectTag <- CreateSubjectTag(subjectID = dsOutcomes$SubjectID, generation = dsOutcomes$Generation)
  dsFull <- Links79Pair[Links79Pair$RelationshipPath == "Gen2Siblings", ]
  dsDF <- CreatePairLinksDoubleEntered(outcomeDataset = dsOutcomes, linksPairDataset = dsFull, outcomeNames = c("MathStandardized", "WeightZGenderAge"))
  expectedASquared <- 0.89669679757107623175 # 0.97878157157751255468
  expectedCSquared <- 0.078992475310234275265 #-0.026817134106613928907
  expectedESquared <- 0.02431072711868953462 # 0.048035562529101349938
  expectedRowCount <- 16680
  unique(dsDF$R)
  # dsDF <- dsDF[dsDF$R %in% c(0, .25, .375, .5, 1), ]
  oName_S1 <- "MathStandardized_S1"
  oName_S2 <- "MathStandardized_S2"
  tolerance <- 1e-6

  actual <- DeFriesFulkerMethod1(dataSet = dsDF, oName_S1 = oName_S1, oName_S2 = oName_S2)
  # actual <- DeFriesFulkerMethod1(outcomeForSubject1=dsDF$MathStandardized_S1, outcomeForSubject2=dsDF$MathStandardized_S2, relatedness=dsDF$R)
  expect_equal(object = slot(actual, "ASquared"), expected = expectedASquared, tolerance = tolerance, scale = 1)
  expect_equal(object = slot(actual, "CSquared"), expected = expectedCSquared, tolerance = tolerance, scale = 1)
  expect_equal(object = slot(actual, "ESquared"), expected = expectedESquared, tolerance = tolerance, scale = 1)
  expect_equal(object = slot(actual, "CaseCount"), expected = expectedRowCount, tolerance = tolerance, scale = 1)
  expect_true(object = slot(actual, "Unity"))
  expect_true(object = slot(actual, "WithinBounds"))
  # expect_equal(object=actual$ASquared, expected=expectedASquared, tolerance = tolerance, scale=1)


  actualFromWrapper <- AceUnivariate(method = "DeFriesFulkerMethod1", dataSet = dsDF, oName_S1 = oName_S1, oName_S2 = oName_S2)
  # actualFromWrapper <- AceUnivariate(outcomeForSubject1=dsDF$MathStandardized_S1, outcomeForSubject2=dsDF$MathStandardized_S2, relatedness=dsDF$R, method="DeFriesFulkerMethod1")
  expect_equal(object = slot(actualFromWrapper, "ASquared"), expected = expectedASquared, tolerance = tolerance, scale = 1)
  expect_equal(object = slot(actualFromWrapper, "CSquared"), expected = expectedCSquared, tolerance = tolerance, scale = 1)
  expect_equal(object = slot(actualFromWrapper, "ESquared"), expected = expectedESquared, tolerance = tolerance, scale = 1)
  expect_equal(object = slot(actualFromWrapper, "CaseCount"), expected = expectedRowCount, tolerance = tolerance, scale = 1)
  expect_true(object = slot(actualFromWrapper, "Unity"))
  expect_true(object = slot(actualFromWrapper, "WithinBounds"))
})


# ------------------------------------------------------------
test_that("DFMethod3 -MathStandardized", {
  dsOutcomes <- ExtraOutcomes79
  dsOutcomes$SubjectTag <- CreateSubjectTag(subjectID = dsOutcomes$SubjectID, generation = dsOutcomes$Generation)
  dsFull <- Links79Pair[Links79Pair$RelationshipPath == "Gen2Siblings", ]
  dsDF <- CreatePairLinksDoubleEntered(outcomeDataset = dsOutcomes, linksPairDataset = dsFull, outcomeNames = c("MathStandardized", "WeightZGenderAge"))
  expectedASquared <- 0.77344473256718349052
  expectedCSquared <- 0.14692041073837297516
  expectedESquared <- 0.079634856694443589831
  expectedRowCount <- 16680
  # dsDF <- dsDF[dsDF$R %in% c(0, .25, .375, .5, 1), ]
  oName_S1 <- "MathStandardized_S1"
  oName_S2 <- "MathStandardized_S2"
  tolerance <- 1e-6

  actual <- DeFriesFulkerMethod3(dataSet = dsDF, oName_S1 = oName_S1, oName_S2 = oName_S2)
  expect_equal(object = slot(actual, "ASquared"), expected = expectedASquared, tolerance = tolerance, scale = 1)
  expect_equal(object = slot(actual, "CSquared"), expected = expectedCSquared, tolerance = tolerance, scale = 1)
  expect_equal(object = slot(actual, "ESquared"), expected = expectedESquared, tolerance = tolerance, scale = 1)
  expect_equal(object = slot(actual, "CaseCount"), expected = expectedRowCount, tolerance = tolerance, scale = 1)
  expect_true(object = slot(actual, "Unity"))
  expect_true(object = slot(actual, "WithinBounds"))
  # expect_equal(object=actual$ASquared, expected=expectedASquared, tolerance = tolerance, scale=1)

  actualFromWrapper <- AceUnivariate(method = "DeFriesFulkerMethod3", dataSet = dsDF, oName_S1 = oName_S1, oName_S2 = oName_S2)
  expect_equal(object = slot(actualFromWrapper, "ASquared"), expected = expectedASquared, tolerance = tolerance, scale = 1)
  expect_equal(object = slot(actualFromWrapper, "CSquared"), expected = expectedCSquared, tolerance = tolerance, scale = 1)
  expect_equal(object = slot(actualFromWrapper, "ESquared"), expected = expectedESquared, tolerance = tolerance, scale = 1)
  expect_equal(object = slot(actualFromWrapper, "CaseCount"), expected = expectedRowCount, tolerance = tolerance, scale = 1)
  expect_true(object = slot(actualFromWrapper, "Unity"))
  expect_true(object = slot(actualFromWrapper, "WithinBounds"))
})

#
# slot(actual, "ASquared")
# slot(actual, "CSquared")
# slot(actual, "ESquared")
# slot(actual, "CaseCount")



# test_that("DFMethod1 -WeightZGenderAge", {
#   dsOutcomes <- ExtraOutcomes79
#   dsOutcomes$SubjectTag <- CreateSubjectTag(subjectID=dsOutcomes$SubjectID,generation=dsOutcomes$Generation)
#   dsFull <- Links79Pair[Links79Pair$RelationshipPath=='Gen2Siblings', ]
#   dsDF <- CreatePairLinksDoubleEntered(outcomeDataset=dsOutcomes, linksPairDataset=dsFull, outcomeNames=c("MathStandardized", "WeightZGenderAge"))
#   expectedASquared <- 0.67402146265628393
#   expectedCSquared <- -0.013283359091640816
#   expectedESquared <- 0.33926189643535687
#   expectedRowCount <- 6958
#   oName_S1 <- "WeightZGenderAge_S1"
#   oName_S2 <- "WeightZGenderAge_S2"
#
#   dsDF$WeightZGenderAge_S1
#   dsDF[, c(oName_S1, oName_S2)]
#   tolerance <- 1e-6
#
#   actual <- DeFriesFulkerMethod1(dataSet=dsDF, oName_S1=oName_S1, oName_S2=oName_S2)
#   expect_equal(object=slot(actual, "ASquared"), expected=expectedASquared, tolerance = tolerance, scale=1)
#   expect_equal(object=slot(actual, "CSquared"), expected=expectedCSquared, tolerance = tolerance, scale=1)
#   expect_equal(object=slot(actual, "ESquared"), expected=expectedESquared, tolerance = tolerance, scale=1)
#   expect_equal(object=slot(actual, "CaseCount"), expected=expectedRowCount, tolerance = tolerance, scale=1)
#   expect_true(object=slot(actual, "Unity"))
#   expect_false(object=slot(actual, "WithinBounds"))
#   #expect_equal(object=actual$ASquared, expected=expectedASquared, tolerance = tolerance, scale=1)
#
#
#   actualFromWrapper <- AceUnivariate(method="DeFriesFulkerMethod1", dataSet=dsDF, oName_S1=oName_S1, oName_S2=oName_S2)
#   expect_equal(object=slot(actualFromWrapper, "ASquared"), expected=expectedASquared, tolerance = tolerance, scale=1)
#   expect_equal(object=slot(actualFromWrapper, "CSquared"), expected=expectedCSquared, tolerance = tolerance, scale=1)
#   expect_equal(object=slot(actualFromWrapper, "ESquared"), expected=expectedESquared, tolerance = tolerance, scale=1)
#   expect_equal(object=slot(actualFromWrapper, "CaseCount"), expected=expectedRowCount, tolerance = tolerance, scale=1)
#   expect_true(object=slot(actualFromWrapper, "Unity"))
#   expect_false(object=slot(actualFromWrapper, "WithinBounds"))
# })

# test_that("DFMethod3 -WeightStandardizedAdult", {
#   dsOutcomes <- ExtraOutcomes79
#   dsOutcomes$SubjectTag <- CreateSubjectTag(subjectID=dsOutcomes$SubjectID,generation=dsOutcomes$Generation)
#   dsFull <- Links79Pair[Links79Pair$RelationshipPath=='Gen2Siblings', ]
#   dsDF <- CreatePairLinksDoubleEntered(outcomeDataset=dsOutcomes, linksPairDataset=dsFull, outcomeNames=c("MathStandardized", "Weight", "WeightStandardized", "WeightStandardizedForAge19To25"))
#   expectedASquared <- 0.64047731125483631
#   expectedCSquared <- 0.0035255270911337348
#   expectedESquared <- 0.35599716165402995
#   expectedRowCount <- 6958
#   #dsDF <- dsDF[dsDF$R %in% c(0, .25, .375, .5, 1), ]
#   oName_S1 <- "WeightStandardizedForAge19To25_S1"
#   oName_S2 <- "WeightStandardizedForAge19To25_S2"
#   tolerance <- 1e-6
#
#   actual <- DeFriesFulkerMethod3(dataSet=dsDF, oName_S1=oName_S1, oName_S2=oName_S2)
#   expect_equal(object=slot(actual, "ASquared"), expected=expectedASquared, tolerance = tolerance, scale=1)
#   expect_equal(object=slot(actual, "CSquared"), expected=expectedCSquared, tolerance = tolerance, scale=1)
#   expect_equal(object=slot(actual, "ESquared"), expected=expectedESquared, tolerance = tolerance, scale=1)
#   expect_equal(object=slot(actual, "CaseCount"), expected=expectedRowCount, tolerance = tolerance, scale=1)
#   expect_true(object=slot(actual, "Unity"))
#   expect_true(object=slot(actual, "WithinBounds"))
#   #expect_equal(object=actual$ASquared, expected=expectedASquared, tolerance = tolerance, scale=1)
#
#   actualFromWrapper <- AceUnivariate(method="DeFriesFulkerMethod3", dataSet=dsDF, oName_S1=oName_S1, oName_S2=oName_S2)
#   expect_equal(object=slot(actualFromWrapper, "ASquared"), expected=expectedASquared, tolerance = tolerance, scale=1)
#   expect_equal(object=slot(actualFromWrapper, "CSquared"), expected=expectedCSquared, tolerance = tolerance, scale=1)
#   expect_equal(object=slot(actualFromWrapper, "ESquared"), expected=expectedESquared, tolerance = tolerance, scale=1)
#   expect_equal(object=slot(actualFromWrapper, "CaseCount"), expected=expectedRowCount, tolerance = tolerance, scale=1)
#   expect_true(object=slot(actualFromWrapper, "Unity"))
#   expect_true(object=slot(actualFromWrapper, "WithinBounds"))
# })
