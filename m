Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE07E30D7B3
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Feb 2021 11:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232865AbhBCKhc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Feb 2021 05:37:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45829 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233854AbhBCKha (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Feb 2021 05:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612348564;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fEB7xBqwhyPOWn31cidRiNIM5Aa2KdyDpLu2IJ8+dfE=;
        b=QLHgPVoPnxW3uKN0Qlp8nBFKUQsMsAfPw2FjYtq3X1MEs9KtXYnPGIFOAS3PtXB9cQxJjB
        ipmSLHQ5KKKEEKJSsWEcg1GytUX6aUS9ij3YjY5VpC5J1lWjj/MU9xgdbrdyHeSRF9es0f
        HTiANNvFUnSlc7k0IeXGd9qAc+xkjCY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-0qshGI5tPry0qMI-QZQbKQ-1; Wed, 03 Feb 2021 05:36:02 -0500
X-MC-Unique: 0qshGI5tPry0qMI-QZQbKQ-1
Received: by mail-ej1-f70.google.com with SMTP id jg11so11792319ejc.23
        for <linux-watchdog@vger.kernel.org>; Wed, 03 Feb 2021 02:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fEB7xBqwhyPOWn31cidRiNIM5Aa2KdyDpLu2IJ8+dfE=;
        b=KykrBVvSff90epizXKZCNsveQf809e5Mv/o0rwVC6e4dsFvSvqmoLQsDFYJoKw69Rw
         jtlm1qyuCsUflPTp442CBwwJHUGjOvzY1pP7PJG+HMomLxyHxnf3U1HKNdHLJBWPFvTr
         zq/s9DpPlU3W/jcqBTJDe590OghuAlrDNmP8AdAK4Zmop3YQdQvHxVaTFzdG6FmxVxbz
         oAKFdtdDfK6yucpZuiPWWGWFCFnwJP3GFd0vWr5GQ2RwmpGKiaUHjTHDL9GilirRZ5vk
         7vaReuLW/OGvdfdchLWB3xD7OAAASvjcuIF3z4AyES8EqNRzn02X/Do89ayh4nySW6R0
         VQ8A==
X-Gm-Message-State: AOAM530zPIru3Sm6j39QWtnzbGj3Zf872UX0M32iMyGJRKUm9yI+mr/Q
        4UFOTK+oONRnVLcyWliFfgmond0TIhYmbaBvTwN4xFytSfEli48dJhq6A6iAn5utYCidl5wobGr
        yY14m52cxbU4K3etT5/LY+EwOSq8=
X-Received: by 2002:a17:907:10c1:: with SMTP id rv1mr2694240ejb.74.1612348561146;
        Wed, 03 Feb 2021 02:36:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqwfeuaQQcjcQ8kmMpA9bMjScyF6z1WqjDALhpwWfWpqmNI4F1sKUnQiqj4uSlF2824+0Cdg==
X-Received: by 2002:a17:907:10c1:: with SMTP id rv1mr2694227ejb.74.1612348561015;
        Wed, 03 Feb 2021 02:36:01 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id e9sm655746edk.66.2021.02.03.02.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 02:36:00 -0800 (PST)
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <886bbdc0-3391-2140-a2d4-1688b262966f@redhat.com>
 <CAHp75VeFvwE64zX8Wu8XvMMJ6vgxAaoYpvH2rJ_FD3CCnFZNHA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8d350b8c-5f1d-256d-cdc5-8501af0c0cad@redhat.com>
Date:   Wed, 3 Feb 2021 11:35:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VeFvwE64zX8Wu8XvMMJ6vgxAaoYpvH2rJ_FD3CCnFZNHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 2/3/21 10:54 AM, Andy Shevchenko wrote:
> On Tue, Jan 26, 2021 at 4:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 1/26/21 1:38 PM, Andy Shevchenko wrote:
>>> Hi guys,
>>>
>>> This is first part of Intel MID outdated platforms removal. It's collected into
>>> immutable branch with a given tag, please pull to yours subsystems.
>>>
>>> (All changes are tagged by the respective maintainers)
> 
>> Erm, I already have this 2 in platform-drivers-x86/for-next since you said that
>> these 2 could be merged independently.
>>
>> Anyways I just did a test-merge and there is no conflict, so everything is ok.
>>
>> From my pov this looks good and I plan to merge this into platform-drivers-x86/for-next
>> before the merge-window.
>>
>> I'm going to hold off on doing that for a bit for now in case one of the other
>> subsys maintainers has any objections.
> 
> Any news on this? Have you pulled it somewhere (I don't see it in Linux next)?

I was going through all pending pdx86 stuff yesterday to prep for the upcoming
merge-window. I was doing so in FIFO order and I ran out of steam just as I got
to this pull-req.

So today is a new day and after sending out a fixes pull-req for 5.11 this is
(was) the first thing on my list.

I've merged this into my review-hans now (and I will push it to for-next soon).

I did one last check of all the commits after merging, and I found one small
issue.

The "gpio: msic: Remove driver for deprecated platform" commit forgets to
drop the Makefile line for the msic driver:

obj-$(CONFIG_GPIO_MSIC)                 += gpio-msic.o

This is not a reason to redo the entire branch, but it would be good if you
can do a follow up patch to fix this.

Regards,

Hans

