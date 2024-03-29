file_cache_path           File.expand_path("../", __FILE__)
data_bag_path             File.expand_path("../data_bags", __FILE__)
encrypted_data_bag_secret File.expand_path("../data_bag_key", __FILE__)
cookbook_path             File.expand_path("../cookbooks", __FILE__)
role_path                 File.expand_path("../roles", __FILE__)


cache_options({ :path => File.expand_path("../cache/checksums", __FILE__), :skip_expires => true })
