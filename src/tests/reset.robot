*** Settings ***
Resource  resource.robot
Suite Setup     Open And Configure Browser
Suite Teardown  Close Browser
Test Setup      Reset Counter

*** Test Cases ***
Reset Functionality Works
    Go To  ${HOME_URL}
    Page Should Contain  nappia painettu 0 kertaa

    Click Button  Paina
    Page Should Contain  nappia painettu 1 kertaa
    Click Button  Paina
    Page Should Contain  nappia painettu 2 kertaa
    Click Button  Paina
    Page Should Contain  nappia painettu 3 kertaa

    Click Button  Nollaa
    Page Should Contain  nappia painettu 0 kertaa

