#!/bin/bash
SOURCES="\
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/199/data_00-4-8-2016_01_28_07.55.06.834867622-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/199/data_00-59-2-2016_01_21_21.25.07.803872772-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/255/data_00-97-6-2016_01_28_15.52.20.352478142-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/255/data_00-81-7-2016_01_28_12.56.06.321567239-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/255/data_00-22-5-2016_01_29_10.45.24.883029249-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/223/data_00-74-4-2016_01_25_21.31.22.018396554-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/223/data_00-97-2-2016_01_21_19.58.30.442104842-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/297/data_00-71-5-2016_03_17_16.42.13.039639147-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/297/data_00-90-1-2016_01_25_15.48.59.621738717-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/297/data_00-42-4-2016_01_28_13.13.30.159463584-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/297/data_00-96-1-2016_01_28_17.33.59.977053696-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/297/data_00-24-1-2016_01_21_21.26.40.392177182-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/297/data_00-67-5-2016_01_25_15.45.35.797768532-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/204/data_00-69-5-2016_01_25_11.36.28.803145089-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/204/data_00-48-4-2016_01_22_00.25.35.075848083-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/204/data_00-65-4-2016_01_28_17.05.31.466714092-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/143/data_00-91-9-2016_01_28_12.44.19.926720400-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/143/data_00-48-4-2016_01_25_20.07.24.542823999-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/143/data_00-67-6-2016_01_28_18.47.50.679962361-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-33-1-2016_03_21_12.11.17.590153966-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-48-4-2016_03_21_12.31.49.746708162-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-68-8-2016_03_11_07.58.33.987448383-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-1-4-2016_03_16_14.55.59.705632903-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-89-9-2016_03_16_15.38.34.611567360-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-99-7-2016_03_16_16.16.12.460457972-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-13-3-2016_03_16_16.57.28.661659809-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-49-8-2016_03_16_17.40.41.940702228-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-57-9-2016_03_16_18.19.28.972827898-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-29-8-2016_03_16_18.52.15.896038696-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-123-3-2016_03_16_19.20.07.094445837-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-102-4-2016_03_16_19.47.59.226778065-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-18-9-2016_03_16_20.14.26.919233379-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-117-1-2016_03_16_20.40.55.674371262-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-128-9-2016_03_16_21.20.55.263814751-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-5-2-2016_03_16_22.06.21.480488696-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-9-7-2016_03_16_22.59.39.046390984-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-20-5-2016_03_17_16.18.25.548716697-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-63-3-2016_03_17_17.01.39.857981986-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-135-2-2016_03_17_17.49.59.694293497-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-149-2-2016_03_17_18.58.31.986269073-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-25-3-2016_03_18_13.04.19.917547596-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-84-7-2016_01_25_20.23.05.254538389-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-50-9-2016_01_21_15.58.52.203693613-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-40-2-2016_01_25_15.59.19.784805268-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-88-1-2016_01_28_21.20.49.077626405-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-32-3-2016_01_25_15.03.32.906731099-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-67-5-2016_01_28_15.48.26.079971447-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-91-4-2016_01_21_19.15.39.682007566-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-32-4-2016_01_28_08.25.51.107404437-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-67-5-2016_01_21_20.23.08.856422420-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-98-8-2016_01_28_11.03.50.534430812-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-54-9-2016_01_21_13.43.03.916168962-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-88-8-2016_01_21_21.58.01.695229834-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-10-4-2016_01_28_08.05.02.573288211-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-7-3-2016_01_21_15.58.34.999143509-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-43-2-2016_01_25_14.59.17.376090958-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-63-10-2016_01_28_21.40.11.911121445-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-83-10-2016_01_25_12.01.10.413332663-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-26-4-2016_01_28_11.34.13.549140972-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-91-6-2016_01_21_15.27.56.452637012-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-98-3-2016_01_25_13.30.08.664022749-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-99-5-2016_01_28_09.40.43.637672541-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-83-3-2016_01_21_17.24.30.564014326-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-66-8-2016_01_25_20.24.26.444849164-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-74-8-2016_01_28_21.16.10.946602422-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-27-10-2016_01_21_19.28.07.636426838-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-92-5-2016_01_28_10.26.31.282768108-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-29-4-2016_01_21_17.19.58.652679409-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-32-2-2016_01_25_11.31.42.435401020-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-43-9-2016_01_28_10.22.03.442123546-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-36-7-2016_01_21_13.42.52.342525739-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-40-6-2016_01_25_13.30.09.935187429-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-92-2-2016_01_28_19.08.53.408982610-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-34-4-2016_01_21_21.06.09.861710664-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-75-3-2016_01_25_23.06.03.936149415-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-82-5-2016_01_28_17.02.39.632857560-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-7-5-2016_01_21_18.57.21.245257460-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-79-9-2016_01_25_15.29.04.537013263-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-98-4-2016_01_28_18.23.10.343982518-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-31-6-2016_01_22_00.03.43.719406906-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-55-9-2016_01_25_22.48.05.876618515-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-79-8-2016_01_21_16.21.23.179349004-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-86-4-2016_01_25_19.46.56.969582795-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-63-4-2016_01_28_20.32.29.480047438-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-50-6-2016_01_25_11.54.06.536751723-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-55-5-2016_01_28_16.21.04.977793666-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-68-2-2016_01_25_11.38.17.792405755-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-77-4-2016_01_28_12.16.13.191763794-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-67-1-2016_01_21_14.00.50.038194059-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-23-4-2016_01_21_17.45.01.826995641-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-98-10-2016_01_25_21.25.11.900300544-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-91-3-2016_01_21_13.59.34.380166031-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-46-10-2016_01_25_11.47.43.918516704-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-27-4-2016_01_28_13.32.26.418878441-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-28-10-2016_01_21_14.20.01.697358313-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-95-10-2016_01_22_01.28.08.710036245-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-1-7-2016_01_28_10.55.11.542869786-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-67-9-2016_01_21_15.24.15.030026092-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-46-2-2016_01_25_13.11.59.199625229-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-87-2-2016_01_28_15.58.01.876565220-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-74-10-2016_01_22_01.27.07.015895299-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-96-3-2016_01_25_22.40.49.030426878-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-72-1-2016_01_21_15.18.48.405467861-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-40-10-2016_01_25_12.00.35.413894486-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-78-2-2016_01_28_22.02.54.900291495-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-41-9-2016_01_25_13.27.42.333864748-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-91-6-2016_01_28_16.04.29.813226693-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-26-9-2016_01_21_22.59.49.624226535-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-88-10-2016_01_25_21.17.59.742620737-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-64-3-2016_01_28_22.35.05.159416815-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-32-4-2016_01_25_11.37.11.100371601-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-87-3-2016_01_28_15.55.50.078980748-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-82-1-2016_01_21_22.14.16.219399434-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-14-9-2016_01_28_08.00.38.276230385-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-55-3-2016_01_21_14.34.53.992899534-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-96-3-2016_01_25_20.16.48.313261687-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-71-4-2016_01_21_18.54.21.620317117-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-11-6-2016_01_28_07.45.23.293714739-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-19-1-2016_01_21_15.35.15.435515804-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-33-7-2016_01_21_23.02.43.606774175-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-45-6-2016_01_28_12.16.19.688247958-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-28-9-2016_01_21_21.11.19.772148769-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-87-2-2016_01_25_17.32.41.342386339-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-77-1-2016_01_28_22.18.39.602452164-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-53-2-2016_01_21_23.16.41.878271925-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-75-3-2016_01_25_20.26.42.599489870-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-24-3-2016_01_21_15.57.42.681026507-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-33-5-2016_01_25_12.24.28.755077978-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-83-8-2016_01_28_13.55.25.142160891-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-68-8-2016_01_21_17.08.11.813263107-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-97-8-2016_01_25_15.25.11.356469794-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-67-1-2016_01_28_23.38.33.104611445-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/288/data_00-48-1-2016_01_25_14.44.16.323697899-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/097/data_00-69-4-2016_01_25_22.05.01.814773902-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/097/data_00-7-10-2016_01_21_20.24.32.742183337-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/159/data_00-86-4-2016_01_25_16.08.17.414570501-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/159/data_00-79-5-2016_01_25_20.51.51.676406016-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/159/data_00-63-2-2016_01_25_20.54.18.988203687-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/159/data_00-69-7-2016_01_25_19.46.23.285910519-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/139/data_00-31-1-2016_03_16_20.30.06.085149051-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/139/data_00-91-6-2016_01_25_21.32.11.474345556-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/139/data_00-13-7-2016_01_28_13.37.42.202566872-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/139/data_00-56-4-2016_01_28_13.45.36.381375664-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/139/data_00-62-8-2016_01_25_11.52.37.638325807-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/139/data_00-36-4-2016_01_22_00.29.10.811272122-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/139/data_00-56-10-2016_01_21_17.51.50.305359931-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/139/data_00-25-7-2016_01_28_09.05.08.417564012-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/224/data_00-90-4-2016_01_28_23.11.48.209224314-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/224/data_00-94-1-2016_01_28_20.07.59.257323242-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/220/data_00-52-9-2016_03_16_19.56.41.330176890-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/220/data_00-36-4-2016_01_25_16.41.15.971502728-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/220/data_00-38-6-2016_01_21_17.54.31.405848841-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/220/data_00-64-3-2016_01_25_17.46.26.963599943-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/220/data_00-99-5-2016_01_28_16.29.23.654164155-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/220/data_00-45-5-2016_01_28_08.35.10.861736637-dcap \
dcap://dmsdca15.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/220/data_00-11-4-2016_01_28_08.09.47.593257558-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/220/data_00-59-5-2016_01_25_18.08.32.912704018-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/012/data_00-146-5-2016_03_17_18.50.29.532142860-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/012/data_00-64-1-2016_01_28_23.19.42.070974345-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/012/data_00-12-5-2016_01_28_23.41.46.169253691-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/012/data_00-99-10-2016_01_28_13.32.17.435778268-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/012/data_00-4-7-2016_01_28_07.44.55.676576318-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/237/data_00-10-1-2016_01_28_08.04.48.494564884-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/237/data_00-99-10-2016_01_28_20.35.30.580556309-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/237/data_00-40-5-2016_01_25_20.49.40.900304426-dcap \
dcap://dmsdca19.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/226/data_00-56-5-2016_01_21_20.49.47.982373058-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/226/data_00-83-6-2016_01_25_13.20.55.087072844-dcap \
dcap://dmsdca18.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/226/data_00-92-2-2016_01_21_17.03.31.935460611-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/226/data_00-59-5-2016_01_25_13.26.53.920736652-dcap \
dcap://dmsdca22.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/161/data_00-52-5-2016_01_25_20.38.40.112397297-dcap \
dcap://dmsdca21.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/161/data_00-78-3-2016_01_25_14.16.24.504127509-dcap \
dcap://dmsdca20.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/004/data_00-46-3-2016_01_25_13.14.53.739536640-dcap \
dcap://dmsdca17.fnal.gov:24125/pnfs/fs/usr/test/arossi/online/004/data_00-66-5-2016_01_25_18.08.39.809230745-dcap \
"

DCCP=`which dccp`
for f in ${SOURCES}
do
    ${DCCP} ${f} /dev/null
done