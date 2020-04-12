#!/bin/bash
SOURCES="\
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/019/data_00-49-6-2016_01_25_20.41.28.220938426-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/019/data_00-76-10-2016_01_28_18.41.45.880094775-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/015/data_00-146-5-2016_03_17_19.07.32.163075635-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/015/data_00-93-8-2016_01_28_19.13.00.441507010-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/015/data_00-5-1-2016_01_22_00.09.02.650342699-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/015/data_00-50-5-2016_01_25_16.43.29.341228637-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/015/data_00-77-5-2016_01_25_14.49.34.415714068-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/203/data_00-52-10-2016_03_18_13.16.12.852537261-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/203/data_00-82-2-2016_01_28_15.28.14.134863038-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/203/data_00-72-3-2016_01_25_21.00.40.745070063-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/203/data_00-2-8-2016_01_21_15.01.44.812900992-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/203/data_00-89-5-2016_01_25_16.03.16.982284251-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/056/data_00-64-2-2016_01_28_11.34.36.061122281-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/056/data_00-44-7-2016_01_25_14.17.10.560821619-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/292/data_00-58-8-2016_01_21_19.54.39.545745786-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/292/data_00-63-2-2016_01_21_19.27.47.807173723-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/292/data_00-86-7-2016_01_25_12.56.08.336707019-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/191/data_00-93-2-2016_01_28_16.16.35.569382175-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/191/data_00-55-10-2016_01_28_23.04.58.528164967-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/296/data_00-14-4-2016_03_16_23.16.27.262735915-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/296/data_00-69-6-2016_01_21_14.49.33.658641558-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/296/data_00-99-4-2016_01_21_23.44.57.122026941-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/296/data_00-15-9-2016_01_21_19.20.48.265427132-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/296/data_00-41-7-2016_01_25_15.01.04.962229787-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/296/data_00-46-3-2016_01_21_17.59.02.775384720-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/241/data_00-82-3-2016_01_28_23.34.19.461413997-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/241/data_00-82-9-2016_01_28_20.34.06.294189841-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/241/data_00-93-8-2016_01_28_13.42.38.694875410-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/241/data_00-8-2-2016_01_21_13.15.03.415566425-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/282/data_00-47-8-2016_01_25_16.03.36.600103760-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/282/data_00-50-3-2016_01_28_09.18.49.186272219-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/188/data_00-84-8-2016_01_21_18.15.08.833666810-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/188/data_00-9-3-2016_01_28_12.09.21.662501934-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/049/data_00-49-8-2016_01_25_21.07.43.057149951-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/049/data_00-4-3-2016_01_21_18.52.12.616436382-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/213/data_00-139-6-2016_03_16_20.53.22.617447135-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/213/data_00-68-2-2016_01_25_13.00.58.776177360-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/213/data_00-52-3-2016_01_25_21.24.16.779151400-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/213/data_00-63-6-2016_01_28_14.40.25.800452195-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/213/data_00-93-1-2016_01_25_22.02.22.920309739-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/213/data_00-32-5-2016_01_21_19.10.08.780703937-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/213/data_00-72-8-2016_01_28_18.08.20.832868328-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/213/data_00-53-2-2016_01_25_16.20.54.725894125-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/096/data_00-80-3-2016_01_22_01.15.40.753782321-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/096/data_00-59-1-2016_01_25_12.08.55.434502992-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/096/data_00-88-4-2016_01_21_16.59.26.948719747-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/035/data_00-22-6-2016_01_21_14.03.03.893911378-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/035/data_00-0-1-2016_01_21_21.15.54.232422748-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/020/data_00-128-9-2016_03_16_20.25.27.759453259-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/020/data_00-74-5-2016_01_21_17.05.27.173328216-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/020/data_00-75-8-2016_01_21_14.24.27.029811356-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/020/data_00-47-2-2016_01_25_15.20.58.691559592-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/020/data_00-55-7-2016_01_25_19.56.22.321687529-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/020/data_00-51-10-2016_01_21_18.00.22.274060681-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/020/data_00-17-9-2016_01_28_11.56.23.524465284-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/020/data_00-16-9-2016_01_28_08.28.26.394442451-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/183/data_00-32-10-2016_01_28_11.58.09.061466841-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/183/data_00-15-5-2016_01_21_20.03.05.601801964-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/044/data_00-98-2-2016_03_16_18.57.47.131540517-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/044/data_00-47-2-2016_03_17_17.36.25.058656960-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/044/data_00-71-2-2016_01_25_15.25.55.917050114-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/044/data_00-78-2-2016_01_25_20.37.33.628044721-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/044/data_00-93-1-2016_01_21_22.05.36.923728505-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/044/data_00-35-5-2016_01_21_20.52.48.761683782-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/044/data_00-3-6-2016_01_28_13.40.03.125245720-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/044/data_00-43-4-2016_01_25_20.11.00.168526747-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/044/data_00-78-9-2016_01_21_16.30.27.995262190-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/044/data_00-70-8-2016_01_25_12.35.31.709850979-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/044/data_00-6-8-2016_01_28_11.47.18.734290316-dcap \
"

DCCP=`which dccp`
for f in ${SOURCES}
do
    ${DCCP} ${f} /dev/null
done
