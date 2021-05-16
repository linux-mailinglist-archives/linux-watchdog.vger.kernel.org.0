Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D96382216
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 01:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbhEPXav (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 16 May 2021 19:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbhEPXau (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 16 May 2021 19:30:50 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B66C061573;
        Sun, 16 May 2021 16:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=lr4+FFD80CxEdd/zr2bpfohQbxAklrTTMigzrv1n1/k=; b=NKx+NQNVDVhEHil84pPnU0zQdR
        X3y1roi+jyF5bl0qSH+9unO73LmaLjubNaQegYuOytVLF/nMMPiviN5sazg8ljgs6S7ngW5XUYlz1
        yO54qccZKNuaMQcQU1B/T+RuZkE61Lpblc+99Fvp2jsjOG20hCdRdCKlQGOjf3bntakWEZeyMsua/
        Og+dhpMjjToZZchTACbnawCLyjvZGxfdHHCoy55HF0HUwYhb0mD/0x5TKCq/v15Anz4utFVpAK4/j
        5pVu8jVN/mTgrVXiIrglEHDIvMWRXdx0SXbvB4O1+/o3CKkEl8c9RB2GBzwxUfbh3Ph7dB4217dQV
        eRY22AYQ==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1liQCS-00DLkD-Li; Sun, 16 May 2021 23:29:32 +0000
Subject: Re: [PATCH] watchdog: mtx-1: drop au1000.h header file
To:     Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
References: <20210516211703.25349-1-rdunlap@infradead.org>
 <a1df3bdf-b883-008f-2989-27bbfe1c9b9e@roeck-us.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d22c3fb9-51c7-6f1f-f9ce-e761ad25502c@infradead.org>
Date:   Sun, 16 May 2021 16:29:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <a1df3bdf-b883-008f-2989-27bbfe1c9b9e@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/16/21 4:08 PM, Guenter Roeck wrote:
> On 5/16/21 2:17 PM, Randy Dunlap wrote:
>> The mtx-1_wdt driver does not need the au1000.h header file.
>> Instead, the header file causes build errors, so drop it.
>>
>> This change fixes multiple build errors, all in au1000.h. E.g.:
>>
>> In file included from ../drivers/watchdog/mtx-1_wdt.c:44:
>> ../arch/mips/include/asm/mach-au1x00/au1000.h: In function 'alchemy_rdsys':
>> ../arch/mips/include/asm/mach-au1x00/au1000.h:603:36: error: implicit declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'? [-Werror=implicit-function-declaration]
>>    603 |  void __iomem *b = (void __iomem *)KSEG1ADDR(AU1000_SYS_PHYS_ADDR);
>> ../arch/mips/include/asm/mach-au1x00/au1000.h:603:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>>    603 |  void __iomem *b = (void __iomem *)KSEG1ADDR(AU1000_SYS_PHYS_ADDR);
>>
>> Fixes: 04bf3b4f5fc0 ("[WATCHDOG] MTX-1 Watchdog driver")
> 
> More like
> 
> Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")

Duh. Thanks.

>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: linux-watchdog@vger.kernel.org
>> Cc: Florian Fainelli <f.fainelli@gmail.com>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
>> ---
>>   drivers/watchdog/mtx-1_wdt.c |    2 --
>>   1 file changed, 2 deletions(-)
>>
>> --- linux-next-20210514.orig/drivers/watchdog/mtx-1_wdt.c
>> +++ linux-next-20210514/drivers/watchdog/mtx-1_wdt.c
>> @@ -41,8 +41,6 @@
>>   #include <linux/uaccess.h>
>>   #include <linux/gpio/consumer.h>
>>   -#include <asm/mach-au1x00/au1000.h>
>> -
>>   #define MTX1_WDT_INTERVAL    (5 * HZ)
>>     static int ticks = 100 * HZ;
