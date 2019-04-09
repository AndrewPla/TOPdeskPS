# TOPdeskPS Release History
## 0.1.3

### Fixed
* Fixed the Status parameter of New-TdIncident so it now enforces the proper casing. Closes #89


## 0.1.2

### Added

* Get-TdKnowledgeItem

### Fixed

* New-TdIncident parameter CallerEmail is no longer mandatory.


## 0.0.8- Jan 9th, 2019

### Fixed
* Get-TdDepartment - Fixed the name parameter #56
* New-TdPerson - Fixed the department argument #57

## 0.0.7 - January 6th, 2019

### Added

* Get-TdBranchFilter- Thanks Michael!
* Get-TdCategoryFilter
* Get-TdOperatorFilter
* Get-TdOperatorOperatorGroup
* Get-TdOperatorAvatar
* Get-TdPersonAvatar
* Get-TdDepartment
* New-TdBranch
* Set-TdBranch
* New-TdBudgetHolder
* Tons of other commands

### Fixed

* Added support for PS Core.
* Fixed several small typos/bugs
* Fixed bad help/docs


## 0.0.6 - 10/14/2018

### Added

* New-TdChangeAction
* Get-TdChangeActivity
* Get-TdAsset
* Get-TdAssetTemplateBlank
* New-TdAsset
* Get-TdAssetTemplate
* Remove-TdAsset
* Set-TdAsset
* Get-TdAssetLink
* Set-TdAssetLink
* Get-TdAssetLinkPossibleRelation
* Remove-TdAssetLink
* Get-TdAssetAssignment
* Add-TdAssetAssignment
* Remove-TdAssetAssignment
* Send-TdAssetFile
* Get-TdAssetFile
* Remove-TdAssetFile
* Get-TdAssetField
* Get-TdAssetFieldValue
* Get-TdAssetCapability
* Get-TdAssetDetail
* Get-TdAssetCapabilityDetail
* New-TdAssetCapability
* Set-TdAssetCapability

### Fixed

* Get-TdChange now returns the proper changes
* #30 Connect-TdService now supports using application passwords using the ApplicationPassword parameter.

## 0.0.5 - 9/30/2018

### Added

* Get-TdApiVersion
* Get-TdArchiveReason
* Get-TdBranch
* Get-TdBudgetHolder
* Get-TdCallType
* Get-TdCategory
* Get-TdChange
* Get-TdClosureCode
* Get-TdCountry
* Get-TdDeescealationReason
* Get-TdDuration
* Get-TdEntryType
* Get-TdEscalationReason
* Get-TdImpact
* Get-TdIncidentAction
* Get-TdKnowledgeItem
* Get-TdPerson
* Get-TdPersonGroup
* Get-TdPriority
* Get-TdProcessingStatus
* Get-TdServiceWindow
* Get-TdUrgency
* Get-TdTimeSpentReason
* New-TdPerson
* New-TdChange
* Send-TdIncidentFile
* Send-TdTaskNotification
* Set-TdPerson
* Get-TdOperatorGroup

## 0.0.3 - 8/22/2018

### Fixed

* Better logging
* boolean params are now switch! Sorry :)

### Added

* Get-TdCategory
* Get-TdSubcategory
* Get-TdOperator
* Fancy tab completion. As part of Connect-TdService we make a few basic api calls to enable tab completion based on your TOPdesk environment.
* Added new configuration system using PSFramework
* Added PSFramework as a required module.
* Massively updated the build system to use VSTS
* Created a site for this project [andrewpla.github.io/TOPdeskPS]('https://andrewpla.github.io/TOPdeskPS')

### Changed

* Added PSFramework as a required module.
* Lots of small changes

## 0.0.2 - 7/9/2018

### Fixed

* many fixes

### Added

* Send-TdImportFile

### Changed

* Added more functions/polishing.

## 0.0.1 - 7/9/2018

### Fixed

* Initial release

### Added

* Initial release

### Changed

* Initial release
