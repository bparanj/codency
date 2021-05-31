Tasks

1. Only published episodes must show up in the feed. 
		Enable:	Episode.published in EpisodesController index action.
2. Delete the line:
	   return 10 if true
	 before generating the real feed
3. Configure AWS credentials and bucket for populating the file size.
4. Write S3 file upload script using AWS SDK
5. Generate separate feeds for Google, Apple and other platforms if needed.
6. Find Jekyll equivalent of <%= auto_discovery_link_tag(:rss, "http://example.com") %>.
		Can it be a simple html link?
