# Crawler-VPN
Multi-threading crawler to crawl Google search including VPN wrapper

<div align="center">
  <img src="https://smhttp-ssl-23575.nexcesscdn.net/80ABE1/sflashrouters/media/catalog/category/expressvpn-700px2.png" width="300"><br><br>
</div>

Full bash documentation: [https://www.expressvpn.com/support/vpn-setup/app-for-linux/](https://www.expressvpn.com/support/vpn-setup/app-for-linux/)

Please refer to [https://www.expressvpn.com/support/vpn-setup/app-for-linux/#download](https://www.expressvpn.com/support/vpn-setup/app-for-linux/#download)

but before that,
```bash
pip3 install bs4 newspaper3k fake_useragent
```

in main.py
```python
# you can put any limit, up until million of VPN activated
# you can put any SQL keywords, replaced 'selangor'
google_news_run('selangor', limit=100, year_start=2016, year_end=2018, debug=False, sleep_time_every_ten_articles=0)
```

in core.py
```python
outputs = run_parallel_in_threads(get_article, links)
# after this line, put any unstructured database like mongo / dynamo
```

## Output
```text
2018-01-13 13:17:01,457 - DEBUG - Starting new HTTP connection (1): malaysiandigest.com
2018-01-13 13:17:01,458 - DEBUG - Starting new HTTPS connection (1): www.thestar.com.my
2018-01-13 13:17:01,461 - DEBUG - Starting new HTTPS connection (1): www.thestar.com.my
2018-01-13 13:17:01,461 - DEBUG - Starting new HTTPS connection (1): www.thestar.com.my
2018-01-13 13:17:01,462 - DEBUG - Starting new HTTPS connection (1): www.fourfourtwo.com
2018-01-13 13:17:01,463 - DEBUG - Starting new HTTPS connection (1): www.thestar.com.my
2018-01-13 13:17:01,464 - DEBUG - Starting new HTTPS connection (1): www.thestar.com.my
2018-01-13 13:17:01,465 - DEBUG - Starting new HTTP connection (1): www.themalaymailonline.com
2018-01-13 13:17:01,467 - DEBUG - Starting new HTTPS connection (1): www.thestar.com.my
2018-01-13 13:17:01,468 - DEBUG - Starting new HTTPS connection (1): www.thestar.com.my
2018-01-13 13:17:01,572 - DEBUG - http://malaysiandigest.com:80 "GET /frontpage/29-4-tile/712625-mahathir-returning-his-selangor-royal-awards-doesn-t-impress-anyone-here-s-m-sians-want-him-to-return.html HTTP/1.1" 200 None
2018-01-13 13:17:01,777 - DEBUG - https://www.thestar.com.my:443 "GET /sport/football/2016/05/08/selangor-in-good-spirits-ahead-of-tampines-clash/ HTTP/1.1" 200 None
2018-01-13 13:17:01,837 - DEBUG - https://www.thestar.com.my:443 "GET /news/nation/2017/05/31/selangor-sultan-angry-disappointed-with-subang-mp/ HTTP/1.1" 200 None
2018-01-13 13:17:01,849 - DEBUG - https://www.thestar.com.my:443 "GET /news/nation/2017/12/07/selangor-sultan-angry-and-disappointed-with-zaids-remarks/ HTTP/1.1" 200 None
2018-01-13 13:17:01,866 - DEBUG - https://www.thestar.com.my:443 "GET /news/nation/2017/10/16/selangor-sultan-withdraws-zamihan-preaching-credentials/ HTTP/1.1" 200 None
2018-01-13 13:17:01,879 - DEBUG - https://www.thestar.com.my:443 "GET /sport/football/2017/05/07/singapore-side-edge-selangor-selection-to-retain-sultan-of-selangors-cup/ HTTP/1.1" 200 None
2018-01-13 13:17:02,334 - DEBUG - https://www.thestar.com.my:443 "GET /news/nation/2016/10/31/selangor-mb-announces-rm3_45bil-for-state-budget/ HTTP/1.1" 200 None
2018-01-13 13:17:02,384 - DEBUG - https://www.thestar.com.my:443 "GET /news/nation/2017/11/30/selangor-claims-conspiracy-after-remand/ HTTP/1.1" 200 None
```
