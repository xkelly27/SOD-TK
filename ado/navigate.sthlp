{smcl}
{* *! version 1.9.0 10jan2017}{...}
{vieweralsosee "ucol" "help ucol"}{...}
{vieweralsosee "connect" "help connect"}{...}
{vieweralsosee "goodbye" "help goodbye"}{...}
{viewerjumpto "Syntax" "sort##syntax"}{...}
{title:Title}

{p2colset 5 13 20 2}{...}
{p2col :{cmd:navigate} {hline 2}}Changes directory according to frequently visited locations{p_end}
{p2colreset}{...}

{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{cmd:navigate}
{{varlist}}

{marker group}{...}
{title:Options for {navigate}}

{synoptset 22 tabbed}{...}
{synopthdr}
{synoptline}
{synopt : {opt desktop}}Takes user to local desktop folder. Other acceptable inputs: Desktop{p_end}
{synopt : {opt downloads}}Takes user to local downloads folder. Other acceptable inputs: Downloads{p_end}
{synopt : {opt onedrive}}Takes user to OneDrive folder. Other acceptable inputs: OneDrive, sharepoint, shared library{p_end}
{synopt : {opt repository}}Takes user to repository folder. Other acceptable inputs: repo, Repository{p_end}
{synopt : {opt code}}Takes user to repository code folder. Other acceptable inputs: Code, function path{p_end}
{synopt : {opt app}}Takes user to repository app contents. Other acceptable inputs: tool, ucol, App{p_end}



{marker example}{...}
{title:Examples}

{pstd}{cmd:navigate} tool{break}
{p_end}

{pstd}{cmd:navigate} OneDrive{break}
{p_end}

{pstd}{cmd:navigate} function path{break}
{p_end}

{marker author}{...}
{title:Author}

{pstd}Xavier Kelly{break}
Data Analyst, University of Denver, CO, USA{break}
{browse "mailto:xavier.kelly@du.edu":xavier.kelly@du.edu}{break}
{p_end}


{marker project}{...}
{title:More Information}

{pstd}{break}
To report bugs, ask for help, etc. please email (see above). A project URL (Github) will be provided once it is up and running.{break}
{p_end}
