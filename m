Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5D3169805
	for <lists+linux-watchdog@lfdr.de>; Sun, 23 Feb 2020 15:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgBWOIJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 23 Feb 2020 09:08:09 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:51995 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgBWOIJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 23 Feb 2020 09:08:09 -0500
Received: by mail-pj1-f65.google.com with SMTP id fa20so2873629pjb.1;
        Sun, 23 Feb 2020 06:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XD21Leo6kLR5qlxiWjZstdOKlqxFlzQ6WlHQ2R8Sm0g=;
        b=VVCuNFRsY5ktZtLIbg4z3N8VwcmqYJBXpWys4vupuwKDJZlvbzDme9m7YEjlXPgiA9
         81UmvGYiq1GjTqCaZAxN3K2/jbxnvHqXhK1yMjGMh01Y09EhgWshlqZfWgZA7XUorjUL
         5OfNgTpl0eic4MB/ueEz/STh6MpbFRheO103tdYu9lqhRbp+ukkHvp5EkVzbK5RKDRWi
         R6nGaa3fh8ZOI7mOkNh6LNhI+Hq1+p4ukyvrxXrKv6dcsMGZPikHDBI/JH0XOyBg0oCC
         r3tNVn8xKnwJ17JhhE81csZ5xm5Ot8vJ2gYSK0fTsG0n5VAHokfCqQs68d7oGKklBoVJ
         7Okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XD21Leo6kLR5qlxiWjZstdOKlqxFlzQ6WlHQ2R8Sm0g=;
        b=iJ8OfP+Iv9DyC8P2STVq6EnI7aRmd6/IaeWfFNV8tUH6oB3+/H62nhUWAB8uCPOHSc
         /AALagFkOvNasS52CAy7/+oTBg+vSe9nSQbqblrHxQJzuo1LHVZlEHiVoQb0JOZK49f2
         vEa/xaDVz/z9876vn55Fs/Uip3d9T8kw/BRYc0LKbaqPE9L/bd+p6v5PFeF3Quro+kLj
         azoip3AlWsFzwo5JYpkczAlKa4si6d0Yls9Hq5BYY8g3GrPu0M7pjl9GlPUlJC/QGdvh
         AV7GP/+3iF9C/7lmtqtiE5yk3YbMVwPrp71MNuaE9V7OmiyWsqY6zHuo5H5GNolc3cj8
         zP7w==
X-Gm-Message-State: APjAAAWmS7Tl8U3ZTy5LErzhFM4VidYOTbDG/TvH13bvPANusAUMW6YQ
        Vm91LLHdpJa1Jsu8uyx1SiU=
X-Google-Smtp-Source: APXvYqynmSayN+effdTkIadEzkTXnzmsvurSXr0zsGFqccNp3FIydiJaZFYwNsYn2B/4oHoTAkLumg==
X-Received: by 2002:a17:902:8a8e:: with SMTP id p14mr45705255plo.28.1582466888756;
        Sun, 23 Feb 2020 06:08:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v8sm9132919pfn.172.2020.02.23.06.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2020 06:08:07 -0800 (PST)
Subject: Re: [PATCH 3/3] watchdog: imx2_wdt: Remove unused include of init.h
To:     Anson Huang <anson.huang@nxp.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <1582250430-8872-1-git-send-email-Anson.Huang@nxp.com>
 <1582250430-8872-3-git-send-email-Anson.Huang@nxp.com>
 <20200222160218.GA12740@roeck-us.net>
 <DB3PR0402MB3916C4CC9A79BFA49441EBEAF5EF0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a45aeb79-7918-42e9-1c47-3cc631057a59@roeck-us.net>
Date:   Sun, 23 Feb 2020 06:08:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <DB3PR0402MB3916C4CC9A79BFA49441EBEAF5EF0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/22/20 4:16 PM, Anson Huang wrote:
> Hi, Guenter
> 
>> Subject: Re: [PATCH 3/3] watchdog: imx2_wdt: Remove unused include of
>> init.h
>>
>> On Fri, Feb 21, 2020 at 10:00:30AM +0800, Anson Huang wrote:
>>> There is nothing in use from init.h, remove it.
>>>
>>
>> NACK, sorry; this driver uses __init and __exit_p.
> 
> Ah, yes, just notice them. But I don't understand why the .probe callback needs
> __init and .remove callback needs __exit_p? Should they need to be removed?
>   

That is not a matter of "needs". __init causes the code to be removed after
initialization. This is ok and desirable if it is known that the hardware is
built-in and will only ever be probed once.

exit_p causes the code to be removed if it is built into the kernel. This is
desirable and makes sense if the device is known to never be removed.

Having said that, what _is_ unnecessary is the remove function. Registration
could use devm_watchdog_register_device(), and the watchdog subsystem should
prevent removal if the watchdog is running. Plus, the removal function is
buggy: It doesn' call clk_disable_unprepare() (but that could be handled
with devm_add_action_or_reset() in the probe function). In my opinion,
fixing all that would be more valuable than trying to drop an include file.

Thanks,
Guenter
