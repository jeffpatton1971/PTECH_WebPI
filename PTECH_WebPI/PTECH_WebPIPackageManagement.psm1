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

		$useCachedValue = $false;

		Write-Verbose "Incoming Param Title      : $($Title)";
		Write-Verbose "Incoming Param Ensure     : $($Ensure)";

		$EnsurePresent = 'Absent';
		$Package = Get-WebPiProduct -Title $Title;
		$IsInstalled = $Package.IsInstalled($useCachedValue);

		switch ($Ensure)
		{
			'Absent'
			{
				#
				# Package must not be installed
				#
				if ($IsInstalled)
				{
					$EnsurePresent = 'Present';
				}
				else
				{
					$EnsurePresent = 'Absent';
				}
			}
			'Present'
			{
				#
				# Package must be installed
				#
				if ($IsInstalled)
				{
					$EnsurePresent = 'Present';
				}
				else
				{
					$EnsurePresent = 'Absent';
				}
			}
		}

		$returnValue = @{
			Title = $Title
			Ensure = $EnsurePresent
		};

		return $returnValue;
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

		$useCachedValue = $false;

		Write-Verbose "Incoming Param Title      : $($Title)";
		Write-Verbose "Incoming Param LanguageId : $($LanguageId)";
		Write-Verbose "Incoming Param Ensure     : $($Ensure)";

		$Product = Get-WebPiProduct -Title $Title;

		switch ($Ensure)
		{
			'Absent'
			{

			}
			'Present'
			{
				$Package = Install-WebPiProduct -Product $Product -LanguageID $LanguageId;
			}
		}
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

		$useCachedValue = $false;

		Write-Verbose "Incoming Param Title      : $($Title)";
		Write-Verbose "Incoming Param Ensure     : $($Ensure)";

		$Package = Get-WebPiProduct -Title $Title;
		
		return $Package.IsInstalled($useCachedValue);

	}
	catch
	{
		throw $_;
	}
}