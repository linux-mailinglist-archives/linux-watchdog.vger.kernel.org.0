Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6DFBE9406
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Oct 2019 01:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbfJ3ANQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Oct 2019 20:13:16 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44733 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfJ3ANP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Oct 2019 20:13:15 -0400
Received: by mail-pf1-f195.google.com with SMTP id q26so237945pfn.11
        for <linux-watchdog@vger.kernel.org>; Tue, 29 Oct 2019 17:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9gCRAVK8ADR+UZtiGXs1f5pzPHT2VJYuVljJ65eXMh0=;
        b=J6nGuzOMboX5GaPRU+8ITVl154zKgeF8zvIflfoB9JfrqfdWGyYiAGeTGMWth98JxH
         RCJwD+XzRPFpVUAterR93h9hdzTpTTzgUq7bF/FwPK8mW6ZrIaWuL+op/V6JdPzaAwmL
         tzMrqdF1axtTQ+5b7QP82ks3X35lLxLhBVrLo2aOg3sq9jXJ9sl5wXO8T6G5cK6LiKC0
         xfI/SKTgcAqTnETiIIX5VRqphP6aWCxNPOyx1mNIU7oAjnH+uq94dSX2u5wg1rylqwPq
         aom7vP5HkHYocismydE/ozJTTGRY9JWYvx+cuhWdHctZXOiynoPBS/k3PFJYVFwJasV0
         Cw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9gCRAVK8ADR+UZtiGXs1f5pzPHT2VJYuVljJ65eXMh0=;
        b=RHXU8y1WJpcN7I8fUJ5fvw9AhDg/fztgN+DOuRP5qyyrzg7RzZ3T0FY8M00yZcSncM
         6iP7XJsLEQ++MMINdGpEhMrwOxSczhsNurpfxaSVOHbqhcqIJTOkkumDAHDW8uBRjHAg
         XYwmJOVyDwpZuUKm63W1VF4+73PioNUJFNDjszqaxo6ZWak1Y7URMuAZTz2f0HpdPnVz
         C5wIDhoLSf7V9llMy6B9iNncWCrKxY+GpVX6MtwsdKVojaLsJfYO46ukln6Z1avAwTHg
         hdL5p1W/IMlTiVaYa6hHWkzymgIyMddRN5MVKf5Xl9k70JQ3L2KkaCmBQC/gOXk24T/6
         9q7A==
X-Gm-Message-State: APjAAAVWxNleIDZdLqQe3SA0SMTONOyc9Uk2goiTAqGIY8GPlpD5it40
        1NxHQqOjNAY4al3ltPnIHt97vA6o
X-Google-Smtp-Source: APXvYqxOOtR5USoX5QEi/x2vPnFSoaq3AIzrb/F7BZcXPpG6fSvCiaSHHpNlvfVh/H+sfUjagUTGjw==
X-Received: by 2002:a17:90a:cc0c:: with SMTP id b12mr10133996pju.121.1572394395087;
        Tue, 29 Oct 2019 17:13:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z18sm249591pfq.182.2019.10.29.17.13.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2019 17:13:13 -0700 (PDT)
Subject: Re: [PATCH v1] watchdog: intel-mid_wdt: Add WATCHDOG_NOWAYOUT support
To:     Ferry Toth <fntoth@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Razvan Becheriu <razvan.becheriu@qualitance.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20190924143116.69823-1-andriy.shevchenko@linux.intel.com>
 <643ee5fc-a682-38bc-b92c-aee47913152e@roeck-us.net>
 <980eb3ec-ab3e-5aa6-e4ae-4cbecf29f778@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f13a146b-296d-0cca-8443-5771b76a3c64@roeck-us.net>
Date:   Tue, 29 Oct 2019 17:13:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <980eb3ec-ab3e-5aa6-e4ae-4cbecf29f778@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/29/19 10:42 AM, Ferry Toth wrote:
> Op 30-09-2019 om 15:15 schreef Guenter Roeck:
>> On 9/24/19 7:31 AM, Andy Shevchenko wrote:
>>> Normally, the watchdog is disabled when /dev/watchdog is closed, but if
>>> CONFIG_WATCHDOG_NOWAYOUT is defined, then it means that the watchdog should
>>> remain enabled. So we should keep it enabled if CONFIG_WATCHDOG_NOWAYOUT
>>> is defined.
>>>
>>> Reported-by: Razvan Becheriu <razvan.becheriu@qualitance.com>
>>> Cc: Ferry Toth <fntoth@gmail.com>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Any chance of this going in v5.4?
> 
Good question. There are a few other pending bug fixes, including one
which fixes a build failure. Wim, any chance you can queue those up ?

Thanks,
Guenter

>>> ---
>>>   drivers/watchdog/intel-mid_wdt.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/watchdog/intel-mid_wdt.c b/drivers/watchdog/intel-mid_wdt.c
>>> index 2cdbd37c700c..470213abfd3d 100644
>>> --- a/drivers/watchdog/intel-mid_wdt.c
>>> +++ b/drivers/watchdog/intel-mid_wdt.c
>>> @@ -134,6 +134,7 @@ static int mid_wdt_probe(struct platform_device *pdev)
>>>       wdt_dev->timeout = MID_WDT_DEFAULT_TIMEOUT;
>>>       wdt_dev->parent = dev;
>>> +    watchdog_set_nowayout(wdt_dev, WATCHDOG_NOWAYOUT);
>>>       watchdog_set_drvdata(wdt_dev, dev);
>>>       ret = devm_request_irq(dev, pdata->irq, mid_wdt_irq,
>>>
>>
> 
> 

