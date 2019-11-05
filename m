Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA6CEFF92
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Nov 2019 15:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbfKEOWa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 Nov 2019 09:22:30 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36098 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbfKEOWa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 Nov 2019 09:22:30 -0500
Received: by mail-pf1-f196.google.com with SMTP id v19so15539187pfm.3;
        Tue, 05 Nov 2019 06:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kh0GkoV1ypwo9WTausthrxVTVhqGQ7PRqBLhScWrd34=;
        b=fNtTA1h+w0VcsBDMFdUmA77KT7OR2xINASAtTFv5/uxA2BGp4Ct+oe5VLIFKz5qMz9
         Bl4ds80b1dxZFQoESNkDg9JCq7R0pIfBoXiIABZJVNHKxF2UR6krNg0kWjCxJ/dIbJwE
         YgalM3C4KcB7ffshart6XmN1kZzKEF05ZmqhONsucmEd5ZNSmDGwfmP9NV5jgRaedYku
         SJtvvsD5NEK01jbdGAFu4REyEm2GD/4zwLifkHqmrR0NaGx+4qvvRwEU3m1q7t86LLYa
         6xeiBRx4erGqv/pzQIV6Yzx3yhW2oL9ddGyhG0R7JxTYc0XaexiTF7ZppKNOJo2DCyi1
         Lmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kh0GkoV1ypwo9WTausthrxVTVhqGQ7PRqBLhScWrd34=;
        b=BBBIgoIuLD/kgJNWd1H2W6DXZ5U+mIgBipsoeq3l+kEXefMOnkQC9bjG3bd4KwUZ9J
         YEVPdADFMlHPOlbBoSb659u9bCl4w1Tgj704kQbPGtCCxb3da6jSliYhRNqUQ9J022pf
         gVrjtFokiQGyBwpM0lGw+jZRdHsWiFMS+/DAGqSWE4JPonM2vcJ2/wTCYX05BGHFXfCh
         hq9hJG+EP8ozBSEKJK1h33m5UPsptYYqPlY0d6stk26GYv5gibwAacKGVK74Hlqw2PuQ
         aM4nwpeVIa/RSKszoGLr2tVZd7pfn39h0GdGpoMjhbxXWhLz75xUeu2yhVFERZYvBYT7
         Xntg==
X-Gm-Message-State: APjAAAUvAlv5yv54KAkwisxHUJnmGh/C7Zhh/mKUnnWpA3+AxT+fdW70
        20ZoxnTdxz5AxuSQ0lqnmwkrMKn6
X-Google-Smtp-Source: APXvYqxpiQCi2hyOgVZjsR6lTai9Q8fbectmhR81wMA6vyPaB9NcSfzGMHTGnejeJGiMPkR3UW9n3w==
X-Received: by 2002:a63:e156:: with SMTP id h22mr36201170pgk.266.1572963748724;
        Tue, 05 Nov 2019 06:22:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e59sm22997998pjk.28.2019.11.05.06.22.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 06:22:27 -0800 (PST)
Subject: Re: [PATCH] watchdog: make nowayout sysfs file writable
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20191105123125.25985-1-linux@rasmusvillemoes.dk>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <63003ae2-a789-066d-6bb5-1136ff17acbe@roeck-us.net>
Date:   Tue, 5 Nov 2019 06:22:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105123125.25985-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/5/19 4:31 AM, Rasmus Villemoes wrote:
> It can be useful to delay setting the nowayout feature for a watchdog
> device. Moreover, not every driver (notably gpio_wdt) implements a
> nowayout module parameter/otherwise respects CONFIG_WATCHDOG_NOWAYOUT,
> and modifying those drivers carries a risk of causing a regression for
> someone who has two watchdog devices, sets CONFIG_WATCHDOG_NOWAYOUT
> and somehow relies on the gpio_wdt driver being ignorant of
> that (i.e., allowing one to gracefully close a gpio_wdt but not the
> other watchdog in the system).
> 
> So instead, simply make the nowayout sysfs file writable. Obviously,
> setting nowayout is a one-way street.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>   .../ABI/testing/sysfs-class-watchdog          |  9 ++++++--
>   drivers/watchdog/watchdog_dev.c               | 22 ++++++++++++++++++-
>   2 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-watchdog b/Documentation/ABI/testing/sysfs-class-watchdog
> index 675f9b537661..9860a8b2ba75 100644
> --- a/Documentation/ABI/testing/sysfs-class-watchdog
> +++ b/Documentation/ABI/testing/sysfs-class-watchdog
> @@ -17,8 +17,13 @@ What:		/sys/class/watchdog/watchdogn/nowayout
>   Date:		August 2015
>   Contact:	Wim Van Sebroeck <wim@iguana.be>
>   Description:
> -		It is a read only file. While reading, it gives '1' if that
> -		device supports nowayout feature else, it gives '0'.
> +		It is a read/write file. While reading, it gives '1'
> +		if the device has the nowayout feature set, otherwise
> +		it gives '0'. Writing a '1' to the file enables the
> +		nowayout feature. Once set, the nowayout feature
> +		cannot be disabled, so writing a '0' either has no
> +		effect (if the feature was already disabled) or
> +		results in a permission error.
>    >   What:		/sys/class/watchdog/watchdogn/state
>   Date:		August 2015
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index dbd2ad4c9294..0c478b8f8d5a 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -452,7 +452,27 @@ static ssize_t nowayout_show(struct device *dev, struct device_attribute *attr,
>   
>   	return sprintf(buf, "%d\n", !!test_bit(WDOG_NO_WAY_OUT, &wdd->status));
>   }
> -static DEVICE_ATTR_RO(nowayout);
> +
> +static ssize_t nowayout_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t len)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +	unsigned int value, current;
> +	int ret;
> +
> +	ret = kstrtouint(buf, 0, &value);
> +	if (ret)
> +		return ret;
> +	if (value > 1)
> +		return -EINVAL;
> +	current = !!test_bit(WDOG_NO_WAY_OUT, &wdd->status);

"!!" on test_bit is unnecessary, and assigning the result to an unsigned int
doesn't really make sense. Might as well drop the variable and use test_bit
in the expression below directly.

Guenter

> +	/* nowayout cannot be disabled once set */
> +	if (current && !value)
> +		return -EPERM;
> +	watchdog_set_nowayout(wdd, value);
> +	return len;
> +}
> +static DEVICE_ATTR_RW(nowayout);
>   
>   static ssize_t status_show(struct device *dev, struct device_attribute *attr,
>   				char *buf)
> 

