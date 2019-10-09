Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F53ED106D
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Oct 2019 15:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731307AbfJINnB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 9 Oct 2019 09:43:01 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:32985 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731072AbfJINnB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 9 Oct 2019 09:43:01 -0400
Received: by mail-pl1-f196.google.com with SMTP id d22so1096201pls.0;
        Wed, 09 Oct 2019 06:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4Edus/v7OUgnZTtV64pllzP4xpuDmz162zPn+6vHICQ=;
        b=cQBXV3QOipArjfvZb00WHn16UzyYvh6jngj8uALWcOjMYAGuNVXzGSqLjAdnjKZgRc
         77esMF5OqeMlqTlSItkzaLVdUZ+t5i5AxCReElLu3LUcnXQwbB1//fD4xSewcNGd5nJZ
         DGXKLyR9Dv10AFGxdk5CKKowOqoZ3NqPy2yBDye4sl9+7CcqgDGtKyGc2Kyln8/Uve8W
         Jf8nFktHv5+egEbVpEVpu3Pu4VKBdnGeF//UdKwN8fzU/amY4hNEGufCxPiPp6Kr/xKU
         UGRGG0swDhlMsuv2tHFj9VSLMQq6wT5Xiv7s0eQid2cDgGryRbsLkuxq7I5T3ZZf422F
         RHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4Edus/v7OUgnZTtV64pllzP4xpuDmz162zPn+6vHICQ=;
        b=bCfPmb5zSiVpJdiqOIKy6pnZgjC1lBu1QqZf5kZ9BiomYg/4ZdJ1NGIabQi6sHV6Bs
         PByb2+9WdLcT2FqAjHQ53dEcY/e5XtVgvzcOi3GXgAobX3nYoNrreZ1z4KCJIOc4seV9
         kjn9+XS+SStbRDln9RuFADaEm3taSXnKlWT1qfkUXM8j6fQ3WaiuaX11HPh8LPMcjP1i
         M/B50LD8ueX8EwpcG4xI/cih0r7yaYhVsiosrMAM/T91Gjrd9GmCh7SJyFqnk9M1iXu/
         GgZn0YtjW727gt96pRoPYKLsFT5inhwq3oF8272Zo4hC5drIFDBTYL9VGTDGCU55a29G
         meNQ==
X-Gm-Message-State: APjAAAUlzikyEB3CFrjU5ma02MYTylRjyhAKO6Gqw3vOfEKCp3jcAMWJ
        6ErUWMTPx54U/j06Jm9dyM0=
X-Google-Smtp-Source: APXvYqygUQnSCIshs8yBxJ1/wLFZjClbo1d/vkB6BHYgR00wYGq6lQcP6f2RjgwCoTyL9yixqiYMDg==
X-Received: by 2002:a17:902:8a96:: with SMTP id p22mr3129837plo.272.1570628580824;
        Wed, 09 Oct 2019 06:43:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ep10sm7566436pjb.2.2019.10.09.06.42.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 06:42:59 -0700 (PDT)
Subject: Re: [PATCH] watchdog: imx_sc_wdt: Pretimeout should follow SCU
 firmware format
To:     Anson Huang <Anson.Huang@nxp.com>, wim@linux-watchdog.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
References: <1570606667-16729-1-git-send-email-Anson.Huang@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <de796993-a973-1b49-05fb-303541da0a77@roeck-us.net>
Date:   Wed, 9 Oct 2019 06:42:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570606667-16729-1-git-send-email-Anson.Huang@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/9/19 12:37 AM, Anson Huang wrote:
> SCU firmware calculates pretimeout based on current time stamp
> instead of watchdog timeout stamp, need to convert the pretimeout
> to SCU firmware's timeout value.
> 
> Fixes: 15f7d7fc5542 ("watchdog: imx_sc: Add pretimeout support")
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/imx_sc_wdt.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> index 7ea5cf5..8ed89f0 100644
> --- a/drivers/watchdog/imx_sc_wdt.c
> +++ b/drivers/watchdog/imx_sc_wdt.c
> @@ -99,8 +99,14 @@ static int imx_sc_wdt_set_pretimeout(struct watchdog_device *wdog,
>   {
>   	struct arm_smccc_res res;
>   
> +	/*
> +	 * SCU firmware calculates pretimeout based on current time
> +	 * stamp instead of watchdog timeout stamp, need to convert
> +	 * the pretimeout to SCU firmware's timeout value.
> +	 */
>   	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_SET_PRETIME_WDOG,
> -		      pretimeout * 1000, 0, 0, 0, 0, 0, &res);
> +		      (wdog->timeout - pretimeout) * 1000, 0, 0, 0,
> +		      0, 0, &res);
>   	if (res.a0)
>   		return -EACCES;
>   
> 

