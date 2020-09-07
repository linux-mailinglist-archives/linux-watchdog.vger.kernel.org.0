Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A92E725FD79
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Sep 2020 17:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730223AbgIGPrR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 7 Sep 2020 11:47:17 -0400
Received: from david.siemens.de ([192.35.17.14]:33625 "EHLO david.siemens.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730222AbgIGPrB (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 7 Sep 2020 11:47:01 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 087Fkc26025246
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 7 Sep 2020 17:46:38 +0200
Received: from [139.22.116.238] ([139.22.116.238])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087FkbFU013301;
        Mon, 7 Sep 2020 17:46:37 +0200
Subject: Re: watchdog: sp5100_tco support for AMD V/R/E series
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org,
        "Awan, Arsalan" <Arsalan_Awan@mentor.com>,
        "Hombourger, Cedric" <Cedric_Hombourger@mentor.com>,
        "Farnsworth, Wade" <wade_farnsworth@mentor.com>
References: <15c8913e-9026-2649-9911-71d6f1c79519@siemens.com>
 <f7e3233b-97e4-1f25-e18e-edb39ca86ce9@roeck-us.net>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9e270546-7962-932b-2e4c-3c833b7d4b30@siemens.com>
Date:   Mon, 7 Sep 2020 17:46:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f7e3233b-97e4-1f25-e18e-edb39ca86ce9@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 07.09.20 17:31, Guenter Roeck wrote:
> On 9/7/20 4:20 AM, Jan Kiszka wrote:
>> Hi all,
>>
>> Arsalan reported that the upstream driver for sp5100_tco does not work
>> for embedded Ryzen. Meanwhile, I was able to confirm that on an R1505G:
>>
>> [   11.607251] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
>> [   11.607337] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO address
>> [   11.607344] sp5100-tco sp5100-tco: Watchdog hardware is disabled
>>
>> ..and fix it:
>>
>> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
>> index 85e9664318c9..5482154fde42 100644
>> --- a/drivers/watchdog/sp5100_tco.c
>> +++ b/drivers/watchdog/sp5100_tco.c
>> @@ -193,7 +193,8 @@ static void tco_timer_enable(struct sp5100_tco *tco)
>>  		/* Set the Watchdog timer resolution to 1 sec and enable */
>>  		sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN3,
>>  					  ~EFCH_PM_WATCHDOG_DISABLE,
>> -					  EFCH_PM_DECODEEN_SECOND_RES);
>> +					  EFCH_PM_DECODEEN_SECOND_RES |
>> +					  EFCH_PM_DECODEEN_WDT_TMREN);
> 
> Confusing. The register in question is a 32-bit register, but only a byte
> is written into it. Bit 24-25 are supposed to be the resolution, bit 25-26
> set to 0 enable the watchdog. Bit 7 is supposed to enable MMIO decoding.
> This is from AMD Publication 52740. So something in the existing code
> is (or seems to be) wrong, but either case I don't see how setting bit 7
> (or 31 ?) would enable the watchdog hardware.
> 
> Hmm, I wrote that code. Guess I'll need to to spend some time figuring out
> what is going on.

The logic came from [1] which inspired [2] - that's where I pointed out
the large overlap with the existing upstream driver. I would love to see
all that consolidated.

BTW, the R1505G is family 0x17. Maybe something changed there, and that
bit 7 was just reserved/ignored so far. ENOSPECS

Jan

[1]
https://git.yoctoproject.org/cgit/cgit.cgi/meta-amd/commit/meta-amd-bsp/recipes-kernel/amd-wdt/files/amd_wdt.c?id=cd760c9f04d276382a0f5156dabdb766594ace56
[2]
https://github.com/siemens/efibootguard/commit/3a702aa96d193f26571ea4e70db29ef01a0d4d5f

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
