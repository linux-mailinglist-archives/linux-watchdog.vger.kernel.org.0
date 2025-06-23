Return-Path: <linux-watchdog+bounces-3703-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D790AAE3888
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 10:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0802D172917
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Jun 2025 08:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B634233D9E;
	Mon, 23 Jun 2025 08:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UyLJtDQZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B42233159;
	Mon, 23 Jun 2025 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667720; cv=none; b=j5ta8mcjv6z0X9TZ6QVbJjbbI5b3f/lR8vqOiGALyz2AgaOYooVstOHcJsbrNqkmdyM2yZSnAyd8+NjcUM16OMMAFB7JZZYt9Ol/xX2lYE6aw77JiEYN/GxGR61pAgvOVBDFLX6CSwmBmjnkWBJC9Xlf9eqEfbu1pcxN9lL8J0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667720; c=relaxed/simple;
	bh=YU41Sp80pqlhUDxe2jPkjz382ottt88kUUyJc6M5FDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPrttB4yNg/Xywpt+DBu4drKxZaM5Bpt9jTi7E16YoJk7rOhFWfB3A/yqGXHegL2Wj5N8493NDAprRrK3CiQ9JknG/1THunNTsdrJdIYKxuKjYol5X3Ub6WfXJ0ULrN8i/jONdvWKpr+MwJOC3KRAzc1R8juffwN6mrtrT3Hqcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UyLJtDQZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667717;
	bh=YU41Sp80pqlhUDxe2jPkjz382ottt88kUUyJc6M5FDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UyLJtDQZtrSmzZPL7ocG7LPyv+UtHaMBKwtS5T0jLgBTlimfsQ7B0wmKQNVHpZQMj
	 NsPS8SoKF6gFiSTh7AqBPBpt5gtgsxkRZ1wVxl20Dx6QoHjoV6Hvw5394pboV/neuq
	 gg37ihdAihWa566F8hu2HQcan4cmyI0MIniaD2dFeye5VTBLaRmNl9+FKu6NMcFiYG
	 AOE4OkTeTBIWgXqEpXebShUcQZc8uIQntzzG8W09dMLpFR3u5H7uLah445l/TRPTtc
	 OJDfynR+Shv5AK/ajGN1WimF492uR4BXapTqtoUSg4HuqEFEUtsaB9bw25qVo2Dk3g
	 7dcsYbx2VTgxg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B90717E156E;
	Mon, 23 Jun 2025 10:35:16 +0200 (CEST)
Message-ID: <b0c43d9e-bd29-4fcd-9c62-269f6c6ef7e4@collabora.com>
Date: Mon, 23 Jun 2025 10:35:15 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] ARM: mediatek: show the hardware name for the
 MT6572
To: wctrl@proton.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
 <20250620-mt6572-v1-7-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-7-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for the MT6572 SoC.
> 

Please clarify the commit title.

ARM: mediatek: Add board_dt_compat entry for the MT6572 SoC

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>   arch/arm/mach-mediatek/mediatek.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
> index e6e9f93a1f01c7d043cf4312b9406b25c8897198..5c28124bd0078b31665fef647e496f4131b82c8d 100644
> --- a/arch/arm/mach-mediatek/mediatek.c
> +++ b/arch/arm/mach-mediatek/mediatek.c
> @@ -38,6 +38,7 @@ static void __init mediatek_timer_init(void)
>   
>   static const char * const mediatek_board_dt_compat[] = {
>   	"mediatek,mt2701",
> +	"mediatek,mt6572",
>   	"mediatek,mt6589",
>   	"mediatek,mt6592",
>   	"mediatek,mt7623",
> 



