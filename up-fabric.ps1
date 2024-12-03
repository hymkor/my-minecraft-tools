# Update mod-profile for fabric-mods of minecraft

# How to setup fabric-installer-1.0.1.exe
#   open https://fabricmc.net/use/installer/
#   and click `Download for Windows`
#
# How to setup ferium
#   scoop bucket add games
#   scoop install ferium

$gameversion = "1.21.4"
$profile = "v$gameversion"

function Step-Exec($command) {
    While ($true) {
        $ans = (Read-Host ("`r`n$ {0}`r`n[Y]es: execute, [N]o: skip, [Q]uit ?" -f $command))
        if ($ans -eq "q" ){
            exit 1
        }
        if ($ans -eq "n" ){
            return
        }
        if ($ans -eq "y" ){
            Invoke-Expression $command
            return
        }
    }
}

Step-Exec fabric-installer-1.0.1.exe

ferium.exe profile list

Step-Exec "ferium.exe profile create --mod-loader fabric --name $profile --game-version $gameversion"

# Fabric API from ChaosForge
Step-Exec "ferium.exe add 306612"

# FreeCam ( https://www.curseforge.com/minecraft/mc-mods/free-cam )
Step-Exec "ferium add 557076"

# FreeCam by Zergatul from ChaosForge
# Step-Exec "ferium.exe add 618947"

# Malilib from GitHub
Step-Exec "ferium.exe add sakura-ryoko/malilib"

# minihud from GitHub
Step-Exec "ferium.exe add sakura-ryoko/minihud"

# Mod Menu from modrinth ( https://modrinth.com/mod/modmenu/ )
Step-Exec "ferium.exe add mOgUt4GM"

Step-Exec "ferium.exe upgrade"
