#!/bin/bash
SOURCES="\
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/141/data_00-93-3-2016_01_21_15.51.44.046428892-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/141/data_00-77-8-2016_01_25_23.32.59.891070972-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/101/data_00-64-2-2016_01_28_15.55.10.294848442-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/101/data_00-58-5-2016_01_28_08.33.28.769984392-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/180/data_00-64-10-2016_01_21_18.07.28.285230967-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/180/data_00-22-5-2016_01_29_10.02.45.546161528-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/180/data_00-97-2-2016_01_28_19.38.24.267321744-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/260/data_00-60-8-2016_01_21_16.09.06.890956313-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/260/data_00-24-8-2016_01_28_11.46.39.428620159-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/260/data_00-81-6-2016_01_25_22.03.42.874073928-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/260/data_00-1-2-2016_01_28_13.49.12.276112347-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/235/data_00-149-10-2016_03_16_20.55.25.016446917-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/235/data_00-63-5-2016_01_21_20.31.56.100432940-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/235/data_00-75-4-2016_01_21_17.43.10.716246929-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/235/data_00-60-10-2016_01_25_12.53.46.828416807-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/235/data_00-37-3-2016_01_21_21.10.25.640165764-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/235/data_00-74-1-2016_01_28_13.49.59.131326005-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/235/data_00-37-6-2016_01_21_18.14.39.614081963-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-70-7-2016_03_21_12.48.45.281261467-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-70-1-2016_03_16_16.20.21.052116332-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-3-10-2016_03_16_18.07.45.589557330-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-8-8-2016_03_16_19.28.17.390858554-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-64-5-2016_03_16_20.33.47.543379330-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-13-1-2016_03_16_22.07.52.472880579-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-23-1-2016_03_17_16.43.20.929281780-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-136-2-2016_03_17_18.58.42.720014265-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-24-1-2016_01_21_20.26.51.628283982-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-97-9-2016_01_28_10.50.30.309816625-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-14-3-2016_01_21_19.08.45.445874659-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-27-3-2016_01_28_11.57.45.456194921-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-70-5-2016_01_21_14.12.18.675387366-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-78-1-2016_01_25_11.39.56.585425398-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-42-8-2016_01_21_13.21.11.354821423-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-99-8-2016_01_25_20.38.16.470818440-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-81-2-2016_01_21_20.10.38.368902705-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-63-5-2016_01_21_17.43.58.457100777-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-27-4-2016_01_28_12.33.22.549959942-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-70-1-2016_01_21_19.06.42.482704957-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-55-3-2016_01_28_16.25.19.053330448-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-89-3-2016_01_21_22.23.19.318705475-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-76-6-2016_01_28_16.48.17.677294918-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-3-6-2016_01_28_12.44.25.191069257-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-92-7-2016_01_21_21.55.36.465173519-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-65-7-2016_01_28_16.02.59.731840598-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-77-3-2016_01_25_19.41.31.175148230-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-22-6-2016_01_21_15.49.41.741641251-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-20-5-2016_01_28_13.05.09.396606802-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-11-6-2016_01_21_23.49.32.458950064-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-14-3-2016_01_28_11.58.03.795381581-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-85-2-2016_01_25_15.54.03.764680086-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-48-8-2016_01_21_22.21.47.123559838-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-96-1-2016_01_28_13.53.46.759003652-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-64-9-2016_01_25_22.11.42.309153693-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-21-1-2016_01_21_18.42.49.844792169-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-99-6-2016_01_28_22.50.29.988683671-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-12-7-2016_01_28_10.17.39.827310894-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-95-4-2016_01_21_22.07.48.596774306-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-90-9-2016_01_29_02.44.47.573306935-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-75-10-2016_01_25_20.20.26.556995510-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-57-9-2016_01_21_21.55.09.955874184-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/259/data_00-22-4-2016_01_29_09.01.28.540143257-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/178/data_00-36-10-2016_01_28_14.23.29.322771566-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/178/data_00-17-9-2016_01_29_09.42.19.966907927-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/178/data_00-99-5-2016_01_25_20.17.40.249202736-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/137/data_00-115-6-2016_03_16_20.42.04.255788047-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/137/data_00-47-5-2016_01_25_12.26.13.948252947-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/137/data_00-70-4-2016_01_28_14.52.32.418619521-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/137/data_00-44-8-2016_01_28_14.08.08.079413199-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/137/data_00-86-4-2016_01_25_12.02.01.654039695-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/137/data_00-73-3-2016_01_25_13.14.01.065978489-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/137/data_00-56-5-2016_01_22_01.06.15.183552436-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/137/data_00-41-6-2016_01_28_11.52.12.494350845-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/184/data_00-83-4-2016_01_25_22.13.46.594526976-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/184/data_00-99-10-2016_01_25_20.47.25.356448740-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/103/data_00-12-2-2016_03_16_23.31.07.562327963-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/103/data_00-96-1-2016_01_25_15.35.08.963107288-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/103/data_00-74-7-2016_01_28_13.32.03.783475960-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/103/data_00-99-1-2016_01_21_22.30.07.155139883-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/103/data_00-87-4-2016_01_28_19.53.55.815341123-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/103/data_00-88-5-2016_01_28_11.14.10.550523940-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/131/data_00-58-4-2016_01_21_22.28.12.138501075-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/131/data_00-71-10-2016_01_21_16.56.26.166221511-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/207/data_00-1-6-2016_01_21_20.59.13.997991238-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/207/data_00-88-1-2016_01_28_22.05.00.432261830-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/207/data_00-65-7-2016_01_21_20.25.19.451562094-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/207/data_00-37-5-2016_01_22_01.13.13.325611871-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-96-6-2016_03_21_12.24.43.677880559-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-11-4-2016_03_14_15.52.07.381516095-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-0-10-2016_03_16_15.44.55.396022446-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-98-5-2016_03_16_16.40.43.952476466-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-106-2-2016_03_16_17.40.21.468727457-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-65-2-2016_03_16_18.38.03.643652588-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-134-5-2016_03_16_19.16.38.356170278-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-1-2-2016_03_16_19.54.28.913171224-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-132-5-2016_03_16_20.33.09.897917983-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-130-2-2016_03_16_21.26.38.603296056-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-13-4-2016_03_16_22.36.18.473809672-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-0-7-2016_03_17_16.07.21.999896714-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-20-7-2016_03_17_17.18.49.671771045-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-124-2-2016_03_17_18.51.26.021826615-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-27-7-2016_03_18_13.11.45.488890536-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-5-6-2016_01_28_08.21.40.840486657-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-19-7-2016_01_28_12.31.52.196059659-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-53-5-2016_01_28_14.20.34.719734811-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-74-3-2016_01_28_19.49.46.361606999-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-0-4-2016_01_28_14.20.11.790403281-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-94-5-2016_01_28_20.40.22.335259280-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-27-2-2016_01_21_13.33.34.247105674-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-24-4-2016_01_21_21.01.21.608786026-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-76-10-2016_01_21_20.17.49.120286560-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-27-9-2016_01_21_18.51.57.023089995-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-15-3-2016_01_21_18.11.28.443859732-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-90-5-2016_01_28_22.19.53.231678278-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-30-2-2016_01_21_17.06.37.127397442-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-94-7-2016_01_21_15.14.26.461436204-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-81-7-2016_01_21_15.50.52.537795593-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-52-10-2016_01_21_18.53.15.618072087-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-62-9-2016_01_21_19.37.25.720488943-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-59-8-2016_01_21_16.41.14.234638339-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-23-6-2016_01_21_14.59.17.551321714-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-73-8-2016_01_21_16.10.58.680897199-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-69-3-2016_01_28_21.28.33.520381405-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-13-9-2016_01_21_13.25.10.800412759-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-21-10-2016_01_21_14.21.43.412910202-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-78-1-2016_01_21_14.23.33.645088165-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-9-2-2016_01_21_18.34.02.846393397-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-89-3-2016_01_21_14.09.29.241557515-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-0-8-2016_01_21_18.25.32.617393012-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-61-1-2016_01_21_18.52.36.452963232-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-48-7-2016_01_21_15.30.07.014838350-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-90-2-2016_01_28_19.06.01.524455641-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-70-4-2016_01_28_20.57.40.139900036-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-88-5-2016_01_28_11.17.21.930967499-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-48-5-2016_01_25_21.29.48.211569944-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-63-2-2016_01_25_19.37.55.052024736-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-77-3-2016_01_25_17.00.08.946004002-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-71-10-2016_01_25_15.09.08.610850235-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-79-1-2016_01_25_23.31.01.082929041-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-62-6-2016_01_25_16.09.47.105142076-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-83-10-2016_01_25_14.31.26.709096443-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-62-8-2016_01_25_21.46.13.035549304-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-36-6-2016_01_25_12.29.53.754876459-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-63-7-2016_01_25_14.26.50.558638807-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-37-1-2016_01_21_22.13.45.672378220-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-11-5-2016_01_21_23.53.31.453468717-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-87-7-2016_01_21_19.55.17.607550540-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-68-5-2016_01_25_11.30.33.769268411-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-91-4-2016_01_25_11.45.27.854349254-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-67-1-2016_01_25_13.10.53.864135853-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-4-9-2016_01_21_22.15.06.302174779-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-93-8-2016_01_21_23.37.23.046164538-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-39-7-2016_01_21_22.22.25.423271414-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-99-7-2016_01_25_11.57.59.018647088-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-17-6-2016_01_22_00.09.26.544897156-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-65-5-2016_01_25_12.05.24.040347789-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-24-5-2016_01_21_20.05.56.712657800-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-76-10-2016_01_21_22.08.24.117472422-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-79-7-2016_01_22_01.10.21.882869033-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-36-2-2016_01_25_11.16.00.069584622-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-68-4-2016_01_25_11.50.16.515621114-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-55-3-2016_01_25_15.10.18.366611332-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-63-2-2016_01_21_23.57.11.108141608-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-70-9-2016_01_25_13.26.46.605325516-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-66-9-2016_01_25_17.44.58.002760929-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/175/data_00-65-10-2016_01_25_16.02.09.327012603-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/163/data_00-5-10-2016_03_16_22.12.25.801700322-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/163/data_00-80-8-2016_01_21_22.04.44.605676913-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/163/data_00-51-4-2016_01_25_22.46.38.288659054-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/163/data_00-41-10-2016_01_25_15.45.55.881253932-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/163/data_00-94-9-2016_01_25_22.38.37.094462767-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/163/data_00-62-2-2016_01_25_11.31.21.640856364-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/262/data_00-85-3-2016_01_21_15.35.15.199513508-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/262/data_00-4-1-2016_01_21_14.40.47.926925467-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/130/data_00-21-2-2016_03_16_19.10.11.889885293-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/130/data_00-96-7-2016_03_17_18.20.21.384518900-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/130/data_00-88-2-2016_01_28_17.15.03.368854099-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/130/data_00-95-4-2016_01_21_14.13.20.917852219-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/130/data_00-66-6-2016_01_21_13.32.20.264637576-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/130/data_00-72-6-2016_01_28_19.46.16.699204361-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/130/data_00-75-4-2016_01_28_14.29.20.821412851-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/130/data_00-1-8-2016_01_28_12.34.03.320249609-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/130/data_00-38-10-2016_01_21_18.23.13.577403336-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/130/data_00-65-6-2016_01_28_16.05.41.682742337-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/130/data_00-95-2-2016_01_22_00.01.31.431600111-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/017/data_00-24-9-2016_01_21_16.49.17.237193272-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/017/data_00-26-6-2016_01_21_16.04.59.241341049-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/264/data_00-14-2-2016_01_21_17.39.33.074666593-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/264/data_00-53-3-2016_01_21_19.24.49.078746622-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/264/data_00-54-6-2016_01_21_15.03.32.575126941-dcap \
"

DCCP=`which dccp`
for f in ${SOURCES}
do
    ${DCCP} ${f} /dev/null
done