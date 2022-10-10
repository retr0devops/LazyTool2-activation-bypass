<?php 

 $data = [
   "UA" => "com.vk.vkclient/12 (unknown, iPhone OS 16, iPhone, Scale/2.000000)", 
   "vpn" => [
      ], 
   "allowVkAds" => false, 
   "client_artworks" => true, 
   "hints" => false, 
   "def_buf_secs" => "60.0", 
   "migrate_lk" => true, 
   "update_button" => [
            "paid_bundle" => "com.lazytool2.enterprice222", 
            "paid_url" => "https://lazyshop.app/apps", 
            "free_url" => "https://lazyshop.app/apps" 
         ], 
   "tracksTracker" => [
               "enabled" => true, 
               "max_tracks" => 10, 
               "track_time" => 300, 
               "tries" => 5 
            ], 
   "vk_artworks" => true, 
   "fadeOut_enabled" => false, 
   "down" => null, 
   "a_s_new" => false, 
   "a_s_new2" => true, 
   "media_list_thumbs" => true, 
   "flEN" => true, 
   "aboutLazyId" => "https://teletype.in/@lazytool/Hy-S8DPFV", 
   "lazyValidator" => [
                  "trust" => $_GET["trust"], 
                  "ok" => $_GET["ok"], 
                  "betaHint" => true 
               ], 
   "migrate_timer" => false, 
   "VKMain" => [
                     "my" => [
                        "e" => true, 
                        "l" => false 
                     ], 
                     "search" => [
                           "e" => true, 
                           "l" => false 
                        ], 
                     "radio" => [
                              "e" => true, 
                              "l" => false 
                           ], 
                     "friends" => [
                                 "e" => true, 
                                 "l" => false 
                              ], 
                     "messages" => [
                                    "e" => true, 
                                    "l" => false 
                                 ], 
                     "groups" => [
                                       "e" => true, 
                                       "l" => false 
                                    ], 
                     "news" => [
                                          "e" => true, 
                                          "l" => false 
                                       ], 
                     "wall" => [
                                             "e" => true, 
                                             "l" => false 
                                          ], 
                     "liked" => [
                                                "e" => true, 
                                                "l" => false 
                                             ], 
                     "bookmarks" => [
                                                   "e" => true, 
                                                   "l" => false 
                                                ], 
                     "new_tracks" => [
                                                      "e" => true, 
                                                      "l" => false, 
                                                      "b" => "PUkLGlpXADkvD0tMBABHRDYKDhNqQBIWI0lTVFZVHwcqBA5USA" 
                                                   ], 
                     "albums" => [
                                                         "e" => true, 
                                                         "l" => true 
                                                      ], 
                     "podcasts" => [
                                                            "e" => true, 
                                                            "l" => true 
                                                         ], 
                     "popular" => [
                                                               "e" => true, 
                                                               "l" => false 
                                                            ], 
                     "popular_VK" => [
                                                                  "e" => true, 
                                                                  "l" => true, 
                                                                  "b" => "PUkLGlpXADkvD0tMBgdHRDYKDhNqQBIWI0lTVFZVHwcqBA5USA" 
                                                               ], 
                     "popular_inApp" => [
                                                                     "e" => true, 
                                                                     "l" => false 
                                                                  ], 
                     "random_playlist" => [
                                                                        "e" => true, 
                                                                        "l" => false 
                                                                     ], 
                     "recommendations" => [
                                                                           "e" => true, 
                                                                           "l" => false 
                                                                        ], 
                     "special_for_you" => [
                                                                              "e" => true, 
                                                                              "l" => false, 
                                                                              "b" => "PUkLGlpXADkvD0tMBBhJFicMDClBTRsDZFFLFVRACgopDEsL" 
                                                                           ], 
                     "recent_audio" => [
                                                                                 "e" => true, 
                                                                                 "l" => false, 
                                                                                 "b" => "PUkLGlpXADkvD0tMAxhJFicMDClBTRsDZFFLFVRACgopDEsL" 
                                                                              ], 
                     "queue" => [
                                                                                    "e" => true, 
                                                                                    "l" => false 
                                                                                 ] 
                  ] 
]; 
 
 
header("Content-Type: application/json");
echo json_encode($data);
