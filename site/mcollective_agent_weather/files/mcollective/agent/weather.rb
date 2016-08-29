module MCollective
  module Agent
    class Weather<RPC::Agent
      action "prepare" do
        reply[:status] = run("/bin/docker pull quay.io/ripienaar/weather:%d" % request[:release])
      end

      action "launch" do
        status = run("/bin/docker pull quay.io/ripienaar/weather:%d" % request[:release])

        reply.fail!("Could not fetch weather release %d" % request[:release]) unless status == 0

        existing = []
        status = run("/bin/docker ps -f name=weather -q", :stdout => existing, :chomp => true)

        reply.fail!("Could not fetch existing weather instances") unless status == 0

        existing.each do |id|
          Log.info("Deleting weather instance %s" % id)
          status = run("/bin/docker kill %s" % id)
          reply.fail!("Could not kill weather instances %s" % id) unless status == 0
          status = run("/bin/docker rm %s" % id)
          reply.fail!("Could not rm weather instances %s" % id) unless status == 0
        end

        request[:instances].times do |instance|
          cmd = [
            "/bin/docker",
            "run",
            "-e FORECAST_API=%s" % Facts["forecast_key"],
            "-e FORECAST_LON=35.897778",
            "-e FORECAST_LAT=14.5125",
            "-e FORECAST_LOCATION=\"Valletta, Malta\"",
            "-p 9292",
            "-d",
            "--name weather.%d" % instance,
            "--restart always",
            "quay.io/ripienaar/weather:%d" % request[:release]
          ]

          status = run(cmd.join(" "))
          reply.fail!("Could not start weather instances %d" % instance) unless status == 0
        end

        reply[:status] = "Deployed %d instances of weather:%d" % [request[:instances], request[:release]]
      end

      action "status" do
        reply[:releases] = []

        existing = []
        status = run("/bin/docker ps -f name=weather --format \"{{.ID}}\t{{.Image}}\t{{.Names}}\"", :stdout => existing, :chomp => true)

        existing.each do |running|
          id, image, name = running.split("\t")

          reply[:releases] << {"id" => id, "image" => imgage, "name" => name}
        end
      end
    end
  end
end
