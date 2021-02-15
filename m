Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503F231B74D
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Feb 2021 11:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbhBOKjA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Feb 2021 05:39:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55884 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229802AbhBOKi7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Feb 2021 05:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613385452;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qc6c5uDkuHKyGcgNcwsQu/75zJZpP0qScLTmIXfkA7E=;
        b=UdqzGS/07q7m/25GYHFYhESSlqwkNuqRyOxawzePzOg540/muUXCGCSoXtiRK3HbghHA9N
        krtU+hNxsestQW+0MdXzfbrHE/aiJEGyIfKgENyBeP+ICAP3xsbmvVJOv4ScPvIi/aKju/
        iIoybkymNSqlWRTU9k2kqCbni7pNnKk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-B14EKA-oNb-FTt0xlRg59A-1; Mon, 15 Feb 2021 05:37:29 -0500
X-MC-Unique: B14EKA-oNb-FTt0xlRg59A-1
Received: by mail-ej1-f69.google.com with SMTP id yd11so4076399ejb.9
        for <linux-watchdog@vger.kernel.org>; Mon, 15 Feb 2021 02:37:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qc6c5uDkuHKyGcgNcwsQu/75zJZpP0qScLTmIXfkA7E=;
        b=O7/Y6qwJ0k41lrdsWkRpkY0UA8pDS48X4a18vIdYjbUNRRaLL02qSHNXTks/tfFe1e
         4fN6JPVxH/lWvNG0ATvZf2QtfywNOjH8KKcffVIMmVEtDUA/pXJg3yK21/+Rpy7mU+1H
         6JE6r1KswaTuXhnFly4WYLHFP6Io8HfZ08oX99DvUqepU5QdJe93iS0MlD8e7A6+/UCf
         7K2mTa7HptTtc8McciM3Qewv+mi95I91/DVEOQ5S3iQ3Ug4x1np/zUYySk0yGRmtkYS0
         7uEA/BED9MkcNv65EJZvBqXOy0CnpDxLsBj1AhI/URoYsUGD90FgS9m2m/2LOcN7chFk
         yjUA==
X-Gm-Message-State: AOAM533Y8uXJuL3TXCDMNwaR6LniF2iyge8WHDs0ATFcgj7MR9kAFHET
        /wn3XTC4OSTWcbvsKeNipyBnCukwFwVfXnCDWuVF1jA104warzetY4D4y1wW/vCwo1wqVGSvh6a
        lBxWvD0TY8kdsQWCS5hCJfurFBTQ=
X-Received: by 2002:a17:906:4c85:: with SMTP id q5mr14729133eju.375.1613385448066;
        Mon, 15 Feb 2021 02:37:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz48iDFT6icNz/G5V8W+1Gbn7S+71yinDSb0pE+yIHXEoPgTdlObwbV19LXrzwB8QNHY2LTFQ==
X-Received: by 2002:a17:906:4c85:: with SMTP id q5mr14729106eju.375.1613385447894;
        Mon, 15 Feb 2021 02:37:27 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id o4sm9693499edw.78.2021.02.15.02.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 02:37:27 -0800 (PST)
Subject: Re: [RFC PATCH 1/7] drivers: base: Add resource managed version of
 delayed work init
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>
Cc:     "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "sre@kernel.org" <sre@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        "saravanak@google.com" <saravanak@google.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jroedel@suse.de" <jroedel@suse.de>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "cw00.choi@samsung.com" <cw00.choi@samsung.com>
References: <cover.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
 <1230b0d2ba99ad546d72ab079e76cb1b3df32afb.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
 <2fb4b305-a93f-f91e-3001-dab5057e39cc@redhat.com>
 <084893a3-0071-13e9-5ce6-b7b027e6cd2a@roeck-us.net>
 <16140f5b-c504-1c07-9f0c-3813d686d157@redhat.com>
 <74ec29cb5780e93cca3d4cdec221c65e764c8a3e.camel@fi.rohmeurope.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <400d3e82-a76e-136c-0e03-ed7e40608e2a@redhat.com>
Date:   Mon, 15 Feb 2021 11:37:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <74ec29cb5780e93cca3d4cdec221c65e764c8a3e.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 2/15/21 8:22 AM, Vaittinen, Matti wrote:
> 
> On Sat, 2021-02-13 at 16:59 +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 2/13/21 4:27 PM, Guenter Roeck wrote:
>>> On 2/13/21 7:03 AM, Hans de Goede wrote:
>>> [ ... ]
>>>> I think something like this should work:
>>>>
>>>> static int devm_delayed_work_autocancel(struct device *dev,
>>>> struct delayed_work *w,
>>>> 					void (*worker)(struct
>>>> work_struct *work)) {
>>>> 	INIT_DELAYED_WORK(w, worker);
>>>> 	return devm_add_action(dev, (void (*action)(void
>>>> *))cancel_delayed_work_sync, w);
>>>> }
>>>>
>>>> I'm not sure about the cast, that may need something like this
>>>> instead:
>>>>
>>>> typedef void (*devm_action_func)(void *);
>>>>
>>>> static int devm_delayed_work_autocancel(struct device *dev,
>>>> struct delayed_work *w,
>>>> 					void (*worker)(struct
>>>> work_struct *work)) {
>>>> 	INIT_DELAYED_WORK(w, worker);
>>>> 	return devm_add_action(dev,
>>>> (devm_action_func)cancel_delayed_work_sync, w);
>>>
>>> Unfortunately, you can not type cast function pointers in C. It is
>>> against the C ABI.
>>> I am sure it is done in a few places in the kernel anyway, but
>>> those are wrong.
>>
>> I see, bummer.
> 
> I think using devm_add_action() is still a good idea.

Yes, we could also just have a 1 line static inline function to do
the function-cast. Like this:

static inline void devm_delayed_work_autocancel_func(void *work)
{
	cancel_delayed_work_sync(work);
}

static inline int devm_delayed_work_autocancel(struct device *dev, struct delayed_work *w, void (*worker)(struct work_struct *work))
{
	INIT_DELAYED_WORK(w, worker);
	return devm_add_action(dev, devm_delayed_work_autocancel_func, w);
}

Both functions will then simply be compiled out in files which do not
use them.

>> If we add a devm_clk_prepare_enable() helper that should probably be
>> added
>> to drivers/clk/clk-devres.c and not to drivers/base/devres.c .
>>
>> I also still wonder if we cannot find a better place for this new
>> devm_delayed_work_autocancel() helper but nothing comes to mind.
> 
> I don't like the idea of including device.h from workqueue.h - and I
> think this would be necessary if we added
> devm_delayed_work_autocancel() as inline in workqueue.h, right?

Yes.

> I also see strong objection towards the devm managed clean-ups.

Yes it seems that there are some people who don't like this, where as
others do like them.

> How about adding some devm-helpers.c in drivers/base - where we could
> collect devm-based helpers - and which could be enabled by own CONFIG -
> and left out by those who dislike it?

I would make this something configurable through Kconfig, but if
go the static inline route, which I'm in favor of then we could just
have a:

include/linux/devm-cleanup-helpers.h

And put everything (including kdoc texts) there.

This way the functionality is 100% opt-in (by explicitly including
the header if you want the helpers) which hopefully makes this a
bit more acceptable to people who don't like this style of cleanups.

I would be even happy to act as the upstream maintainer for such a
include/linux/devm-cleanup-helpers.h file, I can maintain it as part
of the platform-drivers-x86 tree (with its own MAINTAINERS entry).

Greg, would this be an acceptable solution to you ?

Regards,

Hans

