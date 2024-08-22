Return-Path: <linux-watchdog+bounces-1505-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D375395B7D6
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Aug 2024 16:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E1B71F25D34
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Aug 2024 14:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97081C9ECF;
	Thu, 22 Aug 2024 14:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MdB/ilfb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6411DFF8;
	Thu, 22 Aug 2024 14:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724335311; cv=none; b=TGkb7/oZtTqKEiH2Om71kFrr4CXitc1J+mQ469jgHHG8YxLyw+vG2BMDp1FqVcCRkcSphUPbJojmo/CuVDqwcuij99KwVeHHwNWO4caejwNtQ/36HVfL25pyu5onj5ZzC6/4T8Tk2h2reLVy54d5HdnT1tLixrc5MA5VMyfpwJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724335311; c=relaxed/simple;
	bh=hElFKKPt5BmkLqVsSkl2Zsu1s6DxBxZ5njjKnkyHum8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pvxTnGES30B0cxzufs2sw4vC1FOVeLenBj+TMgSgqxEuvLgdBizs2GPrMJQz5kSx0r6Zf+WA61Fv8cQxa4V+BcQoEzOPPNVPPnc3xBgfyIZ6pAP0tLvusg5ttRJXdFCXTllXo/ag77ZcXCY6MC5mG4T1rrPk+weMrzQu9PVwRAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MdB/ilfb; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47ME1XTe096033;
	Thu, 22 Aug 2024 09:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724335293;
	bh=V6O3thZTvUdpevfBBR2wGhWQ+2pCve6s8iaRQ7MCcVg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MdB/ilfbEJJlJEaA9zx2UAGKqXS12sQLF8+s1rPfJAZWEfirnLtX1j2xnph1at8vM
	 8qVyl86vcVH9fIqJmOhGUhMDO3sBETJ4x683qwZwZqk6c+u0G0fRp3/jcWzaGeCrLV
	 8urKgRF+n+kMkQyGqCwUwzIZb0oPvEPMExiHiFpQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47ME1Xmx029101
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Aug 2024 09:01:33 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Aug 2024 09:01:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Aug 2024 09:01:32 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47ME1WOX088865;
	Thu, 22 Aug 2024 09:01:32 -0500
Message-ID: <17fc8f51-8e60-4ad6-a385-fa46fd7c5f86@ti.com>
Date: Thu, 22 Aug 2024 09:01:32 -0500
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: rti_wdt: Allow timeout config with timeout-sec
To: Guenter Roeck <linux@roeck-us.net>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240821201935.1698146-1-jm@ti.com>
 <a9de6e68-baac-4fe7-a05c-ca4d79ddd84e@roeck-us.net>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <a9de6e68-baac-4fe7-a05c-ca4d79ddd84e@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Guenter,

On 8/21/24 6:28 PM, Guenter Roeck wrote:
> On Wed, Aug 21, 2024 at 03:19:35PM -0500, Judith Mendez wrote:
>> Currently rti_wdt does not allow timeout to be configured
>> via DT property timeout-sec, so fix watchdog_init_timeout
>> to be able to use timeout-sec.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   drivers/watchdog/rti_wdt.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
>> index 8e1be7ba01039..7260c67e60a25 100644
>> --- a/drivers/watchdog/rti_wdt.c
>> +++ b/drivers/watchdog/rti_wdt.c
>> @@ -332,7 +332,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
>>   		memunmap(vaddr);
>>   	}
>>   
>> -	watchdog_init_timeout(wdd, heartbeat, dev);
>> +	wdd->timeout = heartbeat;
> 
> The proper fix would be to initialize the 'heartbeat' variable with 0,
> set wdt->timeout to DEFAULT_HEARTBEAT, and to keep passing 'heartbeat'
> to watchdog_init_timeout(). That used to be done but was explicitly
> changed in an earlier commit, presumably on purpose. I am not inclined
> to accept a (partial) revert unless the author of commit 5527483f confirms
> that this is acceptable and desirable. Otherwise we'll just end up in an
> edit war, which I really don't want to get into.

You are right, I completely missed this change in this commit due
to the subject line not being related. I will try to align with Tero
Kristo to see if this is something we can add back. Thanks.

~ Judith

> 
> Guenter
> `
> 
>> +	watchdog_init_timeout(wdd, 0, dev);
>>   
>>   	ret = watchdog_register_device(wdd);
>>   	if (ret) {
>>
>> base-commit: 860bbe8e618fd62446309e286ab4a83d38201c0a
>> -- 
>> 2.46.0
>>


