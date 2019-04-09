@{
    # Script module or binary module file associated with this manifest
    RootModule = 'TOPdeskPS.psm1'

    # Version number of this module.
    ModuleVersion = '0.1.3'


    # ID used to uniquely identify this module
    GUID = '3c6f28d6-772c-4325-8236-d4bc99373aa9'

    # Author of this module
    Author = 'Andrew Pla'

    # Company or vendor of this module
    CompanyName = ''

    # Copyright statement for this module
    Copyright = 'Copyright (c) 2018 Andrew Pla'

    # Description of the functionality provided by this module
    Description = 'Module to interact with the TOPdesk API. Interact with changes, incidents, assets, supporting files, notifications and more.'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.0'

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of the .NET Framework required by this module
    # DotNetFrameworkVersion = '2.0'

    # Minimum version of the common language runtime (CLR) required by this module
    # CLRVersion = '2.0.50727'

    # Processor architecture (None, X86, Amd64, IA64) required by this module
    # ProcessorArchitecture = 'None'

    # Modules that must be imported into the global environment prior to importing
    # this module
    RequiredModules = @(
        @{
            ModuleName = 'PSFramework'; ModuleVersion = '0.10.27.128'
        }
    )

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to
    # importing this module
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    #TypesToProcess = @('xml\TOPdeskPS.Types.ps1xml')

    # Format files (.ps1xml) to be loaded when importing this module
    FormatsToProcess = @('xml\TOPdeskPS.Format.ps1xml')

    # Modules to import as nested modules of the module specified in
    # ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module
    FunctionsToExport = @('Add-TdAssetAssignment','Connect-TdService','Disconnect-TdService','Get-TdApiVersion','Get-TdArchiveReason','Get-TdAsset','Get-TdAssetAssignment','Get-TdAssetCapability','Get-TdAssetCapabilityDetail','Get-TdAssetDetail','Get-TdAssetField','Get-TdAssetFieldValue','Get-TdAssetFile','Get-TdAssetLink','Get-TdAssetLinkPossibleRelation','Get-TdAssetTemplate','Get-TdAssetTemplateBlank','Get-TdBranch','Get-TdBranchDetail','Get-TdBranchFilter','Get-TdBudgetHolder','Get-TdCallType','Get-TdCategory','Get-TdCategoryFilter','Get-TdChange','Get-TdChangeActivity','Get-TdChangeCalendar','Get-TdChangeCalendarDetail','Get-TdChangeCalendarProgress','Get-TdChangeCalendarRequest','Get-TdChangeDetail','Get-TdChangeProgress','Get-TdChangeRequest','Get-TdChangeTemplate','Get-TdClosureCode','Get-TdCountry','Get-TdDeescalationReason','Get-TdDepartment','Get-TdDuration','Get-TdEntryType','Get-TdEscalationReason','Get-TdImpact','Get-TdIncident','Get-TdIncidentAction','Get-TdIncidentTimeSpent','Get-TdKnowledgeItem','Get-TdLocation','Get-TdLocationDetail','Get-TdLoggedInOperator','Get-TdLoggedInPerson','Get-TdOperator','Get-TdOperatorAvatar','Get-TdOperatorFilter','Get-TdOperatorGroup','Get-TdOperatorGroupMember','Get-TdPermissionGroup','Get-TdPerson','Get-TdPersonAvatar','Get-TdPersonGroup','Get-TdPriority','Get-TdProcessingStatus','Get-TdServiceWindow','Get-TdSubcategory','Get-TdSupplier','Get-TdSupplierContact','Get-TdTimeSpentReason','Get-TdUrgency','Get-TdUrl','Invoke-TdMethod','New-TdAsset','New-TdAssetCapability','New-TdBranch','New-TdBudgetHolder','New-TdChange','New-TdChangeAction','New-TdChangeProgress','New-TdDepartment','New-TdIncident','New-TdOperator','New-TdOperatorGroup','New-TdPerson','Remove-TdAsset','Remove-TdAssetAssignment','Remove-TdAssetFile','Remove-TdAssetLink','Send-TdAssetFile','Send-TdAssetImportFile','Send-TdChangeActivityFile','Send-TdChangeFile','Send-TdIncidentFile','Send-TdNotification','Send-TdWebDAVFile','Set-TdAsset','Set-TdAssetCapability','Set-TdAssetLink','Set-TdBranch','Set-TdChange','Set-TdChangeActivity','Set-TdChangeProcessingStatus','Set-TdIncident','Set-TdIncidentTimeSpent','Set-TdOperator','Set-TdOperatorBranchFilter','Set-TdOperatorCategoryFilter','Set-TdOperatorGroup','Set-TdOperatorOperatorFilter','Set-TdOperatorOperatorGroup','Set-TdOperatorPermissionGroup','Set-TdPerson')

    # Cmdlets to export from this module
    CmdletsToExport = ''

    # Variables to export from this module
    VariablesToExport = ''

    # Aliases to export from this module
    AliasesToExport = ''

    # List of all modules packaged with this module
    ModuleList = @()

    # List of all files packaged with this module
    FileList = @()

    # Private data to pass to the module specified in ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{

        #Support for PowerShellGet galleries.
        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @('TOPdesk', 'API')

            # A URL to the license for this module.
            LicenseUri = 'https://github.com/AndrewPla/TOPdeskPS/blob/master/LICENSE.md'

            # A URL to the main website for this project.
            ProjectUri = 'https://andrewpla.github.io/TOPdeskPS'

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            ReleaseNotes = 'https://github.com/AndrewPla/TOPdeskPS/blob/master/CHANGELOG.md'

        } # End of PSData hashtable

    } # End of PrivateData hashtable
}


