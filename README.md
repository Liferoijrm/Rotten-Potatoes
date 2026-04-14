# RottenPotatoes - Rails Study Implementation

A Ruby on Rails simple implementation of the **RottenPotatoes** application, based on Chapter 4 of the *Engineering Software as a Service (ESaaS)* book. This project serves as a small study into Rails' CRUD operations, ActiveRecord, and dynamic view rendering.

## 🚀 Features

* **Full CRUD**: Create, Read, Update, and Delete movies.
* **Dynamic Sorting**: Sort movies by title or release date by clicking the table headers.
* **Persistent Highlighting**: The currently selected sorting column is highlighted using conditional CSS classes.
* **Database Seeding**: Pre-populated database with standard movie data for testing.
* **Safety Features**: 
    * Implementation of **Strong Parameters** to prevent mass-assignment vulnerabilities.
    * **Turbo-powered** deletion with confirmation dialogs.
* **DRY Code**: Uses Rails **Partials** (`_form.html.erb`) to share logic between New and Edit views.

## 🛠️ Tech Stack

* **Language**: Ruby
* **Framework**: Ruby on Rails
* **Database**: SQLite3
* **Frontend**: ERB (Embedded Ruby), CSS3, Turbo (Hotwire)

## 📋 Prerequisites

* Ruby (3.x recommended)
* Rails (latest stable)
* SQLite3

## ⚙️ Installation & Setup

1.  **Clone the repository:**
    ```bash
    git clone <your-repo-link>
    cd RottenPotatoes
    ```

2.  **Install dependencies:**
    ```bash
    bundle install
    ```

3.  **Setup the Database:**
    *Note: If on Windows, ensure your environment is correctly configured (see Windows Notes below).*
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```

4.  **Run the Server:**
    ```bash
    rails server
    ```
    Access the application at `http://localhost:3000`.

## 🪟 Windows Compatibility Notes (Survival Guide)

During development on Windows, a few hurdles were encountered and solved:

* **MSYS2/Gem Issues**: If `bundle install` fails, run `ridk install` (option 3) followed by `ridk exec pacman -Syu` to update the development toolchain.
* **Binary Execution**: Windows may not recognize files in `bin/` without extensions. Instead of `bin/rails`, use the standard `rails` command (e.g., `rails db:migrate`).
* **Linux Interoperability**: If moving between environments, you might need to run `bundle lock --add-platform x86_64-linux` to keep the Gemfile.lock compatible.
* **Advice for the Future**: Strongly consider using **WSL (Windows Subsystem for Linux)** for a smoother Ruby environment!

## 📝 Implementation Highlights

### Sorting Logic
The controller handles sorting by checking `params[:sort_by]`. If a valid column is passed, ActiveRecord handles the query:
```ruby
@movies = Movie.order(params[:sort_by])