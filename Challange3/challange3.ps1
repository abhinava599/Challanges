function Get-NestedValue {
    param (
        [Parameter(Mandatory = $true)]
        [hashtable]$Object,

        [Parameter(Mandatory = $true)]
        [string]$Key
    )

    # Split the key by the '/' delimiter
    $keys = $Key -split '/'

    # Initialize current object reference
    $current = $Object

    foreach ($key in $keys) {
        if ($current -is [hashtable] -and $current.ContainsKey($key)) {
            $current = $current[$key]
        } else {
            Write-Error "Key path '$Key' not found."
            return $null
        }
    }

    return $current
}