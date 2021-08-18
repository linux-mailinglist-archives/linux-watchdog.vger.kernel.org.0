Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F56A3F070D
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Aug 2021 16:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238967AbhHROuL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Aug 2021 10:50:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49207 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239019AbhHROuJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Aug 2021 10:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629298172;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s7Lyj/ieRKc9K2s5IHpXE6VBQKpJC+mo/RRZtN4R68k=;
        b=Ngg3LS8yY91JUtw2uxTYX5Lh2+X+WJefLYVnogXpxIg9rIQgcCKhzPJQRN8lEzM2FlQD/E
        4LG3W+yx5uYFgLG8qKWRvzN+DlRzprJ1ATMLlkBpg18RMQRNLccP0KBX7W8NntXKyQlH+o
        ykoYC4mkz5n//tGeFuR+blqO0DCbFhg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-R0_TWqv6N9mCFodHyO3ZKg-1; Wed, 18 Aug 2021 10:49:31 -0400
X-MC-Unique: R0_TWqv6N9mCFodHyO3ZKg-1
Received: by mail-ed1-f69.google.com with SMTP id v20-20020aa7d9d40000b02903be68450bf3so1154773eds.23
        for <linux-watchdog@vger.kernel.org>; Wed, 18 Aug 2021 07:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s7Lyj/ieRKc9K2s5IHpXE6VBQKpJC+mo/RRZtN4R68k=;
        b=NFitURY0WyfbwlZk1QxGx+ggIwdjwAh1v3uUVoZvEHhImuM378qT1ZEMJlfzlXtvAV
         rjCbOmdHUSstXamQfVNLIDGZEizgSt+V+zYQYF9Ut2iVOl/8a8jPFmywSaw0rEZ2q3M+
         0PIa2q0AvT1IdnCA/GQpiEhcGobpzCz0wCgZ433iG+tWS1n2/8M6ZZ+6e6TQnc/prOMl
         ujs0i4EP6UuUFnJKYptUqkmgWCFdTkurzf4V0b+Py9paKApHgj+cBI0r3Q5bJrS7+jsw
         kEVE3Y2/3hEr8Owswr4tu1YJJeQlMXoVCYX1RY7As8fhjiavPiSdRs/CtYf+AJqfXjcv
         CNAA==
X-Gm-Message-State: AOAM531csdrrHZWDj9R7MSKDpCo/xCZsCSBzp/Z2COqO8fRP13zJmTj8
        Vuzyevj9fjKmNXCUqmOiVJTTCMfYAcjMZyq3r9hiCmKY5xzBj1sm3e2sE6M/iDGAcFmilqvD14A
        6cROoPj/5B6WARvm3EkbTAbL2wl8=
X-Received: by 2002:a05:6402:394:: with SMTP id o20mr10464488edv.232.1629298170022;
        Wed, 18 Aug 2021 07:49:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhvWx4R4OLMLTFG6KtbrwR2PGpNmu5xAUvyR78qvAOZNwVRCK9AXwG0e89AtCez25SPWdzvA==
X-Received: by 2002:a05:6402:394:: with SMTP id o20mr10464475edv.232.1629298169876;
        Wed, 18 Aug 2021 07:49:29 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d3sm112991edv.48.2021.08.18.07.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 07:49:29 -0700 (PDT)
Subject: Re: [Watchdog drivers] - WDIOC_GETSUPPORT clarification
To:     Guenter Roeck <linux@roeck-us.net>,
        Jose Noguera <jnoguera@redhat.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     Peter Robinson <perobins@redhat.com>
References: <CAKu6O181WOq36RCDO0VPcsZZoUFAJ88BMqv0Hqf+qYCeZsMJtQ@mail.gmail.com>
 <9866b7d2-1d43-db77-fa79-0be4bed51f5f@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0db70d23-d15c-e485-2600-439dc5d55d47@redhat.com>
Date:   Wed, 18 Aug 2021 16:49:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9866b7d2-1d43-db77-fa79-0be4bed51f5f@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 8/18/21 4:13 PM, Guenter Roeck wrote:
> On 8/18/21 2:57 AM, Jose Noguera wrote:
>> Hello all!
>>
>> I’m Jose, working in Red Hat on Fedora IoT and RHEL For Edge related projects.
>>
>> While trying to add the feature of figuring out whether the current boot was triggered or not by a hardware watchdog using wdctl, we’ve found an odd behaviour in the drivers definition that we would like to check with you.
>>
>> Looking specifically for the flag WDIOF_CARDRESET, we can find 40 files that contain it:
>>
>> $ grep -rl CARDRESET drivers/watchdog/ | wc -l
>> 40
>>
>> but only 19 of them have the flag advertised in the options field of the watchdog_info struct returned by the WDIOC_GETSUPPORT ioctl.
>>
>> This leads to wdctl not showing WDIOF_CARDRESET for drivers like i6300esb, even when the board had been reset this way:
>>
>> $ sudo wdctl
>> Device: /dev/watchdog0
>> Identity: i6300ESB timer [version 0]
>> Timeout: 30 seconds
>> Pre-timeout: 0 seconds
>>
>> FLAG DESCRIPTION STATUS BOOT-STATUS
>> KEEPALIVEPING Keep alive ping reply 1 0
>> MAGICCLOSE Supports magic close char 0 0
>> SETTIMEOUT Set timeout (in seconds) 0 0
>>
>> Working with Hans (in CC), we added a little patch (BugZilla ticket: 1993983) on wdctl and this would be the output of the command when it was a card reset triggered boot:
>>
>> $ sudo wdctl
>> Device: /dev/watchdog0
>> Identity: i6300ESB timer [version 0]
>> Thank you all for your time,
>>
>> Jose
> 
>> Timeout: 30 seconds
>> Pre-timeout: 0 seconds
>>
>> FLAG DESCRIPTION STATUS BOOT-STATUS
>> CARDRESET Card previously reset the CPU 1 1
>> KEEPALIVEPING Keep alive ping reply 1 0
>> MAGICCLOSE Supports magic close char 0 0
>> SETTIMEOUT Set timeout (in seconds) 0 0
>>
>> So our question is, may we know what is intended to be present in ident.options? What should the API call WDIOC_GETSUPPORT return in the options field?
>>
> 
> Search for WDIOC_GETSUPPORT in Documentation/watchdog/watchdog-api.rst.
> I don't see any ambiguity there. Patches welcome.

Ok, so drivers which may set CARDRESET in their GETBOOTSTATUS reply, but
don't advertise this in their GETSUPPORT watchdog_info.options reply
are buggy and should be fixed, got it. Thanks.

I've made a note about fixing this in a possible-kernel-projects document
which I keep for when people who are interested in kernel development
ask me for projects.

Regards,

Hans

