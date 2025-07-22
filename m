Return-Path: <linux-watchdog+bounces-3893-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAF6B0CE87
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jul 2025 02:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8035816A05F
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jul 2025 00:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACBAA2D;
	Tue, 22 Jul 2025 00:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6e0PPft"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0338810F2;
	Tue, 22 Jul 2025 00:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753142762; cv=none; b=ZzLHk0JS4hnXbNU42BC2qAyR3WkD+qbZzaGUA2iQ3wU6IFyuMytHaKmdUg4tEhhoqMooLxdyrPFgUcmlXEHONwiJQPsg1GuF49XSn/TrP55pHhXBPn25DuxW5ytyYr7fq7DTJiNK8NxTfNhF3o2dvg4W7V8L17aSLGc43HptKlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753142762; c=relaxed/simple;
	bh=5B+bfuGI56XdI5KUPanslLxZZ/KAsxRoA6LWbwTkv1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n9+O97v3l90xMUV8QS1hnNMMszoLPfAMzwD3NwFxb470q5Yo8QTMWD1YTso6DXibheOwAzXB14qKo7O1jX2OdZAhDqaX/mdiyWpEdFEcDLoLbWwN4hF7Cga49mTpk5fi1albwhxe20nWC8g+iU19kw/D2heaqWnjwQsZHEKUTS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6e0PPft; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso5098768a12.2;
        Mon, 21 Jul 2025 17:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753142760; x=1753747560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sobliWCWmFUhzddJ3ftNgbEXYTt6A109IYSj/TbGfVo=;
        b=Z6e0PPft7Trynjo9DIbO49HOGzi1d/Mc6qrjPophE7Khb3wgm4nVFyChnRWiAyF2gO
         962mn35/yMdjNSZPiBIlS5yMSfyV9Fx44dPQiEJ79laiCFYMsDd6ViwIxpenSJtmaaQy
         X2gqWMZmMnVHcatrXKrhBNq+7J9sDkK3u6A/EwNmNDKZuybykrvS4yewQiFBg5WRIRib
         r6aJr+ROnBoQAs3Qw8fuxDm7hZJjUdC5qo+HY/cfxlixpMJh5WqphWsqBQgTSdVO57oa
         gkHveHgNRzGK+7F/fEdZTb+TxAOjwuxMBYQ4nBCZFnteYG2/qhWc0znkcIaablbLnsZB
         lFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753142760; x=1753747560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sobliWCWmFUhzddJ3ftNgbEXYTt6A109IYSj/TbGfVo=;
        b=N0peHAmJwcQMi6mrv+ZEk3iMq3DCGIQUcqH91AlK0+GR801u4lwZkOW1CdsYw4p4TT
         XfGp/LXb+bV6RwLl7b3bTr9lL61M04x0bApFuxTptIeqgxAQ9lftEg9arCEfN2tvJlQd
         dLUY0PY1y5rJXvwot/BPU7BVxPgRo2NYt6KqLNy7r6ybX1DIoCRM1PqQF1Ho007qBxQ6
         ALbjMvVtoh60hNs+YnupVGAhOvDTk5qQVkDjrmfN8n5YOyrC4km8MRW+4DGe00ibIuEj
         ftl8/rogx7+N7P+3IkpmThSbiR48/igzRpvqxYX06y6HGynm23ds1cDWp9hTuXYYmbjk
         jSrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUel6428tbEhKoJkvVQ6ECz0x17nJkI50EzZsRa99DIwHhI9ZUwin9Z+1Bk1kODXRjHC6ExE45UkfW2Cks=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGj4Czbt8qyDb3xFgMUQ1z+Nc0Bbg0VyHHQH7L48+qZg6Oeb2t
	gmtqZWZLQTTkjCWfQTIn7wTL6iHFCeF1DavB6m7mQhhOTeSSi9d6U1v1
