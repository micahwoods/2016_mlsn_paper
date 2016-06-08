### GSS data

The `GSS_14082301.csv` file is n = 78 and is GSS data up to 23 August 2014. These are the GSS data used for the update of MLSN guidelines and CSSA abstract. These data are n = 41 after cutting.

### ATC data

`zembu.bl2` is ATC soil test data from Asia until Feb 2013, not cleaned

`atc_additions.csv` is ATC soil test data from mid-February 2013 through July 2014

In the scripts, the `zembu.bl2` and `atc_additions.csv` data are combined, then the topdressing, experimental, and bad samples are removed

For ATC, n = 3101 before cutting by pH >= 5.5, pH <= 8.5, and TEC <= 6 cmol/kg (60 mmol/kg), and n = 1474 after cutting.

### PACE data

`pace_clean_14082301.csv` is all the PACE data, uncut, with topdressing, experimental, and bad removed

PACE data are n = 13,062, and then after cut are 2209

###  Combined

`2014_MLSN.csv` is n = 3721 file from Larry already cut at pH >= 5.5, pH <= 8.5, and TEC <= 6. I moved that to an archive folder outside of this repository. It includes ATC, GSS, and PACE data. This file can be used to generate the MLSN guidelines that were calculated in August 2014. However, my preference is to work with the uncut files, across all pH and TEC ranges, cleaned only to remove bad, topdressing, experimental, and such samples, using scripts to explicitly generate the final cleaned and filtered vectors. Note that n = 3724 for the process working with uncut files. The MLSN calculated values are the same.