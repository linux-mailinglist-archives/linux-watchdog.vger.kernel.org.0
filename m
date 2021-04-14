Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD94335F2CA
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Apr 2021 13:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241370AbhDNLvD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 14 Apr 2021 07:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233595AbhDNLvC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 14 Apr 2021 07:51:02 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791AAC061574
        for <linux-watchdog@vger.kernel.org>; Wed, 14 Apr 2021 04:50:41 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id t17-20020a9d77510000b0290287a5143b41so7829197otl.11
        for <linux-watchdog@vger.kernel.org>; Wed, 14 Apr 2021 04:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m704yjjmt46Hm2V5zFkNLpq+/OUx1tpeIbMQVIHxvws=;
        b=rDp77KXST0guLDIkpdX10Ifcp09VrPYk4QEgTt+UbvEmvdk49Ff7sVtGSYDeqbNKrk
         svDWSTl0eoOBe8OatQ03sllFSSBEWgo1kcvm6ngW3ztiuqCUorMK0SpPSi+l9e/Aa7I1
         TX1pCrNwyMpWuqfxYSoSiI/3cd32EghjNz0u3RrwAHLasY3+nLm1D1guPrMNGuleMZsc
         NHan7k3ff6ydcfMfrX0NUX9xh8K/o++RMw7XtOQH39SgoJwhFzV6MX8YAWOmh8e6Sh86
         kqPlurLYtb7Fr7oVT9t8NV0yMAT5vHfFD5V3Wvc0CuA40rccb9YPkWnFlKOc2/0/UAac
         qHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=m704yjjmt46Hm2V5zFkNLpq+/OUx1tpeIbMQVIHxvws=;
        b=FmQoEKgy3gfkfKy33AlG9VVC7CANBwFOML84T9dXsqTKuMh+i9Q4IyVohM23tDamBQ
         wqLT6gt0Jy0oNtEipd+hBXpT4RD7pCNOLRRqclio6wU2ikEFJzrzjwIGSau/tRNMSZAd
         AtzHHZn2Ar4qePWlQmLHJbtoCPot/iTemxx802FUqXwHNH2FP2nxv4swEGGqpbPOSXHb
         akHx/YWhpIwmN+1UEaNDUGNnbkezeyEyc9K+QurQphhnZHc89RI9B4YbeKXY8CYyro8o
         t2OgsotqNwW4Y+Hx3ldBIGeZoWh0BpovvYCPLE8PAdAflaKWEWaWNb1J1IGNhX3Bx4eA
         yavg==
X-Gm-Message-State: AOAM5327EsAg2yZghC8xj/DQVuYfJ6oN8K7fzQisE/QhwnlSOVdagTAN
        vEWl3Zaocbc1GHCQA69oUzg=
X-Google-Smtp-Source: ABdhPJz9eaH1c9hijMTXfBreSL2ADLZbnreVybu6XekpJG2XYPpD0rThGa4oZxDXmFwUXTWIWVV09w==
X-Received: by 2002:a05:6830:3151:: with SMTP id c17mr32569461ots.245.1618401040913;
        Wed, 14 Apr 2021 04:50:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a13sm3405236ooj.14.2021.04.14.04.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 04:50:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [RFC] watchdog: pretimeout: add a notifier call chain governor
To:     Stefan Eichenberger <eichest@gmail.com>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20210413154553.1968039-1-eichest@gmail.com>
 <41ec7802-e637-1177-9d16-d8fb3ff6bc3a@roeck-us.net>
 <20210413165615.GA2942421@eichest-laptop>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <6000fb30-6feb-cf4a-a379-8ee5b3acb0de@roeck-us.net>
Date:   Wed, 14 Apr 2021 04:50:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210413165615.GA2942421@eichest-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/13/21 9:56 AM, Stefan Eichenberger wrote:
> Hi Guenter,
> 
> Thanks a lot for the fast feedback!
> 
> On Tue, Apr 13, 2021 at 09:15:35AM -0700, Guenter Roeck wrote:
>> On 4/13/21 8:45 AM, Stefan Eichenberger wrote:
>>> Add a governor which calls a notifier call chain. This allows the
>>> registration of custom functions to the watchdog pretimeout. This is
>>> useful when writing out-of-tree kernel modules and it is more similar to
>>> the register_reboot_notifier or register_oom_notifier API.
>>>
>>> Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
>>
>> It seems questionable to implement such a notification as governor.
>> A governor is configurable, and letting userspace override notifications
>> seems very odd and unusual. Please provide a use case.
> 
> What I would like to do is to have an out-of-tree module which will
> write a pattern into a reserved memory region when a watchdog occurs.
> After a reboot the module then read this reserved memory region and can
> differentiate between different reset reasons. Here the example kernel
> module:
> https://github.com/embear-engineering/sample-kernel-modules/blob/use-watchdog-register/reset-reason/reset-reason.c
> 
> Registering to the watchdog happens on line 180.
> 
> I think I could just implement a governor in the module but it is not
> really flexible because then I would have to compile the kernel with
> e.g. the noop governor and then switch to my governor after the module
> loaded. Then I thought why not using a notifier chain similar to reboot,
> panic, or oom.
> 

I have two problems with this: First, we do not support in-kernel code purely
for out-of-tree drivers. Second, the idea of using a configurable notifier
(ie one that can be disabled by userspace action) seems odd. If anything,
that would have to be an unconditional notifier. However, again, that would
require a use case in the upstream kernel.

Guenter
