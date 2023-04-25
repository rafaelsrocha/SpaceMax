# SpaceMAX 🚀

It's a SpaceX-based iOS app I'm creating for fun while trying out some programming concepts.

## Building the app

There are two steps to complete before building the app:

1. Go to [tomorrow.io](https://www.tomorrow.io) and get an API key. It will be used on the next step;
2. Run `make setup` on the project's root folder. It will:
    - install the needed dependencies
    - download the `schema.graphqls` file
    - generate the GraphQL operation and schema files
    - create the Config.xcconfig file containing the API key mentioned above

After that, you should be good to go 🚀

## Generating GraphQL models

After creating your `.graphql` file containing your query, run `make generate-graphql-code` to generate the referent files.

## Features

- [x] Next launch
- [ ] Launches
- [ ] Rockets info

### Next launch

As explained on this [Medium post](https://medium.com/open-graphql/launching-spacex-graphql-api-b3d7029086e0), SpaceX GraphQL is not realtime data. That being said, there are some outdated or missing information that would be needed to fill the screen (i.e.: Launch's location/address).
The weather section also relies on the missing location mentioned above.

## Roadmap

- [x] Light/dark mode
- [ ] UI animations
- [ ] Animated transitions
- [ ] Tap on sections to change unit (i.e.: change kilometer to miles)
- [ ] 3D showroom
- [ ] [Microapps](https://increment.com/mobile/microapps-architecture/) – ([Medium's feedback](https://medium.engineering/evolution-of-the-medium-ios-app-architecture-8b6090f4508e) about it sounds promising)
