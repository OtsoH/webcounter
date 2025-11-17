*** Settings ***
Resource  resource.robot
Suite Setup     Open And Configure Browser
Suite Teardown  Close Browser
Test Setup      Reset Counter

*** Test Cases ***
Set Value With Valid Number
    Go To  ${HOME_URL}
    Page Should Contain  nappia painettu 0 kertaa

    Input Text  name=new_value  5
    Click Button  aseta
    Page Should Contain  nappia painettu 5 kertaa

    Input Text  name=new_value  10
    Click Button  aseta
    Page Should Contain  nappia painettu 10 kertaa

Set Value To Zero
    Go To  ${HOME_URL}
    Click Button  Paina
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa

    Input Text  name=new_value  0
    Click Button  aseta
    Page Should Contain  nappia painettu 0 kertaa

Set Negative Value
    Go To  ${HOME_URL}
    Page Should Contain  nappia painettu 0 kertaa

    Input Text  name=new_value  -3
    Click Button  aseta
    Page Should Contain  nappia painettu -3 kertaa

Set Large Value
    Go To  ${HOME_URL}
    Page Should Contain  nappia painettu 0 kertaa

    Input Text  name=new_value  100
    Click Button  aseta
    Page Should Contain  nappia painettu 100 kertaa

Set Value And Continue Counting
    Go To  ${HOME_URL}
    Input Text  name=new_value  7
    Click Button  aseta
    Page Should Contain  nappia painettu 7 kertaa

    Click Button  Paina
    Page Should Contain  nappia painettu 8 kertaa
    Click Button  Paina
    Page Should Contain  nappia painettu 9 kertaa

Empty Input Field
    Go To  ${HOME_URL}
    Click Button  Paina
    Page Should Contain  nappia painettu 1 kertaa

    # Jätä kenttä tyhjäksi ja paina aseta
    Clear Element Text  name=new_value
    Click Button  aseta
    Page Should Contain  nappia painettu 1 kertaa