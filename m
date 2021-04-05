Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5063542FD
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Apr 2021 16:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236061AbhDEOtW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 5 Apr 2021 10:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235948AbhDEOtV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 5 Apr 2021 10:49:21 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88572C061756
        for <linux-watchdog@vger.kernel.org>; Mon,  5 Apr 2021 07:49:15 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id v25so11843611oic.5
        for <linux-watchdog@vger.kernel.org>; Mon, 05 Apr 2021 07:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Eb3T+cGKWpdh70qCJxM/QeswneGdDjUmPjqhhRYFeQc=;
        b=ogjp4Ht1+2kTmOfAWs+QkavhVjM/x/JM9qzgQDv8vGF+CDqfhatlA0HUCrNzWzhWwq
         9oBS2pw98CRQsEeDMHaELrFZ/tRNAZvT3cdQ5m5PYn174pjSphIny7v68Tv+xSf7AyxO
         4bKlJH3JhTdsHgOH/wtVulSJ9cAzpeLX1XqxtWbcEshx1NtOsw2bcqgNsdCEztm0/+LY
         i/idqKkuzKW1Gbumo7KDGWVdnS7EDPt0sQ1uw00kakVEw3nkHt0m4c4av2ZEZwXUoBp1
         skJpeSj+15SGh/be+BDTD6WxZcISPojKDEQnvOoEJr1MGB8OamNkypZmY35L5rMwyE9d
         r+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Eb3T+cGKWpdh70qCJxM/QeswneGdDjUmPjqhhRYFeQc=;
        b=Sw/o3DzlghzRuY9DF1sJwwkOI5UTLOEHssZAMuMu2n1HHFW9QGPh+OzFPEM8/0zmsv
         2l9R1DGWdAC8L2SS8wojUN4gorRut8bMYbTNaWYkludy/w7hgOLMU8l7J2lyIZ4GQlws
         0/UBjmNHSX2E1CG6BieZObKMgMyyD5ldGLnwrAzjHeMQqMsZiswnykLlUGfnuSUfneJs
         pKPZDQlGmZ5Y/wIqRnWo2Pylv0+eQBpv4p3JNteg//WXtwXKCZ7wMytqyFrBary3PHE8
         fmYZokA301aNXd1XrobGggGl0x7yOQgyMTEXbnkKS1eJDtiedCV75rdJNf3dNiO0TyDX
         U8jA==
X-Gm-Message-State: AOAM532xKWHl9Sth/fasLxmQQN5toq1u8C5/RsKZr9Z8Q1gJCt9/phs4
        UU94yEuiuybJmuy7UFbVaCg=
X-Google-Smtp-Source: ABdhPJyuYXEgSSr4Z68eFnNWT9K0I2a3DJUYZN433BHBn8WURVCuhCecBSprsJnaZ/LowFvEgX6vBg==
X-Received: by 2002:a54:4799:: with SMTP id o25mr18318740oic.20.1617634155037;
        Mon, 05 Apr 2021 07:49:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n10sm3943567otj.36.2021.04.05.07.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 07:49:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: meson_wdt: Use device_get_match_data() helper
To:     Tian Tao <tiantao6@hisilicon.com>, wim@linux-watchdog.org,
        khilman@baylibre.com
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <1617243921-56774-1-git-send-email-tiantao6@hisilicon.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <61aa8bab-4282-3264-ccae-2b7284f4c9ec@roeck-us.net>
Date:   Mon, 5 Apr 2021 07:49:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617243921-56774-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/31/21 7:25 PM, Tian Tao wrote:
> Use the device_get_match_data() helper instead of open coding.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/meson_wdt.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/watchdog/meson_wdt.c b/drivers/watchdog/meson_wdt.c
> index 459f3ae..539feaa 100644
> --- a/drivers/watchdog/meson_wdt.c
> +++ b/drivers/watchdog/meson_wdt.c
> @@ -162,7 +162,6 @@ static int meson_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct meson_wdt_dev *meson_wdt;
> -	const struct of_device_id *of_id;
>  	int err;
>  
>  	meson_wdt = devm_kzalloc(dev, sizeof(*meson_wdt), GFP_KERNEL);
> @@ -173,12 +172,7 @@ static int meson_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(meson_wdt->wdt_base))
>  		return PTR_ERR(meson_wdt->wdt_base);
>  
> -	of_id = of_match_device(meson_wdt_dt_ids, dev);
> -	if (!of_id) {
> -		dev_err(dev, "Unable to initialize WDT data\n");
> -		return -ENODEV;
> -	}
> -	meson_wdt->data = of_id->data;
> +	meson_wdt->data = device_get_match_data(dev);
>  
>  	meson_wdt->wdt_dev.parent = dev;
>  	meson_wdt->wdt_dev.info = &meson_wdt_info;
> 

