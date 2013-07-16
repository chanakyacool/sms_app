path = File.join(Rails.root, "config/twilio.yml")
TWILIO_CONFIG = YAML.load(File.read(path))[Rails.env] || {'sid' => 'ACa92bccd6de96ced50b755b2818baf0c9', 'from' => '+17542273900', 'token' => '8eb0ae36e8c6f68649f95bf326738f35'}

