Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application ## see nyc_subway_status/lib/nyc_subway_status/cli.rb
- [x] Pull data from an external source               ## used nokogiri to scrape MTA train data and populate Line objects
- [x] Implement both list and detail views            ## CLI displays list of subway lines with names and status. details for each line can be user selected, once a user selects a line to view details the specific URL on the MTA website for the status of that line will open for the user.
