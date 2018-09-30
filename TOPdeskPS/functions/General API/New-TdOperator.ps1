function New-TdOperator {
    [CmdletBinding()]
    param (
        [Alias('LastName')]
        [Parameter(Mandatory)]
        [system.string]$Surname,

        [system.string]$FirstName,

        [system.string]$Gender = 'UNDEFINED',

        [system.string]$EmployeeNumber,

        [Alias('TelephoneNumber')]
        [system.string]$Telephone,

        [system.string]$MobileNumber,

        [system.string]$NetworkLoginName,

        [Alias('EmailAddress')]
        [system.string]$Email,

        [Parameter(ParameterSetName = 'BranchId', Mandatory)]
        [system.string]$BranchId,

        [Parameter(ParameterSetName = 'BranchName', Mandatory)]
        $BranchName,
        [system.string]$LocationId,
        [system.string]$DepartmentId,
        [system.string]$BudgetHolderId,
        [boolean]$LoginPermission,
        [system.string]$LoginName,
        [securestring]$Password,
        [boolean]$Installer,
        [boolean]$FirstLineCallOperator,
        [boolean]$SecondLineCallOperator,
        [boolean]$ProblemManager,
        [boolean]$ProblemOperator,
        [boolean]$ChangeCoordinator,
        [boolean]$RequestForChangeOperator,
        [boolean]$ExtensiveChangeOperator,
        [boolean]$SimpleChangeOperator,
        [boolean]$ScenarioManager,
        [boolean]$PlanningActivityManager,
        [boolean]$ProjectCoordinator,
        [boolean]$ProjectActivitiesOperator,
        [boolean]$StockManager,
        [boolean]$ReservationsOperator,
        [boolean]$ServiceOperator,
        [boolean]$ExternalHelpDeskParty,
        [boolean]$ContractManager,
        [boolean]$OperationsOperator,
        [boolean]$OperationsManager,
        [boolean]$KnowledgeBaseManager,
        [boolean]$AccountManager
    )
    
    begin {
    }
    
    process {
    }
    
    end {
    }
}