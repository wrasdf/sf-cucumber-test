After do |scenario|
  begin
    if ENV['HEADLESS'] == 'true'
      embed_screenshot("screehshot=#{Time.new.to_i}") if scenario.failed?
    end
  end
end
