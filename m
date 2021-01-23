Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 207173011B5
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 01:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbhAWA23 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 19:28:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbhAWA2J (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 19:28:09 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF379C06174A;
        Fri, 22 Jan 2021 16:27:25 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id k8so6893776otr.8;
        Fri, 22 Jan 2021 16:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5DL58PlcydahDChMshjBPlDiZR1WArvL4jU3aG7Z9Ss=;
        b=p+rwWtjTrJKhRkOS93BUUHLrcCHWlxzSaZFB8asTboaxPbhosjvmiESlrz0/QuRF3J
         T/olVWU2bfBvAEWLHEHM3gvx0Sv8UAXL1r6Jq2cIV9K5gdbSBAU+Q/YebfBYsVfHUukn
         E6AKUPFfG5E4Y5e7kDzoEOHXreaPY7+cW4mPXRiuXQUuNAxEnGcl8HShvi3EyzTv2eIJ
         CiIdAUUFmd5DztkwnupGNBnCQKtOFusXNWY8kbiIulc7xb5FLh9qzXlJ7NVebbfFwcx9
         UsjitcvIwcJassqQslPzpaC+3Qs70ehu1/kgMp3hdKe7MGpWPzI28DQoK1ADvjH3DV/e
         zLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5DL58PlcydahDChMshjBPlDiZR1WArvL4jU3aG7Z9Ss=;
        b=T0kzTkXJpVr3NtI6VnTKk+sPW4vtEqdY/PXBDVixjtv5U73BWDBc3+ws7Wc4Fti6yA
         NSKVIe9VZOYtTq4tFOvS+7LThmsaNV+d62+oOySUIFWsn4eOkaIDr34HWhXiD5VV6jtX
         2Zubw9vMZmo0GjiCtiyt4BSkAK3MofIJ0aU5Sw9g0eeVcMKnULXWldORqbV/dhPalumk
         unEGp0HKxPxBO063JWpe+WjVJjLqnfRuUnHdvNSk8Y4mNYVMlJ8hkytqadtoL858palQ
         Ecqmck3mWnvpxAMTzIkLZSK1/5sYwYGJBHjBXkbJjYYQnAUZr/rUGSwStdcWE1ZorLir
         hODA==
X-Gm-Message-State: AOAM5318nfxvRPZDKDVy+w0nC+PF0vJBLahA62FkHDABntHkTDEGK/Zo
        4kFIAeSnvhR9hpOofzWAxM0=
X-Google-Smtp-Source: ABdhPJxL6Dtd8pOJzU3f+lnfVf6qhyYZQ/kVCCooO1rQ+UxnG1Y3uKBIuaOR2RyKe5tc5MmCeoY51Q==
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr5145572otj.188.1611361645381;
        Fri, 22 Jan 2021 16:27:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y22sm79636oot.7.2021.01.22.16.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 16:27:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v1 1/5] watchdog: intel_scu_watchdog: Remove driver for
 deprecated platform
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
 <1f3d5ad1-9f8f-4a78-6239-6cdcbeeeb95b@redhat.com>
 <YArtsQSQsGdfNlBI@smile.fi.intel.com> <YArzAvcZXfv8DaI4@smile.fi.intel.com>
 <4ba64643-9254-055d-49a0-55104b8669d8@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1d57c7b0-9ef4-3306-1566-2b99f40d92d1@roeck-us.net>
Date:   Fri, 22 Jan 2021 16:27:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4ba64643-9254-055d-49a0-55104b8669d8@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 1/22/21 1:04 PM, Hans de Goede wrote:
> Hi,
> 
> On 1/22/21 4:45 PM, Andy Shevchenko wrote:
>> +Cc: Arnd, RTC maintainers, Lee
>>
>> On Fri, Jan 22, 2021 at 05:22:25PM +0200, Andy Shevchenko wrote:
>>> On Fri, Jan 22, 2021 at 03:59:34PM +0100, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> What is the plan for merging this series ?
>>>>
>>>> It touches files under:
>>>> arch/x86
>>>> drivers/watchdog
>>>> drivers/platform/x86
>>>>
>>>> It is probably best if the entire series is merged through a single
>>>> tree. I don't expect this to cause any conflicts with current / upcoming
>>>> changes under drivers/platform/x86, so I'm fine with this being merged
>>>> through another tree.
>>>>
>>>> Or if I can get an ack for that from the x86 and watchdog maintainers
>>>> I can merge the entire series through the pdx86 tree.
>>>
>>> For time being I'm collecting tags and comments.
>>> As of today this series is independent per se, but other (later) clean up
>>> patches may rely on this.
>>>
>>> One strategy can be providing an immutable branch for anybody who wants it and
>>> merge thru PDx86 or watchdog tree (I guess PDx86 is preferable because there
>>> are more patches touching other stuff, though independently, in this matters).
>>
>> Yes, I think one more time and guess the best is:
>>  - get tags from x86 / watchdog
>>  - get tag from RTC
>>  - collect everything in PDx86 immutable branch
> 
> Ok, that works for me. I assume that it is best for the other subsystems
> if I create an immutable branch for this based on 5.11-rc1
> (and then merge that into pdx86/for-next) ?
> 
> Guenter, I believe you have already reviewed all the watchdog changes,
> are you ok with me creating an immutable branch for the entire series
> and then sending you a pull-req for that ?
> 

Wim handles watchdog pull requests, and he usually creates a branch
for Linus to pull from either during or shortly before a commit window.
Also, I don't immediately see why the watchdog tree should carry the other
patches of this series, immutable or not; I would not expect a dependency
against those.

Anyway, I am fine if the the wdt driver removal is submitted through some
other branch.

Thanks,
Guenter
