Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8CAE3C14CA
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Jul 2021 16:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbhGHODB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 8 Jul 2021 10:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbhGHODB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 8 Jul 2021 10:03:01 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0B0C061574
        for <linux-watchdog@vger.kernel.org>; Thu,  8 Jul 2021 07:00:18 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 59-20020a9d0ac10000b0290462f0ab0800so5885500otq.11
        for <linux-watchdog@vger.kernel.org>; Thu, 08 Jul 2021 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oOm91dBbJz5JuW3PcbRszHoTT41rzGvgpclEMlI/5LE=;
        b=IKh6WN1Pm/qeIWCh8oIi7G2HmwjIQloRB+Grp44RV7cI0otO2kmzWwjSHKmKTL0v4+
         HO5U4heJCmSuUeOaHl5/ukEkONqEobB6JSo2TiL2UuAQ6E+VqYOYEIKxSwb30x9jwi3l
         XXO35TcgcCkjBRX3I43XyOXm0o/kuxeDnCF8W2foR2G10Aiasks8NM+NsxOwMdhU1bs/
         0sr4EsFmHGZaPdrqii0Ik6ju11jHCMhtPqcmhGSFBipJBOfpARHB+VcojWoGzkxuC2ll
         DbyW9BeU9mSrGu+yXhnNIV6tBauN66CvxqmrBaDNI3Qb+AK75q5C5B2PAxUfGuCbxgIE
         9xKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oOm91dBbJz5JuW3PcbRszHoTT41rzGvgpclEMlI/5LE=;
        b=TBmccKBNwJhvNk9a8Ce9M14b5p1Vbq0EtiJ3bnjTX/EE0X5GxDfV8aAu9swhfz22/3
         1DbaxdBChfwDrHTlne+eFRswPBkGh94siIVosSmvgghOHUchCxB+WCnIHh+s2A0yTppI
         WN3OoUlFOw+9hFoFeCCF2ppGeLm1Bz7A0J5dzJyzAKekz0GRfZtqFwjfnrvJJZMT7EVY
         JD+yGPAjHrlvRHljeICyDmChxqFmuToQhTrCo1K2yoMV4N1d6f3BS0Cv//a4/OQRmf7c
         eUz555VjqgmiYqhP8wKRRj6QWHczpK0Xmgs61d247IheIFMNIjYscuexmKMBEJKS4izh
         bqsg==
X-Gm-Message-State: AOAM531Ylx/6Q61ahOutsnn16KdTq2BiawSQkS8y0aQt0d/knO7OGYJm
        6C6LhE70iFQX9Cl2XuskOcc=
X-Google-Smtp-Source: ABdhPJxbq2c/JK60aJd4NgW3Zw5rg/FjU8r6OhG9Mh8CioC/+l+UIHaWD4GYuqU872PWCSmVQ4/WCQ==
X-Received: by 2002:a9d:64a:: with SMTP id 68mr23529442otn.68.1625752817771;
        Thu, 08 Jul 2021 07:00:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v8sm507871oth.69.2021.07.08.07.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 07:00:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2] watchdog: da9062: da9063: prevent pings ahead of
 machine reset
To:     Primoz Fiser <primoz.fiser@norik.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Support Opensource <support.opensource@diasemi.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20210706112103.1687587-1-primoz.fiser@norik.com>
 <20210708082128.2832904-1-primoz.fiser@norik.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <c5071540-3f01-68d3-b0ca-4c33771914ce@roeck-us.net>
Date:   Thu, 8 Jul 2021 07:00:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708082128.2832904-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/8/21 1:21 AM, Primoz Fiser wrote:
> Proper machine resets via da9062/da9063 PMICs are very tricky as they
> require special i2c atomic transfers when interrupts are not available
> anymore. This is also a reason why both PMIC's restart handlers do not
> use regmap but instead opt for i2c_smbus_write_byte_data() which does
> i2c transfer in atomic manner. Under the hood, this function tries to
> obtain i2c bus lock with call to i2c_adapter_trylock_bus() which will
> return -EAGAIN (-11) if lock is not available.
> 
> Since commit 982bb70517aef ("watchdog: reset last_hw_keepalive time at
> start") occasional restart handler failures with "Failed to shutdown
> (err = -11)" error messages were observed, indicating that some
> process is holding the i2c bus lock. Investigation into the matter
> uncovered that sometimes during reboot sequence watchdog ping is issued
> late into poweroff/reboot phase which did not happen before mentioned
> commit (usually the watchdog ping happened immediately as commit message
> suggests). As of now, when watchdog ping usually happens late into
> poweroff/reboot stage when interrupts are not available anymore, i2c bus
> lock cannot be released anymore and pending restart handler in turn
> fails.
> 
> Thus, to prevent such late watchdog pings from happening ahead of
> pending machine restart and consequently locking up the i2c bus, check
> for system_state in watchdog ping handler and consequently do not send
> pings anymore in case system_state > SYSTEM_RUNNING.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Implemented proposal suggested by Guenter Roeck.
> 
> Re-spun boards in boot/reboot loop tests and done 5000 cycles on each
> one with flying colors.
> 
> Changes in v2:
> - reduce code complexity by removing reboot notifiers and use
>    system_state variable instead
> - minor commit message rewording
> 
>   drivers/watchdog/da9062_wdt.c | 7 +++++++
>   drivers/watchdog/da9063_wdt.c | 7 +++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index 706fb09c2f24..f02cbd530538 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -117,6 +117,13 @@ static int da9062_wdt_ping(struct watchdog_device *wdd)
>   	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
>   	int ret;
>   
> +	/*
> +	 * Prevent pings from occurring late in system poweroff/reboot sequence
> +	 * and possibly locking out restart handler from accessing i2c bus.
> +	 */
> +	if (system_state > SYSTEM_RUNNING)
> +		return 0;
> +
>   	ret = da9062_reset_watchdog_timer(wdt);
>   	if (ret)
>   		dev_err(wdt->hw->dev, "Failed to ping the watchdog (err = %d)\n",
> diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
> index 423584252606..d79ce64e26a9 100644
> --- a/drivers/watchdog/da9063_wdt.c
> +++ b/drivers/watchdog/da9063_wdt.c
> @@ -121,6 +121,13 @@ static int da9063_wdt_ping(struct watchdog_device *wdd)
>   	struct da9063 *da9063 = watchdog_get_drvdata(wdd);
>   	int ret;
>   
> +	/*
> +	 * Prevent pings from occurring late in system poweroff/reboot sequence
> +	 * and possibly locking out restart handler from accessing i2c bus.
> +	 */
> +	if (system_state > SYSTEM_RUNNING)
> +		return 0;
> +
>   	ret = regmap_write(da9063->regmap, DA9063_REG_CONTROL_F,
>   			   DA9063_WATCHDOG);
>   	if (ret)
> 

