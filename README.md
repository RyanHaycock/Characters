# Characters

An example project that retrieves a list of Rick and Morty characters from a public API. The project uses an MVVM-C architecture with services accessed via protocols and a shared Env to facilitate testing.


## To Do

- Adding paging so all characters can be displayed
- Improving any diffing logic to help performance
- Moving the image service over to use the Network Router to facilitate mocking
- More tests around the Network Router, pages and conveniences
- Add a fade animation for any images that are loaded whilst on-screen
- Implement Coordinators correctly so children are managed and the `AppCoordinator` can be broken up
