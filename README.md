<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
    <img src="https://user-images.githubusercontent.com/116703107/239712974-64aaeb60-037c-4879-a723-93eea5a59b60.png" height="200">
<br>
  <h3 align="center"> Inner Worlds Back End </h3>
<br>
  <p align="center">
    Mod 4 Capstone Project
    <br />
  </p>
</div>
<br>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#schema">Inner Worlds Schema</a></li>
    <li><a href="#endpoint">Endpoint Details</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#inner">Inner Worlds Team</a></li>
    <li><a href="#acknowledgements">Acknowlegdements</a></li>
  </ol>
</details>


## About The Project

Inner Worlds is an application to help a user keep a detailed dream journal, and provide data about their dreams.

The learning goals for this project were;

* Demonstrate knowledge you’ve gained throughout Turing
* Use an agile process to turn well defined requirements into deployed and production ready software
* Gain experience dividing applications into components and domains of responsibilities to facilitate multi-developer teams. Service oriented architecture concepts and patterns are highly encouraged.
* Explore and implement new concepts, patterns, or libraries that have not been explicitly taught while at Turing
* Practice an advanced, professional git workflow including a Pull Request Review
* Gain experience using continuous integration tools to build and automate the deployment of features
* Build applications that execute in development, test, CI, and production environments
* Focus on communication between front-end and back-end teams in order to complete and deploy features that have been outlined by the project spec

We hope your experience is out of this world!


### Inception - Diagramming and Brainstorming

* Whenever I get assigned a project, I like to start with some brain-storming and diagramming. It helps me get an eagle's eye view of the problems I'm trying to solve.

