Return-Path: <linux-watchdog+bounces-3719-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 119DBAE8572
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Jun 2025 16:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F9541776FC
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Jun 2025 14:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32CF25C837;
	Wed, 25 Jun 2025 14:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wne0F2DO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22D113D53B;
	Wed, 25 Jun 2025 14:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860101; cv=none; b=GDEyMKBKjYYWM105qsqMSQJTVahu0dijaRjv1Y3KiPZZLLRLVaePErW9OdKS3YMzegfZLawgsoZKDOETZYTdbmScxbvpbUxX2k3BmLRBBHyLb+hx9YQqGXmP59BKKP3200lu5mRPDlO4VUlhxzJRc7QDiwaXWov2qM6C8raW5sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860101; c=relaxed/simple;
	bh=9F8lPK5shmD6ADdRuHTPezLJa7GOsIOjbFmUVmIzJM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IKrnSa7X2uu7j+WZ+tSNZkJSlCi7kYSIQuzqN5gPg0K82+mgmEoN2qZfMmZ7/auXPcFFjSWOTGb1woMLUUuWEmdVvK0lrZvjgj34dkKfVHcrpRlmKZsV4WEIpALjADx0HBdLNtu//IF2qtanhQqOULtBylTlzPnAkCwkwtRYHDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wne0F2DO; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PE1BPY2174964;
	Wed, 25 Jun 2025 09:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750860071;
	bh=m8aY9XaIbidLP9MStkpbdNHeE08j2OQhZ4p847qpKOs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wne0F2DOZZFrC3efzh+pCbzCvgAISYIHMer+mQ5ZgaK0higMDEGGhs68234wwtRtO
	 eE9wTUgU8MWoAAELRhMMIHqCvldlk13p956i4t6lgpbke+ZoqSnzJPEpino1+hoe1Y
	 vyoIoUwCjdZv2tahBLcAPcT4Xf9O2mFFO4Uarx1w=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PE1BRj2629965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 09:01:11 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 09:01:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 09:01:11 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PE1Ai43495570;
	Wed, 25 Jun 2025 09:01:10 -0500
Message-ID: <216a0f99-9c45-480e-9b8a-1a9168b3338c@ti.com>
Date: Wed, 25 Jun 2025 09:01:10 -0500
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] dt-bindings: watchdog: ti,rti-wdt: Add
 ti,am62l-rti-wdt compatible
To: "Raghavendra, Vignesh" <vigneshr@ti.com>,
        Wim Van Sebroeck
	<wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250624202605.1333645-1-jm@ti.com>
 <20250624202605.1333645-2-jm@ti.com>
 <4b91a211-9e97-4431-8b42-4817fd17e1e1@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <4b91a211-9e97-4431-8b42-4817fd17e1e1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Vignesh,

On 6/24/25 11:53 PM, Raghavendra, Vignesh wrote:
> 
> 
> On 6/25/2025 1:56 AM, Judith Mendez wrote:
>> Add a new compatible ti,am62l-rti-wdt for am62l SoC [0].
>>
>> [0] https://www.ti.com/product/AM62L
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
>> index 62ddc284a524..f57d5c2b8024 100644
>> --- a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
>> +++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
>> @@ -24,6 +24,7 @@ properties:
>>     compatible:
>>       enum:
>>         - ti,j7-rti-wdt
>> +      - ti,am62l-rti-wdt
>>   
> 
> Would be good to keep this sorted alphabetically.

Sure, Ill switch and respin the series, thanks for
reviewing.

~ Judith

> 
>>     reg:
>>       maxItems: 1
> 


