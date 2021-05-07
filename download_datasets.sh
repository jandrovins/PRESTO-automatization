ROOT_DIR=$(pwd)
# asumimos que crearemos los directorios en el home del usuario en el que esté la carpeta
cd ${ROOT_DIR}
mkdir ../presto
cd ../presto
wget https://nr50dq.bn.files.1drv.com/y4mRytEDUPY_ceOg4_w8bProkGMI20WjtOaRdIn_owOZL8gD7IphqMAY-KJDWmWB9QnvwRX73vDc_SVS-nwsmYEz7q2Z-fxanFnBgl0KT0wGm9Q8eqOd3CY_-IAQiBFy5vVifqnbU8iEES7K9FMiBqUbJezwUObyfC55Iiy4kMlubEOWxIUQbFyip8IuJ1wC1UD0-tyWi3T5FBRFAEC1Jtdgw
tar -xf y4mRytEDUPY_ceOg4_w8bProkGMI20WjtOaRdIn_owOZL8gD7IphqMAY-KJDWmWB9QnvwRX73vDc_SVS-nwsmYEz7q2Z-fxanFnBgl0KT0wGm9Q8eqOd3CY_-IAQiBFy5vVifqnbU8iEES7K9FMiBqUbJezwUObyfC55Iiy4kMlubEOWxIUQbFyip8IuJ1wC1UD0-tyWi3T5FBRFAEC1Jtdgw
rm -f y4mRytEDUPY_ceOg4_w8bProkGMI20WjtOaRdIn_owOZL8gD7IphqMAY-KJDWmWB9QnvwRX73vDc_SVS-nwsmYEz7q2Z-fxanFnBgl0KT0wGm9Q8eqOd3CY_-IAQiBFy5vVifqnbU8iEES7K9FMiBqUbJezwUObyfC55Iiy4kMlubEOWxIUQbFyip8IuJ1wC1UD0-tyWi3T5FBRFAEC1Jtdgw
rm -f TestData1/pipeline.py TestData2/pipeline.py

cp ${ROOT_DIR}/pipeline.py TestData1
cp ${ROOT_DIR}/pipeline.py TestData2
