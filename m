Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25467400A5E
	for <lists+linux-watchdog@lfdr.de>; Sat,  4 Sep 2021 10:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbhIDISA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 4 Sep 2021 04:18:00 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:36700 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233068AbhIDIR7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 4 Sep 2021 04:17:59 -0400
Received: by mail-wr1-f43.google.com with SMTP id q14so1879976wrp.3
        for <linux-watchdog@vger.kernel.org>; Sat, 04 Sep 2021 01:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7an6f31DgE6xeQrZ3d8mQUGGVz2z21es8AtooXxO4hI=;
        b=Uqs4A++HFM7BYa4CR2JqLqSK01g+O7fm/PXzkfSMx3Nfix4h9yiiULKIp3Ogg7eZkp
         jUdstHyZSvEqPHcvvsJttyAgrZZxb33Xoq4Wj6BHHXECodflsPx65Eg4i1u5J6ZvmKOO
         E/loS3upXqHYfIvFFEfZAt/DpXOGAfkxyEDoqp03bXcJxB7cQUpEiyyiw4EPaZ6uknUn
         ichOjJL8gmblcIGndp3WWxAx313sY2H5BAlTh1c37w33CF/wpzem3Ctm9Q32q/Nq6EKs
         n0G7csdbV53PSsxN4n5mItad4t8qRn7/3lohV6dp5EPrqgRZus17GN381J1hv5eWyMEN
         zTcQ==
X-Gm-Message-State: AOAM531Fg4lPODVnf/c/cadfcMxOVkM7e6cQGGfPo0A5kQ7kzpy5uD96
        buwx7pGocYZf+CV9/DkRzT0=
X-Google-Smtp-Source: ABdhPJyzO08RZL0px+6WlZk+vQghMMq/9cU+cr+znL4oKRtSCA7jhkipzn+bxgiJZo32a+hHn13XuA==
X-Received: by 2002:adf:c510:: with SMTP id q16mr2897611wrf.203.1630743417831;
        Sat, 04 Sep 2021 01:16:57 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with UTF8SMTPSA id b15sm1588204wru.1.2021.09.04.01.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Sep 2021 01:16:56 -0700 (PDT)
Message-ID: <85ce6068-c98e-dbe0-a4b6-5c877b460f64@kernel.org>
Date:   Sat, 4 Sep 2021 10:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: was [Re: [PATCH v3] watchdog: Add hrtimer-based pretimeout feature]
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Curtis Klein <curtis.klein@hpe.com>, wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org
References: <1612383090-27110-1-git-send-email-curtis.klein@hpe.com>
 <67d601c9-8f95-cb10-40df-4d962ec6f9ba@kernel.org>
 <7fdd262e-84fb-0c34-baa9-162130f1e109@roeck-us.net>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <7fdd262e-84fb-0c34-baa9-162130f1e109@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 02. 09. 21, 16:05, Guenter Roeck wrote:
> On 9/1/21 11:55 PM, Jiri Slaby wrote:
>> On 03. 02. 21, 21:11, Curtis Klein wrote:
>>> This adds the option to use a hrtimer to generate a watchdog pretimeout
>>> event for hardware watchdogs that do not natively support watchdog
>>> pretimeouts.
>>>
>>> With this enabled, all watchdogs will appear to have pretimeout support
>>> in userspace. If no pretimeout value is set, there will be no change in
>>> the watchdog's behavior.
>>
>> Hi,
>>
>> on my Dell Latitude 7280, CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y causes 
>> all reboot, kexec, suspend to panic. Disabling that option makes it 
>> all work again. Provided it happens very late in the process, I don't 
>> know how to grab some logs...
>>
>> Any ideas?
>>
> 
> AFAICS the timer does not stop on reboot. I think we'll need to augment 
> the code
> to do that.

No, it is stopped via device unregister -> watchdog_dev_unregister -> 
watchdog_cdev_unregister -> watchdog_hrtimer_pretimeout_stop.

But look:
watchdog_cdev_unregister
   -> wdd->wd_data = NULL;
   -> watchdog_hrtimer_pretimeout_stop
     -> hrtimer_cancel(&wdd->wd_data->pretimeout_timer);

The diff below obviously fixes the issue, but I don't know what the 
consequences are. The other possibility would be to pass wd_data 
directly to watchdog_hrtimer_pretimeout_stop.

I don't know how this can work on some machines (I verified it does).

--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1096,6 +1096,8 @@ static void watchdog_cdev_unregister(struct 
watchdog_device *wdd)
                 watchdog_stop(wdd);
         }

+       watchdog_hrtimer_pretimeout_stop(wdd);
+
         mutex_lock(&wd_data->lock);
         wd_data->wdd = NULL;
         wdd->wd_data = NULL;
@@ -1103,7 +1105,6 @@ static void watchdog_cdev_unregister(struct 
watchdog_device *wdd)

         hrtimer_cancel(&wd_data->timer);
         kthread_cancel_work_sync(&wd_data->work);
-       watchdog_hrtimer_pretimeout_stop(wdd);

         put_device(&wd_data->dev);
  }

thanks,
-- 
js
suse labs
