function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[ValidateNotNullOrEmpty()]
		[string]$Title,

		[ValidateSet("Present","Absent")]
		[string]$Ensure
	)

	try
	{
		$ErrorActionPreference = 'Stop';
		$Error.Clear();

		Write-Verbose "Incoming Param Title      : $($Title)"
		Write-Verbose "Incoming Param Ensure     : $($Ensure)"
	}
	catch
	{
		throw $_;
	}
}

function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[ValidateNotNullOrEmpty()]
		[string]$Title,

		[parameter(Mandatory = $true)]
		[ValidateSet('en','fr','es','de','it','ja','ko','ru','zh-cn','zh-tw','cs','pl','tr','pt-br','he','zh-hk','pt-pt')]
		[string]$LanguageId,

		[ValidateSet("Present","Absent")]
		[string]$Ensure
	)

	try
	{
		$ErrorActionPreference = 'Stop';
		$Error.Clear();

		Write-Verbose "Incoming Param Title      : $($Title)"
		Write-Verbose "Incoming Param LanguageId : $($LanguageId)"
		Write-Verbose "Incoming Param Ensure     : $($Ensure)"
	}
	catch
	{
		throw $_;
	}
}

function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[ValidateNotNullOrEmpty()]
		[string]$Title,

		[ValidateSet("Present","Absent")]
		[string]$Ensure
	)

	try
	{
		$ErrorActionPreference = 'Stop';
		$Error.Clear();

		Write-Verbose "Incoming Param Title      : $($Title)"
		Write-Verbose "Incoming Param Ensure     : $($Ensure)"
	}
	catch
	{
		throw $_;
	}
}