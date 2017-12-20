# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Donation.destroy_all
Fund.destroy_all
Organization.destroy_all


health = Fund.find_or_create_by!(
  category: 'Health/Human Services'
)

education = Fund.find_or_create_by!(
  category: 'Education'
)

animals = Fund.find_or_create_by!(
  category: 'Animals'
)

p "created #{Fund.count} funds!"



org1 = Organization.create!(
  funds: [health],
  name: 'Better Way of Miami',
  category: 'Health/Human Services',
  address: '800 NW 28 Street Miami, FL 33127',
  description: 'Better Way of Miami Inc., a non-profit community based organization, is committed to providing shelter, residential care, treatment, housing, and services on a continuum to indigent, homeless, and addicted persons and those with co-occurring disorders, their families and supporters, in order to maximize their chances for a productive, healthy and fulfilling life in recovery.',
  website: 'http://betterwaymiami.org'
)

org2 = Organization.create!(
  funds: [health],
  name: 'Amigos for Kids',
  category: 'Health/Human Services',
  address: '2153 Coral Way, Suite 405 Miami, FL 33145',
  description: 'Amigos For Kids is a nonprofit organization dedicated to preventing child abuse and neglect by valuing children, strengthening families and educating communities.',
  website: 'http://www.amigosforkids.org'
)

org3 = Organization.create!(
  funds: [health],
  name: 'Miami Diaper Bank',
  category: 'Health/Human Services',
  address: '4770 Biscayne Blvd Suite 980 Miami, FL 33137',
  description: 'In lieu of a comprehensive national poverty policy to specifically address this need, which can take years to realize, the Miami Diaper Bank works locally to provide immediate relief, filling the gap in resources by fundraising as well as collecting and distributing diapers and diaper supplies to local institutions designed to support low-income and poverty-stricken families care for their children. Our goal is to keep South Florida babies clean, dry and healthy!',
  website: 'http://www.miamidiaperbank.com'
)

org4 = Organization.create!(
  funds: [education],
  name: '100 Black Men of South Florida',
  category: 'Education',
  address: '5825 Sunset Dr Ste. 201 South Miami, FL 33143-5222',
  description: 'To improve the quality of life of our communities and enhance educational and economic opportunities for all African Americans',
  website: 'http://www.100blackmensf.org'
)

org5 = Organization.create!(
  funds: [education],
  name: 'CODEART',
  category: 'Education',
  address: '6440 SW 98TH St. Miami, FL 33156',
  description: 'Our mission is to increase the number of girls studying computer science by delighting and inspiring them with the creative possibilities of computer programming. We use art to inspire girls in grades 4-12 to code! We hold workshops where we teach students how to write computer programs to generate art and hold an annual event, Code/Art Miami, where student computer-generated art is displayed and awards are given for the top coded art submissions.',
  website: 'http://www.code-art.com'
)

org6 = Organization.create!(
  funds: [education],
  name: 'Shake-a-Leg Miami',
  category: 'Education',
  address: '2620 S Bayshore Dr Coconut Grove, FL 33133-5424',
  description: 'Our Mission is to use the marine environment to improve the health, education and independence of people with disabilities, disadvantaged youth and their families.',
  website: 'http://shakealegmiami.org'
)

org7 = Organization.create!(
  funds: [animals],
  name: 'The Cat Network',
  category: 'Animals',
  address: 'PO BOX 347228 Coral Gables, FL 33234-7228',
  description: 'The Cat Network, Inc. (CN) is a 501(c)3, Florida not-for-profit corporation dedicated to humanely reducing cat overpopulation by educating the public about the need to sterilize their pets and strays; providing access to low-cost spay/neuter services for stray, homeless and abandoned cats; helping members in their efforts to place adoptable cats in loving homes; and advocating non-lethal population control and humane public policy.',
  website: 'http://www.thecatnetwork.org'
)

org8 = Organization.create!(
  funds: [animals],
  name: 'Everglades Angels Dog Rescue',
  category: 'Animals',
  address: '2637 E. Atlantic Blvd # 269 Pompano Beach, FL 33062',
  description: 'Everglades Angels Dog Rescue is a Non Profit 100% Volunteer organization. Our Mission is to end the suffering of thousands of abandoned dogs in the Everglades. Our goal is to treat the rescued dogs medically, including sterilization and microchip identification. Also, to provide psychological training and placement in qualified homes. Our organization is unique because our dedication is to all dogs that have no shelter, food, and no chance of survival. We seek out the tortured, sick and debilitated dogs, in the most remote areas of Florida. Everglades Angels Dog Rescue solely survives on donations, please help us spread our mission.',
  website: 'http://www.evergladesangelsdogrescue.org/'
)

org9 = Organization.create!(
  funds: [animals],
  name: 'Pet Project for Pets',
  category: 'Animals',
  address: '2200 NW 9th Avenue Wilton Manors, FL 33311',
  description: 'The Pet Project for Pets is a nonprofit organization that provides pet food, pet supplies , pet vaccines and reduced cost veterinarian care to individuals who are financially challenged due to a terminal illness, disability, aging, (seniors) or victims of crime so that they can “KEEP THEIR PETS AND PROVIDE FOR THEM”',
  website: 'http://www.thepetprojectfl.org'
)

p "created #{Organization.count} organizations!"


samantha_peanuts = 
  DonorLogin.find_by(
    first_name: "Samantha",
    last_name: "Peanuts",
    email: "samantha@peanuts.com"
    ) || 
  DonorLogin.create!(
    first_name: "Samantha",
    last_name: "Peanuts",
    email: "samantha@peanuts.com",
    password: 'PASSWORD',
  )

peter_segal = 
  DonorLogin.find_by(
    first_name: "Peter",
    last_name: "Segal",
    email: "peter@segal.com",
    ) ||
  DonorLogin.create!(
    first_name: "Peter",
    last_name: "Segal",
    email: "peter@segal.com",
    password: 'PASSWORD',
  )

10.times do
  fund = Fund.all.sample
  donation = Donation.create!(
    amount: (rand * (1-1000) + 1000).round(2), 
    fund: fund,
    donor_login: samantha_peanuts,
  )
end

10.times do
  fund = Fund.all.sample
  donation = Donation.create!(
    amount: (rand * (1-1000) + 1000).round(2), 
    fund: fund,
    donor_login: peter_segal,
  )
end

p "#{samantha_peanuts.first_name} now has #{samantha_peanuts.donations.count} donations"
p "#{peter_segal.first_name} now has #{peter_segal.donations.count} donations"