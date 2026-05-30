# Air Filtration Idle Control

IC10 script to automatically switch a `StructureFiltration` (Air Filtration unit) between **Idle** and **Active** mode based on the presence of two specific gases detected by a pipe gas analyzer.

## Features

- Monitors any two gases from the full list of Stationeers gases.
- Gases are easily configurable at the top of the script.
- Only activates the air filtration when **both** selected gases are detected above a set threshold.
- Keeps the unit in Idle mode when the target gases are not present (energy saving).
- Clear and safe logic.

## Required Devices & Labels

| Device                    | Prefab                  | Recommended Label      | Purpose |
|---------------------------|-------------------------|------------------------|---------|
| Air Filtration Unit       | `StructureFiltration`   | `AIR_FILTRATION`       | The machine to control |
| Pipe Gas Analyzer         | `StructurePipeAnalysizer` | `PIPE_ANALYZER`      | Analyzes gas in the pipe/network |

## Setup Instructions

1. Place an IC10 chip programmed with this script into any IC socket.
2. Label your **Air Filtration** unit `AIR_FILTRATION`.
3. Label your **Pipe Gas Analyzer** `PIPE_ANALYZER` (place it on the pipe or network you want to monitor).
4. Edit the top of the script to choose which two gases to monitor (see list below).
5. Optionally adjust the `THRESHOLD` value (default is 5%).

## Available Gases (Latest Stationeers)

Edit these values in the script:

```ic10
define GAS1 "RatioOxygen"
define GAS2 "RatioVolatiles"
```

Full list of common gas ratios:

- `RatioOxygen`
- `RatioNitrogen`
- `RatioCarbonDioxide`
- `RatioVolatiles`
- `RatioPollutant`
- `RatioWater`
- `RatioNitrousOxide`
- `RatioHydrogen` (if available)

## How It Works

1. The script continuously reads the two chosen gas ratios from the `PIPE_ANALYZER`.
2. If **both** gases are above the `THRESHOLD` → sets the `AIR_FILTRATION` to **Active** mode.
3. If one or both gases fall below the threshold → sets the filtration unit to **Idle** mode.

This is useful for:
- Only running expensive air filtration when specific contaminants or desired gases are actually present.
- Preventing unnecessary power consumption when the air is already clean.

## Configuration Options

At the top of `AIR_FILTRATION_IDLE.ic10`:

```ic10
define GAS1 "RatioOxygen"
define GAS2 "RatioVolatiles"
define THRESHOLD 0.05              # 5% minimum concentration
```

You can change `THRESHOLD` to a higher value (e.g. `0.10` for 10%) if you want more strict detection.

## Notes & Tips

- Make sure your Gas Analyzer has a clear view of the pipe gas (proper pipe connection).
- The script uses the `Mode` property. If your version of Stationeers uses a different property (e.g. `On` or `Setting`), you can easily change the `s` instructions in the script.
- Works with one IC10 chip.
- Safe to run continuously.

## Author

Created for Orffyrus's Stationeers collection.

## Related Scripts

- `AC_HEATER` – Smart heater control based on AC mode
- `ATMO_MATRIX` – Atmosphere control system
- `CO2_ROOM_CONTROL` – CO2 management
