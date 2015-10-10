
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|

  # rspec-expectations config
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # clean up carrierwave dirs
  config.after(:all) do
    if Rails.env.test? || Rails.env.cucumber?
      FileUtils.rm_rf(Dir["#{Rails.root}/public/uploads/#{Rails.env}"])
      FileUtils.rm_rf(Dir["#{Rails.root}/tmp/uploads/#{Rails.env}"])
    end
  end

end
