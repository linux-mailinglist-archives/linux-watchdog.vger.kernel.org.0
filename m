Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0816C19744
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 May 2019 05:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfEJDxr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 9 May 2019 23:53:47 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34211 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726916AbfEJDxr (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 9 May 2019 23:53:47 -0400
Received: by mail-pl1-f193.google.com with SMTP id w7so2166835plz.1
        for <linux-watchdog@vger.kernel.org>; Thu, 09 May 2019 20:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RJ5ymXPLzSAjMLqDfnseP5vp46vxa/2u3pCc/ti2+6I=;
        b=aixP4btYJi9Pp6rDLVSymYswm8oIHZkcSIIv3Npb9QkOsWwyUgJAMyGKpKPX8hqYWb
         dOLCtkWuMKwOByrMcl8cPfj8+2NL983FZY2M9wRI0uZnl1n90W0OD5MLMJ6S9g8MZ3kL
         08SLjyGrk0wTqoXM0avqvGHFs9RasPerG5FTJHTRZx7K7yR7kF5QG19EarRe3aGczA4q
         wUnDNi1Ah4/dTHqPcxE/s+ey2QCzbDCveCGBqn0cljwBw+erl8I8Dl40fRANQ96M05sV
         Kei7aaBxI/Ru9oCQ6EXEsKVYcR2cR+Cwfl7RpuxKkjQv6hR76yl6G7wXvXpo3moY1NtT
         cMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RJ5ymXPLzSAjMLqDfnseP5vp46vxa/2u3pCc/ti2+6I=;
        b=qAuQuNeVMKwgGZEQc34usfpgg/giwiauc2P8/+QCOTPq5DM1jbv37CCeFl6DJtEWSo
         WYBoi4wByf5WXUQblBt5rCSErT+uQ8N2RMionHdYmmzm977nS3DB5YpD/NoRi6Cf+G/o
         DHCKVIbC8Z1Dh9S3LhxyCEdGMDJ98AC7NGPSQ3ZXP++1S9N/cYBP+rs42YyGCWpvB58C
         XZcf5Uvhcht0RIEAcPXcS+QEccCr7hj5LaNpN7KTYYZKOyERPuNkUDVzNyhnBudCEx02
         7pTc+vNnOTcQ9gNziqXasySkQAxkNN6Py5hYkkO882sXBkaccg/ZaydJOssNmbQh5Ebx
         wHNw==
X-Gm-Message-State: APjAAAXpZ2/QuAkgZmPMYg7o8+Ktq0ChzoRRHDED+CDg30kj6WVHFYjf
        6ps4xq6RgZ2nXUP9x6c/wS0rOnH9
X-Google-Smtp-Source: APXvYqw4GPMEE3wdxSvcp2xBgpAM12cwWXDSkIzjlgcuWAXFht0JHD26uhhAhdZ+SgfJry5ic7xbGw==
X-Received: by 2002:a17:902:24a:: with SMTP id 68mr9922428plc.250.1557460426186;
        Thu, 09 May 2019 20:53:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l65sm8687945pfb.7.2019.05.09.20.53.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 20:53:44 -0700 (PDT)
Subject: Re: What to set in struct watchdog_device::bootstatus?
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
References: <20190208105230.g33nxiu4r6uqech3@pengutronix.de>
 <f9ec94d7-8365-e733-81ff-34c501cce89a@roeck-us.net>
 <20190220201408.gcgsg43uonwc4ucs@pengutronix.de>
 <20190509192510.m6o7d63u7e4fs22h@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <641788d4-7bbf-ed34-6bcb-6f34e1aa261f@roeck-us.net>
Date:   Thu, 9 May 2019 20:53:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509192510.m6o7d63u7e4fs22h@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/9/19 12:25 PM, Uwe Kleine-König wrote:
> Hello Guenter,
> 
> On Wed, Feb 20, 2019 at 09:14:08PM +0100, Uwe Kleine-König wrote:
>> In a custom kernel patch stack I found a patch that uses (apart from
>> WDIOF_CARDRESET also) WDIOF_POWERUNDER and WDIOF_EXTERN1 to
>> differentiate the different reset causes. Now that you told using this
>> is wrong, I wonder how these are supposed to be used instead; and there
>> are a few more that according to
>> Documentation/watchdog/watchdog-kernel-api.txt might be used to set
>> bootstatus. Are these a relic? What do these signal?
> 
> I'm still interested in an answer here. While it is currently not
> possible to "fix" the custom kernel as some other software that is
> already shipping depends on this. Still I'd like to know the details
> here to maybe suggest an alternative for the longterm future.
> 
>> IMHO there is a patch opportunity waiting to improve the documenation
>> :-) Or maybe even change watchdog_get_status() to ensure that only
>> WDIOF_CARDRESET, WDIOF_MAGICCLOSE and WDIOF_KEEPALIVEPING can be set?
> 

The basic problem, as I see it, is that the bits were defined a long time
ago as standard API, even tough they really only apply to a small subset
of watchdog cards. Personally I tend to believe that any set of bits
would be insufficient. Maybe it should have been a string. Either case,
I don't believe in forcing more or less random reboot reasons into a
given set of bits. On the other side I also don't see the point in
arbitrarily limiting the bit values returned by WDIOC_GETSTATUS.
With that, my general approach would be some kind of report-what-makes-sense
approach. But using WDIOF_POWERUNDER for "power cycle" just goes a bit too
far.

Thanks,
Guenter
