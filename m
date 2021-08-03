Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4148A3DF0F8
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Aug 2021 17:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235641AbhHCPBh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 3 Aug 2021 11:01:37 -0400
Received: from thoth.sbs.de ([192.35.17.2]:52215 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235368AbhHCPBg (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 3 Aug 2021 11:01:36 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 173F153s023774
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 3 Aug 2021 17:01:05 +0200
Received: from [167.87.38.215] ([167.87.38.215])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 173F145k008483;
        Tue, 3 Aug 2021 17:01:04 +0200
Subject: Re: Faulty commit "watchdog: iTCO_wdt: Account for rebooting on
 second timeout"
From:   Jan Kiszka <jan.kiszka@siemens.com>
To:     Jean Delvare <jdelvare@suse.de>, linux-watchdog@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Michael Marley <michael@michaelmarley.com>
References: <20210803165108.4154cd52@endymion>
 <e13f45c4-70e2-e2c2-9513-ce38c8235b4f@siemens.com>
Message-ID: <67815219-7226-1a90-4599-5649e9bbc861@siemens.com>
Date:   Tue, 3 Aug 2021 17:01:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <e13f45c4-70e2-e2c2-9513-ce38c8235b4f@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 03.08.21 16:59, Jan Kiszka wrote:
> On 03.08.21 16:51, Jean Delvare wrote:
>> Hi all,
>>
>> Commit cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on
>> second timeout") causes a regression on several systems. Symptoms are:
>> system reboots automatically after a short period of time if watchdog
>> is enabled (by systemd for example). This has been reported in bugzilla:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=213809
>>
>> Unfortunately this commit was backported to all stable kernel branches
>> (4.14, 4.19, 5.4, 5.10, 5.12 and 5.13). I'm not sure why that is the
>> case, BTW, as there is no Fixes tag and no Cc to stable@vger either.
>> And the fix is not trivial, has apparently not seen enough testing,
>> and addresses a problem that has a known and simple workaround. IMHO it
>> should never have been accepted as a stable patch in the first place.
>> Especially when the previous attempt to fix this issue already ended
>> with a regression and a revert.
>>
>> Anyway... After a glance at the patch, I see what looks like a nice
>> thinko:
>>
>> +	if (p->smi_res &&
>> +	    (SMI_EN(p) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
>>
>> The author most certainly meant inl(SMI_EN(p)) (the register's value)
>> and not SMI_EN(p) (the register's address).
>>
> 
> https://lkml.org/lkml/2021/7/26/349
> 

That's for the fix (in line with your analysis).

I was also wondering if backporting that quickly was needed. Didn't
propose it, though.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
