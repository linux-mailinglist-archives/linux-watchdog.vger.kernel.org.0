Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 533C23F072B
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Aug 2021 16:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239340AbhHROy0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Aug 2021 10:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239811AbhHROyX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Aug 2021 10:54:23 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD7CC061764
        for <linux-watchdog@vger.kernel.org>; Wed, 18 Aug 2021 07:53:48 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so4169622otk.9
        for <linux-watchdog@vger.kernel.org>; Wed, 18 Aug 2021 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Tb+yhIt9tXNGoREbp4KViSFIoC2tjwz+VrddKZUmAsk=;
        b=q46hqc2wqiB8OZ3OaQ3++UOLCtT66A6Y+x46CSxjKWwHdf4jDkIHJoG/g50O8ZPhoS
         hhjj+UL7MG5Q5ufyAqjP7TI5yivGKj42ilzdXmU4P3UbKcBTMFx2SDEPvTVO5PPT5uTr
         ZKul6VbCTnWWTu0fxfJ2SYFB3u9nEFXCREAaWMUPWmc0dIeOBHKXPmCK8BnFef/TDh0S
         OOSMyuALKmGwwFvLUni3ji4h7wOUP7013ZWOecHaM3O295AN0aAHCUZpecXVC6l1/+eG
         wNVdoQWLaMYL89sPOCYdQ3s9QYkYjr6Z0m75PuYDvn89jLgLfa8QO3+5kB1WyktNpngC
         BV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tb+yhIt9tXNGoREbp4KViSFIoC2tjwz+VrddKZUmAsk=;
        b=laSBQbpdHOHUh0F7AYDrzEGJg55qu+TKmQ4h6SpvMHBmqEx+RlYObKeBIIlCaYf8nv
         2gya88an1C0rJD9mgYhIa1kpSW5u2glLHIdy7WdKgD1WLAa4X5zPCss6sRuMeLrRQ5tG
         blT9/5iLu9xW0qhblcQ/xy+vpd5HpNwDHuTYvytShk6h9XBVlvz4YmawaUgOv9BETC7j
         V84xu/2+o/Wh2UJ9xMtE8rManx9u1zcOKEHEnhMYGU+Yl9j5hqEBuJ6dgOCZsT0bZ+Z4
         kSHGQGQKlofhGCv2be/4Own/xNjpAmHTnBCJ2p4PqcvV3zzEI6iA69hFxSVQE9qw+DPg
         e5DQ==
X-Gm-Message-State: AOAM533c+prSoOdqBNk9FEg1kyDYZ5/X7FLiXkhnbJer5vsvY6OmmdP5
        k4KTd69VuyZDuBRMly5iThU=
X-Google-Smtp-Source: ABdhPJwzNlgORTq3NTBccuCv1WhwQZDYuPRKWMkPGAhRJvnaEkC/fmkYA7kLRVloQvkCmLPPbkGNnA==
X-Received: by 2002:a9d:206c:: with SMTP id n99mr7369659ota.64.1629298427098;
        Wed, 18 Aug 2021 07:53:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l8sm1089068oom.19.2021.08.18.07.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 07:53:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [Watchdog drivers] - WDIOC_GETSUPPORT clarification
To:     Hans de Goede <hdegoede@redhat.com>,
        Jose Noguera <jnoguera@redhat.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     Peter Robinson <perobins@redhat.com>
References: <CAKu6O181WOq36RCDO0VPcsZZoUFAJ88BMqv0Hqf+qYCeZsMJtQ@mail.gmail.com>
 <9866b7d2-1d43-db77-fa79-0be4bed51f5f@roeck-us.net>
 <0db70d23-d15c-e485-2600-439dc5d55d47@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <3d7ec88a-8756-9a22-9e85-ab3b8c9953d2@roeck-us.net>
Date:   Wed, 18 Aug 2021 07:53:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0db70d23-d15c-e485-2600-439dc5d55d47@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/18/21 7:49 AM, Hans de Goede wrote:
> Hi,
> 
> On 8/18/21 4:13 PM, Guenter Roeck wrote:
>> On 8/18/21 2:57 AM, Jose Noguera wrote:
>>> Hello all!
>>>
>>> I’m Jose, working in Red Hat on Fedora IoT and RHEL For Edge related projects.
>>>
>>> While trying to add the feature of figuring out whether the current boot was triggered or not by a hardware watchdog using wdctl, we’ve found an odd behaviour in the drivers definition that we would like to check with you.
>>>
>>> Looking specifically for the flag WDIOF_CARDRESET, we can find 40 files that contain it:
>>>
>>> $ grep -rl CARDRESET drivers/watchdog/ | wc -l
>>> 40
>>>
>>> but only 19 of them have the flag advertised in the options field of the watchdog_info struct returned by the WDIOC_GETSUPPORT ioctl.
>>>
>>> This leads to wdctl not showing WDIOF_CARDRESET for drivers like i6300esb, even when the board had been reset this way:
>>>
>>> $ sudo wdctl
>>> Device: /dev/watchdog0
>>> Identity: i6300ESB timer [version 0]
>>> Timeout: 30 seconds
>>> Pre-timeout: 0 seconds
>>>
>>> FLAG DESCRIPTION STATUS BOOT-STATUS
>>> KEEPALIVEPING Keep alive ping reply 1 0
>>> MAGICCLOSE Supports magic close char 0 0
>>> SETTIMEOUT Set timeout (in seconds) 0 0
>>>
>>> Working with Hans (in CC), we added a little patch (BugZilla ticket: 1993983) on wdctl and this would be the output of the command when it was a card reset triggered boot:
>>>
>>> $ sudo wdctl
>>> Device: /dev/watchdog0
>>> Identity: i6300ESB timer [version 0]
>>> Thank you all for your time,
>>>
>>> Jose
>>
>>> Timeout: 30 seconds
>>> Pre-timeout: 0 seconds
>>>
>>> FLAG DESCRIPTION STATUS BOOT-STATUS
>>> CARDRESET Card previously reset the CPU 1 1
>>> KEEPALIVEPING Keep alive ping reply 1 0
>>> MAGICCLOSE Supports magic close char 0 0
>>> SETTIMEOUT Set timeout (in seconds) 0 0
>>>
>>> So our question is, may we know what is intended to be present in ident.options? What should the API call WDIOC_GETSUPPORT return in the options field?
>>>
>>
>> Search for WDIOC_GETSUPPORT in Documentation/watchdog/watchdog-api.rst.
>> I don't see any ambiguity there. Patches welcome.
> 
> Ok, so drivers which may set CARDRESET in their GETBOOTSTATUS reply, but
> don't advertise this in their GETSUPPORT watchdog_info.options reply
> are buggy and should be fixed, got it. Thanks.
> 
> I've made a note about fixing this in a possible-kernel-projects document
> which I keep for when people who are interested in kernel development
> ask me for projects.
> 

With an add-on: If the driver in question is an old-style driver, anyone
affected by the problem should really convert the driver to support
the watchdog subsystem.

Thanks,
Guenter

> Regards,
> 
> Hans
> 

