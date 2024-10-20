Return-Path: <linux-watchdog+bounces-2239-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A60B29A5203
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Oct 2024 04:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95C16B21501
	for <lists+linux-watchdog@lfdr.de>; Sun, 20 Oct 2024 02:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D5928F4;
	Sun, 20 Oct 2024 02:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8fJn/lY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5462119;
	Sun, 20 Oct 2024 02:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729392526; cv=none; b=gZDw3jyNPaf1Qt+o4Ivnbxg416RYfkbS/5S62Jtx34fCX96+gNFXB4vHTweL/m+18N2S9k+ArazH+kKTMSG9sBYKBUnLYShiwoNoblxLSclS1ntmzS5p1xLI/GuPVtTTvzWkTiUda8heWEztP/AVVH983xNo2q5RC1eeCCNJPnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729392526; c=relaxed/simple;
	bh=hT180n6qO2pFHddG1IxvqgO0JDIb1ao4rVOdUYN+H6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnyJZ21g7XOcNxGkdJ8REg+qah60r0322/MO80mnR8+6XECcjqrUGBMmO8cnW5z6/aLR4cmhXNqcig79J3PAH+QH2l/eZYUQlv7kqfL3PXcC/8CWysgoj6etafoms2wa1GLb2LpSknieZvUizxvKoxSRAhVVbZt1zSeeldcVTtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8fJn/lY; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ea79711fd4so2338922a12.0;
        Sat, 19 Oct 2024 19:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729392523; x=1729997323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iFV4XfvnQE9C39gQWF+E1gqEMlXGECPAzKUue/FpEvU=;
        b=L8fJn/lYB5KO04bk+HZyqC32AuxL4XGLf76nkjwIpycDhZGqUU92eDHymNYgz0zdKl
         L09Wp8L3UOtRoC4f8NVcd7SXjo2OhRdioLJFjOpQE4K8EZJUqq6eW3rqUfeHL3EDfwoI
         /uZ5f+LLVHY55/WlDvA0zfIV44T+Z2N653wqNx3Kkz6xeRXTDw2YtgV2b9UTKNR/DKGm
         BCurb0oHYgqY7l0NJdI3FoeKcAJDeVgW59hq3gniV92PBiI0dIs+IE8GkWLwKkJ52VA5
         foCglGoUu5CdgY6FBTKUjaLW3zUd9xN5UqkK1ABGRnUbKwcAlayrnCaIONGXO+OykpSk
         HawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729392523; x=1729997323;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFV4XfvnQE9C39gQWF+E1gqEMlXGECPAzKUue/FpEvU=;
        b=PBQaq2WL+CEmdPJbIErvimZNmtmM5b5tWaCOP0CEF1hIYW+cda26QIwgam0ALKjwgW
         8iUDVyc7znHxNIzDChT/iDNaAIupsU7H0QS3a509AI1aMF2amYNrdtt5G7tz2exyQqp6
         FxNb34J9QTBbT10IZosasZER1SuqF9vtesMik//Qg4lrBoNdbIysrTVkoL+JktJnIc0+
         L+Yo5bOz9FsPNIrAX4BC38gMgprGRFopTlELdP9Th9N31OgEGg4pxR7kk2aLzSq2VE3p
         dEwOt7oLeHtBpxuOU4/uAOjFBSd/KelSCK3wvjCEWL7SfK2akaL1wxQ5yiyJny4BDjOJ
         dFNA==
X-Forwarded-Encrypted: i=1; AJvYcCWAYpEk/QF8jIJVMZYqpRgye+sfV7VNQscqklsjaBwRsWz9j6WivQU05/6nIc12FjxQdU1zwmAAwca0kJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsD8Cxa3eS5Rhu5PMGKY4MoaeJRCLe1L50ohwiPsJVzIvVCnT2
	fYjLi+crV/RIXGiDUO5Bq93+s97Wyi1YXpoXNt1L51IFDvz/dnnh
X-Google-Smtp-Source: AGHT+IH5u3KCfDcin1+1FwJ+RNpLKCzC1hCMnHCQXqrhk8yQEKaj0GsZ3clold1kXfI1c7RS1WJzdA==
X-Received: by 2002:a05:6a21:164a:b0:1d6:e6b1:120f with SMTP id adf61e73a8af0-1d92c4dffb5mr10961697637.11.1729392523134;
        Sat, 19 Oct 2024 19:48:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab58aadsm454651a12.53.2024.10.19.19.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Oct 2024 19:48:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0702196c-5447-4a4b-ac71-336dbf06a6c7@roeck-us.net>
