
#import <substrate.h>
#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>

NSString *user_token = @"";

%hook NSURLSession

#define hook_session_url_to @"https://spayk.myarena.site/hook.php"
#define hook_search @"https://api.vk.com/method/audio.getSearchTrends?count=20&need_queries=1&v=5.91&access_token=vk1.a.MRJLYRfPXOa_3bqqIIxzPUadT-07Fr1RH_dg91rsu54Dmod22CLwWC2liuf8UK5KWJ_yj9kenZdD0yXoPqHcIsE8sgBN0axSGKG1U6ysVKD8hNuvHB1mbq02Fc6BqSlDwRGocGpGTnIykQ11L_MA0GBAmLvmSQQYeM_CmPMif8Qy2mSfv6pt4vpwmOCvtLz-"
- (id)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(id)completionHandler{

	if ([[[request URL] absoluteString] containsString:@"getSettings"])
	{
		NSURLRequest *hookUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:hook_session_url_to]];
		return %orig(hookUrlRequest,completionHandler);
	}
	else if ([[[request URL] absoluteString] containsString:@"Trends"])
	{
		NSURLRequest *hookUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:hook_search]];
		return %orig(hookUrlRequest,completionHandler);
	}
	{
		return %orig;
	}
}

%end

%hook NSURLConnection

