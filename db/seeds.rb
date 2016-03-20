Mechanic.create!([
  {uid: nil, name: "Jake", email: "jake@test.com", encrypted_password: "$2a$10$IvEibvJM5ZKc5Io5zL.FtuG8a.KT05UIk3eYWMCnPWL0e98545w0e", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-03-20 02:26:26", last_sign_in_at: "2016-03-20 02:25:12", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
  {uid: nil, name: "Mike", email: "mike@test.com", encrypted_password: "$2a$10$l3BGTutwQQncy6laveWuo.DFlS4mdYhvIzyZz.SLk2qK36/t9Tvhq", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-03-20 02:25:55", last_sign_in_at: "2016-03-20 02:25:55", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
  {uid: nil, name: "Sean", email: "sean@test.com", encrypted_password: "$2a$10$30POo21RpXvRHNnfrgyDJOHK.iqB1FZT5aenUicO4EFuEFh01efhq", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-03-20 02:26:15", last_sign_in_at: "2016-03-20 02:26:15", current_sign_in_ip: "::1", last_sign_in_ip: "::1"}
])
Customer.create!([
  {name: "Judy"},
  {name: "Laura"},
  {name: "Thomas"},
  {name: "Jennifer"},
  {name: "Eric"},
  {name: "Bryan"},
  {name: "Arnie"},
  {name: "James"}
])
Job.create!([
  {mechanic_id: 1, customer_id: 1},
  {mechanic_id: 2, customer_id: 4},
  {mechanic_id: 3, customer_id: 6},
  {mechanic_id: 1, customer_id: 5},
  {mechanic_id: 2, customer_id: 8},
  {mechanic_id: 3, customer_id: 3}
])
WorkOrder.create!([
  {description: "Alignment", price: 89, job_id: 1, status: 1},
  {description: "Front Brake Drums", price: 299, job_id: 1, status: 0},
  {description: "Replace Windshield", price: 399, job_id: 1, status: 0},
  {description: "Oil Change", price: 27, job_id: 2, status: 1},
  {description: "Spark Plugs", price: 79, job_id: 3, status: 1},
  {description: "Coolant Flush", price: 139, job_id: 3, status: 1},
  {description: "Struts", price: 399, job_id: 4, status: 1},
  {description: "New Tires", price: 375, job_id: 4, status: 1},
  {description: "Muffler", price: 198, job_id: 5, status: 0},
  {description: "Transmission Fluid", price: 75, job_id: 5, status: 0},
  {description: "Wiper Blades", price: 25, job_id: 6, status: 0},
  {description: "Battery", price: 90, job_id: 6, status: 0}
])
