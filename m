Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5A96174E0B
	for <lists+linux-watchdog@lfdr.de>; Sun,  1 Mar 2020 16:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgCAPqt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 1 Mar 2020 10:46:49 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:34820 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgCAPqs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 1 Mar 2020 10:46:48 -0500
Received: by mail-pj1-f66.google.com with SMTP id s8so1534839pjq.0;
        Sun, 01 Mar 2020 07:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rnDdU1t+i3pbiA7G2lqfJJVJbNAuzNGmpXr7ztBKXlQ=;
        b=lqkVpCAyg/jzYuiab/XMJeOi14yP/WQW36so+Rpz4P+A2QT9dG+Gsovj2cLgPUuB5i
         by7TXuO4DKZX1Awk+/cggTU47fBFKfiOzwleppi257Rs5lys3p8lFNo8fMkg8CcMijec
         c6HfCzQ/XvOJGrWbUve4M2H+1fmt7oejJBdvxMFa6chVj2uQuLKVX2FvSx0ZqDIiqqrz
         n3/2XA5vo6xHaIa9X3tVjXM6J4EAhsE74HdpGutaLvX8HxyezcfQSNICWl0rQlkgoU7D
         kpMH6qLyK38OwN87jwurNAR2PQERoL8mfZtR9cvVE+Obw9raidvCeEJ7JlzTbJ3Wf8+Y
         mu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rnDdU1t+i3pbiA7G2lqfJJVJbNAuzNGmpXr7ztBKXlQ=;
        b=KmholEemImq/byhidaC5xD4299CIGbm4weJQwiKzmkVMZBkdxO2jqVIFlfrooFcjZf
         IIFk+nS2HsQ/aMugUOv92kXGQ7FZnKEU7wFBjLn+u+FZVJkWyjrmV1DS5WJO1yX7lhED
         IN3WB+UmjAPK7EzAjaKXMH3JEGMPqXm/Z6hviHSzZgUuKogM7KEqqRkghMwG3223APBU
         /0trV6xCN7QfzwmqmPu9sWYXbEQfLBuNguht+OCmJYZGrUd9ka12bvSu7um8NjVibLzx
         JCuSrk6dH2QrGNuafc/5Dli2ZFpFEwGLbI0QntXmSPbJKE6PB//9t39jGWJxbdNvyBzk
         4aLQ==
X-Gm-Message-State: ANhLgQ2yv/S2yppmHViDvY/rosJZFqQLxk0iY+IDrOhbuiP/Aj0DXXPg
        XBCVMySBpvFf8ms3UpjUBkI=
X-Google-Smtp-Source: ADFU+vsUUhq/wcS9dgZmaWvfisSda1ebn8/l6WK2I11wpblr8HoeUCOxeXQpV6Wj7gE0P8lg42PLDQ==
X-Received: by 2002:a17:902:b904:: with SMTP id bf4mr4278476plb.151.1583077607229;
        Sun, 01 Mar 2020 07:46:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c184sm17790346pfa.39.2020.03.01.07.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2020 07:46:46 -0800 (PST)
Subject: Re: [PATCH v1 1/4] dt-binding: watchdog: add restart priority
 documentation
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20200301094040.123189-1-tmaimon77@gmail.com>
 <20200301094040.123189-2-tmaimon77@gmail.com>
 <6ecf9a6b-8fca-1e7a-10d0-ee518e6ecf64@roeck-us.net>
 <CAP6Zq1gYvoGwNwr2zCopQ5CcyVUjgdYK6yX1wVMmWh5gapp+zQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e009d5e5-03a1-301c-0a65-c7f59c1be9fa@roeck-us.net>
Date:   Sun, 1 Mar 2020 07:46:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAP6Zq1gYvoGwNwr2zCopQ5CcyVUjgdYK6yX1wVMmWh5gapp+zQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/1/20 7:36 AM, Tomer Maimon wrote:
> 
> 
> On Sun, 1 Mar 2020 at 12:06, Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
> 
>     On 3/1/20 1:40 AM, Tomer Maimon wrote:
>     > Add device tree restart priority documentation.
>     >
> 
>     I think this warrants an explanation _why_ this is needed.
>     What is the use case ? Not just theory, please.
> 
> 
> In the NPCM750 there is two initiated restarts:
> 
>   * Software reset
>   * WD reset
> 
> the Software restart found at NPCM reset driver
> https://github.com/torvalds/linux/blob/master/drivers/reset/reset-npcm.c
> 
> In NPCM WD driver the restart is configure as well, I will like to add the priority so the user will have maximum flexibility if he using both restarts
> 

This is not the intended use case for restart priority. It is not
intended to be user configurable. The idea is that the more thorough
restart gets higher priority. This is implied by the restart method,
not by user preferences.

Also, the idea behind supporting multiple means to reset the system
is to be able to support multiple means to restart, some of which
may not always be available. In that situation, the priority means,
and is supposed to mean, "pick the best restart method available".
Again, that is determined by system design, and not supposed to
be configurable by the user.

On top of that, a watchdog driver based reset is almost always
a reset of last resort, to be chosen only if nothing else is available
in a given system. The existence of the reset driver confirms that
this is not different for this driver/chip.

Guenter
