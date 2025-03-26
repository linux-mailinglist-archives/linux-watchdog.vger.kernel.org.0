Return-Path: <linux-watchdog+bounces-3149-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94946A71345
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 10:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43D711759C6
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 09:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E29615E5AE;
	Wed, 26 Mar 2025 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b="JhyCf7Mq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8795C142E67
	for <linux-watchdog@vger.kernel.org>; Wed, 26 Mar 2025 09:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742979699; cv=none; b=ZWkVFVnTZr+01Cpj8FWR5iNFQ+5ZohrQhNgpxcwoONgwgcg91YFCiFQ4O4teUHRTgbM3l6ATCveRFqN16w2zGQ2t2VqADMUsyk9rFYQ3lqF4yn0Uz2MZSH8PxclHr5Zxm1L0pFc9z7agS23x78CO/cOcznpTOEq9FVwQmGpUaa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742979699; c=relaxed/simple;
	bh=6u43Q1NkrppVvLo2iof650xw+zAkcHmT1g1rSKHkuMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uC46lSA6RoWA5NhaLco/a9bb8PEj9BXjN/My3UGjJXNuPQqXrw/xrk55NpvOVB+bxUDW4oXsASanW6CNDWlEJEdH35985d5Z6FGli5JczeuRqVEDwJ2m/vQN8f+dBhV9E4pQqdnqiPqiEgIkkuZ272htj5gDqtF+6qK9PnIT9dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b=JhyCf7Mq; arc=none smtp.client-ip=185.136.65.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250326090132f12510f69595e24b9b
        for <linux-watchdog@vger.kernel.org>;
        Wed, 26 Mar 2025 10:01:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=GCld6BFMCLijEkN8uZhbUfpR3Zgt8sb2MHPQHCsCJRI=;
 b=JhyCf7MqrqnYfq3n6hXL4nibif+eNs83SQrIOOzRqqqvxyGeXY07eX6Ken/n33AiKAv9Bp
 9NJIMnGxhO+88HWjHXy96GVp629AfQkyyahlO8GzVh3J7i5EOx7z5g5G+VRvEhZKct0NbQPo
 uLc+rwhwM4Rp5gjsJCaoiEblm9efPL+2A1qQqPrnUQDQVIdxDRljPLCcMdw1tWO5j0Px2+Mb
 R4lpK81rM+ximPQgtr2CWyrsOmhsR5FRzEfZDK8m/a6HGCQkPHfHbTEMoIdLWp7dQ2i4CQEj
 pQrHT4Bk/s7uHZkSLzFM+RkVigP0F6hq81MPyNPmU/pZSOQ1Eqd4VpXQ==;
Message-ID: <54d3c7a8-1392-4870-9bd6-48aebe3881f1@siemens.com>
Date: Wed, 26 Mar 2025 09:01:28 +0000
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] ACPI: PNP: Add Intel OC Watchdog IDs to non-PNP
 device list
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jan.kiszka@siemens.com, benedikt.niedermayr@siemens.com
References: <20250317-ivo-intel_oc_wdt-v3-0-32c396f4eefd@siemens.com>
 <20250317-ivo-intel_oc_wdt-v3-2-32c396f4eefd@siemens.com>
 <1beeb77c-83d6-4634-ba39-2b40efbb8437@siemens.com>
 <CAJZ5v0jh1jJy+YRMtLDnYqAhPrN2Pox+NY0Vqh_uqb7F=NwqEg@mail.gmail.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@siemens.com>
In-Reply-To: <CAJZ5v0jh1jJy+YRMtLDnYqAhPrN2Pox+NY0Vqh_uqb7F=NwqEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328357:519-21489:flowmailer

On 3/25/25 6:59 PM, Rafael J. Wysocki wrote:
> On Tue, Mar 25, 2025 at 6:19 PM Diogo Ivo <diogo.ivo@siemens.com> wrote:
>>
>> Hello,
>>
>> On 3/17/25 10:55 AM, Diogo Ivo wrote:
>>> Intel Over-Clocking Watchdogs are described in ACPI tables by both the
>>> generic PNP0C02 _CID and their ACPI _HID. The presence of the _CID then
>>> causes the PNP scan handler to attach to the watchdog, preventing the
>>> actual watchdog driver from binding. Address this by adding the ACPI
>>> _HIDs to the list of non-PNP devices, so that the PNP scan handler is
>>> bypassed.
>>>
>>> Note that these watchdogs can be described by multiple _HIDs for what
>>> seems to be identical hardware. This commit is not a complete list of
>>> all the possible watchdog ACPI _HIDs.
>>>
>>> Signed-off-by: Diogo Ivo <diogo.ivo@siemens.com>
>>> ---
>>> v2->v3:
>>>    - Reword the commit message to clarify purpose of patch
>>> ---
>>> ---
>>>    drivers/acpi/acpi_pnp.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/acpi/acpi_pnp.c b/drivers/acpi/acpi_pnp.c
>>> index 01abf26764b00c86f938dea2ed138424f041f880..3f5a1840f573303c71f5d579e32963a5b29d2587 100644
>>> --- a/drivers/acpi/acpi_pnp.c
>>> +++ b/drivers/acpi/acpi_pnp.c
>>> @@ -355,8 +355,10 @@ static bool acpi_pnp_match(const char *idstr, const struct acpi_device_id **matc
>>>     * device represented by it.
>>>     */
>>>    static const struct acpi_device_id acpi_nonpnp_device_ids[] = {
>>> +     {"INT3F0D"},
>>>        {"INTC1080"},
>>>        {"INTC1081"},
>>> +     {"INTC1099"},
>>>        {""},
>>>    };
>>>
>>>
>>
>> Gentle ping on this patch.
> 
> Do you want me to pick it up or do you want to route it through a
> different tree?

Unless the watchdog maintainers have any objections it's fine if you
pick it up.

Best regards,
Diogo

