Return-Path: <linux-watchdog+bounces-1436-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4159893E8C7
	for <lists+linux-watchdog@lfdr.de>; Sun, 28 Jul 2024 19:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E22D1C20E2D
	for <lists+linux-watchdog@lfdr.de>; Sun, 28 Jul 2024 17:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CB851C4A;
	Sun, 28 Jul 2024 17:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=traphandler.com header.i=@traphandler.com header.b="lw0QRYcc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtpout6.mo537.mail-out.ovh.net (smtpout6.mo537.mail-out.ovh.net [51.210.91.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D0C1FB5
	for <linux-watchdog@vger.kernel.org>; Sun, 28 Jul 2024 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.210.91.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722187402; cv=none; b=OpZr/3Ata30Tv0diGbRy83PaW4JkToH54Zfbqp6GDp4tfZvZjfMVyB0DZQlTwLQKzSY7obu8VplQJBcwFGsnOPM31NCedwoXapTuff9tdGJ4Xib94pnyIL0iPnMD+4euaaGi+c4ly4aB39rGJyETK7TRy3o4y2zY0hypHlFUgPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722187402; c=relaxed/simple;
	bh=/j9nfoD9jiYLN2GLB20m7UrXn9VwOI/bQpvYlw9tUqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Vk/lKBX4mXmax/xkqTJjWdHdWBrnsaZ1oxc3RBX7vDGUsbHb5IJz6pOTT9rST3xcHe+76Q0D+eDWm8N67qhRbrzu137maYVhRVMQBFHMMt3xzxNndMyQqXi/Z+A/v6zf2GLxN/kfv8X0K0LdYbEbpPNysIew8IUM2t3jzSvUnF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=traphandler.com; spf=pass smtp.mailfrom=traphandler.com; dkim=pass (2048-bit key) header.d=traphandler.com header.i=@traphandler.com header.b=lw0QRYcc; arc=none smtp.client-ip=51.210.91.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=traphandler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=traphandler.com
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net [152.228.215.222])
	by mo537.mail-out.ovh.net (Postfix) with ESMTPS id 4WX6l93ZxDzyTD;
	Sun, 28 Jul 2024 16:44:05 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net. [127.0.0.1])
        by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <nichen@iscas.ac.cn>; Sun, 28 Jul 2024 16:44:05 +0000 (UTC)
Received: from pro2.mail.ovh.net (unknown [10.108.9.98])
	by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4WX6l91L70z86Jq;
	Sun, 28 Jul 2024 16:44:05 +0000 (UTC)
Received: from [192.168.1.15] (88.161.25.233) by DAG1EX1.emp2.local
 (172.16.2.1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 28 Jul
 2024 18:44:04 +0200
Message-ID: <34f987be-6e9d-487b-b051-adde23470da1@traphandler.com>
Date: Sun, 28 Jul 2024 18:44:04 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: rzn1: Convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>, <tzungbi@kernel.org>, <phil.edworthy@renesas.com>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240716031137.400502-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
In-Reply-To: <20240716031137.400502-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DAG3EX1.emp2.local (172.16.2.21) To DAG1EX1.emp2.local
 (172.16.2.1)
DKIM-Signature: v=1; a=rsa-sha256; d=traphandler.com;
 s=ovhemp997128-selector1; c=relaxed/relaxed; t=1722185045;
 h=from:to:subject:date; bh=RM6RMt85mDyx4dQWv3n20UgwxMngxxsG38Ef+hrdcn0=;
 b=lw0QRYccc4Mz3ieykarQSbDEMBbT5aNOm1fmxtFHhIGclU6nUeriFiq8Z7MKy9chHsxJBV8sEgJGXnvRr4pv5M8f+j1gk9Ngd/KTzcdXmzEF2w+I9ax0hu6R4AkOvBiZQpYnU6Aj4DCIewkdHL7RmcT+LtezcMSgUtdL9GA9cX3J7DT+cDYIeKv4yjjBAbhqOdV4QwT72bj3pZhzBdnfi/gsqLgcDOVMtxZRQ1tICSo4W1K5wM2RhC6GjSAwkKf2qjAH/qDW902wKoXyvKFlOP8VYauwcTnkKb/8WBICvm/rb/FwM65xVRwHRRWANQ9oQBOElOO26KPTVFZUUMq9ig==
X-Ovh-Tracer-Id: 8454663876436900315
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrjedtgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttddvjeenucfhrhhomheplfgvrghnqdflrggtqhhuvghsucfjihgslhhothcuoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqnecuggftrfgrthhtvghrnhephfffgfdtffdvleehjefhtdefkeelhfehgefhffeugefgudektdeffeetleelkefgnecukfhppeduvdejrddtrddtrddupdekkedrudeiuddrvdehrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehnihgthhgvnhesihhstggrshdrrggtrdgtnhdprhgtphhtthhopehtiihunhhgsghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhmsehlihhnuhigqdifrghttghhughoghdrohhrghdprhgtphhtthhopehphhhilhdrvggufihorhhthhihsehrvghnvghsrghsrdgtohhmpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
 gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehfeejpdhmohguvgepshhmthhpohhuth


On 16/07/2024 05:11, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Fixes: d65112f58464 ("watchdog: Add Renesas RZ/N1 Watchdog driver")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/watchdog/rzn1_wdt.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/rzn1_wdt.c b/drivers/watchdog/rzn1_wdt.c
> index 980c1717adb5..7d3192d34afd 100644
> --- a/drivers/watchdog/rzn1_wdt.c
> +++ b/drivers/watchdog/rzn1_wdt.c
> @@ -140,9 +140,9 @@ static int rzn1_wdt_probe(struct platform_device *pdev)
>   	}
>   
>   	wdt->clk_rate_khz = clk_rate / 1000;
> -	wdt->wdtdev.info = &rzn1_wdt_info,
> -	wdt->wdtdev.ops = &rzn1_wdt_ops,
> -	wdt->wdtdev.status = WATCHDOG_NOWAYOUT_INIT_STATUS,
> +	wdt->wdtdev.info = &rzn1_wdt_info;
> +	wdt->wdtdev.ops = &rzn1_wdt_ops;
> +	wdt->wdtdev.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
>   	wdt->wdtdev.parent = dev;
>   	/*
>   	 * The period of the watchdog cannot be changed once set

reviewed-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>

