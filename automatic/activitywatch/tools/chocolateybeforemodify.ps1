# Close ActivityWatch before it is upgraded or uninstalled.
# aw-qt starts aw-server and the watchers as separate processes, and stopping
# aw-qt alone leaves them running with their files locked, so stop every aw-*
# process running from this package's folder. Matching on the path leaves any
# aw-* program that is not part of this package alone.
$toolsDir   = Split-Path -Parent $MyInvocation.MyCommand.Definition
$installDir = (Join-Path $toolsDir 'activitywatch').TrimEnd('\') + '\'

Get-Process aw-* -ErrorAction SilentlyContinue |
  Where-Object { $_.Path -and $_.Path.StartsWith($installDir, [StringComparison]::OrdinalIgnoreCase) } |
  Stop-Process -Force -PassThru |
  Wait-Process -Timeout 10 -ErrorAction SilentlyContinue
