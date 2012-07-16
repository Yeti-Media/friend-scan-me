CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJPPJMAKTH2CWFFGA',       # required
    :aws_secret_access_key  => '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',       # required
    }
  config.fog_directory  = 'friendscanme'      
end
