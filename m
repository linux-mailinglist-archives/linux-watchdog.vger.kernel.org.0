Return-Path: <linux-watchdog+bounces-2444-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 851F39C382A
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Nov 2024 07:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AF742810DE
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Nov 2024 06:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C88F9D9;
	Mon, 11 Nov 2024 06:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="k0F/JygU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E83D2914;
	Mon, 11 Nov 2024 06:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731305132; cv=none; b=Qq3hPKZlReezGk/bexGJNtbHOB3rUQe8k/vO/Bxgd9dDjJntRrQMYeJuKGKQn0jIoGd11Z136JtxJx4L8O6Ya0VxUvVpAP+wfrF/o+axOk424K9te8YhI/GCDp9E5MBWJE2pm6LOsPVYU75UddjDXtcBTp95/cCKyV6VC1FI6v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731305132; c=relaxed/simple;
	bh=ZoX4DfujTWf4Xgazp2bMtl7zPsqKlwuVL+3Q9ihSeSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kTAHZqCVNJNUnF3fjurVJA+JIj3DXXD8pSOYzN3oyFFWxT73LMOfonL1AZ1Dk0JCdz8cs8ZskhLd3K+RXdE8qm5NxM2HqbOcUNK92CUNklMhpKH64EZtpIXf7QOg8CBFOokw4ybnEYmZVuCuO/d+Q2PJIZaAf84tFlb3/3rZSus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=k0F/JygU; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AB657aO070047;
	Mon, 11 Nov 2024 00:05:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731305107;
	bh=0hVGZIeT+VhLtZFZlIPIFnU8Y8lw0yVpS9k09J/ynv0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=k0F/JygUH264hMcNU9Ijz2vjd/XgdEv0YGCIHAiizMpjgZ0QfjX65T//9Vr7eDPvj
	 r4FtReMySvlejZsymtbdpcwgo1o688+4R8DjJ8BcLpfqMl8M6MkJwYqiJHSJ55Ja1Q
	 RIXVTVDB0sM6kJBH0TGUPvDrVWuu9ZJgpyrmBJuQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AB657Li101387;
	Mon, 11 Nov 2024 00:05:07 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 11
 Nov 2024 00:05:06 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 11 Nov 2024 00:05:06 -0600
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AB65472130668;
	Mon, 11 Nov 2024 00:05:04 -0600
Message-ID: <fd344c80-13f6-40fc-8169-28819e8ae69a@ti.com>
Date: Mon, 11 Nov 2024 11:35:03 +0530
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: rti: of: honor timeout-sec property
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
        <linux-watchdog@vger.kernel.org>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
	<linux@roeck-us.net>, Judith Mendez <jm@ti.com>,
        Tero Kristo
	<t-kristo@ti.com>, <stable@vger.kernel.org>
References: <20241107203830.1068456-1-alexander.sverdlin@siemens.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20241107203830.1068456-1-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 08/11/24 02:08, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Currently "timeout-sec" Device Tree property is being silently ignored:
> even though watchdog_init_timeout() is being used, the driver always passes
> "heartbeat" == DEFAULT_HEARTBEAT == 60 as argument.
> 
> Fix this by setting struct watchdog_device::timeout to DEFAULT_HEARTBEAT
> and passing real module parameter value to watchdog_init_timeout() (which
> may now be 0 if not specified).
> 
> Cc: stable@vger.kernel.org
> Fixes: 2d63908bdbfb ("watchdog: Add K3 RTI watchdog support")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>  drivers/watchdog/rti_wdt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index f410b6e39fb6f..58c9445c0f885 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -61,7 +61,7 @@
>  
>  #define MAX_HW_ERROR		250
>  
> -static int heartbeat = DEFAULT_HEARTBEAT;
> +static int heartbeat;
>  
>  /*
>   * struct to hold data for each WDT device
> @@ -252,6 +252,7 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  	wdd->min_timeout = 1;
>  	wdd->max_hw_heartbeat_ms = (WDT_PRELOAD_MAX << WDT_PRELOAD_SHIFT) /
>  		wdt->freq * 1000;
> +	wdd->timeout = DEFAULT_HEARTBEAT;
>  	wdd->parent = dev;
>  
>  	watchdog_set_drvdata(wdd, wdt);


LGTM. Thanks for the fix!

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>



-- 
Regards
Vignesh

