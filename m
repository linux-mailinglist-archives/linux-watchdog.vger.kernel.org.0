Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAF18961A3
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Aug 2019 15:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729203AbfHTNxp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Aug 2019 09:53:45 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39847 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728248AbfHTNxo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Aug 2019 09:53:44 -0400
Received: by mail-pg1-f193.google.com with SMTP id u17so3299947pgi.6
        for <linux-watchdog@vger.kernel.org>; Tue, 20 Aug 2019 06:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R+ypcnght2kdcyqjnOiXmyAQ/osjNOQYaQoFv60Rkv8=;
        b=g6BGT92T2aogVCtD0qDAFdyhls0eBXSNeoiOg1m8OxYS+dp8ab8aw+EJ9Br0w5ZhzM
         6xBenYl+NhHXyBRYYgLKkZOIAma8EQnmKSCCCyurJW6iVap39cVzvkT9i8rLX3uXLJ0V
         18tYvLYUWsk98bYLL3/sAiNzw3QyrvGoRf2SQz2rcWQjG11HGTtR44B6uxM2r2C/0So/
         uFNrHhvjaSnFdl4m/NyywtQ70XCrESTawlJBg74L1023Y0k3fUt+vA5/7qPY4ndGLR1d
         Ndqvzb2ZF4n44cVwKwXdn6dY7BlVCVv3z+xqR7c5Ufdm8mRpgcMiN8Nf/flzxBIrLAnh
         CiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R+ypcnght2kdcyqjnOiXmyAQ/osjNOQYaQoFv60Rkv8=;
        b=hWwyGK/0EZPQm0HyEjes+2yK3MpIPSuG7er8K7HXxx1pVZoMfqd9heF6fDglldIpk1
         XE768QcdRLO6wai7lifuo/gTv5vWOfJ7lGi/I1VtOV/pVo8P3sKeFMFVXXRpLpBuXuwG
         1oBZyurALpszxvwBkv1kjoqtwHbk1yaDEzo2Z58bHrBRrNMRyq/2LmVOGYhOeoxtgfyg
         vjUXBl3ExTA9kPHQp5h8N5Gko0rBs8onDKsvk5YQr0Sk4JgbilCD4RrKc7GyPVu/0B5r
         TMiASW+EI0zHYinzoYUGZ3DQdNxD4vRGgvyOu/HWfXhVm3cKBxc7XgeXZupZWFwsRPTq
         pfiQ==
X-Gm-Message-State: APjAAAWDv+aEHXKZsQycmj21DQYFBgX5lyFke9o1ZNg1K6IeU0wy4Bz1
        rohYLKQUnjA9jXeueIN9BtinsMHO
X-Google-Smtp-Source: APXvYqyaCiJF2PrhPuhq97+hDbq7M136FzCqpL/NHE62upz/zcL7hKsErsWXmvkE+Rrtv4BwIbWLfQ==
X-Received: by 2002:aa7:984a:: with SMTP id n10mr30487626pfq.3.1566309223686;
        Tue, 20 Aug 2019 06:53:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p20sm29745667pgi.81.2019.08.20.06.53.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 06:53:42 -0700 (PDT)
Subject: Re: [PATCH 02/12] watchdog: Add the ability to provide data to read
To:     cminyard@mvista.com, Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     Convert@minyard.net, the@minyard.net, IPMI@minyard.net,
        watchdog@minyard.net, to@minyard.net, standard@minyard.net,
        interface@minyard.net, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20190819203711.32599-1-minyard@acm.org>
 <20190819203711.32599-3-minyard@acm.org> <20190819224345.GB8869@roeck-us.net>
 <20190820002309.GI445@minyard.net>
 <20190820010946.GF25435@anatevka.americas.hpqcorp.net>
 <20190820121243.GO445@minyard.net>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <fa50d921-8d40-6bf8-00f3-b46d9468829a@roeck-us.net>
Date:   Tue, 20 Aug 2019 06:53:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820121243.GO445@minyard.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/20/19 5:12 AM, Corey Minyard wrote:
> On Mon, Aug 19, 2019 at 07:09:46PM -0600, Jerry Hoemann wrote:
>> On Mon, Aug 19, 2019 at 07:23:09PM -0500, Corey Minyard wrote:
>>> On Mon, Aug 19, 2019 at 03:43:45PM -0700, Guenter Roeck wrote:
>>>> On Mon, Aug 19, 2019 at 03:37:01PM -0500, minyard@acm.org wrote:
>>>>> From: Corey Minyard <cminyard@mvista.com>
>>>>>
>>>>> This is for the read data pretimeout governor.
>>>>>
>>>>> Signed-off-by: Corey Minyard <cminyard@mvista.com>
>>>>
>>>> On further thought, I think it would be a bad idea to add this
>>>> functionality: It changes the userspace ABI for accessing the watchdog
>>>> device. Today, when a watchdog device is opened, it does not provide
>>>> read data, it does not hang, and returns immediately. A "cat" from it
>>>> is an easy and quick means to test if a watchdog works.
>>>
>>> Umm, why would a "cat" from a watchdog tell you if a watchdog works?
>>
>> cat /dev/watchdog starts the watchdog running.
>>
>> Then one can do useful things like monitor /sys/class/watchdog/watchdogN and see
>> time ticking down, etc..,
>>
>> echo V > /dev/watchdog stops the watchdog assuming driver supports WDIOF_MAGICCLOSE.
>>
>> So I can test without having to reboot.
>>
>> One can't test magic close with the proposed change as /dev/watchdog
>> is exclusive open.
> 
> Sure you can:
> 
> # echo "" >/dev/watchdog0
> [   92.390649] watchdog: watchdog0: watchdog did not stop!
> # sleep 2
> # cat /sys/class/watchdog/watchdog0/timeleft
> 8
> # echo "V" >/dev/watchdog0
> 
> Works just fine.  But I can make it so that reading returns an error
> unless the governor is the read one.
> 
> The question is if this is required to transfer the IPMI watchdog
> over to the standard interface.  It currently has this function,
> do we do an API change to move it over?
> 
Having to change the standard watchdog API to accommodate a non-standard driver
is most definitely not the right approach. If it was, anyone could use it to
force standard API/ABI changes. Just implement driver X outside its subsystem
and then claim you need to change the subsystem to accommodate it.

On a side note, a standard watchdog driver can implement its own ioctl functions.

Guenter

> -corey
> 
>>
>>
>>
>>
>> -- 
>>
>> -----------------------------------------------------------------------------
>> Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
>> -----------------------------------------------------------------------------
> 

