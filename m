Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47F04175B4A
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2020 14:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbgCBNKO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Mar 2020 08:10:14 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39766 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgCBNKO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Mar 2020 08:10:14 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 022D9qUE083398;
        Mon, 2 Mar 2020 07:09:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583154592;
        bh=11HsLWbFStWilV1up7DnDRIW9Ds4GdB+p7Dg78Jjr0Y=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=aBJXGgMqsj9ehTD8BJx2ncVfLNNUGEDuJgulW0QzFCq5JSGijD99JFq4pNjDhQJdA
         LfgVV6SU+mIiolaSwgxJodgVG5YkfrNIJ4u9mI14MCVCtnwx/8Aa0QkNfW8ed2UgvS
         ENTcdFXYHeqUW5J6zRr7oQQ8vg3g8xoC1gufCqUI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 022D9qgS052102
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 2 Mar 2020 07:09:52 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Mar
 2020 07:09:52 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Mar 2020 07:09:51 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 022D9oGD121273;
        Mon, 2 Mar 2020 07:09:51 -0600
Subject: Re: [PATCH 2/4] watchdog: add support for resetting keepalive timers
 at start
To:     Guenter Roeck <linux@roeck-us.net>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200228142331.13716-1-t-kristo@ti.com>
 <20200228142331.13716-3-t-kristo@ti.com>
 <20200228171314.GA14594@roeck-us.net>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <ff925a60-869e-e0a4-b60d-6a4f2fc93281@ti.com>
Date:   Mon, 2 Mar 2020 15:09:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200228171314.GA14594@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 28/02/2020 19:13, Guenter Roeck wrote:
> On Fri, Feb 28, 2020 at 04:23:29PM +0200, Tero Kristo wrote:
>> Current watchdog core pets the timer always after the initial keepalive
>> time has expired from boot-up. This is incorrect for certain timers that
>> don't like to be petted immediately when they are started, if they have
>> not been running over the boot.
>>
>> To allow drivers to reset their keepalive timers during startup, add
>> a new watchdog flag to the api, WDOG_RESET_KEEPALIVE.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   drivers/watchdog/watchdog_dev.c | 2 ++
>>   include/linux/watchdog.h        | 1 +
>>   2 files changed, 3 insertions(+)
>>
>> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
>> index 8b5c742f24e8..131e40c21703 100644
>> --- a/drivers/watchdog/watchdog_dev.c
>> +++ b/drivers/watchdog/watchdog_dev.c
>> @@ -283,6 +283,8 @@ static int watchdog_start(struct watchdog_device *wdd)
>>   		set_bit(WDOG_ACTIVE, &wdd->status);
>>   		wd_data->last_keepalive = started_at;
>>   		watchdog_update_worker(wdd);
>> +		if (test_bit(WDOG_RESET_KEEPALIVE, &wdd->status))
>> +			wd_data->last_hw_keepalive = started_at;
> 
> I don't think the additional flag is needed. The code should just set
> last_hw_keepalive. After all, it already sets last_keepalive, which
> determines when the next internal keepalive will be sent. It makes sense
> to also set last_hw_keepalive to prevent the next keepalive from being
> sent too early.

Ok, I can modify this patch to tweak the last_hw_keepalive 
unconditionally if you think that is safe to do. I did it like this as 
there might be some cases where the existing implementations actually 
expect the ping to happen immediately for some reason (but I guess in 
those cases the corresponding watchdog drivers would need to be modified.)

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
