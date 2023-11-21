Return-Path: <linux-watchdog+bounces-6-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74F77F24BB
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Nov 2023 05:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E6FD28228F
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Nov 2023 04:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1411B1842;
	Tue, 21 Nov 2023 04:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="y2ONs/Q2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81AD0BE;
	Mon, 20 Nov 2023 20:00:59 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AL40cih051202;
	Mon, 20 Nov 2023 22:00:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700539239;
	bh=NpKEUHQuhk1S1PC4cZuWT6Fcnm4AYXb8QD+XB4CAJEo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=y2ONs/Q2VVSDEuzJxacMm+mDAvaZmrtunUuuhV5Ed15/tv6Pi/BSSnmP5Fo8MTzA2
	 KoAbkojWA5o5b9h2SxJ0aOxSRL2GR7cqbVaY9tEWggwY1V8X/NY/L6HA1n9swuIwoe
	 1deC1t68Q+RW6BMidJVgqsFVg2ZKipCgl9BkacWk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AL40c1o068392
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Nov 2023 22:00:38 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 20
 Nov 2023 22:00:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 20 Nov 2023 22:00:38 -0600
Received: from [172.24.227.94] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AL40ZVO123866;
	Mon, 20 Nov 2023 22:00:36 -0600
Message-ID: <0f3277cc-0e4a-42c9-920c-87e1e6d6c0ca@ti.com>
Date: Tue, 21 Nov 2023 09:30:34 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] watchdog: rti_wdt: Use managed APIs to handle runtime
 PM
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck
	<wim@linux-watchdog.org>
CC: Tero Kristo <t-kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <afd@ti.com>, <n-francis@ti.com>
References: <20231110100726.2930218-1-vigneshr@ti.com>
 <20231110100726.2930218-2-vigneshr@ti.com>
 <40590367-0a38-4c4c-a608-1174a5ecd5ae@roeck-us.net>
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <40590367-0a38-4c4c-a608-1174a5ecd5ae@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi,

On 10/11/23 20:33, Guenter Roeck wrote:
> On 11/10/23 02:07, Vignesh Raghavendra wrote:
>> Switch to devm_pm_runtime_enable() to simplify error handling in driver
>> probe.
>>
> 
> This also replaces the call to pm_runtime_resume_and_get() without
> explanation.
> Worse, the next patch conditionally re-introduces pm_runtime_put_sync()
> on the probe function.
> 
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>   drivers/watchdog/rti_wdt.c | 30 ++++++++----------------------
>>   1 file changed, 8 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>> index 8e1be7ba0103..163bdeb6929a 100644
>> --- a/drivers/watchdog/rti_wdt.c
>> +++ b/drivers/watchdog/rti_wdt.c
>> @@ -236,12 +236,8 @@ static int rti_wdt_probe(struct platform_device
>> *pdev)
>>       if (wdt->freq < 32768)
>>           wdt->freq = wdt->freq * 9 / 10;
>>   -    pm_runtime_enable(dev);
>> -    ret = pm_runtime_resume_and_get(dev);
>> -    if (ret < 0) {
>> -        pm_runtime_disable(&pdev->dev);
>> -        return dev_err_probe(dev, ret, "runtime pm failed\n");
>> -    }
>> +    devm_pm_runtime_enable(dev);
> 
> devm_pm_runtime_enable() returns an error code. I don't think ignoring it
> is a good idea.
> 


Oops, yes...

>> +    pm_runtime_get_noresume(dev);
> 
> Is this functionally identical to pm_runtime_resume_and_get() ?
> That would require further explanation. Why is it not necessary
> to resume here ?

include/linux/pm_runtime.h ::
 pm_runtime_resume_and_get - Bump up usage counter of a device and
resume it.

vs

pm_runtime_get_noresume - Bump up runtime PM usage counter of a device.

During probe, device is already active. Hence, there is really no need
to call driver level runtime_resume() callback as there is really no
context to resume from. Driver currently doesnt have runtime_pm calls
which I intend to add as a later patch. I guess, its probably better to
move this patch to same series.

Also, missed a call to pm_runtime_put_noidle() in the error path.


So for now I will respin 2/2 as standalone fix and repost along with
runtime_pm support.

Apologies, for the delayed response!

-- 
Regards
Vignesh

