Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFF76103F7D
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Nov 2019 16:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730694AbfKTPoY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Nov 2019 10:44:24 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36961 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732354AbfKTPoT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Nov 2019 10:44:19 -0500
Received: by mail-pj1-f67.google.com with SMTP id f3so17643pjg.4
        for <linux-watchdog@vger.kernel.org>; Wed, 20 Nov 2019 07:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PyDTHBjAR6yyT/O4jEQJ9VzoeIf0hQTSwp0zJileVO8=;
        b=uidh5Ty6bmufSPXQhcNOmJhIv+SGWXGo/HKqV/dzEIbjRzIeAxhrvoGowVwbSps325
         JuOJnj3hAqwEOBREl+tAMt/IIq8Uw5E4XF1ozXny5liYBxjBU779Uy98in9RxNSDXLW8
         kkAspVcOo82fwA0BQFoatm9s/vEjHZttqDS+kwTNWKkvzTrBK16y6H2tpePNJ0nBjaJc
         fXXhQzDEx0zESY7c+jRri8xOeypOPbEhIgEknRr/bf63BWcbkbBQOkQdv0ceB1CekJc2
         5w6aCLDd08ZYdQzJLyva83OoWOGWye6UjVbDeyGCN2GFjyKFfRwJlNJvpRSL1gTZsuOm
         429Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PyDTHBjAR6yyT/O4jEQJ9VzoeIf0hQTSwp0zJileVO8=;
        b=Ev72o6K6hda8gnJv9OUHHt1AKBZ6slzesNDSX1/hINaz7N/qvqB7M/kcv7Mm0L91p7
         yh3Zq54kbbg7GKL7d32do6/GJ5HcDhEcD0H7XqTDOp4ALC/dTaKJu0QT6JMePmyaZPSH
         0Palx5t7N1LNtw94MxiIZsYQyp2q3sr9X1j7DrYYDCIOm3qI0sDdB+tp7A/c5LNmjFI8
         q5qELQGq9AXVIGoSE6vcRHnspWQXpLo/SI4XJJ85apgOm0w9cvNrSfWt0ZXsz1F8dwQu
         YV5eAHJp/ri3/jsl9ikzQKQyKwIMEp4uYYjVWuLVSCyoyaIx2zFGVRbjLFxF1DcAIhkc
         grfQ==
X-Gm-Message-State: APjAAAXDncajDVBTXfybdQa8XEWf4lK7bqaCgMDOlkjBse02b9UGp3a/
        t+M9eia8C9K4UegMvmKbnFccagWY
X-Google-Smtp-Source: APXvYqwuH7ADq4cWg7gjA3cYRKEnR7e0BOF3nnpRTNLDH+OC00rfuik3TaRHlFNirjar6sfunyyRBA==
X-Received: by 2002:a17:90a:fa02:: with SMTP id cm2mr4721255pjb.141.1574264657970;
        Wed, 20 Nov 2019 07:44:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 125sm29555120pfu.136.2019.11.20.07.44.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Nov 2019 07:44:16 -0800 (PST)
Subject: Re: [PATCH] watchdog: imx7ulp: Fix missing conversion of
 imx7ulp_wdt_enable()
To:     Fabio Estevam <festevam@gmail.com>
Cc:     wim@linux-watchdog.org, linux-imx@nxp.com,
        linux-watchdog@vger.kernel.org
References: <20191120140916.25001-1-festevam@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <00cb2b20-0793-77ad-d80c-11f8a8ec972a@roeck-us.net>
Date:   Wed, 20 Nov 2019 07:44:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191120140916.25001-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/20/19 6:09 AM, Fabio Estevam wrote:
> Since commit 747d88a1a88c1b ("watchdog: imx7ulp: Pass the wdog instance in
> imx7ulp_wdt_enable()") imx7ulp_wdt_enable() accepts a watchdog_device
> structure, so fix one instance that missed such conversion.
> 
> This also fixes the following sparse warning:
> 
> drivers/watchdog/imx7ulp_wdt.c:115:31: warning: incorrect type in argument 1 (different address spaces)
> drivers/watchdog/imx7ulp_wdt.c:115:31:    expected struct watchdog_device *wdog
> drivers/watchdog/imx7ulp_wdt.c:115:31:    got void [noderef] <asn:2>*base
> 
> Fixes: 747d88a1a88c1 ("watchdog: imx7ulp: Pass the wdog instance inimx7ulp_wdt_enable()")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/imx7ulp_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 0a87c6f4bab2..11b9e7c6b7f5 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -112,7 +112,7 @@ static int imx7ulp_wdt_restart(struct watchdog_device *wdog,
>   {
>   	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
>   
> -	imx7ulp_wdt_enable(wdt->base, true);
> +	imx7ulp_wdt_enable(wdog, true);
>   	imx7ulp_wdt_set_timeout(&wdt->wdd, 1);
>   
>   	/* wait for wdog to fire */
> 