X-Gm-Gg: ASbGncs6K9iOrPgeCycn9xi3h7JoMFJ46+CsElv45mx6U0jlpK/yyzDTOAwfdslADSH
	pIgiRIzY+gJKZkS9LY9L216LWMDR+ClCjuhM5zZ52NBJMdzQNgWomG5BtDA5v+mb7wFEkQ3+f8H
	9O55QySHmeoLM90QepIHgr1MlcB/C99iLv0LSwOeFBBNzO0hemv5EkfGzw/LNG9AuXdhpglewd2
	1OfFm4DJ1a8s92PvrW8a2R2FaGQ7fP/AZStMbOTTnDZl8qGGpuPCyA9BzR8QRqForghQN+YhKZk
	5Fj0PTBkDe6v92MpbskbHOsh/CpnrwtZTKz8E3VEuB6L5SHNqBSvvZiWnqbZQ5Lx0E2/MscaX4q
	Q5PunVUsCsP0DOhW4IQ9Ktq+QymzkTyQkf8r5IJbmLKolNpnosMsTGkXswjVg9jchzhwAIpouX/
	SvNa1FVw==
X-Google-Smtp-Source: AGHT+IFxgU1ZQ3X+2dR12e/WXct0KxSh0P/e4D5hEEhSnvblyzGzUotNVL4uBpFWSs9QYiWvkDSQGg==
X-Received: by 2002:a05:6a21:6f13:b0:233:84b4:d0a4 with SMTP id adf61e73a8af0-23812f44ab2mr31476185637.32.1753142760051;
        Mon, 21 Jul 2025 17:06:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c8acb858sm6483673b3a.47.2025.07.21.17.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 17:05:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <eae46532-57bd-40fc-9098-69c62d34571f@roeck-us.net>
Date: Mon, 21 Jul 2025 17:05:57 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] watchdog: sbsa: Adjust keepalive timeout to avoid
 MediaTek WS0 race condition
To: Aaron Plattner <aplattner@nvidia.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 Timur Tabi <ttabi@nvidia.com>
References: <20250721230640.2244915-1-aplattner@nvidia.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250721230640.2244915-1-aplattner@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/25 16:06, Aaron Plattner wrote:
> The MediaTek implementation of the sbsa_gwdt watchdog has a race
> condition where a write to SBSA_GWDT_WRR is ignored if it occurs while
> the hardware is processing a timeout refresh that asserts WS0.
> 
> Detect this based on the hardware implementer and adjust
> wdd->min_hw_heartbeat_ms to avoid the race by forcing the keepalive ping
> to be one second later.
> 
> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
> Acked-by: Timur Tabi <ttabi@nvidia.com>
> ---
> Thanks for the suggestion of adjusting wdd->min_hw_heartbeat_ms, Guenter. I
> confirmed that doing this causes the keepalive to fire at the later time and
> this avoids the race:
> 
>   [  137.500462] sbsa-gwdt sbsa-gwdt.0: version: 1, impl: 0x426, need_ws0_race_workaround: 1
>   [  137.500473] sbsa-gwdt sbsa-gwdt.0: Set min_hw_heartbeat_ms to 6000
>   [  137.500944] sbsa-gwdt sbsa-gwdt.0: Initialized with 10s timeout @ 1000000000 Hz, action=0. [enabled]
>   [  143.501475] sbsa-gwdt sbsa-gwdt.0: ping
>   [  149.502044] sbsa-gwdt sbsa-gwdt.0: ping
>   [  155.502351] sbsa-gwdt sbsa-gwdt.0: ping
> 
> I also confirmed that this no longer exposes the adjusted keepalive time to
> userspace:
> 
> # wdctl
> Device:        /dev/watchdog0
> Identity:      SBSA Generic Watchdog [version 0]
> Timeout:       10 seconds
> 
> (in v1 this would have reported 8 seconds)
> 

That is much better!

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