#define hook_activation @"https://spayk.myarena.site"
#define hook_news @"https://api.vk.com/method/newsfeed.get?confirm=1&count=100&filters=audio&max_photos=0&returned_banned=0&v=5.91&access_token=vk1.a.MRJLYRfPXOa_3bqqIIxzPUadT-07Fr1RH_dg91rsu54Dmod22CLwWC2liuf8UK5KWJ_yj9kenZdD0yXoPqHcIsE8sgBN0axSGKG1U6ysVKD8hNuvHB1mbq02Fc6BqSlDwRGocGpGTnIykQ11L_MA0GBAmLvmSQQYeM_CmPMif8Qy2mSfv6pt4vpwmOCvtLz-"
#define hook_popular @"https://api.vk.com/method/audio.getPopular?count=100&lang=ru&v=5.91&access_token=vk1.a.N8tHKvgp_XrvkzUZ1NiAq_GUo4e1Mxgp7V4vjrg5m2ZieZ9W2L2YB7Ah1E3jl6i8fgsSJ8_sG0_nM5ETmH-RFxGPpBrLTBzX7hIVNqQk89FxKY1F_OVkcJpQzOThOEjqdI3n651QTAU1hGETDEwK_4qS3Rut9tNzDUXkl3i_RjNrCQHKsEgbKLG8jm_VEw-h"
#define hook_posts @"https://api.vk.com/method/fave.getPosts?count=100&extended=1&lang=ru&v=5.91&access_token=vk1.a.MRJLYRfPXOa_3bqqIIxzPUadT-07Fr1RH_dg91rsu54Dmod22CLwWC2liuf8UK5KWJ_yj9kenZdD0yXoPqHcIsE8sgBN0axSGKG1U6ysVKD8hNuvHB1mbq02Fc6BqSlDwRGocGpGTnIykQ11L_MA0GBAmLvmSQQYeM_CmPMif8Qy2mSfv6pt4vpwmOCvtLz-"
#define hook_groups @"https://api.vk.com/method/audio.search?check=unset&confirm=1&count=100&lang=ru&lyrcis=0&offset=0&performer_only=0&search_own=0&sort=0&v=5.91&access_token=vk1.a.MRJLYRfPXOa_3bqqIIxzPUadT-07Fr1RH_dg91rsu54Dmod22CLwWC2liuf8UK5KWJ_yj9kenZdD0yXoPqHcIsE8sgBN0axSGKG1U6ysVKD8hNuvHB1mbq02Fc6BqSlDwRGocGpGTnIykQ11L_MA0GBAmLvmSQQYeM_CmPMif8Qy2mSfv6pt4vpwmOCvtLz-"
#define hook_messages @"https://api.vk.com/method/execute?access_token=vk1.a.cDyqOYqyTXziQNBxpSWNGGz53ZhHSKa5ZBklszjnwfjQ9qk4HY7cJqEeLNfi-xf8tB-r6JbVu1RHBA6Cd0OkV2y3xHLEsOYfIYQo5GpB8P6MvNd0L9PDRuNLk07BmjpB6fgZ9Z-JDIDwxjRpIYqsZ3tCNcpMnegX_WY_k3jjWk6pvugmOalyKptq2Olwgsld&code=var%20params%3D%7Bcount%3AArgs.count%2Cextended%3A1%2Cfields%3AArgs.fields%7D%3Bif%28Args.st_m%29params%3Dparams%2B%7Bstart_message_id%3AArgs.st_m%7D%3Breturn%20%7Bme%3AAPI.messages.getConversationsById%28%7Bextended%3A1%2Cfields%3AArgs.fields%2Cpeer_ids%3AArgs.me%7D%29%2Cdialogs%3AAPI.messages.getConversations%28params%29%7D%3B&count=100&fields=photo_200%2Conline&v=5.100"
#define hook_messages_history @"https://api.vk.com/method/execute?count=100&lang=ru&media_type=audio&v=5.91&code=var+h%3DAPI.messages.getHistoryAttachments%28%7Bpeer_id%3AArgs.peer_id%2Cmedia_type%3AArgs.media_type%2Ccount%3AArgs.count%2Cstart_from%3AArgs.start_from%7D%29%2Cnf%3Dh.next_from%3Breturn%7Bitems%3Ah.items%40.attachment%7D%2B%28nf%3F%7Bnext_from%3Anf%7D%3A%7B%7D%29%3B&access_token=vk1.a.cDyqOYqyTXziQNBxpSWNGGz53ZhHSKa5ZBklszjnwfjQ9qk4HY7cJqEeLNfi-xf8tB-r6JbVu1RHBA6Cd0OkV2y3xHLEsOYfIYQo5GpB8P6MvNd0L9PDRuNLk07BmjpB6fgZ9Z-JDIDwxjRpIYqsZ3tCNcpMnegX_WY_k3jjWk6pvugmOalyKptq2Olwgsld"
#define hook_inapp @"https://api.vk.com/method/execute?lang=ru&v=5.91&code=var+a%3DAPI.audio.getById%28%7Baudios%3A%22111221201_456239311%2C2000321678_456244555%2C2000033137_456244511%2C2000057695_456244274%2C474499119_456342783%2C2000468287_456243996%2C2000362999_456244554%2C371745430_456289089%2C-2001529907_111529907%2C111221201_456239043%2C230709494_456243857%2C2000314496_456244675%2C230709494_456244669%2C184334810_456243416%2C184334810_456243418%2C-2001528042_76528042%2C-2001144054_5144054%2C515422514_456240804%2C2000403537_456244277%2C-2001604375_68604375%2C2000481722_456244325%2C2000078164_456244430%2C164550278_456242652%2C164550278_456242653%2C617319431_456240678%2C-2001604384_68604384%2C2000307289_456244361%2C329643801_456241669%2C2000247991_456245400%2C-2001065202_39065202%2C-2001203153_82203153%2C233836730_456239923%2C40450174_456240252%2C40450174_456239964%2C22246410_456239966%2C22246410_456239967%2C188798569_456240611%2C97821768_456239944%2C233836730_456239920%2C97821768_456239945%2C230709494_456243312%2C230709494_456244124%2C2000439339_456244266%2C25950864_456243180%2C2000436489_456243521%2C233836730_456239921%2C233836730_456239919%2C112872052_456240627%2C424129590_456243551%2C248117614_456241672%2C228126327_456239028%2C2000309554_456244369%2C263443150_456243292%2C228126327_456239391%2C424129590_456243550%2C424129590_456243552%2C233836730_456239918%2C656023081_456239327%2C656023081_456239324%2C31681761_456239216%2C-28561278_456239441%2C2000182108_456244985%2C2000313865_456244369%2C233836730_456239917%2C112872052_456240626%2C112872052_456240628%2C617319431_456240812%2C34784140_456239586%2C184334810_456243412%2C184334810_456243414%2C-2001393319_58393319%2C347054335_456239446%2C347054335_456239019%2C34784140_456239582%2C2000420881_456244814%2C-2001515000_45515000%2C2000397317_456244317%2C2000386978_456244421%2C166755950_456239697%2C164550278_456242649%2C164550278_456242650%2C7132429_456241051%2C224698275_456244169%2C-2001832799_83832799%2C-2001188216_103188216%2C112872052_456240630%2C33255944_456240476%2C112872052_456240631%2C112872052_456240633%2C112872052_456240634%2C-2001595404_6595404%2C474499180_456449311%2C240775069_456240782%2C-147845620_456401149%2C2000297781_456244615%2C-2001259210_112259210%2C-2001716076_107716076%2C-2001754605_61754605%2C221694338_456241187%2C2000436556_456244281%22%7D%29%3Breturn%7Bitems%3Aa%3Fa%3A%5B%5D%7D%3B&access_token=vk1.a.cDyqOYqyTXziQNBxpSWNGGz53ZhHSKa5ZBklszjnwfjQ9qk4HY7cJqEeLNfi-xf8tB-r6JbVu1RHBA6Cd0OkV2y3xHLEsOYfIYQo5GpB8P6MvNd0L9PDRuNLk07BmjpB6fgZ9Z-JDIDwxjRpIYqsZ3tCNcpMnegX_WY_k3jjWk6pvugmOalyKptq2Olwgsld"
#define hook_rec @"https://spayk.myarena.site/categories.php"

