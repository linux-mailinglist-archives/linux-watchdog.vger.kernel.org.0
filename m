Return-Path: <linux-watchdog+bounces-3087-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C020CA5E09F
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Mar 2025 16:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10123189E3B3
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Mar 2025 15:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3152512E7;
	Wed, 12 Mar 2025 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b="AdZLtUYY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C668D24419B
	for <linux-watchdog@vger.kernel.org>; Wed, 12 Mar 2025 15:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741793949; cv=none; b=bnY3Ed5WhDzPQCtBVrf2k3sMotmbeIst2IFggDvG9kmsngc5HnsY5NCtQ/qKadGRGSAEvuX3lSctdmgsz93Jvf53wvph1U/bsd+i+g1yGkVSHZzG4pAPW9naK+kp6Vv0vnxZia32OpuHm4nppu/6TpqLLd4gUxfBJGU1+bem6sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741793949; c=relaxed/simple;
	bh=eSXthJ9gBFUjOBPDiwOsndhzo+g/mmYY7/XUp4vG9cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDIO32N86iPkPQT/aio0AgDg+Ssw5ea1B2NE82Bh3DcJjuK65FtjbgYLuKMbIuo3C+WTqBMC5/m/9+/JbiV5pAIJFEnUYVX/XbhMPSmAOCgAkQQixcQ8mAR1k2Vh62jcl+zcciITFplDpE7kTn4l30OT6Skg06u6hgwRw07aNXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b=AdZLtUYY; arc=none smtp.client-ip=185.136.64.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202503121538575a8995f7eabadc5fc2
        for <linux-watchdog@vger.kernel.org>;
        Wed, 12 Mar 2025 16:38:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=9fug/AyD5MGpJaI7QeEK4OFdBV5tMRDjJLZy5ng3g5Y=;
 b=AdZLtUYYdFWI1geDDdo4UNxBp/f11z90w549zOJxi7+RpFmgVW7VBxAKYvonUsCEHUmizR
 gCCo9R4T7//++bPUmfD26cCeetSUHKuvXS/NgPVT2qvTQaQuncgWix8Zn3UnHcxSEx4QD/Vf
 RMfrEp9AaJkr6yPYoQ3ueumLn5fAeq1Kg9qyjA2fsjMEPbbv12kwF6lMt+08PWZmvmd8+ECF
 UT+51IfIdPQzWlkYoW35j0oID/ZUe04Ox+Kop1Z60mxJisK5AYE19lq6T6yqAyRQHVNDltI6
 PxB37/+QE8xkKmSNrQPMr1GT7mt/Ut8SwzGR5CcNDpHUVKoi90qq0GkQ==;
Message-ID: <7bf7b708-9075-4914-82da-f0a510d914a7@siemens.com>
Date: Wed, 12 Mar 2025 15:38:56 +0000
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] watchdog: Add driver for Intel OC WDT
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, jan.kiszka@siemens.com,
 benedikt.niedermayr@siemens.com
References: <20250311-ivo-intel_oc_wdt-v1-1-fd470460d9f5@siemens.com>
 <bd411390-25bd-417e-9caa-aa4a45ad9161@kernel.org>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@siemens.com>
In-Reply-To: <bd411390-25bd-417e-9caa-aa4a45ad9161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328357:519-21489:flowmailer

Hi Krzysztof, thanks for the review.

On 3/12/25 8:50 AM, Krzysztof Kozlowski wrote:
> On 11/03/2025 14:18, Diogo Ivo wrote:
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index f81705f8539aa0b12d156a86aae521aa40b4527d..16e6df441bb344c0f91b40bd76b6322ad3016e72 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -1350,6 +1350,17 @@ config INTEL_MID_WATCHDOG
>>   
>>   	  To compile this driver as a module, choose M here.
>>   
>> +config INTEL_OC_WATCHDOG
>> +	tristate "Intel OC Watchdog"
>> +	depends on X86 && ACPI
> 
> Why can't this be compile tested?

I'll add it in v2 as well as HAS_IOPORT.

>> +static const struct acpi_device_id intel_oc_wdt_match[] = {
>> +	{ "INT3F0D" },
>> +	{ "INTC1099" },
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(acpi, intel_oc_wdt_match);
>> +
>> +static struct platform_driver intel_oc_wdt_platform_driver = {
>> +	.driver = {
>> +		.name = DRV_NAME,
>> +		.acpi_match_table = ACPI_PTR(intel_oc_wdt_match),
> 
> Drop ACPI_PTR, causes warnigns and is not really beneficial.

I'll drop it in v2.

>> +	},
>> +	.probe = intel_oc_wdt_probe,
>> +};
>> +
>> +module_platform_driver(intel_oc_wdt_platform_driver);
>> +
>> +MODULE_AUTHOR("Diogo Ivo <diogo.ivo@siemens.com>");
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Intel OC Watchdog driver");
>> +MODULE_ALIAS("platform:" DRV_NAME);
> 
> Drop alias, you have match table.

I'll drop it in v2.

> Best regards,
> Krzysztof

Best regards,
Diogo