![brainstorm](https://user-images.githubusercontent.com/116703107/234486110-948632be-f898-4613-b249-3d878e4428c1.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Built With

[![Rails]][Rails-url][![PostgreSQL]][PostgreSQL-url][![Puma]][Puma-url][![Capybara]][Capybara-url][![Shoulda-Matchers]][Shoulda-Matchers-url][![RSpec]][RSpec-url]


<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Getting Started
<!-- can change this later or add more detail -->
### Prerequisites

* Ruby
  ```sh
  Ruby 3.1.1
  ```

* Rails
  ```sh
  Rails 7.0.4.3
  ```
* [PostgreSQL](https://www.postgresql.org/download/)

### Installation

_Follow the steps below to install and set up this app._

1. Clone this Repository
   ```sh
   git clone https://github.com/Bobsters986/psydiary_back_end
   ```
2. In your terminal, run the following commands;
    ```sh
    bundle install
    'rails generate graphql:install'
    rails db:{drop,create,migrate,seed}
    ```
3. Run `rails s` in your terminal and visit [http://localhost:3000/graphiql](http://localhost:3000/graphiql) to explore the end points for yourself!


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- USAGE EXAMPLES -->
## Schema

<div align="center">

  ![inner_worlds_schem](https://user-images.githubusercontent.com/116703107/239712049-e4f90a24-86d8-4556-98bc-e8bea0ea2855.png)
</div>


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- Testing -->
## Testing

* This project utilizes RSpec testing
* After cloning this repo and following the steps above to install all necessary gems and API keys:
  * Run the entire test suite using the command `bundle exec rspec`


<!-- JSON Contract -->
## Endpoint Details
* Below are example Requests and Responses for each endpoint

### Weather for Location Request/Response
![weather_request](https://user-images.githubusercontent.com/116703107/234476140-b0750f71-6b2a-4ee5-83f6-4200d90bc7d9.png)

* Response

![weather_response](https://user-images.githubusercontent.com/116703107/234476434-5c473fe1-f8a2-47ea-81cf-ae7365e252b2.png)

### User Registration Request/Response
![registration](https://user-images.githubusercontent.com/116703107/234477540-1e9ef340-f129-4061-a125-453ab20a5dcc.png)

### User Login Request/Response
![login](https://user-images.githubusercontent.com/116703107/234477634-099538e5-85c3-4b22-ab18-19ff96700b14.png)

### Road Trip Request/Response
![road_trip_request](https://user-images.githubusercontent.com/116703107/234477729-5cd68dc5-70cd-4d46-ab9c-4b5029145814.png)

* Response

![road_trip_response](https://user-images.githubusercontent.com/116703107/234477841-80693e8d-2c1d-4128-a602-7491d23d2160.png)


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Inner Worlds Team

### Back End
<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/jadekstewart3"></td>
    <td><img src="https://avatars.githubusercontent.com/Bobsters986"></td>
    <td><img src="https://avatars.githubusercontent.com/kassandraleyba"></td>
    <td><img src="https://avatars.githubusercontent.com/sandfortw"></td>
    <td><img src="https://avatars.githubusercontent.com/sgwalker327"></td>
  </tr>
  <tr>
    <td>Jade Stewart</td>
    <td>Bobby Luly</td>
    <td>Kassandra Leyba</td>
    <td>Weston Sandfort</td>
    <td>Sam Walker</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/jadekstewart3">GitHub</a><br>
      <a href="https://www.linkedin.com/in/jadestewart-software-engineer/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/Bobsters986">GitHub</a><br>
      <a href="https://www.linkedin.com/in/bobbyy-luly-217653260/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/kassandraleyba">GitHub</a><br>
      <a href="https://www.linkedin.com/in/kassandra-leyba/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/sandfortw">GitHub</a><br>
      <a href="https://www.linkedin.com/in/westonsandfort/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/sgwalker327">GitHub</a><br>
      <a href="https://www.linkedin.com/in/sam-walker-95a49630/">LinkedIn</a>
    </td>
  </tr>
</table>

### Front End

<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/LSeward0421"></td>
    <td><img src="https://avatars.githubusercontent.com/danielcurtin"></td>
    <td><img src="https://avatars.githubusercontent.com/Lexyful"></td>
  </tr>
  <tr>
    <td>Lauren Seward</td>
    <td>Daniel Curtin</td>
    <td>Lexye Jordan</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/LSeward0421">GitHub</a><br>
      <a href="https://www.linkedin.com/in/l-seward/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/danielcurtin">GitHub</a><br>
      <a href="https://www.linkedin.com/in/daniel-curtin-39954a192/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/Lexyful">GitHub</a><br>
      <a href="https://www.linkedin.com/in/lexye-jordan-175879260/">LinkedIn</a>
    </td>
  </tr>
</table>

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Acknowledgements
* ["The Best README Template" by Github User othneil](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com 

[Rails]: https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000?logo=ruby-on-rails&logoColor=white&style=for-the-badge
[Rails-url]: https://rubyonrails.org 

[Circle-CI]: https://img.shields.io/circleci/build/github/wise-app-team/wise-app-be/main
[Circle-url]: https://app.circleci.com/

[PostgreSQL]: https://img.shields.io/badge/-PostgreSQL-4169E1?logo=postgresql&logoColor=white&style=for-the-badge
[PostgreSQL-url]: https://www.postgresql.org/

[Puma]: https://img.shields.io/badge/-Puma-FFD43B?logo=puma&logoColor=black&style=for-the-badge
[Puma-url]: https://github.com/puma/puma

[Capybara]: https://img.shields.io/badge/-Capybara-FF7F50?logo=rubygems&logoColor=white&style=for-the-badge
[Capybara-url]: https://github.com/teamcapybara/capybara

[RSpec]: https://img.shields.io/badge/-RSpec-FF7F50?logo=rubygems&logoColor=white&style=for-the-badge
[RSpec-url]: https://github.com/rspec/rspec

[Faker]: https://img.shields.io/badge/-Faker-FF69B4?logo=rubygems&logoColor=white&style=for-the-badge
[Faker-url]: https://github.com/faker-ruby/faker

[Shoulda-Matchers]: https://img.shields.io/badge/-Shoulda%20Matchers-5B5B5B?logo=rubygems&logoColor=white&style=for-the-badge
[Shoulda-Matchers-url]: https://github.com/thoughtbot/shoulda-matchers

[Web-mock]: https://img.shields.io/badge/-WebMock-8B0000?logo=rubygems&logoColor=white&style=for-the-badge
[Web-mock-url]: https://github.com/bblimke/webmock
