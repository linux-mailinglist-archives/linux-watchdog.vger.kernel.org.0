Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644C53D6535
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 19:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbhGZQaV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 12:30:21 -0400
Received: from david.siemens.de ([192.35.17.14]:60810 "EHLO david.siemens.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235177AbhGZQaP (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 12:30:15 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 16QHAQW9024999
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Jul 2021 19:10:26 +0200
Received: from [167.87.33.191] ([167.87.33.191])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16QHAPq7008761;
        Mon, 26 Jul 2021 19:10:25 +0200
Subject: Re: [PATCH] watchdog: iTCO_wdt: Fix detection of SMI-off case
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Christian Storm <christian.storm@siemens.com>,
        =?UTF-8?Q?Mantas_Mikul=c4=97nas?= <grawity@gmail.com>
References: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
 <CAHp75VfCydLguFX=MSoAQ_gayra5ovuwLxcY7m_pHiafvB7b5w@mail.gmail.com>
 <c1c15112-b102-570b-1432-568ca219ccf9@siemens.com>
 <CAHp75VdYUUqVi6rd6C-W+1aTXCPs7ehSLDcRfo4RVe7XU+6c+A@mail.gmail.com>
 <521d14ad-8952-7ef9-3575-b48cefeb8241@roeck-us.net>
 <84665dcf-f036-f059-61a4-cea5087ace2d@siemens.com>
 <CAHp75VdqS5QUwq=25RGKOiPRfcNzNxG9kNMtP-2-=z4EAnUi8w@mail.gmail.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <175ca7d9-254b-ca35-359c-a077b284c9fa@siemens.com>
Date:   Mon, 26 Jul 2021 19:10:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdqS5QUwq=25RGKOiPRfcNzNxG9kNMtP-2-=z4EAnUi8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 26.07.21 16:51, Andy Shevchenko wrote:
> On Mon, Jul 26, 2021 at 5:05 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 26.07.21 15:59, Guenter Roeck wrote:
>>> On 7/26/21 6:40 AM, Andy Shevchenko wrote:
>>>> On Mon, Jul 26, 2021 at 3:04 PM Jan Kiszka <jan.kiszka@siemens.com>
>>>> wrote:
>>>>>
>>>>> On 26.07.21 14:01, Andy Shevchenko wrote:
>>>>>> On Mon, Jul 26, 2021 at 2:46 PM Jan Kiszka <jan.kiszka@siemens.com>
>>>>>> wrote:
>>>>>>>
>>>>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>>
>>>>>>> Obviously, the test needs to run against the register content, not its
>>>>>>> address.
>>>>>>>
>>>>>>> Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on
>>>>>>> second timeout")
>>>>>>> Reported-by: Mantas Mikulėnas <grawity@gmail.com>
>>>>>>
>>>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>
>>>>>> Missed SoB of the submitter (hint: configure your Git to make sure
>>>>>> that submitter and author are the same in terms of name-email).
>>>>>
>>>>> The signed off is there. Not sure what you are referring to.
>>>>
>>>> Nope. It's not. The sign of that is the From: line in the body of the
>>>> email. It happens when the submitter != author. And SoB of the former
>>>> one is absent. But what is strange is that reading them here I haven't
>>>> found the difference. Maybe one is in UTF-8 while the other is not and
>>>> a unicode character degraded to Latin-1 or so?
>>>>
>>>
>>> I have no idea why there is an additional From:, but both From:
>>> tags in the e-mail source are exact matches, and both match the
>>> name and e-mail address in Signed-off-by:. I agree with Jan,
>>> the SoB is there.
>>
>> There is one unknown in this equation, and that is the anti-email system
>> operated by a our IT and some company in Redmond.
> 
> Hmm... The From: in the body is the result of the `git format-patch` I believe.
> So, two (or more?) possibilities here:
>  1) your configuration enforces it to always put From: (something new to me);

Yes, it does, as I explained in my other reply. That's a safety net
because you never have full control over what some mail servers do to
the first From.

>  2) the submitter and author are not the same (see also:
> https://github.com/git/git/commit/a90804752f6ab2b911882d47fafb6c2b78f447c3);
>  3) ...anything else...?
> 
>> But I haven't received
>> any complaints that my outgoing emails are negatively affected by it
>> (incoming are, but that's a different story...). If you received
>> something mangled, Andy, please share the source of that email. I'm
>> happy to escalate internally - and externally.
> 
> I believe I see it in the same way as lore, i.e.
> https://lore.kernel.org/linux-watchdog/d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com/raw

Perfect, then all is fine as it should be (and no time for O365 bashing,
today).

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