Date: Sat, 19 Oct 2024 19:48:40 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: it87_wdt: add PWRGD enable quirk for Qotom
 QCML04
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org
References: <20241018154859.2543595-1-james.hilliard1@gmail.com>
 <74b01dd4-79bb-44bb-98a4-a478a99a5654@roeck-us.net>
 <CADvTj4qZf=1tfqPmN0tY-Rr5Z4BZJAxSZez=789f3wLRfhcXvA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CADvTj4qZf=1tfqPmN0tY-Rr5Z4BZJAxSZez=789f3wLRfhcXvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/19/24 12:55, James Hilliard wrote:
> On Sat, Oct 19, 2024 at 8:33 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 10/18/24 08:48, James Hilliard wrote:
>>> For the watchdog timer to work properly on the QCML04 board we need to
>>> set PWRGD enable in the Environment Controller Configuration Registers
>>> Special Configuration Register 1 when it is not already set, this may
>>> be the case when the watchdog is not enabled from within the BIOS.
>>>
>>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>> ---
>>> Changes v1 -> v2:
>>>     - remove QGLK02/IT87_WDT_BROKEN
>>> ---
>>>    drivers/watchdog/it87_wdt.c | 44 +++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 44 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
>>> index 3e8c15138edd..b8be9af065b2 100644
>>> --- a/drivers/watchdog/it87_wdt.c
>>> +++ b/drivers/watchdog/it87_wdt.c
>>> @@ -20,6 +20,7 @@
>>>
>>>    #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>>
>>> +#include <linux/dmi.h>
>>>    #include <linux/init.h>
>>>    #include <linux/io.h>
>>>    #include <linux/kernel.h>
>>> @@ -40,6 +41,7 @@
>>>    #define VAL         0x2f
>>>
>>>    /* Logical device Numbers LDN */
>>> +#define EC           0x04
>>>    #define GPIO                0x07
>>>
>>>    /* Configuration Registers and Functions */
>>> @@ -73,6 +75,12 @@
>>>    #define IT8784_ID   0x8784
>>>    #define IT8786_ID   0x8786
>>>
>>> +/* Environment Controller Configuration Registers LDN=0x04 */
>>> +#define SCR1         0xfa
>>> +
>>> +/* Environment Controller Bits SCR1 */
>>> +#define WDT_PWRGD    0x20
>>
>> The IT8786 documentation I have states that this bit is reserved.
>> Do you have information suggesting otherwise ?
> 
> Yes, if you clone this repo you'll see the docs in the .rar archive:
> https://gitcode.com/open-source-toolkit/c602e.git
> 
>>
>>> +
>>>    /* GPIO Configuration Registers LDN=0x07 */
>>>    #define WDTCTRL             0x71
>>>    #define WDTCFG              0x72
>>> @@ -240,6 +248,20 @@ static int wdt_set_timeout(struct watchdog_device *wdd, unsigned int t)
>>>        return ret;
>>>    }
>>>
>>> +enum {
>>> +     IT87_WDT_OUTPUT_THROUGH_PWRGD   = BIT(0),
>>
>> I don't mind starting to use BIT(), but then <linux/bits.h> needs to be
>> included as well.
> 
> Ok, will add in v3.
> 
>>
>>> +};
>>> +
>>> +static const struct dmi_system_id it8786_quirks[] = {
>>
>> I see that bit 5 of EC register 0xfa _is_ documented for this purpose on
>> at least one other chip supported by this driver, so the flag should be made
>> generic, and not be IT8786 specific. Please name the quirks it87_quirks
>> or similar and check it for all chips.
> 
> So, the enum is generic but I wanted to separate out the quirks by chip
> since from my understanding each board only uses one chip model and
> thus doing the DMI check for chips with no known boards that need
> quirks applied would be unnecessary. This also helps to document in the
> code which chip a specific board uses which I think is potentially useful
> information to have. If quirks for additional chips end up being needed
> one can simply add another quirks table for that chip.
> 
> I'm also trying to be as specific as possible for the DMI match since these
> Qotom boards only set board names and have no other unique DMI attributes
> we can match against like vendor names.
> 
> Maybe I'm being a bit overly paranoid here but I figured it would be best
> to minimize the probability of a bad match as much as possible.
> 

I really think you are, and I really do not want to have to maintain
multiple quirks tables, and I do not want to see a case match per chip
type. I also really do not care if dmi_first_match() is called for each
chip. It is called exactly once.

Please let's stick with one table and a single call to dmi_first_match().
That is much simpler and much less error prone. If that ever turns out
to be insufficient, we can talk about it then.

Thanks,
Guenter


