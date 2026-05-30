# Air Filtration Idle Control

IC10 script to automatically switch a `StructureFiltration` (Air Filtration unit) between **Idle** and **Active** mode.

## Behavior

- Monitors up to 2 gases using their internal hashes.
- **Activates** the filtration unit if **at least one** of the two selected gases is detected above the threshold.
- Keeps the unit in **Idle** mode otherwise.

## Required Devices & Labels

| Device                    | Prefab                  | Recommended Label | Purpose |
|---------------------------|-------------------------|-------------------|---------|
| Air Filtration Unit       | `StructureFiltration`   | `AIR_FILTRATION`  | Unit to control |
| Pipe Gas Analyzer         | `StructurePipeAnalysizer` | `PIPE_ANALYZER` | Gas detection |

## Configuration

Edit only the top section of the `.ic10` file:

```ic10
define GAS_COUNT 2
define GAS1 HASH("GasOxygen")
define GAS2 HASH("GasVolatiles")
define THRESHOLD 0.05
define FILTRATION_LABEL "AIR_FILTRATION"
define ANALYZER_LABEL "PIPE_ANALYZER"
```

## Available Gas Hashes

```ic10
HASH("GasOxygen")
HASH("GasNitrogen")
HASH("GasCarbonDioxide")
HASH("GasVolatiles")
HASH("GasPollutant")
HASH("GasWater")
HASH("GasNitrousOxide")
HASH("GasHydrogen")
```

## How It Works

The script reads the amount of each selected gas from the analyzer using its hash.  
If the amount of **Gas 1** or **Gas 2** is above `THRESHOLD`, the filtration unit is set to Active mode.

## Notes

- Uses only gas hashes (no Ratio strings).
- Designed for the real limitation of the filtration unit (max 2 gases).
- Works with a single IC10 chip.
- The IC10 chip must be placed **directly inside** the StructureFiltration unit (it uses db). Do **not** place it in a separate IC10 housing.

## Author

Created for Orffyrus's Stationeers collection.

