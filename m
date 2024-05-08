Return-Path: <linux-watchdog+bounces-1052-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1928C04A8
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2024 20:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC19628C19D
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2024 18:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA9B84A34;
	Wed,  8 May 2024 18:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QkHHb/Ck"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEE714A8C;
	Wed,  8 May 2024 18:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715194242; cv=none; b=MlyXS1P6UcJh7huQEjDfbERoe60MOT9A5JLG/aXAagHFJ5U4lu9S9kpHf5mNCnsIxmwY0Nv4aoj/hQqewrq8ByV54MhIdgx5gL8xJsbkDHumlED1XsRbdXZ22CRGSuqpPHDtEcixBsaWf3mNiNxsEMZF5nO7boZxi6aJf3Cg84w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715194242; c=relaxed/simple;
	bh=+jZAzmdkmQvEE7hiXctgDZDwA4fym30WAkn+Xagcn34=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=LCrzWhbzUe7Eif0mV83p6F6qQ3kCn20yA20MwF3SHjvyPygZmTEKxNd6ybD/EM514TIVfmCxkVFLEmF+s/hDtEumkaTvUfWV3NEJib5/GU062Q2Z/BUhB8o7O5IKjYdpu8Hqq2eGjeKb0+OfL/997O925nP1ksYsa/DIrWhTECg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QkHHb/Ck; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 448IoNTm083745;
	Wed, 8 May 2024 13:50:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715194223;
	bh=970tNNN0p9doPlGLA+pPcBmC2H5jLyXb3E79zqlDuiE=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=QkHHb/CkZYzQ1A0MfZSc6eQ342sctVPi4fl1d2ac/NfIk8rdjk3SdddbqZYcqIsCB
	 sGFjnFyQaDL3H6Mt8UJAr1pOJrgRpkMGqDCjbj9lHn+5IVEkr1afzEX06LTUq9h2p1
	 sC5io4mNfKqkBcpw5fv3swXt3YZ7GO4U7iLsjj5k=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 448IoNVk023338
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 May 2024 13:50:23 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 May 2024 13:50:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 May 2024 13:50:23 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 448IoN3Y096467;
	Wed, 8 May 2024 13:50:23 -0500
Message-ID: <a523cf49-4eeb-44a2-8438-c77b3c50ad15@ti.com>
Date: Wed, 8 May 2024 13:50:23 -0500
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] watchdog: rti_wdt: Set min_hw_heartbeat_ms to
 accommodate a safety margin
From: Judith Mendez <jm@ti.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
	<linux@roeck-us.net>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Rafael
 Beims <rafael.beims@toradex.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Nick
 Saulnier <nsaulnier@ti.com>
References: <20240417205700.3947408-1-jm@ti.com>
Content-Language: en-US
In-Reply-To: <20240417205700.3947408-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi all,

On 4/17/24 3:57 PM, Judith Mendez wrote:
> On AM62x, the watchdog is pet before the valid window is open. Fix
> min_hw_heartbeat and accommodate a 2% + static offset safety margin.
> The static offset accounts for max hardware error.
> 
> Remove the hack in the driver which shifts the open window boundary,
> since it is no longer necessary due to the fix mentioned above.
> 

This patch has been sitting and there are no comments.
Please let me know if there is any issue with this patch, since I would
like to get this fix merged (:

Thanks,
Judith


