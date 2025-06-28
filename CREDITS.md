# CREDITS

## Valorant Agents

The agent portraits, ability icons, role icons, ability names, etc. are downloaded from
[valorant-api][valorant_api_link]. The agents and their ability names that have relevant icons included by default is
available at [vsdat_ui/assets/agents/abilities_map.txt][abilities_map_txt_path].

VALORANT and all related assets are property of Riot Games.
This project is not endorsed by or affiliated with Riot Games in any way.

## Style Dynamics 2.0

The included Style Dynamics scoring of the agents are sourced from [Anderzz's streams][anderzz_twitch_link] or his
[YouTube videos][anderzz_youtube_link]. The UI for the Agents ability breakdown was also heavily influenced by mock UI
provided by Anderzz in his Discord server.

## Agent Combo Synergy

The Agent Combo Synergy stats are inspired by [val-synergies.pages.dev][valorant_synergies_link]. Do check them out if
you are mostly interested in the synergy win-rates at various levels of Valorant professional competitions.

## Matches CSVs

A collection of matches csv data sourced from [rib.gg][run_it_back_link] is included at
[assets\csv\matches][matches_csvs_path] after removing the columns irrelevant for the purposes of this app.

To obtain the matches data yourself, you can run these commands in the relevant channel of RIB.GG Discord server:

| Matches | Command | Notes |
| --- | --- | --- |
| 2023 Masters Tokyo and Champions.csv | `!rib matches -e 3169 3168 2929 2928 -csv` | |
| 2024 Game Changers and Ascension.csv | `!rib matches -e 5179 5094 5091 5049 5064 4994 4988 4987 -csv` | *Includes Game Changers Main Event, Ascension Group Stage and Playoffs for EMEA, Americas and Pacific, plus EMEA Play-Ins: Playoffs and Group Stage |
| 2024 July-December.csv | `!rib matches -start 2024-07-01 -end 2025-01-01 -csv` | |
| 2024 VCT Season.csv | `!rib matches -e 4993 4992 4810 4813 4817 4809 4812 4816 4745 4744 4390 4502 4416 4389 4415 4392 4307 4306 4293 4141 4292 4140 4137 4136 4139 4163 4135 -csv` | *Includes every Tier 1 match of VCT 2024 Season from EMEA, Americas and Pacific |
| 2025 Jan-April.csv | `!rib matches -start 2025-01-01 -end 2025-05-01 -csv` | |
| 2025 Kickoff and Masters Bangkok.csv | `!rib matches -e 5234 5226 5235 5352 5353 -csv` | *Includes matches from 2025 VCT Kickoff EMEA, Americas and Pacific, and Masters Bangkok |
| 2025 Masters Toronto.csv | `!rib matches -e 5685 5686 -csv` | |
| 2025 VCT Stage 1.csv | `!rib matches -e 5462 5468 5470 5607 5466 5594 -csv` | *Includes VCT Stage 1, 2025 matches for EMEA, Americas and Pacific |

Only the columns relating to headers: "Map Name", "Team 1 Name", "Team 2 Name", "Team 1 Score", "Team 2 Score",
"Team 1 Attacking Wins", "Team 2 Attacking Wins", "Team 1 Agents", and "Team 2 Agents" were kept to reduce the size of
csv files output from the above commands.

> [!NOTE]
> The VCT China matches are excluded because RIB.GG doesn't have the data for the CN region at this moment.

[valorant_api_link]: https://valorant-api.com/
[anderzz_twitch_link]: https://www.twitch.tv/anderzztv
[anderzz_youtube_link]: https://www.youtube.com/@AnderzzTV
[valorant_synergies_link]: https://val-synergies.pages.dev
[run_it_back_link]: https://www.rib.gg
[abilities_map_txt_path]: packages/vsdat_ui/assets/agents/abilities_map.txt
[matches_csvs_path]: assets/csv/matches/
