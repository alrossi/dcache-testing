#!/bin/bash
SOURCES="\
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/194/data_00-91-1-2016_03_17_17.22.13.415610468-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/194/data_00-89-9-2016_01_28_16.28.54.808680095-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/194/data_00-32-4-2016_01_21_13.28.13.540929500-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/194/data_00-14-6-2016_01_28_09.16.47.950924823-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/194/data_00-14-7-2016_01_28_14.26.02.964768778-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/194/data_00-93-6-2016_01_25_19.44.39.535442083-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/298/data_00-11-5-2016_03_17_16.12.35.314732825-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/298/data_00-63-8-2016_01_25_12.01.04.134475571-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/298/data_00-90-2-2016_01_25_16.11.26.344118391-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/298/data_00-75-3-2016_01_21_22.18.57.737087311-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/298/data_00-70-4-2016_01_28_17.12.33.125798402-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/298/data_00-72-8-2016_01_25_21.56.32.507491385-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-25-5-2016_03_21_12.42.28.114268864-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-5-3-2016_03_16_15.28.27.866492542-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-12-3-2016_03_16_16.49.21.888737420-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-102-8-2016_03_16_18.17.15.807583676-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-50-8-2016_03_16_19.20.16.381942034-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-45-1-2016_03_16_20.20.19.869582619-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-1-9-2016_03_16_21.37.39.093584047-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-9-4-2016_03_16_23.02.31.845446573-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-98-10-2016_03_17_17.08.22.381990779-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-52-1-2016_03_17_19.36.21.247374521-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-36-4-2016_01_21_19.05.36.125291162-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-99-1-2016_01_21_20.40.41.275017431-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-1-7-2016_01_21_15.36.05.534389309-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-76-3-2016_01_28_21.38.16.224140359-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-75-9-2016_01_28_17.16.36.007130407-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-15-1-2016_01_28_11.02.18.255673300-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-78-2-2016_01_28_21.29.03.551839074-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-22-7-2016_01_29_09.38.39.561625137-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-74-3-2016_01_21_17.04.08.407614357-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-99-8-2016_01_28_21.04.11.474142701-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-78-8-2016_01_28_19.01.15.785946456-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-45-10-2016_01_28_14.24.58.800749971-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-85-10-2016_01_25_22.54.20.012777928-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-82-2-2016_01_28_11.52.35.295807691-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-51-5-2016_01_25_16.22.08.041883432-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-41-6-2016_01_25_22.21.52.156559697-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-77-3-2016_01_25_16.03.13.198248725-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-99-3-2016_01_28_10.56.33.844805763-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-85-8-2016_01_25_17.48.42.402997946-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-82-8-2016_01_25_17.53.21.304249714-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-78-7-2016_01_25_20.47.45.167812868-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-75-10-2016_01_25_19.45.09.753581960-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-32-3-2016_01_25_22.16.05.315300881-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-98-2-2016_01_28_17.10.02.555243320-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-92-6-2016_01_28_20.15.45.168517791-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-22-1-2016_01_21_13.25.04.509255115-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-99-7-2016_01_28_20.21.46.749955531-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-89-8-2016_01_28_18.36.08.714039935-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-46-9-2016_01_28_09.38.31.920075874-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-71-4-2016_01_25_19.42.57.086675632-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-41-6-2016_01_28_13.46.54.051239587-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-45-9-2016_01_28_14.20.47.609843056-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-47-5-2016_01_28_14.21.44.320170986-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-56-3-2016_01_28_14.09.08.325738141-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-58-1-2016_01_28_12.36.06.560551727-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-21-2-2016_01_28_08.51.16.750136895-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-36-8-2016_01_25_15.27.26.133085714-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-60-4-2016_01_22_01.05.09.743131381-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-79-8-2016_01_21_19.47.31.176287600-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-71-2-2016_01_21_15.52.32.040993480-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-25-10-2016_01_21_13.13.22.966669427-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-76-9-2016_01_28_18.25.47.989050165-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/040/data_00-90-10-2016_01_28_12.57.32.167333500-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/181/data_00-76-10-2016_01_25_14.05.39.492107329-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/181/data_00-91-9-2016_01_21_22.11.29.467491938-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/286/data_00-65-9-2016_01_25_12.41.47.861670802-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/286/data_00-99-3-2016_01_28_20.49.34.893178207-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/179/data_00-8-4-2016_01_21_22.03.06.856555443-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/179/data_00-18-4-2016_01_21_16.20.53.455388114-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/179/data_00-54-7-2016_01_21_21.13.25.402324336-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/179/data_00-58-9-2016_01_21_16.45.27.004569199-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/128/data_00-77-8-2016_01_28_22.43.32.170179718-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/128/data_00-24-7-2016_01_21_19.27.42.465923063-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/105/data_00-45-2-2016_01_21_21.01.43.065832976-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/105/data_00-91-6-2016_01_25_16.30.10.682092134-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/105/data_00-88-7-2016_01_25_12.35.07.984914121-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/005/data_00-83-10-2016_01_25_21.06.32.161663944-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/005/data_00-55-3-2016_01_25_14.46.32.518212561-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/025/data_00-88-2-2016_01_22_01.34.42.005783811-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/025/data_00-91-6-2016_01_25_14.40.50.026579777-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/025/data_00-92-4-2016_01_28_17.56.38.452816403-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/234/data_00-37-3-2016_01_22_00.49.13.216376658-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/234/data_00-86-8-2016_01_21_21.16.13.737896807-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/155/data_00-25-1-2016_01_21_20.37.08.854743420-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/155/data_00-17-8-2016_01_21_19.09.28.574282916-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/027/data_00-22-3-2016_01_29_10.32.25.211613151-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/027/data_00-93-9-2016_01_21_22.26.13.746035200-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/027/data_00-37-6-2016_01_25_19.55.20.784671392-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/086/data_00-54-5-2016_01_25_15.00.48.869753827-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/086/data_00-69-5-2016_01_28_18.01.58.391173461-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/039/data_00-138-7-2016_03_16_20.42.44.063329157-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/039/data_00-90-2-2016_01_25_20.48.58.033511102-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/039/data_00-58-7-2016_01_22_01.22.00.123631225-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/039/data_00-88-10-2016_01_25_17.37.49.515892381-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/039/data_00-51-3-2016_01_28_21.11.39.488026761-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/039/data_00-54-2-2016_01_21_18.40.28.480188648-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/039/data_00-41-8-2016_01_21_13.51.41.605944311-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/039/data_00-37-5-2016_01_21_14.02.30.838634821-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/074/data_00-76-5-2016_01_25_12.48.25.468391507-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/074/data_00-43-2-2016_01_21_20.39.13.150385133-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/074/data_00-87-10-2016_01_28_19.15.40.861834448-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/138/data_00-29-8-2016_03_17_16.58.31.866933565-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/138/data_00-80-6-2016_01_21_17.08.12.052447666-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/138/data_00-75-7-2016_01_21_17.29.59.492222072-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/138/data_00-98-6-2016_01_28_21.40.04.183948042-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/138/data_00-47-7-2016_01_25_14.52.27.946544030-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/138/data_00-72-5-2016_01_25_16.16.36.457849137-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/068/data_00-40-1-2016_01_21_14.21.08.239343917-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/068/data_00-59-9-2016_01_22_00.32.58.624371310-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/068/data_00-84-8-2016_01_28_20.16.15.828721930-dcap \
"

DCCP=`which dccp`
for f in ${SOURCES}
do
    ${DCCP} ${f} /dev/null
done
