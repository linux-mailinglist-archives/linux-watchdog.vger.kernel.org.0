Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43D4496736
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Aug 2019 19:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbfHTROx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Aug 2019 13:14:53 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40010 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727272AbfHTROx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Aug 2019 13:14:53 -0400
Received: by mail-pf1-f194.google.com with SMTP id w16so3765685pfn.7
        for <linux-watchdog@vger.kernel.org>; Tue, 20 Aug 2019 10:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AJJRrHrH9yML+FmmAX88cj3Uz20Z2dQBd64+iNEJPZ0=;
        b=EQ4VT6NTMeJzKJ7peuj6EIdvI6iof6x/fW2mF/H/bEvAC6F1B6v2wc7mFX/s53lG1m
         Unr+4Mh6hy5mBhWg+9uRZqj45cmbUddKRb5NzhIPsOR/F6/OA9wMdpzvRlwZrUvxRZWn
         yEvNtU1YrDR9B7TkOh5iypLTAHRBs4Mb64OR8SjVcGPg6tlNeo9HlRTBN2HeWXF/cNH/
         kPElfBejCi9iHJPkULiK0DtdijXlLdqhbVn9b3iYC1TQwspyaM1BzBaV5/qTy5Ks4Dix
         RO5lnurUzCjmT4Vok1NLPTwrn2YAT7WXc9DoF0xIiBBBga0x32/ssAKWJlH0n8QfGfcE
         uenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AJJRrHrH9yML+FmmAX88cj3Uz20Z2dQBd64+iNEJPZ0=;
        b=aKLH0MSndKpPuc27XWGxvHxk2Lv4scaQiZ4p5S353XAec6znKG64MMipEMWQRk70ia
         HMsSqU9xdb5Ae9C6gne2DfAUzBYBguWlaEneVzqResh7sxdByMnK6nkrPg++ObyIzEtr
         vvfrFckS0ySBHndmtCmXCmMFULpCkKIDWkbC8oJYo2+f3DN2EScUfWi3Cp8AtvUejFw5
         oHH0Waeewa5nUCNxg3qaOOmp05M7lF4dJb9TkFd2S8Sey+WTzWyvZQ8lq5hToam6RX+H
         5+V+nn0d9WeXfAe567z5KcfkBEFdCgHNOLuqakB7D2syZCm+kV4/XatAa6YDucBMsEQW
         izsQ==
X-Gm-Message-State: APjAAAWRJFScnCqNMy7Fh631pquVhLp4F4gD6eMzE9LyTq7VpK5d4c6S
        SjfbViuwv0pJgFUW8JxTKQg=
X-Google-Smtp-Source: APXvYqyam1IyX69wn/p0FvLpD+SVCxDHZooUoY2ZEvW+BweotA7vcV8Yt9hkSmMUhFed2EOEUxhuhg==
X-Received: by 2002:a65:52c5:: with SMTP id z5mr25832062pgp.118.1566321292374;
        Tue, 20 Aug 2019 10:14:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 185sm22387267pfd.125.2019.08.20.10.14.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 10:14:51 -0700 (PDT)
Subject: Re: [PATCH 02/12] watchdog: Add the ability to provide data to read
To:     cminyard@mvista.com
Cc:     Jerry Hoemann <jerry.hoemann@hpe.com>, Convert@minyard.net,
        the@minyard.net, IPMI@minyard.net, watchdog@minyard.net,
        to@minyard.net, standard@minyard.net, interface@minyard.net,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20190819203711.32599-1-minyard@acm.org>
 <20190819203711.32599-3-minyard@acm.org> <20190819224345.GB8869@roeck-us.net>
 <20190820002309.GI445@minyard.net>
 <20190820010946.GF25435@anatevka.americas.hpqcorp.net>
 <20190820121243.GO445@minyard.net>
 <fa50d921-8d40-6bf8-00f3-b46d9468829a@roeck-us.net>
 <20190820155808.GQ445@minyard.net>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f4a6d027-c491-5e81-777e-ac2ffaecd3dc@roeck-us.net>
