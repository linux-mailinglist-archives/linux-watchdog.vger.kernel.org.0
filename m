Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D159379036
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 May 2021 16:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238522AbhEJOJD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 May 2021 10:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238649AbhEJOEC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 May 2021 10:04:02 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650C2C0611AA;
        Mon, 10 May 2021 06:45:18 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so1007189otc.6;
        Mon, 10 May 2021 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hedE3GT8Rl3Rz//B6pu/A3NCqNNmR97yKYteAby+mXg=;
        b=URpcRw9JjpPvhG2bydpcqdwp2X4UGZLZ7AKk4p8oCL90Sb6t+VKbadMK/EAiq7v/bB
         n16eOuoEw3M5BJhyjMjQ45JTjxyhlmX7QmvSfd04gJaUrh5F6Uugd0+w476T0Hjny7i+
         WQHcsUlg8X+mPtpShFIrhtpNolUv4JbR0PfaifIOErt2atSecaK7YwpELeVbtqE/RUDA
         7FrY6LH67QdbO46h54/6dEIZ/A3ihuiU66DDUIWSH4eEqqo5XqIPeMh6Gwf12I+ZtiTa
         mUT3PRDb2n+m1bPkK0QXZs6qb9XhT9W4Ymq5ZDKZ5HF7R7Baxon4VLbyWKWoXnLLYhge
         SH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hedE3GT8Rl3Rz//B6pu/A3NCqNNmR97yKYteAby+mXg=;
        b=c6CN5K7Jl9hgqQ9IQVBpNxl6/PDX5vbdGZeBdr81E9JKiAJpHyCZv/YvBAGjZqFOaa
         H9xpXfg/OxKNKy0ptxT1eB4K6pvH+ZsNTtVCqA++Sc00TsptR6mbZu8vAO9UofHn4/rj
         rcoGonSZJroaS3qSDTyeYh1gyCZIGmKPmxcDXtVjAUI2BwMX60/ptoZGMkFBEq86XtIg
         Si3XoBuIzDmIlOS95faPMhzsSKbj+SYet2S4O8cLe7kDO+x2Dho0GdtSnRpxvWdRVcmb
         ph22nI75JrHDFpibekG6h237IYtiKZBEvhNSUYhYNdHLwWA4/Y9xfmyS3z3z7D6YJ0Sa
         SZIQ==
X-Gm-Message-State: AOAM53116eiu0JgR0TDAeJnpgZQtiEJzHuPhmEM9kk3j/4RRGcWeF7Nj
        oOYtGZFoFyAR7hn3PfrhkB4=
X-Google-Smtp-Source: ABdhPJw92pktAl/LolRgtY75mG0KjPVHGiVbVJT4ZH5ZzzUFqD8QuNZZ2woJhiRsc+VG57WoaG21QQ==
X-Received: by 2002:a05:6830:18f3:: with SMTP id d19mr8334556otf.369.1620654317881;
        Mon, 10 May 2021 06:45:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x30sm2717960ott.41.2021.05.10.06.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 06:45:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: Add {min,max}_timeout sysfs nodes
To:     Juerg Haefliger <juerg.haefliger@canonical.com>,
        wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
References: <20210510131625.21506-1-juergh@canonical.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <695dfd0f-f090-653e-7580-e45484228781@roeck-us.net>
Date:   Mon, 10 May 2021 06:45:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210510131625.21506-1-juergh@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/10/21 6:16 AM, Juerg Haefliger wrote:
> The valid range for the 'timeout' value is useful information so expose
> the min and max timeout values via sysfs.
> 
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>
> ---
>   drivers/watchdog/watchdog_dev.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 2946f3a63110..b84d53a79618 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -525,6 +525,24 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
>   }
>   static DEVICE_ATTR_RO(timeout);
>   
> +static ssize_t min_timeout_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%u\n", wdd->min_timeout);
> +}
> +static DEVICE_ATTR_RO(min_timeout);
> +
> +static ssize_t max_timeout_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%u\n", wdd->max_timeout);

Makes sense, but please use sysfs_emit().

Guenter

> +}
> +static DEVICE_ATTR_RO(max_timeout);
> +
>   static ssize_t pretimeout_show(struct device *dev,
>   			       struct device_attribute *attr, char *buf)
>   {
> @@ -609,6 +627,8 @@ static struct attribute *wdt_attrs[] = {
>   	&dev_attr_state.attr,
>   	&dev_attr_identity.attr,
>   	&dev_attr_timeout.attr,
> +	&dev_attr_min_timeout.attr,
> +	&dev_attr_max_timeout.attr,
>   	&dev_attr_pretimeout.attr,
>   	&dev_attr_timeleft.attr,
>   	&dev_attr_bootstatus.attr,
> 

