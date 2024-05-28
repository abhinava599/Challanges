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

# Example usage
$object1 = @{ "a" = @{ "b" = @{ "c" = "d" } } }
$key1 = "a/b/c"
$value1 = Get-NestedValue -Object $object1 -Key $key1
Write-Output $value1  # Output: d

$object2 = @{ "x" = @{ "y" = @{ "z" = "a" } } }
$key2 = "x/y/z"
$value2 = Get-NestedValue -Object $object2 -Key $key2
Write-Output $value2  # Output: a