![BrightCoders Logo](img/logo-bc.png)

# Coli-market

Coli-market is a web application for Colima state artist to publish their products and be allowed to have a greater market that they may have.

## Prerequisites

Before running the application, ensure that you have the following dependencies installed:

- Ruby (version 3.2.1)
- Ruby on Rails (version 7.0.2)
- PostgreSQL (version 14.7)

## Getting Started

To get started with the application, follow these steps:

1. Clone the repository:
   git clone https://github.com/juperameza/coli-market.git

2. Install the required gems:
   bundle install

3. Set up the database:
   rails db:create
   rails db:migrate

4. Start the Rails server:
   rails server

5. Open your web browser and visit `http://localhost:3000` to access the application.

Alternative you can use [this link](https://coli-market.onrender.com/)
## Features

- User authentication: Users can sign up, log in, and log out.
- Product management: Users can create, edit, and delete their own products.
- Product listing: Users can view a list of all active products.
- Product details: Users can view detailed information about a specific product.
- Commenting: Users can leave comments on products.
- Rating: Users can rate products on a scale of 1 to 5 stars.

## File Structure

The file structure of the application is organized as follows:
app/
├── controllers/ # Contains controllers for different application features
├── models/ # Contains model classes for database entities
├── views/ # Contains view templates for rendering HTML pages
├── ...
config/
├── database.yml # Configuration file for database connection
├── routes.rb # Defines application routes and URL mappings
├── ...
Gemfile # Lists application dependencies
README.md # Documentation file (you're reading it!)
...

## Technologies Used

- Ruby on Rails - Backend web framework
- PostgreSQL - Database management system
- HTML/CSS - Frontend markup and styling
- JavaScript - Frontend interactivity and AJAX requests
- Bootstrap - CSS framework for responsive design
- Devise - User authentication library

## Contributing

If you'd like to contribute to MyApp, please follow these steps:

1. Fork the repository on GitHub.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with descriptive commit messages.
4. Push your changes to your forked repository.
5. Submit a pull request to the original repository.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

## Acknowledgments

- [Devise](https://github.com/heartcombo/devise) - User authentication library
- [Bootstrap](https://getbootstrap.com) - CSS framework for responsive design
- [Font Awesome](https://fontawesome.com) - Icons used in the application

---
