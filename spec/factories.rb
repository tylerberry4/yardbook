FactoryGirl.define do
  factory :user do
    sequence(:fname) {|n| "User #{n}"}
    lname 'lname'
    blurb 'blurb'
    githuburl 'site@github.com'
    twitterurl 'site@twitter.com'
    linkedinurl 'site@linkedin.com'
    imageurl 'site@image.com'
    webpage 'site@site.com'
    cohort 'Durham 2014'
    extra 'Rails Engineering'
    role 1
  end
end