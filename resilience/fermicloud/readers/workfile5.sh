#!/bin/bash
SOURCES="\
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/277/data_00-86-7-2016_01_25_15.30.11.972906962-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/277/data_00-29-10-2016_01_28_13.55.26.106186773-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/250/data_00-142-7-2016_03_17_19.05.32.767700929-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/250/data_00-3-8-2016_01_28_13.43.30.204491661-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/250/data_00-76-6-2016_01_28_20.45.26.791937670-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/250/data_00-98-2-2016_01_25_16.57.53.971752225-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/250/data_00-84-10-2016_01_28_18.06.52.821442005-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/021/data_00-70-4-2016_01_25_16.53.11.366127810-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/021/data_00-7-1-2016_01_21_19.19.54.147447736-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/211/data_00-69-8-2016_01_21_18.05.26.048605854-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/211/data_00-92-9-2016_01_25_21.04.55.484863427-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/211/data_00-74-8-2016_01_21_18.41.32.355137677-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/229/data_00-72-7-2016_01_25_16.42.32.928331639-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/229/data_00-41-5-2016_01_28_13.07.04.073461665-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/247/data_00-14-8-2016_03_16_22.49.09.939794649-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/247/data_00-38-7-2016_01_21_13.59.38.901513681-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/247/data_00-85-7-2016_01_21_22.19.25.342513488-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/247/data_00-69-3-2016_01_21_22.56.02.437914448-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/247/data_00-53-8-2016_01_21_18.13.50.005109620-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/247/data_00-24-2-2016_01_28_13.01.58.120541161-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/055/data_00-87-2-2016_01_25_13.59.49.384146017-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/055/data_00-38-1-2016_01_21_18.22.03.163188510-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/055/data_00-64-7-2016_01_25_22.37.50.972644239-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/029/data_00-9-3-2016_03_16_23.20.04.904874799-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/029/data_00-94-6-2016_01_25_23.38.42.237862776-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/029/data_00-72-9-2016_01_21_19.04.06.831243058-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/029/data_00-85-4-2016_01_28_12.29.33.876415924-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/029/data_00-91-3-2016_01_25_14.16.01.085788207-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/029/data_00-82-7-2016_01_28_18.33.20.643050579-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/266/data_00-58-3-2016_01_28_12.06.10.597376846-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/266/data_00-36-2-2016_01_21_22.23.45.446496968-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-23-9-2016_03_16_15.36.05.013445956-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-56-7-2016_03_16_18.30.31.656914046-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-145-7-2016_03_16_20.31.37.401359971-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-13-8-2016_03_16_23.29.19.843645762-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-61-1-2016_03_17_20.07.31.464628301-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-91-3-2016_01_21_17.04.16.002859279-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-70-5-2016_01_21_14.11.10.452071964-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-17-7-2016_01_29_09.02.34.945144698-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-13-7-2016_01_21_16.01.20.182525972-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-61-10-2016_01_21_14.14.44.516378371-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-55-2-2016_01_28_20.57.38.014061036-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-71-10-2016_01_28_13.17.23.594395530-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-48-10-2016_01_25_20.32.29.894590716-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-48-5-2016_01_25_11.26.44.423428415-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-53-8-2016_01_21_21.11.26.538634217-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-19-5-2016_01_21_18.45.23.064794721-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-63-1-2016_01_21_23.12.59.874234829-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-77-2-2016_01_21_19.04.57.457461872-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-78-8-2016_01_25_11.54.49.042587354-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-55-3-2016_01_21_13.32.52.759731138-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-13-1-2016_01_28_11.50.52.955292739-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-36-10-2016_01_25_15.31.12.029792715-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-34-9-2016_01_28_13.31.58.918258778-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-31-5-2016_01_28_12.33.20.966765457-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-98-10-2016_01_25_21.21.05.015149462-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/221/data_00-40-7-2016_01_25_21.43.59.818516519-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/042/data_00-77-10-2016_01_21_16.24.24.436917046-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/042/data_00-82-1-2016_01_28_16.11.56.954646188-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/085/data_00-80-6-2016_01_25_14.28.46.211242119-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/085/data_00-77-7-2016_01_28_19.21.57.138583028-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-85-10-2016_03_16_18.18.47.917413251-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-12-1-2016_03_16_22.18.44.425962764-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-67-7-2016_01_28_15.28.37.654932540-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-78-5-2016_01_21_18.46.19.606821482-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-17-8-2016_01_21_17.53.09.862935817-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-43-5-2016_01_25_13.33.42.415345239-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-71-7-2016_01_25_12.02.10.640013067-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-60-1-2016_01_25_17.02.38.709436854-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-27-10-2016_01_21_13.36.35.999909001-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-32-7-2016_01_28_10.39.01.894835537-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-46-4-2016_01_25_15.56.55.714519552-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-86-8-2016_01_21_15.37.47.867190841-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-39-9-2016_01_21_22.57.12.588696379-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-33-3-2016_01_21_16.23.18.905194298-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/166/data_00-67-5-2016_01_21_17.14.55.422588363-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/014/data_00-97-2-2016_01_28_17.15.17.247695672-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/014/data_00-73-2-2016_01_28_23.43.56.344809253-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/014/data_00-91-10-2016_01_21_16.54.07.497616758-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/168/data_00-1-5-2016_03_16_21.33.09.221208356-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/168/data_00-36-3-2016_01_21_22.32.28.590029181-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/168/data_00-53-1-2016_01_25_12.09.12.268293937-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/168/data_00-36-4-2016_01_28_09.11.17.878945715-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/168/data_00-77-8-2016_01_25_15.53.10.025704319-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/168/data_00-61-6-2016_01_28_15.34.26.712455500-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/168/data_00-90-9-2016_01_29_02.19.34.048186545-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/065/data_00-64-7-2016_01_25_21.55.38.803748054-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/065/data_00-44-9-2016_01_25_15.40.55.444836451-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-89-8-2016_03_21_13.01.44.560803899-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-89-1-2016_03_16_16.23.58.083802564-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-30-1-2016_03_16_18.27.27.070929368-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-86-1-2016_03_16_19.54.04.060942703-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-126-8-2016_03_16_21.19.19.551871391-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-12-6-2016_03_16_23.33.04.913602937-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-138-6-2016_03_17_18.50.08.905134399-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-72-3-2016_01_25_21.20.39.844125328-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-98-3-2016_01_28_19.57.31.623897824-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-59-1-2016_01_21_23.42.00.357152085-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-52-3-2016_01_25_19.42.48.746484936-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-78-1-2016_01_28_11.24.45.372875855-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-65-1-2016_01_25_22.06.04.385746714-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-78-8-2016_01_28_17.49.48.752114019-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-89-1-2016_01_28_17.52.18.053219690-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-77-7-2016_01_21_19.40.05.093729341-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-77-8-2016_01_25_22.01.01.737761481-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-55-3-2016_01_25_22.21.22.890189245-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-74-1-2016_01_28_18.01.31.189195125-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-45-10-2016_01_21_16.26.42.855815408-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-59-7-2016_01_25_12.23.53.034390264-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-78-1-2016_01_28_18.46.44.043632914-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-26-7-2016_01_21_16.32.38.474815169-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-82-10-2016_01_25_12.33.11.652862493-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-31-4-2016_01_28_14.13.24.923948462-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-1-6-2016_01_21_15.03.55.544993197-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-42-1-2016_01_21_17.05.55.932296825-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-84-6-2016_01_25_13.04.54.495258478-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-55-6-2016_01_25_19.56.39.899795277-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-92-3-2016_01_28_18.14.21.480690904-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-67-8-2016_01_28_22.33.51.173593629-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-69-3-2016_01_21_22.55.07.672016655-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-78-7-2016_01_25_13.39.29.784766174-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-95-9-2016_01_25_22.04.52.139314913-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-3-7-2016_01_28_08.28.35.874821749-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-99-2-2016_01_21_14.53.54.169256117-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/283/data_00-72-7-2016_01_21_19.39.57.714642332-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-26-10-2016_03_16_17.38.49.922294100-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-5-2-2016_03_16_21.57.50.609330589-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-9-9-2016_01_21_20.36.04.778985417-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-56-10-2016_01_28_16.35.44.192987832-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-95-3-2016_01_25_20.26.46.384581867-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-47-8-2016_01_28_10.29.42.485568101-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-55-6-2016_01_25_18.15.04.763616284-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-72-2-2016_01_28_14.04.14.056056172-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-72-4-2016_01_28_22.27.25.423849780-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-7-4-2016_01_21_13.46.52.162768506-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-97-7-2016_01_22_01.41.10.837679294-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-52-2-2016_01_25_17.47.21.732062439-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-10-3-2016_01_28_08.33.40.713072242-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/263/data_00-85-6-2016_01_28_11.27.22.014869850-dcap \
"

DCCP=`which dccp`
for f in ${SOURCES}
do
    ${DCCP} ${f} /dev/null
done
