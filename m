Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E03379286
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 May 2021 17:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237526AbhEJPXy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 May 2021 11:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235695AbhEJPXY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 May 2021 11:23:24 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17C2C04685D;
        Mon, 10 May 2021 07:56:07 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id g15-20020a9d128f0000b02902a7d7a7bb6eso14647723otg.9;
        Mon, 10 May 2021 07:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jr3vjHhMvc40r6BuXB/YSh49tUzu/s2tfxn11JpQLqo=;
        b=p52tvVBSftImdLqKt/DzQJddUciZJWewknYkLxtQ46CbCJ2ng3Kq7Y7tlq+aIhdEWS
         7IlIrZNkxPQvIkcQDLpZh9s+nt/Y91P8MgiiR0DaDhHFNJYj+hjfZrpcpwDCBqmBnj03
         yjZBKwvTJKqubti3sngHkY2WlUUXSSGue9Zfr8aEAX1Ia7gBJ9VuiujrRdLPRex1Da57
         Mx9703PvxfQCu+gwRl7pRl+laLN/D0ZCWvEoTsQuVuWlQWXCA/VXwJSEU6WtoKbbhDsr
         s25fg9/+b4my4BhfNx+GhIX9VZaar7Pmg1+alvUwXUBsSm1st+MX1xza8GgASnjD4JWc
         M7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jr3vjHhMvc40r6BuXB/YSh49tUzu/s2tfxn11JpQLqo=;
        b=Q+J/Ma/0lHnEQGHl/0zwihwVQ1+RSRWc92pqieGiE9flLMIIsBTx0Ejq5GnhLYOKai
         7yX4pt1QhvI9UMl44P8okd+eQUfY+3wlvRcvXOvBjQJGw7rQgLIQ0wnGshrmrrbpeMQH
         T5dh6HtfLBDc/UK4rqdXKghwdGBY9biYqgq5/CVgQ17ZZ/e0wLqIsTM8FKetP5qCQfgb
         +b2k9nXXOdczyk1nW+x52+8gX9vSWkhVZjoKC59HUFBam5nE3tUiqWv7GWC8Ozj7ytah
         UaMPZ5gRIZ1gGALfEVtwZBDSVNTHASNXnmSU4rr7KuKJy7GPWxsyGGe/fnWYjpyelcUC
         B2TA==
X-Gm-Message-State: AOAM532jMi4jxdpotWc0rBmikjOGvneQ+KTP+ohnamc/KyGcgCO7QDL0
        N2gQZRm41z6K0XZoM5/mmK+oJ4yVrh0=
X-Google-Smtp-Source: ABdhPJyhyHy/fDTiINaV8aO6NtQ2/b6Av4mIJfONa2JFfegJAkMIFZBfM4meVIXHVoLcjWUoBycRGg==
X-Received: by 2002:a9d:630e:: with SMTP id q14mr21327338otk.69.1620658566791;
        Mon, 10 May 2021 07:56:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i11sm2617325otk.70.2021.05.10.07.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 07:56:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Juerg Haefliger <juerg.haefliger@canonical.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210510131625.21506-1-juergh@canonical.com>
 <695dfd0f-f090-653e-7580-e45484228781@roeck-us.net>
 <20210510161406.1b32debd@gollum>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] watchdog: Add {min,max}_timeout sysfs nodes
Message-ID: <f89159ab-a12e-6a71-c415-da1800d67c21@roeck-us.net>
Date:   Mon, 10 May 2021 07:56:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210510161406.1b32debd@gollum>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/10/21 7:14 AM, Juerg Haefliger wrote:
> On Mon, 10 May 2021 06:45:15 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 5/10/21 6:16 AM, Juerg Haefliger wrote:
>>> The valid range for the 'timeout' value is useful information so expose
>>> the min and max timeout values via sysfs.
>>>
>>> Signed-off-by: Juerg Haefliger <juergh@canonical.com>
>>> ---
>>>    drivers/watchdog/watchdog_dev.c | 20 ++++++++++++++++++++
>>>    1 file changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
>>> index 2946f3a63110..b84d53a79618 100644
>>> --- a/drivers/watchdog/watchdog_dev.c
>>> +++ b/drivers/watchdog/watchdog_dev.c
>>> @@ -525,6 +525,24 @@ static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
>>>    }
>>>    static DEVICE_ATTR_RO(timeout);
>>>    
>>> +static ssize_t min_timeout_show(struct device *dev,
>>> +				struct device_attribute *attr, char *buf)
>>> +{
>>> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
>>> +
>>> +	return sprintf(buf, "%u\n", wdd->min_timeout);
>>> +}
>>> +static DEVICE_ATTR_RO(min_timeout);
>>> +
>>> +static ssize_t max_timeout_show(struct device *dev,
>>> +				struct device_attribute *attr, char *buf)
>>> +{
>>> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
>>> +
>>> +	return sprintf(buf, "%u\n", wdd->max_timeout);
>>
>> Makes sense, but please use sysfs_emit().
> 
> OK. And maybe I should send a patch to convert the other occurrences of
> sprintf as well?
> 

Sure, if you want to.

Guenter