> -- Aaron
> 
>   drivers/watchdog/sbsa_gwdt.c | 50 +++++++++++++++++++++++++++++++++---
>   1 file changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
> index 5f23913ce3b49..6ce1bfb390641 100644
> --- a/drivers/watchdog/sbsa_gwdt.c
> +++ b/drivers/watchdog/sbsa_gwdt.c
> @@ -75,11 +75,17 @@
>   #define SBSA_GWDT_VERSION_MASK  0xF
>   #define SBSA_GWDT_VERSION_SHIFT 16
>   
> +#define SBSA_GWDT_IMPL_MASK	0x7FF
> +#define SBSA_GWDT_IMPL_SHIFT	0
> +#define SBSA_GWDT_IMPL_MEDIATEK	0x426
> +
>   /**
>    * struct sbsa_gwdt - Internal representation of the SBSA GWDT
>    * @wdd:		kernel watchdog_device structure
>    * @clk:		store the System Counter clock frequency, in Hz.
>    * @version:            store the architecture version
> + * @need_ws0_race_workaround:
> + *			indicate whether to adjust wdd->timeout to avoid a race with WS0
>    * @refresh_base:	Virtual address of the watchdog refresh frame
>    * @control_base:	Virtual address of the watchdog control frame
>    */
> @@ -87,6 +93,7 @@ struct sbsa_gwdt {
>   	struct watchdog_device	wdd;
>   	u32			clk;
>   	int			version;
> +	bool			need_ws0_race_workaround;
>   	void __iomem		*refresh_base;
>   	void __iomem		*control_base;
>   };
> @@ -161,6 +168,31 @@ static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
>   		 */
>   		sbsa_gwdt_reg_write(((u64)gwdt->clk / 2) * timeout, gwdt);
>   
> +	/*
> +	 * Some watchdog hardware has a race condition where it will ignore
> +	 * sbsa_gwdt_keepalive() if it is called at the exact moment that a
> +	 * timeout occurs and WS0 is being asserted. Unfortunately, the default
> +	 * behavior of the watchdog core is very likely to trigger this race
> +	 * when action=0 because it programs WOR to be half of the desired
> +	 * timeout, and watchdog_next_keepalive() chooses the exact same time to
> +	 * send keepalive pings.
> +	 *
> +	 * This triggers a race where sbsa_gwdt_keepalive() can be called right
> +	 * as WS0 is being asserted, and affected hardware will ignore that
> +	 * write and continue to assert WS0. After another (timeout / 2)
> +	 * seconds, the same race happens again. If the driver wins then the
> +	 * explicit refresh will reset WS0 to false but if the hardware wins,
> +	 * then WS1 is asserted and the system resets.
> +	 *
> +	 * Avoid the problem by scheduling keepalive heartbeats one second later
> +	 * than the WOR timeout.
> +	 *
> +	 * This workaround might not be needed in a future revision of the
> +	 * hardware.
> +	 */
> +	if (gwdt->need_ws0_race_workaround)
> +		wdd->min_hw_heartbeat_ms = timeout * 500 + 1000;
> +
>   	return 0;
>   }
>   
> @@ -202,12 +234,15 @@ static int sbsa_gwdt_keepalive(struct watchdog_device *wdd)
>   static void sbsa_gwdt_get_version(struct watchdog_device *wdd)
>   {
>   	struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
> -	int ver;
> +	int iidr, ver, impl;
>   
> -	ver = readl(gwdt->control_base + SBSA_GWDT_W_IIDR);
> -	ver = (ver >> SBSA_GWDT_VERSION_SHIFT) & SBSA_GWDT_VERSION_MASK;
> +	iidr = readl(gwdt->control_base + SBSA_GWDT_W_IIDR);
> +	ver = (iidr >> SBSA_GWDT_VERSION_SHIFT) & SBSA_GWDT_VERSION_MASK;
> +	impl = (iidr >> SBSA_GWDT_IMPL_SHIFT) & SBSA_GWDT_IMPL_MASK;
>   
>   	gwdt->version = ver;
> +	gwdt->need_ws0_race_workaround =
> +		!action && (impl == SBSA_GWDT_IMPL_MEDIATEK);
>   }
>   
>   static int sbsa_gwdt_start(struct watchdog_device *wdd)
> @@ -299,6 +334,15 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
>   	else
>   		wdd->max_hw_heartbeat_ms = GENMASK_ULL(47, 0) / gwdt->clk * 1000;
>   
> +	if (gwdt->need_ws0_race_workaround) {
> +		/*
> +		 * A timeout of 3 seconds means that WOR will be set to 1.5
> +		 * seconds and the heartbeat will be scheduled every 2.5
> +		 * seconds.
> +		 */
> +		wdd->min_timeout = 3;
> +	}
> +
>   	status = readl(cf_base + SBSA_GWDT_WCS);
>   	if (status & SBSA_GWDT_WCS_WS1) {
>   		dev_warn(dev, "System reset by WDT.\n");


