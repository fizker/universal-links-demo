# Universal Links Server

This is the server component for the Universal Links demo. It has a few pages,
and most of these have one or more apps configured to respond to the URL.

## Running the server

To run the server, the App IDs of the corresponding apps must be configured as environment variables.

To assign this, copy the `.env.example` file and name the copy `.env`, and edit it as necessary.

If the server is started through Xcode, make sure to change `Working Directory` to the `/server/` dir, or the `.env` file will not be picked up. In this case, the server will exit immediately because of the missing data.

If running through docker-compose, the `.env` file is automatically picked up.

### Running in docker

To run the server, navigate into the `server/` folder and run `docker compose up -d`.

To rebuild the server, run `docker compose build` from the `server/` folder.
