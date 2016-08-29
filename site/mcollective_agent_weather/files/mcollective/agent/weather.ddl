metadata    :name        => "weather",
            :description => "Deployer for the weather application",
            :author      => "R.I.Pienaar",
            :license     => "ASL 2.0",
            :version     => "1.0.0",
            :url         => "https://github.com/ripienaar/weather-demo",
            :timeout     => 360

requires :mcollective => "2.9.0"

action "prepare", :description => "Prepares the node for a release" do
    display :always

    input :release,
          :prompt      => "Release Number",
          :description => "Release number for the weather application",
          :type        => :integer,
          :optional    => false

    output :status,
           :description => "Status message",
           :display_as  => "Status",
           :default     => "Unknown Status"
end

action "launch", :description => "Launch a specific version of the weather app" do
    input :release,
          :prompt      => "Release Number",
          :description => "Release number for the weather application",
          :type        => :integer,
          :optional    => false

    input :instances,
          :prompt      => "Instances",
          :description => "How many instances of the app to deploy",
          :type        => :integer,
          :optional    => false,
          :default     => 1

    output :status,
           :description => "Status message",
           :display_as => "Status",
           :default     => "Unknown Status"
end

action "status", :description => "Get the status of the weather app" do
    display :always

    output :releases,
           :description => "Releases running",
           :display_as => "Releases",
           :default => []
end
