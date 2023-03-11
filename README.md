# Building Pages

Project: Building Pages
We are looking to rebuild our building pages! We've decided to work with you on this project and let you take the lead engineer role. Our product team has met with our property managers and have gathered details about what they are looking for in their building pages.

They determined the following is needed in the build.

A list page of all the buildings in their portfolio
Individual pages for each building that contain the following information:

- The Building’s Name
- The Building’s Address
- A Map View of the Building
- A List of the Building’s Policies
- A list of apartments active for rent / sale
- Each listing should have a unit # and a price
- A contact form for the apartment

A couple of notes:
The webpage should be responsive - working in both web and mobile views
Information and files located at https://drive.google.com/drive/folders/1RPTLmCr_LePij5AjsxZrJKKFfTDq9zX1?usp=sharing.
Please try to follow the designs to the best of your ability. Feel free to reach out with any questions about them.
Do not sweat the actual information. Feel free to make up your own values.

### Extra Items:
- Autocomplete


### Techs
- Ruby on Rails
- Tailwind CSS
- MySQL
- React
- esbuild
- ChatGPT for refactor code
- Docker

### Remaining Tasks and Bugs
- Slider fix for sample building images
- Submit form for schedule a visit
- Show amenities of apartment
- Google Map issue


### First setup

```
docker compose up --build
docker-compose exec web rails db:migrate
docker-compose exec web rails db:seed
```


### Test account

john@gmail.com / topsecret
