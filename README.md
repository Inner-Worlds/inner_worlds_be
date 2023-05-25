<a name="readme-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://inner-worlds-ui.vercel.app/">
    <img src="https://user-images.githubusercontent.com/116703107/240810572-224ff783-9b72-46ec-84a8-902e2e0a91a8.png" height="400px">
  </a>

<br />
  <h1 align="center"> Inner Worlds Back End </h3>
  <h3 align="center"> Mod 4 Capstone Project </h3>

  [Visit Inner Worlds today!](https://inner-worlds-ui.vercel.app/)
</div>
<br />


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
    <ul>
        <li><a href="#testing">Testing</a></li>
    </ul>
    <li><a href="#graphql-endpoint-details">GraphQL Endpoint Details</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#inner-worlds-team">Inner Worlds Team</a></li>
    <li><a href="#acknowledgements">Acknowlegdements</a></li>
  </ol>
</details>

<br />

## About The Project

Inner Worlds is an application to help a user keep a detailed dream journal, and provide data about their dreams. This repository serves as a GraphQL API for our [Front End Application](https://inner-worlds-ui.vercel.app/).

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

<br />

### Built With

[![Rails]][Rails-url][![PostgreSQL]][PostgreSQL-url][![GraphQL]][GraphQL-url][![RSpec]][RSpec-url][![Github-Actions]][Github-Actions-url][![Render]][Render-url][![Shoulda-Matchers]][Shoulda-Matchers-url][![Puma]][Puma-url][![VCR]][VCR-url][![Web-mock]][Web-mock-url][![Faraday]][Faraday-url][![Figaro]][Figaro-url][![Faker]][Faker-url][![Rubocop]][Rubocop-url]


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

<br />

### Installation

_Follow the steps below to install and set up this app._

1. THIS REPO NEEDS A TWINWORD API KEY. Get a free API Key at [https://www.twinword.com/api/topic-tagging.php](https://www.twinword.com/api/topic-tagging.php)
2. Clone this Repository
   ```sh
   git clone https://github.com/Inner-Worlds/inner_worlds_be
   ```
3. In your terminal, run the following commands;
    ```sh
    bundle install
    rails generate graphql:install
    bundle exec figaro install
    rails db:{drop,create,migrate,seed}
    ```
4. Add your TwinWord API key to the `application.yml` file
   ```ruby
   TWINWORD_API_KEY: 'ENTER YOUR KEY';
   ```
5. Run `rails s` in your terminal and visit [http://localhost:3000/graphiql](http://localhost:3000/graphiql) to explore the end points for yourself!


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br />

<!-- USAGE EXAMPLES -->
## Schema

<br />

<div align="center">

  ![inner_worlds_schem](https://user-images.githubusercontent.com/116703107/239712049-e4f90a24-86d8-4556-98bc-e8bea0ea2855.png)
</div>


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br />

<!-- Testing -->
### Testing

* This project utilizes RSpec testing
* After cloning this repo and following the steps above to install all necessary gems and API keys:
  * Run the entire test suite using the command `bundle exec rspec`

<br />

<!-- JSON Contract -->
## GraphQL Endpoint Details
* Below are example Requests and Responses for each endpoint

### Create a Dream - Request/Response
<details>
  <summary>Successful</summary>

  ![create_dream_successful](https://user-images.githubusercontent.com/116703107/240803860-c3234614-06e7-4b89-b7cd-7975a7fb8cca.png)
</details>

<details>
  <summary>Unsuccessful</summary>

  * Record Doesn't Exist

  ![create_dream_no_user](https://user-images.githubusercontent.com/116703107/240804545-4e32ad7f-c935-4a9c-91df-5f13ef0b7f6f.png)

  * Missing Fields

  ![create_dream_missing_fields](https://user-images.githubusercontent.com/116703107/240805231-2189394e-0747-4cb7-9295-dd25c5994999.png)
</details>

### Get a User and their Dreams with details - Request/Response
<details>
  <summary>Successful</summary>

  ![get_a_user_success](https://user-images.githubusercontent.com/116703107/240805561-634beaf4-4a77-4269-ac73-5180dc685b10.png)
</details>

<details>
  <summary>Unsuccessful</summary>

  * Record Doesn't Exist

  ![get_a_user_unsuccessful](https://user-images.githubusercontent.com/116703107/240805646-f169d93d-7b21-4698-af18-ae5ff7ceb1be.png)
</details>

### Update a User's Dream - Request/Response
<details>
  <summary>Successful</summary>

  ![update_dream_successful](https://user-images.githubusercontent.com/116703107/240806146-1fedec38-5c12-414e-bd5b-8cdcb8e429dc.png)
</details>

<details>
  <summary>Unsuccessful</summary>

  * Missing Fields

  ![update_dream_unsuccessful](https://user-images.githubusercontent.com/116703107/240806544-6cb109cd-d751-4df9-9140-b81a2aff10bd.png)
</details>

### Delete a User's Dream - Request/Response
<details>
  <summary>Successful</summary>

  ![delete_dream_success](https://user-images.githubusercontent.com/116703107/240806940-102c28ca-687d-41a0-8bab-c5fb794f06da.png)
</details>

<details>
  <summary>Unsuccessful</summary>

  * Record Doesn't Exist

  ![delete_dream_unsuccessful](https://user-images.githubusercontent.com/116703107/240807017-9e05467c-3474-4a76-a32b-6a5242a3ab24.png)
</details>

### Get a User's Dream Stats - Request/Response
<details>
  <summary>Successful</summary>

  ![stats_successful](https://user-images.githubusercontent.com/116703107/240808696-2e668189-0809-4def-899b-3135dfdac0a9.png)
</details>

<details>
  <summary>Unsuccessful</summary>

  * Record Doesn't Exist

  ![stats_unsuccessful](https://user-images.githubusercontent.com/116703107/240808787-a122571f-4475-4e3e-a4a6-49373115017e.png)
</details>

### Add a Tag to a User's Dream - Request/Response
<details>
  <summary>Successful</summary>

  ![add_tag_to_dream](https://user-images.githubusercontent.com/116703107/240807428-d547a138-5ba4-4a9a-b64a-1e19d71739d2.png)
</details>

### Add an Emotion to a User's Dream - Request/Response
<details>
  <summary>Successful</summary>

 ![add_emotion_to_dream](https://user-images.githubusercontent.com/116703107/240807596-7574cec8-8e89-4080-a686-e967b89bcf71.png)
</details>

### Get all Default Tags - Request/Response
<details>
  <summary>Successful</summary>

![default_tags](https://user-images.githubusercontent.com/116703107/240807760-10aef7f3-9c01-472e-97fd-204fc3e80d89.png)
</details>

### Get all Default Emotions - Request/Response
<details>
  <summary>Successful</summary>

![default_emotions](https://user-images.githubusercontent.com/116703107/240808047-0c7ddea8-ea0d-4b9f-a4de-5bdcac1e69c9.png)
</details>

### Delete a User - Request/Response
<details>
  <summary>Successful</summary>

  ![delete_user_successful](https://user-images.githubusercontent.com/116703107/240808198-24c6386e-d29f-4085-ae82-a4489f1d7604.png)
</details>

<details>
  <summary>Unsuccessful</summary>

  * Record Doesn't Exist

  ![delete_user_unsuccessful](https://user-images.githubusercontent.com/116703107/240808396-9c71ea0d-56ab-48a0-bbce-e21144e05f96.png)
</details>

### Delete a User's Dream's Emotion - Request/Response
<details>
  <summary>Successful</summary>

  ![delete_a_dream_emotion_success](https://user-images.githubusercontent.com/116703107/240809131-0529ef10-b722-476f-96f2-790ef0d3d8a6.png)
</details>

<details>
  <summary>Unsuccessful</summary>

  * Record Doesn't Exist

  ![delete_a_dream_emotion_unsuccessful](https://user-images.githubusercontent.com/116703107/240809566-6928f03f-91f4-4f36-b6e4-2eae4ef6842a.png)
</details>

### Delete a User's Dream's Tag - Request/Response
<details>
  <summary>Successful</summary>

  ![delete_a_dream_tag_success](https://user-images.githubusercontent.com/116703107/240810106-a5c51585-fc3f-462a-9d37-65c89455ba77.png)
</details>

<details>
  <summary>Unsuccessful</summary>
  
  * Record Doesn't Exist

  ![delete_a_dream_tag_unsuccessful](https://user-images.githubusercontent.com/116703107/240810304-fbe985f5-a083-4518-8c79-b323694a76ee.png)
</details>
<br />

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

<br />

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

[GraphQL]: https://img.shields.io/badge/GraphQL-E10098.svg?style=for-the-badge&logo=GraphQL&logoColor=white
[GraphQL-url]: https://github.com/graphql

[Web-mock]: https://img.shields.io/badge/-WebMock-8B0000?logo=rubygems&logoColor=white&style=for-the-badge
[Web-mock-url]: https://github.com/bblimke/webmock

[VCR]: https://img.shields.io/badge/-VCR-2F4F4F?logo=rubygems&logoColor=white&style=for-the-badge
[VCR-url]:  https://github.com/vcr/vcr

[Figaro]: https://img.shields.io/badge/-Figaro-FF4136?logo=rubygems&logoColor=white&style=for-the-badge
[Figaro-url]: https://github.com/laserlemon/figaro

[Faraday]: https://img.shields.io/badge/-Faraday-3E3E3E?logo=ruby&logoColor=white&style=for-the-badge
[Faraday-url]: https://github.com/lostisland/faraday

[Github-Actions]: https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white
[Github-Actions-url]: https://github.com/features/actions

[Rubocop]: https://img.shields.io/badge/RuboCop-000000.svg?style=for-the-badge&logo=RuboCop&logoColor=white
[Rubocop-url]: https://github.com/rubocop/rubocop

[Render]: https://img.shields.io/badge/Render-46E3B7?style=for-the-badge&logo=render&logoColor=white
[Render-url]: https://render.com/