Date:   Tue, 20 Aug 2019 10:14:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820155808.GQ445@minyard.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/20/19 8:58 AM, Corey Minyard wrote:
> On Tue, Aug 20, 2019 at 06:53:40AM -0700, Guenter Roeck wrote:
>> On 8/20/19 5:12 AM, Corey Minyard wrote:
>>> On Mon, Aug 19, 2019 at 07:09:46PM -0600, Jerry Hoemann wrote:
>>>> On Mon, Aug 19, 2019 at 07:23:09PM -0500, Corey Minyard wrote:
>>>>> On Mon, Aug 19, 2019 at 03:43:45PM -0700, Guenter Roeck wrote:
>>>>>> On Mon, Aug 19, 2019 at 03:37:01PM -0500, minyard@acm.org wrote:
>>>>>>> From: Corey Minyard <cminyard@mvista.com>
>>>>>>>
>>>>>>> This is for the read data pretimeout governor.
>>>>>>>
>>>>>>> Signed-off-by: Corey Minyard <cminyard@mvista.com>
>>>>>>
>>>>>> On further thought, I think it would be a bad idea to add this
>>>>>> functionality: It changes the userspace ABI for accessing the watchdog
>>>>>> device. Today, when a watchdog device is opened, it does not provide
>>>>>> read data, it does not hang, and returns immediately. A "cat" from it
>>>>>> is an easy and quick means to test if a watchdog works.
>>>>>
>>>>> Umm, why would a "cat" from a watchdog tell you if a watchdog works?
>>>>
>>>> cat /dev/watchdog starts the watchdog running.
>>>>
>>>> Then one can do useful things like monitor /sys/class/watchdog/watchdogN and see
>>>> time ticking down, etc..,
>>>>
>>>> echo V > /dev/watchdog stops the watchdog assuming driver supports WDIOF_MAGICCLOSE.
>>>>
>>>> So I can test without having to reboot.
>>>>
>>>> One can't test magic close with the proposed change as /dev/watchdog
>>>> is exclusive open.
>>>
>>> Sure you can:
>>>
>>> # echo "" >/dev/watchdog0
>>> [   92.390649] watchdog: watchdog0: watchdog did not stop!
>>> # sleep 2
>>> # cat /sys/class/watchdog/watchdog0/timeleft
>>> 8
>>> # echo "V" >/dev/watchdog0
>>>
>>> Works just fine.  But I can make it so that reading returns an error
>>> unless the governor is the read one.
>>>
>>> The question is if this is required to transfer the IPMI watchdog
>>> over to the standard interface.  It currently has this function,
>>> do we do an API change to move it over?
>>>
>> Having to change the standard watchdog API to accommodate a non-standard driver
>> is most definitely not the right approach. If it was, anyone could use it to
>> force standard API/ABI changes. Just implement driver X outside its subsystem
>> and then claim you need to change the subsystem to accommodate it.
> 
> I'm not advocating anything of the sort.  I think it can be done in
> a way that keeps the API the same unless you enable a new pretimeout
> governor.  I would not suggest that the API be changed, and I should
> have handled that in the original design.
> 
>>
>> On a side note, a standard watchdog driver can implement its own ioctl functions.
> 
> I am aware of that, but you can't provide read data on a file descriptor
> through that interface.  The actions and preactions could be done that
> way, but that seemed a more general function that could benefit other
> drivers.
> 
That comment was more directed towards the ioctls you are adding to the
watchdog core, which I think would require more discussion.

> The function to provide read data might be useful, I don't know, but
> it could be used with any driver that did a normal interrupt pretimeout.
> I can't remember why it was originally done.  I vaguely remember someone
> asking for it, but that was 17 years ago.
> 

I find it odd. Only one driver can have the watchdog device open,
and that open file should be used to ping the watchdog. It can't do that
while waiting for a pretimeout. This almost sounds like the user wrote
an application which waited for the pretimeout to happen before pinging
the watchdog.

Talking about a standardized ABI to inform userspace if a pretimeout
occurred... if there is a use case for this, I'd rather trigger a udev
event on the "pretimeout" sysfs attribute. That would make much more
sense to me than sending a random data byte to the "read" function.
The WDIOC_GETSTATUS ioctl could then report that a pretimeout occurred.
Or, depending on the use case, just report the fact that a pretimeout
occurred with WDIOC_GETSTATUS. That would be really simple to add,
and I would support it.

> It could just be left out and added back if someone complains.  That's
> not very friendly since it's an API change, but then we would know if
> anyone was using it.

It is still better than an API change for standard watchdog drivers,
and a somewhat awkward interface to inform userspace about pretimeout
events.

Thanks,
Guenter

> 
> -corey
> 
>>
>> Guenter
>>
>>> -corey
>>>
>>>>
>>>>
>>>>
>>>>
>>>> -- 
>>>>
>>>> -----------------------------------------------------------------------------
>>>> Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
>>>> -----------------------------------------------------------------------------
>>>
>>
> 