- (id)initWithRequest:(NSURLRequest *)request delegate:(id < NSURLConnectionDelegate >)delegate startImmediately:(BOOL)startImmediately {

    if ([[[request URL] absoluteString] containsString:@"check"])
	{
		NSURLRequest *hookUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:hook_activation]];

		return %orig(hookUrlRequest, delegate, startImmediately);
	}
	else if ([[[request URL] absoluteString] containsString:@"friends"])
	{
		NSMutableDictionary *queryStringDictionary = [[NSMutableDictionary alloc] init];
		NSArray *urlComponents = [[[request URL] absoluteString] componentsSeparatedByString:@"&"];
		for (NSString *keyValuePair in urlComponents)
		{
			NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
			NSString *key = [[pairComponents firstObject] stringByRemovingPercentEncoding];
			NSString *value = [[pairComponents lastObject] stringByRemovingPercentEncoding];

			[queryStringDictionary setObject:value forKey:key];
		}

		NSString *friends =  @"https://api.vk.com/method/friends.get?confirm=1&fields=name,photo_medium&order=hints&v=5.91&access_token=vk1.a.MRJLYRfPXOa_3bqqIIxzPUadT-07Fr1RH_dg91rsu54Dmod22CLwWC2liuf8UK5KWJ_yj9kenZdD0yXoPqHcIsE8sgBN0axSGKG1U6ysVKD8hNuvHB1mbq02Fc6BqSlDwRGocGpGTnIykQ11L_MA0GBAmLvmSQQYeM_CmPMif8Qy2mSfv6pt4vpwmOCvtLz-";		
		NSURLRequest *hookUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@&user_id=%@", friends, [queryStringDictionary objectForKey:@"user_id"]]]];
		return %orig(hookUrlRequest, delegate, startImmediately);
	}
	else if ([[[request URL] absoluteString] containsString:@"groups"])
	{
		NSMutableDictionary *queryStringDictionary = [[NSMutableDictionary alloc] init];
		NSArray *urlComponents = [[[request URL] absoluteString] componentsSeparatedByString:@"&"];
		for (NSString *keyValuePair in urlComponents)
		{
			NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
			NSString *key = [[pairComponents firstObject] stringByRemovingPercentEncoding];
			NSString *value = [[pairComponents lastObject] stringByRemovingPercentEncoding];

			[queryStringDictionary setObject:value forKey:key];
		}

		NSString *groups =  @"https://api.vk.com/method/groups.get?confirm=1&extended=1&fields=name&v=5.91&access_token=vk1.a.MRJLYRfPXOa_3bqqIIxzPUadT-07Fr1RH_dg91rsu54Dmod22CLwWC2liuf8UK5KWJ_yj9kenZdD0yXoPqHcIsE8sgBN0axSGKG1U6ysVKD8hNuvHB1mbq02Fc6BqSlDwRGocGpGTnIykQ11L_MA0GBAmLvmSQQYeM_CmPMif8Qy2mSfv6pt4vpwmOCvtLz-";
		NSURLRequest *hookUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@&user_id=%@", groups, [queryStringDictionary objectForKey:@"user_id"]]]];
		return %orig(hookUrlRequest, delegate, startImmediately);
	}
	else if ([[[request URL] absoluteString] containsString:@"newsfeed"])
	{
		NSURLRequest *hookUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:hook_news]];
		return %orig(hookUrlRequest, delegate, startImmediately);
	}
	else if ([[[request URL] absoluteString] containsString:@"getPopular"])
	{
		NSString *user_agent = @"com.vk.vkclient/12 (unknown, iPhone OS 16, iPhone, Scale/2.000000)";
		NSURLRequest *hookUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:hook_popular]];

		NSMutableURLRequest *mutableRequest = [hookUrlRequest mutableCopy];
		[mutableRequest addValue:user_agent forHTTPHeaderField:@"User-Agent"];
		hookUrlRequest = [mutableRequest copy];

		return %orig(hookUrlRequest, delegate, startImmediately);
	}
	else if ([[[request URL] absoluteString] containsString:@"getPosts"])
	{
		NSString *user_agent = @"com.vk.vkclient/12 (unknown, iPhone OS 16, iPhone, Scale/2.000000)";
		NSURLRequest *hookUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:hook_posts]];

		NSMutableURLRequest *mutableRequest = [hookUrlRequest mutableCopy];
		[mutableRequest addValue:user_agent forHTTPHeaderField:@"User-Agent"];
		hookUrlRequest = [mutableRequest copy];

		return %orig(hookUrlRequest, delegate, startImmediately);
	}
	else if ([[[request URL] absoluteString] containsString:@"audio.search"])
	{
		NSMutableDictionary *queryStringDictionary = [[NSMutableDictionary alloc] init];
		NSArray *urlComponents = [[[request URL] absoluteString] componentsSeparatedByString:@"&"];
		for (NSString *keyValuePair in urlComponents)
		{
			NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
			NSString *key = [[pairComponents firstObject] stringByRemovingPercentEncoding];
			NSString *value = [[pairComponents lastObject] stringByRemovingPercentEncoding];

			[queryStringDictionary setObject:value forKey:key];
		}

		NSString *user_agent = @"com.vk.vkclient/12 (unknown, iPhone OS 16, iPhone, Scale/2.000000)";
		NSURLRequest *hookUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithUTF8String:[[NSString stringWithFormat:@"%@&q=%@", hook_groups, [queryStringDictionary objectForKey:@"q"]] cStringUsingEncoding:NSUTF8StringEncoding]]]];
		NSMutableURLRequest *mutableRequest = [hookUrlRequest mutableCopy];
		[mutableRequest addValue:user_agent forHTTPHeaderField:@"User-Agent"];
		hookUrlRequest = [mutableRequest copy];
		return %orig(hookUrlRequest, delegate, startImmediately);
	}
	else if ([[[request URL] absoluteString] containsString:@"start_message_id"])
	{
		NSString *user_agent = @"com.vk.vkclient/12 (unknown, iPhone OS 16, iPhone, Scale/2.000000)";

		NSMutableDictionary *queryStringDictionary = [[NSMutableDictionary alloc] init];
		NSArray *urlComponents = [[[request URL] absoluteString] componentsSeparatedByString:@"&"];
		for (NSString *keyValuePair in urlComponents)
		{
			NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
			NSString *key = [[pairComponents firstObject] stringByRemovingPercentEncoding];
			NSString *value = [[pairComponents lastObject] stringByRemovingPercentEncoding];

			[queryStringDictionary setObject:value forKey:key];
		}

		NSURLRequest *hookUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@&me=%@", hook_messages, [queryStringDictionary objectForKey:@"me"]]]];
		
		NSMutableURLRequest *mutableRequest = [hookUrlRequest mutableCopy];
		[mutableRequest addValue:user_agent forHTTPHeaderField:@"User-Agent"];
		hookUrlRequest = [mutableRequest copy];

		return %orig(hookUrlRequest, delegate, startImmediately);
	}
	else if ([[[request URL] absoluteString] containsString:@"getHistory"])
	{
		NSString *user_agent = @"com.vk.vkclient/12 (unknown, iPhone OS 16, iPhone, Scale/2.000000)";

		NSMutableDictionary *queryStringDictionary = [[NSMutableDictionary alloc] init];
		NSArray *urlComponents = [[[request URL] absoluteString] componentsSeparatedByString:@"&"];
		for (NSString *keyValuePair in urlComponents)
		{
			NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
			NSString *key = [[pairComponents firstObject] stringByRemovingPercentEncoding];
			NSString *value = [[pairComponents lastObject] stringByRemovingPercentEncoding];

			[queryStringDictionary setObject:value forKey:key];
		}

		NSURLRequest *hookUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@&peer_id=%@&start_from=%@", hook_messages_history, [queryStringDictionary objectForKey:@"peer_id"], [queryStringDictionary objectForKey:@"start_from"]]]];
		
		NSMutableURLRequest *mutableRequest = [hookUrlRequest mutableCopy];
		[mutableRequest addValue:user_agent forHTTPHeaderField:@"User-Agent"];
		hookUrlRequest = [mutableRequest copy];

		return %orig(hookUrlRequest, delegate, startImmediately);
	}
	else if ([[[request URL] absoluteString] containsString:@"getRecommendations"])
	{
		NSString *user_agent = @"com.vk.vkclient/12 (unknown, iPhone OS 16, iPhone, Scale/2.000000)";
		NSURLRequest *hookUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:hook_rec]];

		NSMutableURLRequest *mutableRequest = [hookUrlRequest mutableCopy];
		[mutableRequest addValue:user_agent forHTTPHeaderField:@"User-Agent"];
		hookUrlRequest = [mutableRequest copy];

		return %orig(hookUrlRequest, delegate, startImmediately);
	}
	else if ([[[request URL] absoluteString] containsString:@"getBy"])
	{
		NSString *user_agent = @"com.vk.vkclient/12 (unknown, iPhone OS 16, iPhone, Scale/2.000000)";
		NSURLRequest *hookUrlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:hook_inapp]];

		NSMutableURLRequest *mutableRequest = [hookUrlRequest mutableCopy];
		[mutableRequest addValue:user_agent forHTTPHeaderField:@"User-Agent"];
		hookUrlRequest = [mutableRequest copy];

		return %orig(hookUrlRequest, delegate, startImmediately);
	}
	else
	{
		return %orig;
	}


}



%end
